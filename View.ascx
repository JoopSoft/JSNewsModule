<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSNewsModule.View" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />

<div class="JSNews">
    <div class="view">

        <%--FIRST ADD BUTTON--%>
        <asp:Panel ID="pnlFirstAdd" runat="server" CssClass="btn-group">
            <asp:HyperLink ID="lnkFirstAdd" runat="server" CssClass="btn btn-primary link-add"
                ResourceKey="lnkFirstAdd" />
        </asp:Panel>

        <%--EDIT MODE GROUP BUTTONS--%>
        <asp:Panel ID="pnlAdmin" runat="server" Visible="true" CssClass="pnl-admin">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:Label ID="lblContentHolder" runat="server" />
                <asp:Label ID="lblContentHolderActivate" runat="server" />

                <asp:LinkButton ID="lnkCheckLicenseKey" runat="server"
                    OnClick="lnkCheckLicenseKey_Click" />
                <asp:LinkButton ID="lnkGetOwnerInfo" runat="server"
                    OnClick="lnkMoreInfo_Click" />

                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    ResourceKey="lnkAdd" ToolTip="Add News Entry" />
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    ResourceKey="lnkSettings" ToolTip="Settings" />
            </div>
        </asp:Panel>

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
                            <asp:HyperLink ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" />
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <asp:Panel ID="pnlListNavigation" runat="server" CssClass="page_navigation btn-group panel-footer"></asp:Panel>
                <asp:Panel ID="pnlListInfoText" runat="server" CssClass="info_text"></asp:Panel>
            </asp:Panel>

            <%--ACCORDION VIEW--%>
            <asp:Panel ID="pnlAccordion" runat="server" CssClass="rpt-accordion">
                <div class="list-group">
                    <asp:Repeater ID="rptItemAccordionView" runat="server" OnItemDataBound="rptItemAccordionOnItemDataBound">

                        <HeaderTemplate></HeaderTemplate>
                        <ItemTemplate>
                            <div class="list-group-item">
                                <asp:HyperLink ID="btnReadMore" runat="server" ToolTip='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>'>
                                    <asp:Panel ID="badge" runat="server" CssClass="badge">
                                        <asp:Label ID="lblNewsId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsId").ToString() %>' Visible="false" />
                                        <asp:Label ID="lblNewsDate" runat="server"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"NewsDate").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsDate")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsDate")==true)) %>' />
                                    </asp:Panel>
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
                            <asp:HyperLink ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" />
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <asp:Panel ID="pnlAccNavigation" runat="server" CssClass="page_navigation btn-group panel-footer"></asp:Panel>
                <asp:Panel ID="pnlAccInfoText" runat="server" CssClass="info_text"></asp:Panel>
            </asp:Panel>

            <%--POPUP--%>
            <asp:Panel ID="pnlPopUp" runat="server" Visible="false" CssClass="popup">
                <div class="popup-wrapper">
                    <asp:Label ID="lblPopUpIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                    </h3>
                    <asp:Panel ID="pnlInputGroups" runat="server" CssClass="input-group">
                        <asp:Label ID="lblKey" runat="server" CssClass="input-group-addon"
                            ClientIDMode="Static" />
                        <asp:TextBox ID="txtKey" runat="server" CssClass="form-control" Enabled="true"
                            aria-describedby="lblKey"
                            Placeholder="Enter Installed Key" />
                        <span class="input-group-btn">
                            <asp:HyperLink ID="lnkSubmit" runat="server" CssClass="btn btn-primary link-key no-txt"
                                data-toggle="tooltip" />
                        </span>
                    </asp:Panel>
                    <asp:Panel ID="pnlAlerts" runat="server" CssClass="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true" class="link-close no-txt">&times;</span>
                        </button>
                        <asp:Label ID="lblStatusMsg" runat="server"
                            Text="Error messaging status text.." />
                    </asp:Panel>
                    <asp:Panel ID="pnlOwnerInfo" runat="server" ClientIDMode="Static">
                        <div class="owner-wrapper">
                            <asp:Label ID="lblInfoInstalledKey" runat="server" />
                            <asp:Label ID="lblInfoConfirmKey" runat="server" />
                            <asp:Label ID="lblInfoCompany" runat="server" />
                            <asp:Label ID="lblInfoEmail" runat="server" />
                            <asp:Label ID="lblInfoCellPhone" runat="server" />
                            <asp:Label ID="lblInfoDomain" runat="server" />
                        </div>
                    </asp:Panel>

                    <asp:Label ID="lblDeleteNewsID" runat="server" Visible="false" />
                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger link-delete"
                        OnClick="btnDelete_Click" ResourceKey="lnkDelete"
                        data-toggle="tooltip" ToolTip="Delete Image" />
                    <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close no-txt"
                        data-toggle="tooltip" ToolTip="Close" 
                        OnClick="btnClose_Click"/>
                </div>
            </asp:Panel>
        </div>
    </div>
</div>

<script type="text/javascript">
    (function ($, Sys) {

        $settingsData = '<%= ModulePath %>Json/<%= ModuleId %>_Settings.json';

        //PREDEFINED AJAX REQUEST
        function jqXHR(url, beforeLoad, cache) {
            return $.ajax({
                url: url,
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                type: 'get',
                cache: cache,
                beforeSend: beforeLoad
            })
            .always(function () {
                //console.log("complete");
            });
        };

        $(window).load(function () {
            jqXHR($settingsData,
                    function () {
                        //console.log('Before load func');
                    }, false)
                    .done(function (data) {
                        var $settings = data.settings,
                            $newsPerPage = data.settings.newsPerPage,
                            $usePaging = data.settings.usePaging;

                        if ($usePaging === true) {

                            $('.JSNews #<%= pnlList.ClientID %>').paging({
                                item_container_id: '.list-group',
                                nav_label_info: 'Showing {0}-{1} of {2} results',
                                num_page_links_to_display: 3,
                                items_per_page: $newsPerPage,
                                wrap_around: false,
                                show_first_last: false
                            });

                            $('.JSNews #<%= pnlAccordion.ClientID %>').paging({
                                item_container_id: '.list-group',
                                nav_label_info: '{0}-{1} of {2}',
                                num_page_links_to_display: 3,
                                items_per_page: $newsPerPage,
                                wrap_around: false,
                                show_first_last: false
                            });
                        }
                    })
    		    .fail(function (jqXHR, textStatus) {
    		        console.log('Error Loading JSON');
    		    });
        });

    })(jQuery, window.Sys);
</script>

<dnn:DnnJsInclude ID="ellipsisJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/jquery.ellipsis.min.js" Priority="20" />
<dnn:DnnJsInclude ID="pagingJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/jquery.paging.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/main.min.js" Priority="22" />
