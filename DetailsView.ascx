<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.ascx.cs" Inherits="JS.Modules.JSNewsModule.DetailsView" %>

<%--<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>--%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="panel panel-default details-view">
    <div class="panel-heading">
        <h3 class="panel-title">
            <asp:Label ID="lblNewsTitle" runat="server" />
        </h3>
        <asp:Label ID="lblNewsDate" runat="server" CssClass="" />
    </div>
    <div class="panel-body">
        <asp:Image ID="imgNewsImage" runat="server" CssClass="news-image" />
        <asp:Label ID="lblNewsContent" runat="server" CssClass="body-txt" />

        <asp:Panel ID="pnlAdminControls" runat="server" Visible="false" CssClass="pnl-admin">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit" ResourceKey="EditItem.Text" Visible="false" Enabled="false" />
                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" OnClick="lnkDelete_Click" />
            </div>
        </asp:Panel>

    </div>
    <div class="panel-footer">
        <div class="btn-group" role="group" aria-label="Navigate buttons">
            <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-primary link-back" OnClick="btnBack_Click" />
            <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-primary link-home" href="/" />
        </div>

        <div class="btn-group pull-right">
            <asp:LinkButton ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" ResourceKey="AllItems.Text" Visible="True" Enabled="True" CommandName="AllNews" />
            <asp:LinkButton ID="lnkPrev" runat="server" CssClass="btn btn-primary link-prev" ResourceKey="PrevItem.Text" Visible="True" Enabled="True" CommandName="Previous" />
            <asp:LinkButton ID="lnkNext" runat="server" CssClass="btn btn-primary link-next" ResourceKey="NextItem.Text" Visible="True" Enabled="True" CommandName="Next" />
        </div>
    </div>
</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
