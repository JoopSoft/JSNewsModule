<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNews.ascx.cs" Inherits="JS.Modules.JSNewsModule.AddNews" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/DesktopModules/JSNewsModule/Controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />

<div class="JSNews">
    <div class="dnnForm add-news">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
            </h3>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblTitle" runat="server" />
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="fieldset">
                <asp:Panel ID="pnlDate" runat="server" class="dnnFormItem">
                    <dnn:label ID="lblDate" runat="server" />
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
                </asp:Panel>
            </div>
            <asp:Panel ID="pnlShowImg" runat="server" CssClass="dnnFormItem">
                <dnn:label ID="lblShowImg" runat="server" />
                <asp:CheckBox ID="cbShowImg" runat="server" CssClass="hidder" data-target=".showImgGroup" />
            </asp:Panel>
            <asp:Panel ID="showImgGroup" runat="server" CssClass="fieldset">
                <asp:Panel ID="pnlImgList" runat="server" CssClass="showImgGroup dnnFormItem">
                    <dnn:label ID="lblImgUrl" runat="server" />
                    <asp:DropDownList ID="imgList" runat="server" CssClass="selectpicker show-tick single-select"
                        AutoPostBack="True" OnSelectedIndexChanged="Image_Selected" />
                </asp:Panel>
                <asp:Panel ID="pnlImgSelectedGroup" runat="server" CssClass="showImgGroup dnnFormItem group">
                    <dnn:label ID="lblImgSelected" runat="server" />
                    <asp:Image ID="imgPreview" runat="server" CssClass="news-image" AlternateText="News image"
                        ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.svg" />
                    <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete"
                        ResourceKey="btnDeleteImg" OnClick="btnDeleteImg_Click"
                        data-toggle="tooltip" ToolTip="Delete Image" />
                    <asp:TextBox ID="txtImgUrl" runat="server" CssClass="form-control txt-img-url" Enabled="false" />
                </asp:Panel>
                <asp:Panel ID="pnlImgUpload" runat="server" CssClass="showImgGroup dnnFormItem">
                    <dnn:label ID="lblUploadImg" runat="server" />
                    <asp:FileUpload ID="btnImgSelect" runat="server" data-target=".btnImgUpload" />
                    <asp:LinkButton ID="btnImgUpload" runat="server" CssClass="btnImgUpload dnnSecondaryAction link-upload"
                        OnClick="btnImgUpload_Click" ResourceKey="btnUpload" />
                </asp:Panel>
            </asp:Panel>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblTeaserText" runat="server" />
                    <asp:TextBox ID="txtTeaserText" runat="server" TextMode="MultiLine" CssClass="form-control teaser-txt" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:texteditor ID="txtContent" runat="server" />
                </div>
            </div>
            <asp:Panel ID="pnlCustomOrderId" runat="server" CssClass="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCustomOrderId" runat="server" />
                    <asp:TextBox ID="txtCustomOrderId" runat="server" CssClass="form-control" Text="0" />
                </div>
            </asp:Panel>
        </fieldset>

        <div class="dnnFormItem controls">
            <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary link-save"
                OnClick="btnSubmit_Click" ResourceKey="btnSubmit" />
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                OnClick="btnCancel_Click" ResourceKey="btnCancel" />
        </div>

        <%--POPUP--%>
        <asp:Panel ID="pnlPopUp" runat="server" Visible="false">
            <div class="popup-wrapper">
                <asp:Label ID="lblPopUpIcon" runat="server" />
                <h3>
                    <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                </h3>
                <div class="btn-group">
                    <%--FIRST DELETION--%>
                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger link-delete"
                        ResourceKey="btnDeleteImg" OnClick="btnDelete_Click"
                        data-toggle="tooltip" ToolTip="Delete Image" />

                    <%--CONFRIM DELETE AND SET DEFAULT IMAGE--%>
                    <asp:LinkButton ID="btnDefault" runat="server" CssClass="btn btn-danger link-image"
                        ResourceKey="btnDefault" Visible="false" OnClick="btnDefault_Click"
                        data-toggle="tooltip" ToolTip="Use Default Image" />
                    <asp:LinkButton ID="btnRemove" runat="server" CssClass="btn btn-danger link-delete"
                        ResourceKey="btnRemove" Visible="false" OnClick="btnRemove_Click"
                        data-toggle="tooltip" ToolTip="Remove Image" />
                </div>
                <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close no-txt"
                    OnClick="btnClose_Click" data-toggle="tooltip" ToolTip="Close" />
            </div>
        </asp:Panel>
        <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt" 
            ToolTip="Top" />
    </div>
</div>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="18" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="19" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/main.min.js" Priority="21" />