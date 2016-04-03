<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNews.ascx.cs" Inherits="JS.Modules.JSNewsModule.AddNews" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/desktopmodules/JSNewsModule/Controls/TextEditor.ascx" %>
<%--<%@ Register TagPrefix="dnn" TagName="texteditor" Src="~/controls/TextEditor.ascx" %>--%>

<%@ Register TagPrefix="dnn" TagName="DnnUrlControl" Src="~/controls/DnnUrlControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="urlcontrol" Src="~/controls/urlcontrol.ascx" %>



<%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">--%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
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
            <asp:Panel ID="pnlShowImg" runat="server" CssClass="dnnFormItem">
                <dnn:label ID="lblShowImg" runat="server" />
                <asp:CheckBox ID="cbShowImg" runat="server" OnCheckedChanged="cbShowImg_CheckedChanged" AutoPostBack="true" />
            </asp:Panel>
            <asp:Panel ID="pnlImgList" runat="server" CssClass="dnnFormItem">
                <dnn:label ID="lblImgUrl" runat="server" />
                <asp:DropDownList ID="imgList" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="Image_Selected" />
            </asp:Panel>
            <asp:Panel ID="pnlImgSelectedGroup" runat="server" CssClass="dnnFormItem group">
                <dnn:label ID="lblImgSelected" runat="server" />
                <asp:Image ID="imgPreview" runat="server" CssClass="news-image" AlternateText="News image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.svg" />
                <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete" 
                    ResourceKey="btnDeleteImg" OnClick="btnDeleteImg_Click"
                     data-toggle="tooltip" ToolTip="Delete Image" />

                <asp:TextBox ID="txtImgUrl" runat="server" CssClass="form-control txt-img-url" Enabled="false" />                
            </asp:Panel>
            <asp:Panel ID="pnlImgUpload" runat="server" CssClass="dnnFormItem">
                <dnn:label ID="lblUploadImg" runat="server" />
                <asp:FileUpload ID="btnImgSelect" runat="server" 
                    data-toggle="tooltip" />
                <asp:LinkButton ID="btnImgUpload" runat="server" CssClass="dnnSecondaryAction link-upload"  OnClick="btnImgUpload_Click"
                    ResourceKey="btnUpload" data-toggle="tooltip" ToolTip="Upload Image" />
            </asp:Panel>
            
            <div class="dnnFormItem">
                <dnn:label ID="lblTeaserText" runat="server" />
                <asp:TextBox ID="txtTeaserText" runat="server" TextMode="MultiLine" CssClass="form-control teaser-txt" />
            </div>
            <div class="dnnFormItem">
                <%--<dnn:label ID="lblContent" runat="server" />--%>
                <%--<asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="form-control body-txt" />--%>
<%--                <dnn:DnnUrlControl ID="DnnUrlControl" runat="server" />
                <dnn:urlcontrol ID="urlcontrol" runat="server" />--%>

                <dnn:texteditor ID="txtContent" runat="server" />
            </div>                
            
            <asp:Panel ID="pnlCustomOrderId" runat="server" CssClass="dnnFormItem">
                <dnn:label ID="lblCustomOrderId" runat="server" />
                <asp:TextBox ID="txtCustomOrderId" runat="server" CssClass="form-control" Text="0" />
            </asp:Panel>
            <div class="dnnFormItem controls">
                <asp:LinkButton ID="btnSubmit" runat="server"
                    OnClick="btnSubmit_Click" ResourceKey="btnSubmit" CssClass="btn btn-primary link-save" />
                <asp:LinkButton ID="btnCancel" runat="server"
                    OnClick="btnCancel_Click" ResourceKey="btnCancel" CssClass="btn btn-default link-cancel" />
            </div>

            <asp:Panel ID="pnlPopUp" runat="server" Visible="false" >
                <div class="popup-wrapper">
                    <asp:Label ID="lblPopUpIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                    </h3>

                    <div class="btn-group" role="group" aria-label="Control buttons">
                        <%--FIRST DELETION--%>
                        <asp:LinkButton ID="btnYes" runat="server" Visible="false" CssClass="btn btn-danger link-delete"
                            ResourceKey="btnDeleteImg" OnClick="btnYes_Click"
                            data-toggle="tooltip" ToolTip="Delete Image" />

                        <%--CONFRIM DELETE AND SET DEFAULT IMAGE--%>
                        <asp:LinkButton ID="btnDefault" runat="server" CssClass="btn btn-danger link-image"
                            ResourceKey="btnDefault" Visible="false" OnClick="btnDefault_Click"
                            data-toggle="tooltip" ToolTip="Use Default Image" />
                        <asp:LinkButton ID="btnRemove" runat="server" CssClass="btn btn-danger link-delete"
                            ResourceKey="btnRemove" Visible="false" OnClick="btnRemove_Click"
                            data-toggle="tooltip" ToolTip="Remove Image" />

                    </div>

                    <asp:LinkButton ID="btnNo" runat="server" Visible="false" CssClass="close-action btn btn-danger link-close"
                        ResourceKey="btnCancelDelete-RRRRRRRRRRRRRR" OnClick="btnNo_Click"
                        data-toggle="tooltip" ToolTip="Close" />
                    <asp:LinkButton ID="btnCancelDelete" runat="server" CssClass="close-action btn btn-danger link-close"
                        ResourceKey="btnCancelDelete-RRRRRRRRRRRR" Visible="false" OnClick="btnCancelDelete_Click"
                        data-toggle="tooltip" ToolTip="Close" />

                    <%--<asp:LinkButton ID="btnClose" runat="server" Visible="true" CssClass="close-action btn btn-default link-close" 
                        ResourceKey="btnClose-RRRRRRRRRRRRRR" OnClick="btnCancelDelete_Click" 
                        data-toggle="tooltip" ToolTip="Close" />--%>
                    
                </div>
            </asp:Panel>
        </fieldset>
    </div>
</div>

<%--<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
