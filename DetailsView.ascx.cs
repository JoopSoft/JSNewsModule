/*
' Copyright (c) 2016  JoopSoft
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using JS.Modules.JSNewsModule.Components;
using DotNetNuke.Services.Exceptions;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;

namespace JS.Modules.JSNewsModule
{
    public partial class DetailsView : JSNewsModuleModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var sc = new SettingsController();
                int TModuleId = 0;
                var ts = sc.LoadSettings();
                foreach (CustomSettings s in ts)
                {
                    if (s.SettingsId == ModuleId)
                    {
                        TModuleId = ModuleId;
                        break;
                    }
                }
                var cs = sc.LoadSingleSettings(TModuleId);
                var nc = new NewsController();
                var n = nc.LoadNews(NewsId, ModuleId);
                var cn = new News();
                lblNewsTitle.Text = n.NewsTitle;
                lnkPopUpImg.NavigateUrl = n.ImageUrl;
                lnkPopUpImg.ToolTip = n.NewsTitle;
                lblNewsDate.Visible = n.ShowNewsDate;
                lblNewsDate.Text = n.NewsDate;
                lnkPopUpImg.Visible = n.ShowNewsImg;
                imgNewsImage.Visible = n.ShowNewsImg;
                imgNewsImage.ImageUrl = n.ImageUrl;
                imgNewsImage.AlternateText = n.NewsTitle + " image";
                lblNewsContent.Text = Server.HtmlDecode(n.NewsContent);
                btnBack.Visible = n.ShowBack;
                btnBack.Text = n.BackText;
                btnBack.ToolTip = n.BackText;
                btnHome.Visible = n.ShowHome;
                btnHome.Text = n.HomeText;
                btnHome.ToolTip = n.HomeText;
                lnkAll.Visible = cs.ShowNewsButton;
                lnkAll.NavigateUrl = cs.NewsButtonPage;
                #region DetailsView Paging
                var news = nc.LoadAllNews(ModuleId);
                if (cs.IsSorted)
                {
                    if (cs.SortType == "ASC")
                    {
                        switch (cs.SortBy)
                        {
                            case "Title":
                                news = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.NewsTitle);
                                break;
                            case "Date":
                                news = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.NewsDate);
                                break;
                            case "Custom Order":
                                news = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.CustomOrderId);
                                break;
                            default:
                                break;
                        }
                    }
                    else
                    {
                        switch (cs.SortBy)
                        {
                            case "Title":
                                news = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.NewsTitle);
                                break;
                            case "Date":
                                news = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.NewsDate);
                                break;
                            case "Custom Order":
                                news = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.CustomOrderId);
                                break;
                            default:
                                break;
                        }
                    }
                }
                List<int> pagedNews = new List<int>();
                foreach (var pn in news)
                {
                    pagedNews.Add(pn.NewsId);
                }
                int currentIndex = 0;
                for (int i = 0; i < pagedNews.Count; i++)
                {
                    if (pagedNews[i] == n.NewsId)
                    {
                        currentIndex = i;
                    }
                }
                if (currentIndex == 0)
                {
                    lnkPrev.Enabled = false;
                }
                else
                {
                    cn = nc.LoadNews(pagedNews[currentIndex - 1], ModuleId);
                    lnkPrev.Enabled = true;
                    lnkPrev.NavigateUrl = EditUrl(string.Empty, string.Empty, "DetailsView", "nid=" + (pagedNews[currentIndex - 1]));
                    lnkPrev.ToolTip = cn.NewsTitle;
                }
                if (currentIndex == pagedNews.Count - 1)
                {
                    lnkNext.Enabled = false;
                }
                else
                {
                    cn = nc.LoadNews(pagedNews[currentIndex + 1], ModuleId);
                    lnkNext.Enabled = true;
                    lnkNext.NavigateUrl = EditUrl(string.Empty, string.Empty, "DetailsView", "nid=" + (pagedNews[currentIndex + 1]));
                    lnkNext.ToolTip = cn.NewsTitle;
                }
                #endregion
                if (IsEditable && lnkDelete != null && lnkEdit != null && pnlAdminControls != null)
                {
                    pnlAdminControls.Visible = true;                    
                    lnkAdd.ToolTip = "Add News Entry";
                    lnkEdit.ToolTip = "Edit " + n.NewsTitle;
                    lnkDelete.ToolTip = "Delete " + n.NewsTitle;
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);
                    lnkSettings.ToolTip = "Settings";
                }
                else
                {
                    pnlAdminControls.Visible = false;
                }
                if (n.ShowNewsImg)
                {
                    pnlDetailsView.CssClass = "panel panel-default details-view";
                }
                else
                {
                    pnlDetailsView.CssClass = "panel panel-default details-view no-img";
                }

            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = true;
            pnlPopUp.CssClass = "popup confirm-box warning";
            lblPopUpMsg.Text = "Delete this News?";
            lblPopUpIcon.CssClass = "popup-icon link-delete no-txt";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var nc = new NewsController();
            nc.DeleteNews(NewsId, ModuleId);
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
        }
    }
}
   