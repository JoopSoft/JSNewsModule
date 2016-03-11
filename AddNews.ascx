<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNews.ascx.cs" Inherits="JS.Modules.JSNewsModule.AddNews" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<%@ Register TagPrefix="dnn" TagName="texteditor" Src="~/controls/TextEditor.ascx" %>

<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web.Deprecated" Namespace="DotNetNuke.Web.UI.WebControls"%>
<%@ Register TagPrefix="dnncl" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>


<div class="dnnForm dnnEditBasicSettings" id="dnnEditBasicSettings">
    <div class="dnnFormExpandContent dnnRight "><a href=""><%=LocalizeString("ExpandAll")%></a></div>

    <h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead dnnClear">
        <a href="" class="dnnSectionExpanded">
            <%=LocalizeString("BasicSettings")%></a></h2>
    <fieldset>

        <div class="dnnFormItem">
            <dnn:label ID="lblCustomOrderId" runat="server" />
            <asp:TextBox ID="txtCustomOrderId" runat="server" CssClass="form-control" text="0"/>
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblTitle" runat="server" />
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblDate" runat="server" />
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblImgUrl" runat="server" />
            <asp:DropDownList ID="imgList" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="Image_Selected"/><br />
            <dnn:label runat="server" />
            <asp:TextBox ID="txtImgUrl" runat="server" CssClass="form-control" Visible="false" />
        </div>
        
        <div class="dnnFormItem">
            <dnn:label ID="lblUploadImg" runat="server" />
            <asp:FileUpload ID="btnImgSelect" runat="server" CssClass="btn btn-default" />
            <asp:LinkButton ID="btnImgUpload" runat="server" CssClass="btn btn-primary" Text="<i class='fa fa-upload'></i>" OnClick="btnImgUpload_Click" />
            <asp:Image ID="imgPreview" runat="server" AlternateText="News image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Uploaded Images.jpg" Width="35px" Height="35px"  />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblTeaserText" runat="server" />
            <asp:TextBox ID="txtTeaserText" runat="server" TextMode="MultiLine" Rows="3" Columns="20" CssClass="form-control" />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblContent" runat="server" />
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="9" Columns="20" CssClass="form-control" />
            
            <%--Rich text editor--%>
            <dnn:texteditor ID="txtContentRichTxt" runat="server" CssClass="form-control" />

        </div>

        <div class="dnnFormItem">
            <asp:LinkButton ID="btnSubmit" runat="server"
                OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="btn btn-primary" />
            <asp:LinkButton ID="btnCancel" runat="server"
                OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="btn btn-default" />
        </div>


    </fieldset>
</div>


<script type="text/javascript">
    /*globals jQuery, window, Sys */
    (function ($, Sys) {
        function dnnEditBasicSettings() {
            $('#dnnEditBasicSettings').dnnPanels();
            $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
        }

        $(function () {
            $('[data-toggle="tooltip"]').tooltip({
                placement: 'auto left'
            })
        });


        $(document).ready(function () {
            dnnEditBasicSettings();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                dnnEditBasicSettings();
            });

        });

    }(jQuery, window.Sys));
</script>
