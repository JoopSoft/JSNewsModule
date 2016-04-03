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
using DotNetNuke.UI.Utilities;
using System.Linq;
using System.Web.UI;

namespace JS.Modules.JSNewsModule
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The View class displays the content
    /// 
    /// Typically your view control would be used to display content or functionality in your module.
    /// 
    /// View may be the only control you have in your project depending on the complexity of your module
    /// 
    /// Because the control inherits from JSNewsModuleModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : JSNewsModuleModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var nc = new NewsController();
                var cs = new CustomSettings();
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
                cs = sc.LoadSingleSettings(TModuleId);
                int currentPage = cs.CurrentPage;
                switch (cs.ViewMode)
                {
                    case "List":
                        pnlList.Visible = true;
                        pnlAccordion.Visible = false;
                        break;
                    case "Accordion":
                        pnlList.Visible = false;
                        pnlAccordion.Visible = true;
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
                    if (cs.UsePaging)
                    {
                        var news = nc.LoadAllNews(ModuleId);
                        var pageNews = (news.Skip((currentPage - 1) * cs.NewsPerPage)).Take(cs.NewsPerPage);
                        rptItemAccordionView.DataSource = pageNews;
                    }
                    else
                    {
                        rptItemAccordionView.DataSource = nc.LoadAllNews(ModuleId);
                    }
                }
                rptItemAccordionView.DataBind();
                #endregion


                var lnkAll = rptItemListView.Controls[rptItemListView.Controls.Count - 1].Controls[0].FindControl("lnkAll") as LinkButton;
                var lnkPrev = rptItemListView.Controls[rptItemListView.Controls.Count - 1].Controls[0].FindControl("lnkPrev") as LinkButton;
                var lnkNext = rptItemListView.Controls[rptItemListView.Controls.Count - 1].Controls[0].FindControl("lnkNext") as LinkButton;
                var lnkAllA = rptItemAccordionView.Controls[rptItemAccordionView.Controls.Count - 1].Controls[0].FindControl("lnkAll") as LinkButton;
                var lnkPrevA = rptItemAccordionView.Controls[rptItemAccordionView.Controls.Count - 1].Controls[0].FindControl("lnkPrev") as LinkButton;
                var lnkNextA = rptItemAccordionView.Controls[rptItemAccordionView.Controls.Count - 1].Controls[0].FindControl("lnkNext") as LinkButton;
                var currentNews = nc.LoadAllNews(ModuleId);
                bool newsPresent = false;
                foreach (var n in currentNews)
                {
                    newsPresent = true;
                }
                if (newsPresent)
                {
                    pnlFirstAdd.Visible = false;
                    //lnkFirstAdd.Visible = false;
                    lnkAll.Visible = lnkPrev.Visible = lnkNext.Visible = true;
                    lnkAllA.Visible = lnkPrevA.Visible = lnkNextA.Visible = true;
                }
                else
                {
                    pnlFirstAdd.Visible = true;
                    //lnkFirstAdd.Visible = true;
                    lnkAll.Visible = lnkPrev.Visible = lnkNext.Visible = false;
                    lnkAllA.Visible = lnkPrevA.Visible = lnkNextA.Visible = false;
                }
                lnkFirstAdd.NavigateUrl = EditUrl("AddNews");
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void rptItemListOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {

                var lnkEdit = e.Item.FindControl("lnkEdit") as HyperLink;
                var lnkAdd = e.Item.FindControl("lnkAdd") as HyperLink;
                var lnkSettings = e.Item.FindControl("lnkSettings") as HyperLink;
                var lnkDelete = e.Item.FindControl("lnkDelete") as LinkButton;
                var btnReadMore = e.Item.FindControl("btnReadMoreList") as HyperLink;
                var lnkImg = e.Item.FindControl("lnkImg") as HyperLink;


                var pnlAdminControls = e.Item.FindControl("pnlAdmin") as Panel;

                var n = (News)e.Item.DataItem;

                btnReadMore.NavigateUrl = EditUrl(string.Empty, string.Empty, "DetailsView", "nid=" + n.NewsId);
                lnkImg.NavigateUrl = EditUrl(string.Empty, string.Empty, "DetailsView", "nid=" + n.NewsId);
                if (IsEditable && lnkDelete != null && lnkEdit != null && pnlAdminControls != null)
                {
                    pnlAdminControls.Visible = true;
                    lnkDelete.CommandArgument = n.NewsId.ToString();
                    lnkDelete.Enabled = lnkDelete.Visible = lnkEdit.Enabled = lnkEdit.Visible = lnkAdd.Enabled = lnkAdd.Visible = true;
                    lnkDelete.ToolTip = "Delete " + n.NewsTitle;
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);
                    lnkEdit.ToolTip = "Edit " + n.NewsTitle;
                    lnkAdd.NavigateUrl = EditUrl("AddNews");

                    ClientAPI.AddButtonConfirm(lnkDelete, Localization.GetString("ConfirmDelete", LocalResourceFile));
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
                var lnkAdd = e.Item.FindControl("lnkAdd") as HyperLink;
                var lnkSettings = e.Item.FindControl("lnkSettings") as HyperLink;
                var lnkDelete = e.Item.FindControl("lnkDelete") as LinkButton;
                var btnReadMore = e.Item.FindControl("btnReadMore") as HyperLink;


                var pnlAdminControls = e.Item.FindControl("pnlAdmin") as Panel;

                var n = (News)e.Item.DataItem;

                btnReadMore.NavigateUrl = EditUrl(string.Empty, string.Empty, "DetailsView", "nid=" + n.NewsId);
                if (IsEditable && lnkDelete != null && lnkEdit != null && pnlAdminControls != null)
                {
                    pnlAdminControls.Visible = true;
                    lnkDelete.CommandArgument = n.NewsId.ToString();
                    lnkDelete.ToolTip = "Delete " + n.NewsTitle;
                    lnkDelete.Enabled = lnkDelete.Visible = lnkEdit.Enabled = lnkEdit.Visible = lnkAdd.Enabled = lnkAdd.Visible = true;
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);
                    lnkEdit.ToolTip = "Edit " + n.NewsTitle;
                    lnkAdd.NavigateUrl = EditUrl("AddNews");

                    ClientAPI.AddButtonConfirm(lnkDelete, Localization.GetString("ConfirmDelete", LocalResourceFile));
                }
                else
                {
                    pnlAdminControls.Visible = false;
                }
            }
        }


        public void rptItemListOnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                var nc = new NewsController();
                nc.DeleteNews(Convert.ToInt32(e.CommandArgument), ModuleId);
            }
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        public ModuleActionCollection ModuleActions
        {
            get
            {
                var actions = new ModuleActionCollection
                    {
                        //{
                        //    GetNextActionID(), Localization.GetString("EditModule", LocalResourceFile), "", "", "",
                        //    EditUrl(), false, SecurityAccessLevel.Edit, true, false
                        //},
                        {
                            GetNextActionID(), Localization.GetString("AddNews", LocalResourceFile), "", "", "",
                            EditUrl("AddNews"), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                return actions;
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            try
            {
                var nc = new NewsController();
                var sc = new SettingsController();
                var cs = sc.LoadSingleSettings(ModuleId);
                var news = nc.LoadAllNews(ModuleId);
                int pageCount;
                if (news.Count() % cs.NewsPerPage == 0)
                {
                    pageCount = (news.Count() / cs.NewsPerPage);
                }
                else
                {
                    pageCount = (news.Count() / cs.NewsPerPage) + 1;
                }
                if (cs.CurrentPage == pageCount)
                {
                    cs.CurrentPage = 1;
                }
                else
                {
                    cs.CurrentPage++;
                }
                sc.UpdateSettings(cs);
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            try
            {
                var nc = new NewsController();
                var sc = new SettingsController();
                var cs = sc.LoadSingleSettings(ModuleId);
                var news = nc.LoadAllNews(ModuleId);
                int pageCount;
                if (news.Count() % cs.NewsPerPage == 0)
                {
                    pageCount = (news.Count() / cs.NewsPerPage);
                }
                else
                {
                    pageCount = (news.Count() / cs.NewsPerPage) + 1;
                }
                if (cs.CurrentPage == 1)
                {
                    cs.CurrentPage = pageCount;
                }
                else
                {
                    cs.CurrentPage--;
                }
                sc.UpdateSettings(cs);
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }
    }
}