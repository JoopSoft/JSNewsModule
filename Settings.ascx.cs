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
using DotNetNuke.Services.Exceptions;
using JS.Modules.JSNewsModule.Components;

namespace JS.Modules.JSNewsModule
{
    public partial class Settings : JSNewsModuleModuleSettingsBase
    {
        #region Base Method Implementations
        public override void LoadSettings()
        {
            try
            {
                if (!IsPostBack)
                {
                    joopSoft.NavigateUrl = "http://www.joopsoft.com/";
                    joopSoft.Text = "JoopSOFT.com";
                    joopSoft.ToolTip = "JoopSOFT.com";
                    joopSoft.CssClass = "link-dev";
                    joopSoft.Target = "_blank";
                    //Filling The Sorting DropDownLists
                    ddViewModeList.Items.Add("List");
                    ddViewModeList.Items.Add("Accordion");
                    sortByList.Items.Add("Date");
                    sortByList.Items.Add("Title");
                    sortByList.Items.Add("Custom Order");
                    sortTypeList.Items.Add("ASC");
                    sortTypeList.Items.Add("DESC");

                    var sc = new SettingsController();
                    if (AreSettingsPresent(sc)) //Load Settings With Current ModuleId
                    {
                        var s = sc.LoadSingleSettings(ModuleId);
                        string newsButtonPage = s.NewsButtonPage.Remove(0, 2);
                        DisplaySettings(s);
                        ddAllNewsSelect.SelectedValue = newsButtonPage;
                    }
                    else //Load Default Settings
                    {
                        var ds = sc.LoadSingleSettings(0);
                        DisplaySettings(ds);
                        txtAllNews.Text = ds.NewsButtonText;
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        public override void UpdateSettings()
        {
            try
            {
                var sc = new SettingsController();
                var cs = sc.LoadSettings();
                var nc = new NewsController();
                string sortByTemp = null;
                string sortTypeTemp = null;
                sortByTemp = sortByList.SelectedValue;
                sortTypeTemp = sortTypeList.SelectedValue;

                if (!AreSettingsPresent(sc)) 
                {
                    var ns = new CustomSettings()
                    {
                        SettingsId = ModuleId,
                        ViewMode = ddViewModeList.SelectedValue,
                        UsePaging = cbUsePaging.Checked,
                        NewsPerPage = Convert.ToInt32(txtNewsPerPage.Text),
                        ShowCustomOrderId = (sortByList.SelectedValue == "Custom Order"),
                        ShowNewsDate = cbShowNewsDate.Checked,
                        ShowNewsImg = cbShowNewsImg.Checked,
                        ShowReadMore = cbShowReadMore.Checked,
                        ReadMoreText = txtReadMoreText.Text.Trim(),
                        ShowBack = cbShowBack.Checked,
                        BackText = txtBackText.Text.Trim(),
                        ShowHome = cbShowHome.Checked,
                        HomeText = txtHomeText.Text.Trim(),
                        IsSorted = cbIsSorted.Checked,
                        SortBy = sortByTemp,
                        SortType = sortTypeTemp,
                        ShowNewsButton = cbShowAllNews.Checked,
                        NewsButtonText = txtAllNews.Text.Trim(),
                        NewsButtonPage = "~/" + ddAllNewsSelect.SelectedValue
                    };
                    UpdateNewsSettings(ns, nc);
                    sc.AddSettings(ns);
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
                }
                else
                {
                    var s = sc.LoadSingleSettings(ModuleId);
                    s.ViewMode = ddViewModeList.SelectedValue;
                    s.UsePaging = cbUsePaging.Checked;
                    s.NewsPerPage = Convert.ToInt32(txtNewsPerPage.Text);
                    s.ShowCustomOrderId = (sortByList.SelectedValue == "Custom Order");
                    s.ShowNewsDate = cbShowNewsDate.Checked;
                    s.ShowNewsImg = cbShowNewsImg.Checked;
                    s.ShowReadMore = cbShowReadMore.Checked;
                    s.ReadMoreText = txtReadMoreText.Text.Trim();
                    s.ShowBack = cbShowBack.Checked;
                    s.BackText = txtBackText.Text.Trim();
                    s.ShowHome = cbShowHome.Checked;
                    s.HomeText = txtHomeText.Text.Trim();
                    s.IsSorted = cbIsSorted.Checked;
                    s.SortBy = sortByTemp;
                    s.SortType = sortTypeTemp;
                    s.ShowNewsButton = cbShowAllNews.Checked;
                    s.NewsButtonText = txtAllNews.Text.Trim();
                    s.NewsButtonPage = "~/" + ddAllNewsSelect.SelectedValue;
                    UpdateNewsSettings(s, nc);
                    sc.UpdateSettings(s);
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        #endregion

        #region Help Method Implementations
        void DisplaySettings(CustomSettings s)
        {
            ddViewModeList.SelectedValue = s.ViewMode;
            cbUsePaging.Checked = s.UsePaging;
            txtNewsPerPage.Text = s.NewsPerPage.ToString();
            cbShowNewsDate.Checked = s.ShowNewsDate;
            cbShowNewsImg.Checked = s.ShowNewsImg;
            cbShowReadMore.Checked = s.ShowReadMore;
            txtReadMoreText.Text = s.ReadMoreText;
            cbShowBack.Checked = s.ShowBack;
            txtBackText.Text = s.BackText;
            cbShowHome.Checked = s.ShowHome;
            txtHomeText.Text = s.HomeText;
            cbIsSorted.Checked = s.IsSorted;
            sortByList.SelectedValue = s.SortBy;
            sortTypeList.SelectedValue = s.SortType;
            cbShowAllNews.Checked = s.ShowNewsButton;
            txtAllNews.Text = s.NewsButtonText;
        }

        void UpdateNewsSettings(CustomSettings s, NewsController nc)
        {
            var an = nc.LoadAllNews(ModuleId);
            foreach (News n in an)
            {
                string style = "";
                n.ShowCustomOrderId = s.ShowCustomOrderId;
                n.ShowNewsDate = s.ShowNewsDate;
                if (s.ShowNewsImg)
                {
                    n.ShowNewsImg = n.ShowNewsImgTemp;
                }
                else
                {
                    n.ShowNewsImg = s.ShowNewsImg;
                }
                n.ShowReadMore = s.ShowReadMore;
                n.ReadMoreText = s.ReadMoreText;
                n.ShowBack = s.ShowBack;
                n.BackText = s.BackText;
                n.ShowHome = s.ShowHome;
                n.HomeText = s.HomeText;
                #region News Style Rotation
                if (n.ShowNewsDate)
                {
                    if (n.ShowNewsImg)
                    {
                        switch (n.ShowReadMore)
                        {
                            case true:
                                style = "";
                                break;
                            case false:
                                style = "no-read-more";
                                break;
                            default:
                                break;
                        }
                    }
                    else
                    {
                        style = "no-img";
                    }
                }
                else
                {
                    if (n.ShowNewsImg)
                    {
                        switch (n.ShowReadMore)
                        {
                            case true:
                                style = "no-date";
                                break;
                            case false:
                                style = "no-date no-read-more";
                                break;
                            default:
                                break;
                        }
                    }
                    else
                    {
                        style = "no-date no-img";
                    }
                }
                #endregion
                n.NewsStyle = style;
                nc.UpdateNews(n);
            }

        }

        bool AreSettingsPresent(SettingsController sc) {
            var cs = sc.LoadSettings();
            bool areSettingsPresent = false;
            foreach (CustomSettings s in cs)
            {
                if (s.SettingsId == ModuleId)
                {
                    areSettingsPresent = true;
                    break;
                }
            }
            return areSettingsPresent;
        }
        #endregion
    }
}