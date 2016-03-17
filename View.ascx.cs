﻿/*
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
                    rptItemAccordionView.DataSource = nc.LoadAllNews(ModuleId);
                }
                rptItemAccordionView.DataBind();
                #endregion
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
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);
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
                    lnkDelete.Enabled = lnkDelete.Visible = lnkEdit.Enabled = lnkEdit.Visible = lnkAdd.Enabled = lnkAdd.Visible = true;
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);
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
    }
}