﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNews.ascx.cs" Inherits="JS.Modules.JSNewsModule.AddNews" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/DesktopModules/JSNewsModule/Controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<dnn:DnnCssInclude ID="bootstrapDatePickerCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.21/daterangepicker.min.css" />
<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSNewsModule/module.min.css" />

<div class="JSNews">
    <div class="dnnForm add-news">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSNewsMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage one-control dnnFormTitle no-spacing">
                    <asp:Label ID="lblSubTitle" runat="server" ResourceKey="lblSubTitle" />
                </asp:Panel>
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    data-toggle="tooltip" ToolTip="Settings" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblTitle" runat="server" />
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"
                        Placeholder="Enter Title" />
                    <asp:RequiredFieldValidator ID="titleValidator" runat="server" CssClass="txt-error-validate" 
                        ErrorMessage="Required Field" ControlToValidate="txtTitle" SetFocusOnError="True" Display="Dynamic" />
                </div>
            </div>
            <div class="fieldset">
                <asp:Panel ID="pnlDate" runat="server" class="dnnFormItem group">
                    <dnn:label ID="lblDate" runat="server" />
                    <div class="input-group">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="datePicker form-control grouped squared-box" 
                            Placeholder="Enter Date" />
                        <asp:HyperLink ID="lnkCalendarIcon" runat="server" CssClass="datePickerClick input-group-addon link-calendar no-txt" />
                    </div>
                </asp:Panel>
            </div>
            <asp:Panel ID="pnlCustomOrderId" runat="server" CssClass="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCustomOrderId" runat="server" />
                    <asp:TextBox ID="txtCustomOrderId" runat="server" CssClass="form-control" Text="0" 
                        Placeholder="Enter Custom Order" />
                </div>
            </asp:Panel>
            <div class="fieldset">
                <asp:Panel ID="pnlShowImg" runat="server" CssClass="dnnFormItem">
                    <dnn:label ID="lblShowImg" runat="server" />
                    <asp:CheckBox ID="cbShowImg" runat="server" CssClass="hidder" data-target=".showImgGroup" />
                </asp:Panel>
                <asp:Panel ID="showImgGroup" runat="server" CssClass="showImgGroup dnnFormItem">
                    <asp:Panel ID="pnlImgList" runat="server" CssClass="dnnFormItem">
                        <dnn:label ID="lblImgUrl" runat="server" />
                        <asp:DropDownList ID="imgList" runat="server" CssClass="selectpicker single-select form-control"
                            AutoPostBack="True" OnSelectedIndexChanged="Image_Selected" />
                    </asp:Panel>
                    <asp:Panel ID="pnlImgSelectedGroup" runat="server" CssClass="dnnFormItem group">
                        <dnn:label ID="lblImgSelected" runat="server" />
                        <asp:Image ID="imgPreview" runat="server" CssClass="news-image" AlternateText="News image"
                            ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.svg" />
                        <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete"
                            ResourceKey="btnDeleteImg" OnClick="btnDeleteImg_Click"
                            data-toggle="tooltip" ToolTip="Delete Image" />
                        <asp:TextBox ID="txtImgUrl" runat="server" CssClass="form-control txt-img-url" Enabled="false" />
                    </asp:Panel>
                    <asp:Panel ID="pnlImgUpload" runat="server" CssClass="dnnFormItem">
                        <dnn:label ID="lblUploadImg" runat="server" />
                        <asp:FileUpload ID="btnImgSelect" runat="server" data-target=".btnImgUpload" />
                        <asp:LinkButton ID="btnImgUpload" runat="server" CssClass="btnImgUpload dnnSecondaryAction link-upload"
                            OnClick="btnImgUpload_Click" ResourceKey="btnUpload" CausesValidation="False" />
                    </asp:Panel>
                </asp:Panel>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblTeaserText" runat="server" />
                    <asp:TextBox ID="txtTeaserText" runat="server" TextMode="MultiLine" CssClass="form-control teaser-txt"
                        Placeholder="Enter Teaser Text" />
                    <asp:RequiredFieldValidator ID="teaserTextValidator" runat="server" CssClass="txt-error-validate"  
                        ErrorMessage="Required Field" ControlToValidate="txtTeaserText" SetFocusOnError="True" Display="Dynamic" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:texteditor ID="txtContent" runat="server" />
                </div>
            </div>
        </fieldset>

        <div class="dnnFormItem controls">
            <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary link-save"
                OnClick="btnSubmit_Click" ResourceKey="btnSubmit" />
            <asp:HyperLink ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
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
<dnn:DnnJsInclude ID="bootstrapDatePickerMomentJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.21/moment.min.js" Priority="20" />
<dnn:DnnJsInclude ID="bootstrapDatePickerJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.21/daterangepicker.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/main.min.js" Priority="22" />