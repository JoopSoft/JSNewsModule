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
using System.Web.UI.WebControls;

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
                    var sc = new SettingsController();
                    int TModuleId = 0;
                    var ts = sc.LoadSettings();
                    foreach (CustomSettings ns in ts)
                    {
                        if (ns.SettingsId == ModuleId)
                        {
                            TModuleId = ModuleId;
                            break;
                        }
                    }
                    var s = sc.LoadSingleSettings(TModuleId);
                    lblDate.Visible = txtDate.Visible = s.ShowNewsDate;
                    lblImgUrl.Visible = imgList.Visible = btnImgSelect.Visible = btnImgUpload.Visible = s.ShowNewsImg;
                    lblCustomOrderId.Visible = txtCustomOrderId.Visible = (s.ShowCustomOrderId && s.IsSorted);
                    var li = new ListItem("Uploaded Images", "Uploaded Images");
                    imgList.Items.Add(li);
                    string [] imgDirectory = Directory.GetFiles(Server.MapPath("~/DesktopModules/JSNewsModule/Images/"));
                    foreach (string img in imgDirectory)
                    {
                        string filename = Path.GetFileName(img);
                        var im = new ListItem(filename, img);
                        if (filename != "Uploaded Images.jpg")
                        {
                            imgList.Items.Add(new ListItem(filename, img));
                        }
                    }

                    //check if we have an ID passed in via a querystring parameter, if so, load that item to edit.
                    //ItemId is defined in the ItemModuleBase.cs file
                    if (NewsId > 0)
                    {
                        var nc = new NewsController();

                        var n = nc.LoadNews(NewsId, ModuleId);
                        if (n != null)
                        {
                            txtCustomOrderId.Text = n.CustomOrderId.ToString();
                            txtTitle.Text = n.NewsTitle;
                            txtDate.Text = n.NewsDate;
                            txtImgUrl.Text = n.ImageUrl;
                            txtTeaserText.Text = n.NewsTeaserText;
                            txtContent.Text = n.NewsContent;
                            imgPreview.ImageUrl = txtImgUrl.Text;
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
            var s = new CustomSettings();
            var n = new News();
            var nc = new NewsController();
            var sc = new SettingsController();
            int TModuleId = 0;
            var ts = sc.LoadSettings();
            foreach (CustomSettings ns in ts)
            {
                if (ns.SettingsId == ModuleId)
                {
                    TModuleId = ModuleId;
                    break;
                }
            }
            s = sc.LoadSingleSettings(TModuleId);
            if (NewsId > 0)
            {
                n = nc.LoadNews(NewsId, ModuleId);
                n.CustomOrderId = Convert.ToInt32(txtCustomOrderId.Text.Trim());
                n.NewsTitle = txtTitle.Text.Trim();
                n.ShowNewsDate = s.ShowNewsDate;
                n.NewsDate = txtDate.Text.Trim();
                n.ShowNewsImg = s.ShowNewsImg;
                n.ImageUrl = txtImgUrl.Text.Trim();
                n.NewsTeaserText = imgPreview.ImageUrl;
                n.NewsContent = txtContent.Text.Trim();
                n.ShowReadMore = s.ShowReadMore;
                n.ReadMoreText = s.ReadMoreText;
                n.ShowBack = s.ShowBack;
                n.BackText = s.BackText;
                n.ShowHome = s.ShowHome;
                n.HomeText = s.HomeText;
            }
            else
            {
                n = new News()
                {
                    CustomOrderId = Convert.ToInt32(txtCustomOrderId.Text.Trim()),
                    NewsTitle = txtTitle.Text.Trim(),
                    ShowNewsDate = s.ShowNewsDate,
                    NewsDate = txtDate.Text.Trim(),
                    ShowNewsImg = s.ShowNewsImg,
                    ImageUrl = imgPreview.ImageUrl,
                    NewsTeaserText = txtTeaserText.Text.Trim(),
                    NewsContent = txtContent.Text.Trim(),
                    ShowReadMore = s.ShowReadMore,
                    ReadMoreText = s.ReadMoreText,
                    ShowBack = s.ShowBack,
                    BackText = s.BackText,
                    ShowHome = s.ShowHome,
                    HomeText = s.HomeText
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
                imgPreview.ImageUrl = txtImgUrl.Text;
                var li = new ListItem(btnImgSelect.FileName, btnImgSelect.PostedFile.ToString());
                if (!imgList.Items.Contains(li))
                {
                    imgList.Items.Add(li);
                }

            }
        }

        protected void Image_Selected(object sender, EventArgs e)
        {
            var li = new ListItem("Uploaded Images", "Uploaded Images");
            if (imgList.SelectedItem.Equals(li))
            {
                txtImgUrl.Text = "~/DesktopModules/JSNewsModule/Images/Uploaded Images.jpg";
            }
            else
            {
                txtImgUrl.Text = "~/DesktopModules/JSNewsModule/Images/" + imgList.SelectedItem;
            }
            imgPreview.ImageUrl = txtImgUrl.Text;
        }
    }
}