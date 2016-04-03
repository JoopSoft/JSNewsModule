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
                    cbShowImg.Checked = s.ShowNewsImg;
                    lblDate.Visible = txtDate.Visible = s.ShowNewsDate;
                    pnlShowImg.Visible = s.ShowNewsImg && s.ShowReadMore && s.ViewMode == "List";
                    //lblShowImg.Visible = cbShowImg.Visible = cbShowImg.Checked = s.ShowNewsImg && s.ShowReadMore && s.ViewMode == "List";
                    var nc = new NewsController();
                    if (NewsId > 0)
                    {
                        var n = nc.LoadNews(NewsId, ModuleId);
                        cbShowImg.Checked = n.ShowNewsImg;
                    }
                    pnlImgList.Visible = pnlImgSelectedGroup.Visible = pnlImgUpload.Visible = s.ShowNewsImg && cbShowImg.Checked && s.ViewMode == "List";
                    //lblImgUrl.Visible = imgList.Visible = lblImgSelected.Visible = imgPreview.Visible = btnDeleteImg.Visible = txtImgUrl.Visible = lblUploadImg.Visible = btnImgSelect.Visible = btnImgUpload.Visible = s.ShowNewsImg && cbShowImg.Checked && s.ViewMode == "List";
                    lblCustomOrderId.Visible = txtCustomOrderId.Visible = (s.ShowCustomOrderId && s.IsSorted);
                    var li = new ListItem("Default Image", "Default Image.svg");
                    imgList.Items.Add(li);
                    string[] imgDirectory = Directory.GetFiles(Server.MapPath("~/DesktopModules/JSNewsModule/Images/"));
                    foreach (string img in imgDirectory)
                    {
                        string filename = Path.GetFileName(img);
                        var im = new ListItem(filename, img);
                        if (filename != "Default Image.svg")
                        {
                            imgList.Items.Add(im);
                        }
                    }
                    txtImgUrl.Text = imgList.SelectedValue;
                    //check if we have an ID passed in via a querystring parameter, if so, load that item to edit.
                    //ItemId is defined in the ItemModuleBase.cs file
                    if (NewsId > 0)
                    {
                        var n = nc.LoadNews(NewsId, ModuleId);
                        if (n != null)
                        {
                            string name = n.ImageUrl.Replace("~/DesktopModules/JSNewsModule/Images/", "");
                            txtCustomOrderId.Text = n.CustomOrderId.ToString();
                            txtTitle.Text = n.NewsTitle;
                            txtDate.Text = n.NewsDate;
                            cbShowImg.Checked = n.ShowNewsImg;
                            txtImgUrl.Text = name;
                            txtTeaserText.Text = n.NewsTeaserText;
                            txtContent.Text = n.NewsContent;
                            imgPreview.ImageUrl = n.ImageUrl;
                        }
                        foreach (string img in imgDirectory)
                        {
                            string filename = Path.GetFileName(img);
                            var im = new ListItem(filename, img);
                            if (filename == txtImgUrl.Text)
                            {
                                imgList.SelectedValue = img;
                            }
                        }
                    }
                    else
                    {
                        txtImgUrl.Text = imgList.SelectedValue;
                    }
                    if (imgList.SelectedValue == "Default Image.svg")
                    {
                        btnDeleteImg.Visible = false;
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
            string style = "";
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
                n.ShowNewsImg = s.ShowNewsImg && cbShowImg.Checked;
                n.ImageUrl = imgPreview.ImageUrl;
                n.NewsTeaserText = txtTeaserText.Text.Trim();
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
                    ShowNewsImg = s.ShowNewsImg && cbShowImg.Checked,
                    ImageUrl = imgPreview.ImageUrl,
                    NewsTeaserText = txtTeaserText.Text.Trim(),
                    NewsContent = txtContent.Text.Trim(),
                    ShowReadMore = s.ShowReadMore,
                    ReadMoreText = s.ReadMoreText,
                    ShowBack = s.ShowBack,
                    BackText = s.BackText,
                    ShowHome = s.ShowHome,
                    HomeText = s.HomeText,
                };
            }
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
            bool isAllowed = false;
            String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
            if (btnImgSelect.HasFile)
            {
                string fileExtension = Path.GetExtension(btnImgSelect.FileName).ToLower();
                foreach (string str in allowedExtensions)
                {
                    if (str == fileExtension)
                    {
                        isAllowed = true;
                        break;
                    }
                }
                if (isAllowed)
                {
                    DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSNewsModule/Images/"));
                    btnImgSelect.SaveAs(Server.MapPath("~/DesktopModules/JSNewsModule/Images/" + btnImgSelect.FileName));

                    if (btnImgSelect.FileName != null)
                    {
                        txtImgUrl.Text = btnImgSelect.FileName;
                        imgPreview.ImageUrl = "~/DesktopModules/JSNewsModule/Images/" + txtImgUrl.Text;
                        var li = new ListItem("Default Image", "Default Image.svg");
                        imgList.Items.Clear();
                        imgList.Items.Add(li);
                        string[] imgDirectory = Directory.GetFiles(Server.MapPath("~/DesktopModules/JSNewsModule/Images/"));
                        foreach (string img in imgDirectory)
                        {
                            string filename = Path.GetFileName(img);
                            var im = new ListItem(filename, img);
                            if (filename != "Default Image.svg")
                            {
                                imgList.Items.Add(im);
                            }
                            if (filename == txtImgUrl.Text)
                            {
                                imgList.SelectedValue = img;
                            }
                        }
                    }
                    btnDeleteImg.Visible = true;
                }
                else
                {
                    pnlPopUp.Visible = true;
                    pnlPopUp.CssClass = "dnnFormItem popup auto-close-box success";
                    //txtImgUrl.Text = "The Selected File is not Image";
                    lblPopUpMsg.Text = "Selected file is not image!";
                    lblPopUpIcon.CssClass = "popup-icon link-info";
                }

            }
            else
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup auto-close-box success";
                //txtImgUrl.Text = "No File Selected";
                lblPopUpMsg.Text = "No file selected!";
                lblPopUpIcon.CssClass = "popup-icon link-info";
            }
        }

        protected void Image_Selected(object sender, EventArgs e)
        {
            var li = new ListItem("Default Image", "Default Image.svg");
            if (imgList.SelectedItem.Equals(li))
            {
                txtImgUrl.Text = "Default Image.svg";
                btnDeleteImg.Visible = false;
            }
            else
            {
                txtImgUrl.Text = imgList.SelectedItem.ToString();
                btnDeleteImg.Visible = true;
            }
            imgPreview.ImageUrl = "~/DesktopModules/JSNewsModule/Images/" + txtImgUrl.Text;
        }

        protected void cbShowImg_CheckedChanged(object sender, EventArgs e)
        {
            lblImgUrl.Visible = imgList.Visible = lblImgSelected.Visible = imgPreview.Visible = txtImgUrl.Visible = lblUploadImg.Visible = btnImgSelect.Visible = btnImgUpload.Visible = cbShowImg.Checked;
            btnDeleteImg.Visible = cbShowImg.Checked && imgList.SelectedValue != "Default Image.svg";
        }

        protected void btnDeleteImg_Click(object sender, EventArgs e)
        {
            if (imgList.SelectedValue != "Default Image.svg")
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup confirm-box warning";
                //txtImgUrl.Text = "Are you sure you want to delete this Image?";
                lblPopUpMsg.Text = "Delete this Image?";
                lblPopUpIcon.CssClass = "popup-icon link-delete";
                btnYes.Visible = true;
                btnNo.Visible = true;
            }
            else
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup confirm-box warning";
                //txtImgUrl.Text = "Default Image Can't Delete";
                lblPopUpMsg.Text = "Default image can't delete!";
                lblPopUpIcon.CssClass = "popup-icon link-delete";


            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            bool imgUsed = false;
            var nc = new NewsController();
            var an = nc.LoadAllNews(ModuleId);
            foreach (var n in an)
            {
                if (n.ImageUrl == imgPreview.ImageUrl)
                {
                    imgUsed = true;
                    break;
                }
            }
            if (imgUsed)
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup confirm-box warning";
                //txtImgUrl.Text = "There are News using this Image";
                lblPopUpMsg.Text = "There are News using this Image!";
                lblPopUpIcon.CssClass = "popup-icon link-delete";
                btnDefault.Visible = true;
                btnRemove.Visible = true;
                btnCancelDelete.Visible = true;
                btnYes.Visible = false;
                btnNo.Visible = false;
                return;
            }
            else
            {
                txtImgUrl.Text = "Default Image.svg";
                DeleteImage();
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            btnYes.Visible = false;
            btnNo.Visible = false;
            txtImgUrl.Text = "";
        }

        protected void btnDefault_Click(object sender, EventArgs e)
        {
            var nc = new NewsController();
            var an = nc.LoadAllNews(ModuleId);
            foreach (var n in an)
            {
                if (n.ImageUrl == imgPreview.ImageUrl)
                {
                    n.ImageUrl = "~/DesktopModules/JSNewsModule/Images/Default Image.svg";
                    nc.UpdateNews(n);
                }
            }
            lblImgUrl.Text = "Default Image.svg";
            DeleteImage();
            pnlPopUp.Visible = true;
            pnlPopUp.CssClass = "dnnFormItem popup auto-close-box success";
            //txtImgUrl.Text = "Image Replaced with Default";
            lblPopUpMsg.Text = "Default image is applied!";
            lblPopUpIcon.CssClass = "popup-icon link-info";

            btnDefault.Visible = false;
            btnRemove.Visible = false;
            btnCancelDelete.Visible = false;
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            var nc = new NewsController();
            var an = nc.LoadAllNews(ModuleId);
            foreach (var n in an)
            {
                if (n.ImageUrl == imgPreview.ImageUrl)
                {
                    n.ImageUrl = "~/DesktopModules/JSNewsModule/Images/Default Image.svg";
                    n.ShowNewsImg = false;
                    nc.UpdateNews(n);
                }
            }
            txtImgUrl.Text = "Default Image.svg";
            DeleteImage();
            pnlPopUp.Visible = true;
            pnlPopUp.CssClass = "dnnFormItem popup auto-close-box success";
            //txtImgUrl.Text = "Image Removed";
            lblPopUpMsg.Text = "Image Removed!";
            lblPopUpIcon.CssClass = "popup-icon link-info";

            btnDefault.Visible = false;
            btnRemove.Visible = false;
            btnCancelDelete.Visible = false;

        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            txtImgUrl.Text = "";
            btnDefault.Visible = false;
            btnRemove.Visible = false;
            btnCancelDelete.Visible = false;
        }

        protected void DeleteImage()
        {
            File.Delete(imgList.SelectedValue);
            string temp = imgList.SelectedValue.Replace(Server.MapPath("~/DesktopModules/JSNewsModule/Images/"), "");

            pnlPopUp.Visible = true;
            pnlPopUp.CssClass = "dnnFormItem popup auto-close-box success";
            //txtImgUrl.Text = "Image \"" + temp + "\" Deleted";
            lblPopUpMsg.Text = "Image \"" + temp + "\" Deleted";
            lblPopUpIcon.CssClass = "popup-icon link-info";


            var li = new ListItem("Default Image", "Default Image.svg");
            imgList.Items.Clear();
            imgList.Items.Add(li);
            string[] imgDirectory = Directory.GetFiles(Server.MapPath("~/DesktopModules/JSNewsModule/Images/"));
            foreach (string img in imgDirectory)
            {
                string filename = Path.GetFileName(img);
                var im = new ListItem(filename, img);
                if (filename != "Default Image.svg")
                {
                    imgList.Items.Add(new ListItem(filename, img));
                }
            }
            imgPreview.ImageUrl = "~/DesktopModules/JSNewsModule/Images/Default Image.svg";
            btnYes.Visible = false;
            btnNo.Visible = false;
            btnDeleteImg.Visible = false;
        }
    }
}