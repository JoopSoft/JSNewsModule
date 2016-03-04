<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNews.ascx.cs" Inherits="JS.Modules.JSNewsModule.AddNews" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>


<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />


<div class="dnnForm dnnEditBasicSettings" id="dnnEditBasicSettings">
    <div class="dnnFormExpandContent dnnRight "><a href=""><%=LocalizeString("ExpandAll")%></a></div>

    <h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead dnnClear">
        <a href="" class="dnnSectionExpanded">
            <%=LocalizeString("BasicSettings")%></a></h2>
    <fieldset>

        <div class="dnnFormItem">
            <dnn:label ID="lblTitle" runat="server" />
            <asp:TextBox ID="txtTitle" runat="server" />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblDate" runat="server" />
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblImgUrl" runat="server" />
            <asp:TextBox ID="txtImgUrl" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblUploadImg" runat="server" />
            <asp:FileUpload ID="btnImgSelect" runat="server" />
            <asp:LinkButton ID="btnImgUpload" runat="server" CssClass="btn btn-primary" Text="Upload Image" OnClick="btnImgUpload_Click"/>
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblTeaserText" runat="server" />
            <asp:TextBox ID="txtTeaserText" runat="server" TextMode="MultiLine" Rows="3" Columns="20" />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblContent" runat="server" />
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" Columns="20" />
        </div>

    </fieldset>
</div>
<asp:LinkButton ID="btnSubmit" runat="server"
    OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="dnnPrimaryAction" />
<asp:LinkButton ID="btnCancel" runat="server"
    OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="dnnSecondaryAction" />

<script type="text/javascript">
    /*globals jQuery, window, Sys */
    (function ($, Sys) {
        function dnnEditBasicSettings() {
            $('#dnnEditBasicSettings').dnnPanels();
            $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
        }

        $(document).ready(function () {
            dnnEditBasicSettings();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                dnnEditBasicSettings();
            });
        });

    }(jQuery, window.Sys));
</script>
