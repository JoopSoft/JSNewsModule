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
using System.Web.UI.WebControls;
using JS.Modules.JSNewsModule.Components;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using System.Linq;
using System.IO;
using DotNetNuke.Entities.Tabs;

namespace JS.Modules.JSNewsModule
{
    public partial class View : JSNewsModuleModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lnkFirstAdd.NavigateUrl = lnkAdd.NavigateUrl = EditUrl("AddNews");
                lnkSettings.NavigateUrl = "javascript:dnnModal.show('http://" + Request.Url.Host + TabController.CurrentPage.TabPath + "/ctl/Module/ModuleId/" + ModuleId + "?ReturnURL=/JS-News&amp;popUp=true',/*showReturn*/false,550,950,true,'')";
                pnlAdminShortcuts.Visible = IsEditable;
                DefaultSettings();
                pnlPopUp.Visible = false;
                var nc = new NewsController();
                var cs = new CustomSettings();
                var sc = new SettingsController();
                int newsCount = 0;
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
                cs = sc.LoadSingleSettings(TModuleId);
                foreach (News nCount in nc.LoadAllNews(ModuleId))
                {
                    newsCount++;
                }
                pnlAccNavigation.Visible = pnlAccInfoText.Visible = cs.ViewMode == "Accordion" && cs.UsePaging && newsCount > cs.NewsPerPage;
                pnlListNavigation.Visible =  pnlListInfoText.Visible = cs.ViewMode == "List" && cs.UsePaging && newsCount > cs.NewsPerPage;
                switch (cs.ViewMode)
                {
                    case "List":
                        pnlList.Visible = true;
                        pnlAccordion.Visible = false;
                        pnlAccNavigation.Visible = true;
                        pnlAccInfoText.Visible = true;
                        break;

                    case "Accordion":
                        pnlList.Visible = false;
                        pnlAccordion.Visible = true;
                        pnlListNavigation.Visible = false;
                        pnlListInfoText.Visible = false;
                        break;

                    default:
                        break;
                }
                #region List View Sort
                if (cs.IsSorted)
                {
                    if (cs.SortType == "ASC")
                    {
                        switch (cs.SortBy)
                        {
                            case "Title":
                                rptItemListView.DataSource = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.NewsTitle);
                                break;
                            case "Date":
                                rptItemListView.DataSource = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.NewsDate);
                                break;
                            case "Custom Order":
                                rptItemListView.DataSource = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.CustomOrderId);
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
                                rptItemListView.DataSource = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.NewsTitle);
                                break;
                            case "Date":
                                rptItemListView.DataSource = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.NewsDate);
                                break;
                            case "Custom Order":
                                rptItemListView.DataSource = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.CustomOrderId);
                                break;
                            default:
                                break;
                        }
                    }
                }
                else
                {
                    rptItemListView.DataSource = nc.LoadAllNews(ModuleId);
                }
                
                rptItemListView.DataBind();
                #endregion
                #region Accordion View Sort
                if (cs.IsSorted)
                {
                    if (cs.SortType == "ASC")
                    {
                        switch (cs.SortBy)
                        {
                            case "Title":
                                rptItemAccordionView.DataSource = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.NewsTitle);
                                break;
                            case "Date":
                                rptItemAccordionView.DataSource = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.NewsDate);
                                break;
                            case "Custom Order":
                                rptItemAccordionView.DataSource = (nc.LoadAllNews(ModuleId)).OrderBy(item => item.CustomOrderId);
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
                                rptItemAccordionView.DataSource = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.NewsTitle);
                                break;
                            case "Date":
                                rptItemAccordionView.DataSource = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.NewsDate);
                                break;
                            case "Custom Order":
                                rptItemAccordionView.DataSource = (nc.LoadAllNews(ModuleId)).OrderByDescending(item => item.CustomOrderId);
                                break;
                            default:
                                break;
                        }
                    }
                }
                else
                {
                    rptItemAccordionView.DataSource = nc.LoadAllNews(ModuleId);
                }
                rptItemAccordionView.DataBind();
                #endregion

                
                FirstAddVisible(nc);
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        void FirstAddVisible(NewsController nc)
        {
            var currentNews = nc.LoadAllNews(ModuleId);
            bool newsPresent = false;
            foreach (var n in currentNews)
            {
                if (n.NewsId > 0)
                {
                    newsPresent = true;
                    break;
                }
            }
            if (!newsPresent && IsEditable)
            {
                pnlFirstAdd.Visible = true;
                lnkAdd.Visible = false;
            }
            else
            {
                pnlFirstAdd.Visible = false;
                lnkAdd.Visible = true;
            }
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
            var lnkAll = rptItemListView.Controls[rptItemListView.Controls.Count - 1].Controls[0].FindControl("lnkAll") as HyperLink;
            var lnkAllA = rptItemAccordionView.Controls[rptItemAccordionView.Controls.Count - 1].Controls[0].FindControl("lnkAll") as HyperLink;
            lnkAll.NavigateUrl = lnkAllA.NavigateUrl = cs.NewsButtonPage;
            lnkAll.Text = lnkAllA.Text = cs.NewsButtonText;
            lnkAll.Visible = lnkAllA.Visible = cs.ShowNewsButton;
        }

        protected void rptItemListOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var lnkEdit = e.Item.FindControl("lnkEdit") as HyperLink;
                var lnkDelete = e.Item.FindControl("lnkDelete") as LinkButton;
                var btnReadMore = e.Item.FindControl("btnReadMoreList") as HyperLink;
                var lnkImg = e.Item.FindControl("lnkImg") as HyperLink;
                var pnlAdminControls = e.Item.FindControl("pnlAdmin") as Panel;
                var n = (News)e.Item.DataItem;
                btnReadMore.NavigateUrl = lnkImg.NavigateUrl = EditUrl(string.Empty, string.Empty, "DetailsView", "nid=" + n.NewsId);
                if (IsEditable && lnkDelete != null && lnkEdit != null && pnlAdminControls != null)
                {
                    pnlAdminControls.Visible = true;
                    lnkDelete.Enabled = lnkDelete.Visible = lnkEdit.Enabled = lnkEdit.Visible = lnkAdd.Enabled = lnkAdd.Visible = true;
                    lnkDelete.ToolTip = "Delete " + n.NewsTitle;
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);
                    lnkEdit.ToolTip = "Edit " + n.NewsTitle;
                }
                else
                {
                    pnlAdminControls.Visible = false;
                }
            }
        }

        protected void rptItemAccordionOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var lnkEdit = e.Item.FindControl("lnkEdit") as HyperLink;
                var lnkDelete = e.Item.FindControl("lnkDelete") as LinkButton;
                var btnReadMore = e.Item.FindControl("btnReadMore") as HyperLink;
                var pnlAdminControls = e.Item.FindControl("pnlAdmin") as Panel;
                var n = (News)e.Item.DataItem;
                var badge = e.Item.FindControl("badge") as Panel;
                var lblNewsDate = e.Item.FindControl("lblNewsDate") as Label;
                if (!lblNewsDate.Visible)
                {
                    badge.CssClass = "badge no-txt";
                }
                else
                {
                    badge.CssClass = "badge";
                }
                btnReadMore.NavigateUrl = EditUrl(string.Empty, string.Empty, "DetailsView", "nid=" + n.NewsId);
                if (IsEditable && lnkDelete != null && lnkEdit != null && pnlAdminControls != null)
                {
                    pnlAdminControls.Visible = true;
                    lnkDelete.ToolTip = "Delete " + n.NewsTitle;
                    lnkDelete.Enabled = lnkDelete.Visible = lnkEdit.Enabled = lnkEdit.Visible = lnkAdd.Enabled = lnkAdd.Visible = true;
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);
                    lnkEdit.ToolTip = "Edit " + n.NewsTitle;
                }
                else
                {
                    pnlAdminControls.Visible = false;
                }
            }
        }

        protected void btnDeleteNews_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem ri in rptItemListView.Items)
            {
                var btnDelete = ri.FindControl("lnkDelete") as LinkButton;
                var newsId = ri.FindControl("lblNewsId") as Label;

                if (sender.Equals(btnDelete))
                {
                    pnlPopUp.Visible = true;
                    pnlPopUp.CssClass = "popup confirm-box warning";
                    lblPopUpMsg.Text = "Delete this News?";
                    lblPopUpIcon.CssClass = "popup-icon link-delete no-txt";
                    lblDeleteNewsID.Text = newsId.Text;
                }
            }
            foreach (RepeaterItem ri in rptItemAccordionView.Items)
            {
                var btnDelete = ri.FindControl("lnkDelete") as LinkButton;
                var newsId = ri.FindControl("lblNewsId") as Label;

                if (sender.Equals(btnDelete))
                {
                    pnlPopUp.Visible = true;
                    pnlPopUp.CssClass = "popup confirm-box warning";
                    lblPopUpMsg.Text = "Delete this News?";
                    lblPopUpIcon.CssClass = "popup-icon link-delete no-txt";
                    lblDeleteNewsID.Text = newsId.Text;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var nc = new NewsController();
            nc.DeleteNews(Convert.ToInt32(lblDeleteNewsID.Text), ModuleId);
            rptItemListView.DataSource = rptItemAccordionView.DataSource = nc.LoadAllNews(ModuleId);
            rptItemListView.DataBind();
            rptItemAccordionView.DataBind();
            FirstAddVisible(nc);
        }

        protected void AddLine(string appendText)
        {
            string fileName = (Server.MapPath("~/DesktopModules/JSNewsModule/Json/" + ModuleId + "_Settings.json"));
            File.AppendAllText(fileName, appendText + Environment.NewLine);
        }

        protected void DefaultSettings()
        {
            string fileName = Server.MapPath("~/DesktopModules/JSNewsModule/Json/" + ModuleId + "_Settings.json");
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSNewsModule/Json/"));
            if (!File.Exists(fileName))
            {
                using (FileStream fs = File.Open(fileName, FileMode.CreateNew)) { }
                AddLine("{");
                AddLine("\t\"settings\": {");
                AddLine("\t\t\"usePaging\": false,");
                AddLine("\t\t\"newsPerPage\": 3");
                AddLine("\t}");
                AddLine("}");
            }
        }


        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
        }

        public ModuleActionCollection ModuleActions
        {
            get
            {
                var actions = new ModuleActionCollection
                    {
                        {
                            GetNextActionID(), Localization.GetString("AddNews", LocalResourceFile), "", "", "",
                            EditUrl("AddNews"), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                return actions;
            }
        }
    }
}