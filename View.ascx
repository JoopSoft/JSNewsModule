<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSNewsModule.View" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />

<div class="JSNews">
    <div class="panel panel-default view">
        <%--LIST VIEW--%>
        <asp:Panel ID="pnlList" runat="server" CssClass="rpt-list">
            <div class="list-group">
                <asp:Repeater ID="rptItemListView" runat="server" OnItemDataBound="rptItemListOnItemDataBound">

                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>
                        <asp:Panel ID="styleControl" runat="server" CssClass='<%#DataBinder.Eval(Container.DataItem,"NewsStyle").ToString() %>'>
                            <div class="list-group-item">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <asp:Label ID="lblNewsId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsId").ToString() %>' Visible="false" />
                                        <asp:Label ID="lblNewsTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>' />
                                    </h3>
                                    <asp:Label ID="lblNewsDate" runat="server" CssClass="" Text='<%#DataBinder.Eval(Container.DataItem,"NewsDate").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsDate")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsDate")==true)) %>' />
                                </div>
                                <asp:HyperLink ID="lnkImg" runat="server" CssClass="news-image" Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsImg")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsImg")==true)) %>'
                                    ToolTip='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>'>
                                    <asp:Image ID="imgNewsImage" runat="server" CssClass="news-image"
                                        ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsImg")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsImg")==true)) %>' />
                                </asp:HyperLink>
                                <asp:Label ID="lblNewsTeaserText" runat="server" CssClass="teaser-txt ellipsis"
                                    Text='<%#DataBinder.Eval(Container.DataItem,"NewsTeaserText").ToString() %>' />
                                <asp:HyperLink ID="btnReadMoreList" runat="server" CssClass="btn btn-primary read-more"
                                    Text='<%#DataBinder.Eval(Container.DataItem,"ReadMoreText").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowReadMore")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowReadMore")==true)) %>'
                                    ToolTip='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>' />

                                <%--EDIT MODE GROUP BUTTONS--%>
                                <asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="pnl-admin">
                                    <div class="btn-group" role="group" aria-label="Control buttons">
                                        <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-default link-add"
                                            ResourceKey="lnkAdd" Visible="false" Enabled="false"
                                            data-toggle="tooltip" ToolTip="Add News" />
                                        <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-default link-edit"
                                            ResourceKey="lnkEdit" Visible="false" Enabled="false"
                                            data-toggle="tooltip" />
                                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete"
                                            ResourceKey="lnkDelete" Visible="false" Enabled="false" OnClick="btnDeleteNews_Click"
                                            data-toggle="tooltip" />
                                    </div>
                                </asp:Panel>
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div class="panel-footer">
                            <asp:HyperLink ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" />
                            <div class="btn-group pull-right">
                                <asp:LinkButton ID="lnkPrev" runat="server" CssClass="btn btn-primary link-prev" OnClick="lnkPrev_Click"
                                    ResourceKey="lnkPrev" Visible="True" Enabled="True" />
                                <asp:LinkButton ID="lnkNext" runat="server" CssClass="btn btn-primary link-next" OnClick="lnkNext_Click"
                                    ResourceKey="lnkNext" Visible="True" Enabled="True" />
                            </div>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>

        <%--ACCORDION VIEW--%>
        <asp:Panel ID="pnlAccordion" runat="server" CssClass="rpt-accordion">
            <div class="list-group">
                <asp:Repeater ID="rptItemAccordionView" runat="server" OnItemDataBound="rptItemAccordionOnItemDataBound">

                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>
                        <div class="list-group-item">
                            <asp:HyperLink ID="btnReadMore" runat="server" ToolTip='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>'>
                                <span class="badge">
                                    <asp:Label ID="lblNewsId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsId").ToString() %>' Visible="false" />
                                    <asp:Label ID="lblNewsDate" runat="server"
                                        Text='<%#DataBinder.Eval(Container.DataItem,"NewsDate").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsDate")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsDate")==true)) %>' />
                                </span>
                                <div class="list-group-item-text">
                                    <asp:Image ID="imgNewsImage" runat="server" CssClass="news-image"
                                        ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsImg")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsImg")==true)) %>' />
                                    <h4 class="list-group-item-heading">
                                        <asp:Label ID="lblNewsTitle" runat="server"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>' />
                                    </h4>
                                    <asp:Label ID="lblNewsTeaserText" runat="server" CssClass="teaser-txt ellipsis"
                                        Text='<%#DataBinder.Eval(Container.DataItem,"NewsTeaserText").ToString() %>' />
                                </div>
                            </asp:HyperLink>

                            <%--EDIT MODE GROUP BUTTONS--%>
                            <asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="pnl-admin">
                                <div class="btn-group" role="group" aria-label="Control buttons">
                                    <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-default link-add no-txt"
                                        data-toggle="tooltip" ToolTip="Add News" Visible="false" Enabled="false" />
                                    <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-default link-edit no-txt"
                                        data-toggle="tooltip" Visible="false" Enabled="false" />
                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete no-txt"
                                        OnClick="btnDeleteNews_Click" Visible="false" Enabled="false"
                                        data-toggle="tooltip" />
                                </div>
                            </asp:Panel>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div class="panel-footer">
                            <asp:HyperLink ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" />
                            <div class="btn-group pull-right">
                                <asp:LinkButton ID="lnkPrev" runat="server" CssClass="btn btn-primary link-prev no-txt"
                                    OnClick="lnkPrev_Click" Visible="false" CommandName="Previous"
                                    ToolTip="Previous" />
                                <asp:LinkButton ID="lnkNext" runat="server" CssClass="btn btn-primary link-next no-txt"
                                    OnClick="lnkNext_Click" Visible="false" CommandName="Next"
                                    ToolTip="Next" />
                            </div>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>

        <%--        <asp:Panel ID="pnlPaging" runat="server">
            <dnn:PagingControl ID="pagingControl" runat="server"></dnn:PagingControl>
        </asp:Panel>--%>

        <%--FIRST ADD BUTTON--%>
        <asp:Panel ID="pnlFirstAdd" runat="server">
            <asp:HyperLink ID="lnkFirstAdd" runat="server" CssClass="btn btn-primary link-add"
                ResourceKey="lnkFirstAdd" />
        </asp:Panel>

        <%--POPUP--%>
        <asp:Panel ID="pnlPopUp" runat="server" Visible="false" CssClass="popup">
            <div class="popup-wrapper">
                <asp:Label ID="lblPopUpIcon" runat="server" />
                <h3>
                    <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                </h3>
                <asp:Label ID="lblDeleteNewsID" runat="server" Visible="false" />
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger link-delete"
                    OnClick="btnDelete_Click" ResourceKey="lnkDelete"
                    data-toggle="tooltip" ToolTip="Delete Image" />
                <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close no-txt" OnClick="btnClose_Click"
                    data-toggle="tooltip" ToolTip="Close" />
            </div>
        </asp:Panel>
    </div>
</div>

<dnn:DnnJsInclude ID="ellipsisJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Ellipsis/jquery.ellipsis.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/main.min.js" Priority="21" />