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
using DotNetNuke.Entities.Users;
using JS.Modules.JSNewsModule.Components;
using DotNetNuke.Services.Exceptions;
using System.IO;

namespace JS.Modules.JSNewsModule
{
    /// -----------------------------------------------------------------------------
    /// <summary>   
    /// The Edit class is used to manage content
    /// 
    /// Typically your edit control would be used to create new content, or edit existing content within your module.
    /// The ControlKey for this control is "Edit", and is defined in the manifest (.dnn) file.
    /// 
    /// Because the control inherits from JSNewsModuleModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class AddNews : JSNewsModuleModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Implement your edit logic for your module
                if (!Page.IsPostBack)
                {
                    //check if we have an ID passed in via a querystring parameter, if so, load that item to edit.
                    //ItemId is defined in the ItemModuleBase.cs file
                    if (NewsId > 0)
                    {
                        var nc = new NewsController();

                        var n = nc.LoadNews(NewsId, ModuleId);
                        if (n != null)
                        {
                            txtTitle.Text = n.NewsTitle;
                            txtDate.Text = n.NewsDate;
                            txtImgUrl.Text = n.ImageUrl;
                            txtTeaserText.Text = n.NewsTeaserText;
                            txtContent.Text = n.NewsContent;
                        }
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            var n = new News();
            var nc = new NewsController();

            if (NewsId > 0)
            {
                n = nc.LoadNews(NewsId, ModuleId);
                n.NewsTitle = txtTitle.Text.Trim();
                n.NewsDate = txtDate.Text.Trim();
                n.ImageUrl = txtImgUrl.Text.Trim();
                n.NewsTeaserText = txtTeaserText.Text.Trim();
                n.NewsContent = txtContent.Text.Trim();
            }
            else
            {
                n = new News()
                {
                    NewsTitle = txtTitle.Text.Trim(),
                    NewsDate = txtDate.Text.Trim(),
                    ImageUrl = txtImgUrl.Text.Trim(),
                    NewsTeaserText = txtTeaserText.Text.Trim(),
                    NewsContent = txtContent.Text.Trim()

            };
            }

            n.ModuleId = ModuleId;

            if (n.NewsId > 0)
            {
                nc.UpdateNews(n);
            }
            else
            {
                nc.AddNews(n);
            }
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }


        protected void btnImgUpload_Click(object sender, EventArgs e)
        {
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSNewsModule/Images/"));
            btnImgSelect.SaveAs(Server.MapPath("~/DesktopModules/JSNewsModule/Images/" + btnImgSelect.FileName));

            if (btnImgSelect.FileName != null)
            {
                txtImgUrl.Text = "~/DesktopModules/JSNewsModule/Images/" + btnImgSelect.FileName;
            }
        }
    }
}