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
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using JS.Modules.JSNewsModule.Components;

namespace JS.Modules.JSNewsModule
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Settings class manages Module Settings
    /// 
    /// Typically your settings control would be used to manage settings for your module.
    /// There are two types of settings, ModuleSettings, and TabModuleSettings.
    /// 
    /// ModuleSettings apply to all "copies" of a module on a site, no matter which page the module is on. 
    /// 
    /// TabModuleSettings apply only to the current module on the current page, if you copy that module to
    /// another page the settings are not transferred.
    /// 
    /// If you happen to save both TabModuleSettings and ModuleSettings, TabModuleSettings overrides ModuleSettings.
    /// 
    /// Below we have some examples of how to access these settings but you will need to uncomment to use.
    /// 
    /// Because the control inherits from JSNewsModuleSettingsBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Settings : JSNewsModuleModuleSettingsBase
    {
        #region Base Method Implementations

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// LoadSettings loads the settings from the Database and displays them
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void LoadSettings()
        {

            try
            {
                if (!IsPostBack)
                {
                    viewModeList.Items.Add("List");
                    viewModeList.Items.Add("Accordion");
                    sortByList.Items.Add("Date");
                    sortByList.Items.Add("Title");
                    sortByList.Items.Add("Custom Order");
                    sortTypeList.Items.Add("ASC");
                    sortTypeList.Items.Add("DESC");
                    var sc = new SettingsController();
                    var cs = sc.LoadSettings();
                    foreach (CustomSettings s in cs)
                    {
                        if (s.SettingsId == ModuleId)
                        {
                            viewModeList.SelectedValue = s.ViewMode;
                            cbUsePaging.Checked = pnlNewsPerPage.Visible = s.UsePaging;
                            txtNewsPerPage.Text = s.NewsPerPage.ToString();
                            cbShowNewsDate.Checked = s.ShowNewsDate;
                            cbShowNewsImg.Checked = s.ShowNewsImg;
                            cbShowReadMore.Checked = pnlReadMoreText.Visible = s.ShowReadMore;
                            txtReadMoreText.Text = s.ReadMoreText;
                            cbShowBack.Checked = pnlBackText.Visible = s.ShowBack;
                            txtBackText.Text = s.BackText;
                            cbShowHome.Checked = pnlHomeText.Visible = s.ShowHome;
                            txtHomeText.Text = s.HomeText;
                            cbIsSorted.Checked = pnlSortBy.Visible = pnlSortType.Visible = s.IsSorted;
                            sortByList.SelectedValue = s.SortBy;
                            sortTypeList.SelectedValue = s.SortType;
                        }
                        else
                        {
                            var ds = sc.LoadSingleSettings(0);
                            viewModeList.SelectedValue = ds.ViewMode;
                            cbUsePaging.Checked = pnlNewsPerPage.Visible = ds.UsePaging;
                            txtNewsPerPage.Text = ds.NewsPerPage.ToString();
                            cbShowNewsDate.Checked = ds.ShowNewsDate;
                            cbShowNewsImg.Checked = ds.ShowNewsImg;
                            cbShowReadMore.Checked = pnlReadMoreText.Visible = ds.ShowReadMore;
                            txtReadMoreText.Text = ds.ReadMoreText;
                            cbShowBack.Checked = pnlBackText.Visible = ds.ShowBack;
                            txtBackText.Text = ds.BackText;
                            cbShowHome.Checked = pnlHomeText.Visible = ds.ShowHome;
                            txtHomeText.Text = ds.HomeText;
                            cbIsSorted.Checked = pnlSortBy.Visible = pnlSortType.Visible = ds.IsSorted;
                            sortByList.SelectedValue = ds.SortBy;
                            sortTypeList.SelectedValue = ds.SortType;
                        }
                    }
                }
                cbShowReadMore.Enabled = cbShowNewsImg.Checked;
                cbShowNewsImg.Enabled = cbShowReadMore.Checked;
                lblStatImgMsg.Visible = !cbShowReadMore.Checked;
                lblStatReadMoreMsg.Visible = !cbShowNewsImg.Checked;
                if (viewModeList.SelectedValue == "Accordion")
                {
                    pnlShowReadMore.Visible = pnlReadMoreText.Visible = false;
                }
                else
                {
                    pnlShowReadMore.Visible = pnlReadMoreText.Visible = true;
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// UpdateSettings saves the modified settings to the Database
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void UpdateSettings()
        {
            try
            {
                bool isSettingsPresent = false;
                var sc = new SettingsController();
                var cs = sc.LoadSettings();
                var nc = new NewsController();
                var an = nc.LoadAllNews(ModuleId);
                string sortByTemp = null;
                string sortTypeTemp = null;
                sortByTemp = sortByList.SelectedValue;
                sortTypeTemp = sortTypeList.SelectedValue;
                foreach (CustomSettings s in cs)
                {
                    if (s.SettingsId == ModuleId)
                    {
                        isSettingsPresent = true;
                        break;
                    }
                }
                if (!isSettingsPresent)
                {
                    var ns = new CustomSettings()
                    {
                        SettingsId = ModuleId,
                        ViewMode = viewModeList.SelectedValue,
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
                        SortType = sortTypeTemp                       
                    };
                    foreach (News n in an)
                    {
                        string style = "";
                        n.ShowCustomOrderId = ns.ShowCustomOrderId;
                        n.ShowNewsDate = ns.ShowNewsDate;
                        n.ShowNewsImg = ns.ShowNewsImg;
                        n.ShowReadMore = ns.ShowReadMore;
                        n.ReadMoreText = ns.ReadMoreText;
                        n.ShowBack = ns.ShowBack;
                        n.BackText = ns.BackText;
                        n.ShowHome = ns.ShowHome;
                        n.HomeText = ns.HomeText;
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
                    sc.AddSettings(ns);
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
                }
                else
                {
                    var s = sc.LoadSingleSettings(ModuleId);
                    s.ViewMode = viewModeList.SelectedValue;
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
                    foreach (News n in an)
                    {
                        string style = "";
                        n.ShowCustomOrderId = s.ShowCustomOrderId;
                        n.ShowNewsDate = s.ShowNewsDate;
                        n.ShowNewsImg = s.ShowNewsImg;
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

        protected void cbShowNewsImg_CheckedChanged(object sender, EventArgs e)
        {
            cbShowReadMore.Enabled = cbShowNewsImg.Checked;
            lblStatReadMoreMsg.Visible = !cbShowNewsImg.Checked;
            lblReadMoreText.Visible = txtReadMoreText.Visible = true;
        }

        protected void cbShowReadMore_CheckedChanged(object sender, EventArgs e)
        {
            cbShowNewsImg.Enabled = cbShowReadMore.Checked;
            lblStatImgMsg.Visible = !cbShowReadMore.Checked;
            lblStatReadMoreMsg.Visible = !cbShowNewsImg.Checked;

            pnlReadMoreText.Visible = cbShowReadMore.Checked;
        }

        protected void cbShowBack_CheckedChanged(object sender, EventArgs e)
        {
            pnlBackText.Visible = cbShowBack.Checked;
        }

        protected void cbShowHome_CheckedChanged(object sender, EventArgs e)
        {
            pnlHomeText.Visible = cbShowHome.Checked;
        }

        protected void cbIsSorted_CheckedChanged(object sender, EventArgs e)
        {
            pnlSortBy.Visible = pnlSortType.Visible = cbIsSorted.Checked;
        }

        protected void viewModeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (viewModeList.SelectedValue == "Accordion")
            {
                pnlReadMoreText.Visible = pnlShowReadMore.Visible = false;
            }
            else
            {
                pnlReadMoreText.Visible = pnlShowReadMore.Visible = true;
            }
        }

        protected void cbUsePaging_CheckedChanged(object sender, EventArgs e)
        {
            pnlNewsPerPage.Visible = cbUsePaging.Checked;
        }
    }
}