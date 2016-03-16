<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNews.ascx.cs" Inherits="JS.Modules.JSNewsModule.AddNews" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<%@ Register TagPrefix="dnn" TagName="texteditor" Src="~/controls/TextEditor.ascx" %>

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />


<div class="dnnForm add-news">
    <h3 class="dnnFormSectionHead">
            <%=LocalizeString("BasicSettings")%>
    </h3>

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
            <dnn:label ID="lblImgUrl" runat="server" />
            <asp:DropDownList ID="imgList" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="Image_Selected"/>
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblImgSelected" runat="server" />
            <asp:Image ID="imgPreview" runat="server" CssClass="news-image" AlternateText="News image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Uploaded Images.jpg" />
            <asp:TextBox ID="txtImgUrl" runat="server" CssClass="form-control" Visible="true" Enabled="false" />
        </div>        
        <div class="dnnFormItem">
            <dnn:label ID="lblUploadImg" runat="server" />
            <asp:FileUpload ID="btnImgSelect" runat="server" />
            <asp:LinkButton ID="btnImgUpload" runat="server" ResourceKey="btnUpload.Text" CssClass="dnnSecondaryAction link-upload" OnClick="btnImgUpload_Click" />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblTeaserText" runat="server" />
            <asp:TextBox ID="txtTeaserText" runat="server" TextMode="MultiLine" Rows="5" Columns="20" CssClass="form-control" />
        </div>

        <div class="dnnFormItem">
            <dnn:label ID="lblContent" runat="server" />
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="10" Columns="20" CssClass="form-control" />
            
            <%--Rich text editor--%>
            <%--<dnn:texteditor ID="txtContentRichTxt" runat="server" CssClass="form-control" />--%>
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblCustomOrderId" runat="server" />
            <asp:TextBox ID="txtCustomOrderId" runat="server" CssClass="form-control" text="0"/>
        </div>
    </fieldset>
    <div class="dnnFormItem controls">
        <asp:LinkButton ID="btnSubmit" runat="server"
            OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="btn btn-primary link-save" />
        <asp:LinkButton ID="btnCancel" runat="server"
            OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="btn btn-default link-cancel" />
    </div>

</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
