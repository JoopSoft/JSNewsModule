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
    public partial class DetailsView : JSNewsModuleModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var nc = new NewsController();
                var n = nc.LoadNews(NewsId, ModuleId);
                lblNewsTitle.Text = n.NewsTitle;
                lnkPopUpImg.NavigateUrl = n.ImageUrl;
                lblNewsDate.Visible = n.ShowNewsDate;
                lblNewsDate.Text = n.NewsDate;
                imgNewsImage.Visible = n.ShowNewsImg;
                imgNewsImage.ImageUrl = n.ImageUrl;
                lblNewsContent.Text = Server.HtmlDecode(n.NewsContent);
                btnBack.Visible = n.ShowBack;
                btnBack.Text = n.BackText;
                btnHome.Visible = n.ShowHome;
                btnHome.Text = n.HomeText;
                if (IsEditable && lnkDelete != null && lnkEdit != null && pnlAdminControls != null)
                {
                    pnlAdminControls.Visible = true;
                    lnkDelete.CommandArgument = n.NewsId.ToString();
                    lnkDelete.Enabled = lnkDelete.Visible = lnkEdit.Enabled = lnkEdit.Visible = true;
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddNews", "nid=" + n.NewsId);

                    ClientAPI.AddButtonConfirm(lnkDelete, Localization.GetString("ConfirmDelete", LocalResourceFile));
                }
                else
                {
                    pnlAdminControls.Visible = false;
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
            var nc = new NewsController();
            nc.DeleteNews(NewsId, ModuleId);
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }
    }
}
   