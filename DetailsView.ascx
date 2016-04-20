<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.ascx.cs" Inherits="JS.Modules.JSNewsModule.DetailsView" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fancyboxCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" />
<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />

<div class="JSNews">
    <div class="panel panel-default details-view">
        <%--DETAILS VIEW--%>
        <asp:Panel ID="pnlDetailsView" runat="server">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <asp:Label ID="lblNewsTitle" runat="server" />
                </h3>
                <asp:Label ID="lblNewsDate" runat="server" CssClass="date" />
            </div>
            <div class="panel-body">
                <asp:HyperLink ID="lnkPopUpImg" runat="server" CssClass="link-popup">
                    <asp:Image ID="imgNewsImage" runat="server" CssClass="news-image"
                        AlternateText="" />
                </asp:HyperLink>
                <asp:Label ID="lblNewsContent" runat="server" CssClass="body-txt" />
                <asp:Panel ID="pnlAdminControls" runat="server" Visible="false" CssClass="pnl-admin">
                    <div class="btn-group" role="group" aria-label="Control buttons">
                        <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit"
                            ResourceKey="lnkEdit" Visible="false" Enabled="false"
                            data-toggle="tooltip" />
                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete" OnClick="lnkDelete_Click"
                            ResourceKey="lnkDelete" Visible="false" Enabled="false"
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
                        ResourceKey="lnkAll" Visible="True" Enabled="True" CommandName="AllNews" />
                    <asp:LinkButton ID="lnkPrev" runat="server" CssClass="btn btn-primary link-prev"
                        ResourceKey="lnkPrev" Visible="True" Enabled="True" CommandName="Previous" />
                    <asp:LinkButton ID="lnkNext" runat="server" CssClass="btn btn-primary link-next"
                        ResourceKey="lnkNext" Visible="True" Enabled="True" CommandName="Next" />
                </div>
            </div>
        </asp:Panel>

        <%--POPUP--%>
        <asp:Panel ID="pnlPopUp" runat="server" Visible="false" CssClass="popup confirm-box warning">
            <div class="popup-wrapper">
                <asp:Label ID="lblPopUpIcon" runat="server" />
                <h3>
                    <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                </h3>
                <asp:Label ID="lblDeleteNewsID" runat="server" />
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger link-delete"
                    ResourceKey="lnkDelete" OnClick="btnDelete_Click"
                    data-toggle="tooltip" ToolTip="Delete Image" />

                <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close no-txt"
                    OnClick="btnClose_Click" data-toggle="tooltip" ToolTip="Close" />
            </div>
        </asp:Panel>
    </div>
</div>

<dnn:DnnJsInclude ID="fancyboxJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js" Priority="19" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/main.min.js" Priority="21" />