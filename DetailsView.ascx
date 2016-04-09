<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.ascx.cs" Inherits="JS.Modules.JSNewsModule.DetailsView" %>

<link href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" rel="stylesheet" type="text/css" media="screen" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="JSNews">
    <asp:Panel ID="pnlDetailsView" runat="server" CssClass="panel panel-default details-view">
        <div class="panel-heading">
            <h3 class="panel-title">
                <asp:Label ID="lblNewsTitle" runat="server" />
            </h3>
            <asp:Label ID="lblNewsDate" runat="server" CssClass="date" />
        </div>
        <div class="panel-body">
            <asp:HyperLink ID="lnkPopUpImg" runat="server" CssClass="link-popup" >
                <asp:Image ID="imgNewsImage" runat="server" CssClass="news-image" 
                    AlternateText="" />
            </asp:HyperLink>
            <asp:Label ID="lblNewsContent" runat="server" CssClass="body-txt" />
            <asp:Panel ID="pnlAdminControls" runat="server" Visible="false" CssClass="pnl-admin">
                <div class="btn-group" role="group" aria-label="Control buttons">
                    <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit" 
                        ResourceKey="EditItem" Visible="false" Enabled="false"
                        data-toggle="tooltip" />
                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete" OnClick="lnkDelete_Click"
                        ResourceKey="DeleteItem" Visible="false" Enabled="false" 
                        data-toggle="tooltip" />
                </div>
            </asp:Panel>
        </div>
        <div class="panel-footer">
            <div class="btn-group" role="group" aria-label="Navigate buttons">
                <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-primary link-back" 
                    OnClick="btnBack_Click" />
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-primary link-home" 
                    href="/" />
            </div>
            <div class="btn-group pull-right">
                <asp:LinkButton ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" 
                    ResourceKey="AllItems" Visible="True" Enabled="True" CommandName="AllNews" />
                <asp:LinkButton ID="lnkPrev" runat="server" CssClass="btn btn-primary link-prev" 
                    ResourceKey="PrevItem" Visible="True" Enabled="True" CommandName="Previous" />
                <asp:LinkButton ID="lnkNext" runat="server" CssClass="btn btn-primary link-next" 
                    ResourceKey="NextItem" Visible="True" Enabled="True" CommandName="Next"  />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlPopUp" runat="server" Visible="false" CssClass="popup">
        <div class="popup-wrapper">
            <asp:Label ID="lblPopUpIcon" runat="server" />
            <h3>
                <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
            </h3>
            <asp:Label ID="lblDeleteNewsID" runat="server" />
            <div class="btn-group" role="group" aria-label="Control buttons">
                <%--FIRST DELETION--%>
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger link-delete"
                    ResourceKey="btnDeleteImg" OnClick="btnDelete_Click"
                    data-toggle="tooltip" ToolTip="Delete Image" />
            </div>

            <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close"
                ResourceKey="btnCancelDelete-RRRRRRRRRRRRRR" OnClick="btnClose_Click"
                data-toggle="tooltip" ToolTip="Close" />
        </div>
    </asp:Panel>
</div>

<%--<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>

