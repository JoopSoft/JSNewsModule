<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.ascx.cs" Inherits="JS.Modules.JSNewsModule.DetailsView" %>

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
    </div>
    <div class="panel-footer">
        <div class="btn-group" role="group" aria-label="Navigate buttons">
            <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-primary link-back" OnClick="btnBack_Click" />
            <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-primary link-home" href="/" />
        </div>
        <asp:Panel ID="pnlAdminControls" runat="server" Visible="false" CssClass="pnl-admin">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit" ResourceKey="EditItem.Text" Visible="false" Enabled="false" />
                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" OnClick="lnkDelete_Click" />
            </div>
        </asp:Panel>
    </div>
</div>

<script type="text/javascript" src="<%= ModulePath %>/Js/main.js"></script>
