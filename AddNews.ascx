<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNews.ascx.cs" Inherits="JS.Modules.JSNewsModule.AddNews" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="texteditor" Src="~/controls/TextEditor.ascx" %>

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="JSNews">
    <div class="dnnForm add-news">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
            </h3>
        </div>
        <fieldset>
            <div class="dnnFormItem">
                <dnn:label ID="lblTitle" runat="server" />
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblDate" runat="server" />
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblShowImg" runat="server" />
                <asp:CheckBox ID="cbShowImg" runat="server" OnCheckedChanged="cbShowImg_CheckedChanged" AutoPostBack="true" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblImgUrl" runat="server" />
                <asp:DropDownList ID="imgList" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="Image_Selected" />
            </div>
            <div class="dnnFormItem group">
                <dnn:label ID="lblImgSelected" runat="server" />
                <asp:Image ID="imgPreview" runat="server" CssClass="news-image" AlternateText="News image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.png" />
                <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete" 
                    ResourceKey="btnDeleteImg" OnClick="btnDeleteImg_Click"
                     data-toggle="tooltip" ToolTip="Delete Image" />

                <asp:TextBox ID="txtImgUrl" runat="server" CssClass="form-control txt-img-url" 
                    Visible="true" Enabled="false" />                
            </div>

            <asp:Panel ID="pnlPopUp" runat="server" Visible="false" CssClass="dnnFormItem popup warning" >
                <div class="popup-wrapper">
                    <asp:Label ID="lblPopUpIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                    </h3>

                    <asp:LinkButton ID="btnYes" runat="server" Visible="false" CssClass="primary-action btn btn-danger link-delete"
                        ResourceKey="btnDeleteImg" OnClick="btnYes_Click" 
                        data-toggle="tooltip" ToolTip="Delete Image" />
                    <asp:LinkButton ID="btnNo" runat="server" Visible="false" CssClass="close-action btn btn-danger link-close"
                        ResourceKey="btnCancelDelete-RRRRRRRRRRRRRR" OnClick="btnNo_Click" 
                        data-toggle="tooltip" ToolTip="Close" />

                    <asp:LinkButton ID="btnDefault" runat="server" CssClass="secondary-action btn btn-primary link-image"
                        ResourceKey="btnDefault" Visible="false" OnClick="btnDefault_Click" 
                        data-toggle="tooltip" ToolTip="Use Default Image" />
                    <asp:LinkButton ID="btnRemove" runat="server" CssClass="primary-action btn btn-danger link-delete"
                        ResourceKey="btnRemove" Visible="false" OnClick="btnRemove_Click" 
                        data-toggle="tooltip" ToolTip="Remove Image" />
                    <asp:LinkButton ID="btnCancelDelete" runat="server" CssClass="close-action btn btn-danger link-close"
                        ResourceKey="btnCancelDelete-RRRRRRRRRRRR" Visible="false" OnClick="btnCancelDelete_Click" 
                        data-toggle="tooltip" ToolTip="Close" />

                    <%--<asp:LinkButton ID="btnClose" runat="server" Visible="true" CssClass="close-action btn btn-default link-close" 
                        ResourceKey="btnClose-RRRRRRRRRRRRRR" OnClick="btnCancelDelete_Click" 
                        data-toggle="tooltip" ToolTip="Close" />--%>

                </div>
            </asp:Panel>
            
            <div class="dnnFormItem">
                <dnn:label ID="lblUploadImg" runat="server" />
                <asp:FileUpload ID="btnImgSelect" runat="server" 
                    data-toggle="tooltip" />
                <asp:LinkButton ID="btnImgUpload" runat="server" CssClass="dnnSecondaryAction link-upload"  OnClick="btnImgUpload_Click"
                    ResourceKey="btnUpload" data-toggle="tooltip" ToolTip="Upload Image" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblTeaserText" runat="server" />
                <asp:TextBox ID="txtTeaserText" runat="server" TextMode="MultiLine" CssClass="form-control teaser-txt" />
            </div>
            <div class="dnnFormItem">
                <%--<dnn:label ID="lblContent" runat="server" />--%>
                <%--<asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="form-control body-txt" />--%>
            </div>
                
            <dnn:texteditor ID="txtContent" runat="server" CssClass="form-control body-txt" />
            
            <div class="dnnFormItem">
                <dnn:label ID="lblCustomOrderId" runat="server" />
                <asp:TextBox ID="txtCustomOrderId" runat="server" CssClass="form-control" Text="0" />
            </div>
            <div class="dnnFormItem controls">
                <asp:LinkButton ID="btnSubmit" runat="server"
                    OnClick="btnSubmit_Click" ResourceKey="btnSubmit" CssClass="btn btn-primary link-save" />
                <asp:LinkButton ID="btnCancel" runat="server"
                    OnClick="btnCancel_Click" ResourceKey="btnCancel" CssClass="btn btn-default link-cancel" />
            </div>
        </fieldset>
    </div>
</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
