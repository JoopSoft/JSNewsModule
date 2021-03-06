﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="JS.Modules.JSNewsModule.Settings" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSNewsModule/module.min.css" />

<div class="JSNews">
    <div class="dnnForm settings">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSNewsMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage one-control dnnFormTitle">
                    <asp:Label ID="lblSubTitle" runat="server" ResourceKey="lblSubTitle" />
                </asp:Panel>
                <asp:HyperLink ID="lnkAddNews" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add News Entry" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblViewMode" runat="server" />
                    <asp:DropDownList ID="ddViewModeList" runat="server" CssClass="selectpicker single-select form-control check-equal"
                        data-target=".pnlReadMoreGroup" data-equal="Accordion" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShowNewsDate" runat="server" />
                    <asp:CheckBox ID="cbShowNewsDate" runat="server" />
                </div>
            </div>
            <asp:Panel ID="pnlReadMoreNewsGroup" runat="server" CssClass="fieldset">
                <asp:Panel ID="pnlShowNewsImg" runat="server" CssClass="dnnFormItem">
                    <dnn:Label ID="lblShowNewsImg" runat="server" />
                    <asp:CheckBox ID="cbShowNewsImg" runat="server" />

                    <asp:Label ID="lblStatusImgMsg" runat="server" Enabled="false"
                        ResourceKey="lblStatImgMsg" />
                </asp:Panel>
                <asp:Panel ID="pnlReadMoreGroup" runat="server" CssClass="pnlReadMoreGroup dnnFormItem">
                    <asp:Panel ID="pnlShowReadMore" runat="server" CssClass="dnnFormItem">
                        <dnn:Label ID="lblShowReadMore" runat="server" />
                        <asp:CheckBox ID="cbShowReadMore" runat="server" CssClass="hidder" data-target=".pnlReadMoreTxt" />

                        <asp:Label ID="lblStatusReadMoreMsg" runat="server" Enabled="false"
                            ResourceKey="lblStatReadMoreMsg" />
                    </asp:Panel>
                    <asp:Panel ID="pnlReadMoreText" runat="server" CssClass="pnlReadMoreTxt dnnFormItem">
                        <dnn:Label ID="lblReadMoreText" runat="server" />
                        <asp:TextBox ID="txtReadMoreText" runat="server" CssClass="form-control"
                            Placeholder="Enter Read More Button Text" />
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShowBack" runat="server" />
                    <asp:CheckBox ID="cbShowBack" runat="server" CssClass="hidder" data-target=".pnlBackText" />
                </div>
                <asp:Panel ID="pnlBackText" runat="server" class="pnlBackText dnnFormItem">
                    <dnn:Label ID="lblBackText" runat="server" />
                    <asp:TextBox ID="txtBackText" runat="server" CssClass="form-control"
                        Placeholder="Enter Back Button Text" />
                </asp:Panel>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShowHome" runat="server" />
                    <asp:CheckBox ID="cbShowHome" runat="server" CssClass="hidder" data-target=".pnlHomeText" />
                </div>
                <asp:Panel ID="pnlHomeText" runat="server" class="pnlHomeText dnnFormItem">
                    <dnn:Label ID="lblHomeText" runat="server" />
                    <asp:TextBox ID="txtHomeText" runat="server" CssClass="form-control"
                        Placeholder="Enter Home Button Text" />
                </asp:Panel>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShowAllNews" runat="server" />
                    <asp:CheckBox ID="cbShowAllNews" runat="server" CssClass="hidder" data-target=".pnlShowAllNews" />
                </div>
                <div class="pnlShowAllNews dnnFormItem">
                    <dnn:Label ID="lblAllNewsText" runat="server" />
                    <asp:TextBox ID="txtAllNews" runat="server" CssClass="form-control"
                        Placeholder="Enter All News Button Text" />
                </div>
                <div class="pnlShowAllNews dnnFormItem group">
                    <dnn:Label ID="lblAllNewsSelect" runat="server" />
                    <asp:DropDownList ID="ddAllNewsSelect" runat="server" CssClass="selectpicker single-select form-control" DataSourceID="SqlDataSourcePages" DataTextField="TabName" DataValueField="TabPath" />

                    <asp:SqlDataSource ID="SqlDataSourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" SelectCommand="SELECT * FROM [Tabs] WHERE (([PortalID] = @PortalID) AND ([ContentItemID] IS NOT NULL))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="PortalID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblIsSorted" runat="server" />
                    <asp:CheckBox ID="cbIsSorted" runat="server" CssClass="hidder" data-target=".pnlSortNews" />
                </div>
                <asp:Panel ID="pnlSortBy" runat="server" class="pnlSortNews dnnFormItem group">
                    <dnn:Label ID="lblSortBy" runat="server" />
                    <asp:DropDownList ID="sortByList" runat="server" CssClass="selectpicker single-select form-control" />
                </asp:Panel>
                <asp:Panel ID="pnlSortType" runat="server" class="pnlSortNews dnnFormItem group">
                    <dnn:Label ID="lblSortType" runat="server" />
                    <asp:DropDownList ID="sortTypeList" runat="server" CssClass="selectpicker single-select form-control" />
                </asp:Panel>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblUsePaging" runat="server" />
                    <asp:CheckBox ID="cbUsePaging" runat="server" CssClass="hidder" data-target=".pnlPaging" />
                </div>
                <asp:Panel ID="pnlNewsPerPage" runat="server" CssClass="pnlPaging dnnFormItem">
                    <dnn:label ID="lblNewsPerPage" runat="server" />
                    <asp:TextBox ID="txtNewsPerPage" runat="server" CssClass="form-control"
                        Placeholder="Enter News Items per Page" />
                </asp:Panel>
            </div>
            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt"
                ToolTip="Top" />
        </fieldset>
    </div>
</div>

<script type="text/javascript">
    (function ($, Sys) {

        //SWITCH CHECKBOXES BETWEEN READMORE AND IMAGE LINKS
        $('.JSNews #<%= cbShowNewsImg.ClientID %>')
            .each(function () {
                if ($(this).is(':checked')) $('.JSNews #<%= cbShowReadMore.ClientID %>')
                .prop('disabled', false)
                .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                .find('#<%= lblStatusReadMoreMsg.ClientID %>')
                .hide();
            else $('.JSNews #<%= cbShowReadMore.ClientID %>')
                .prop('disabled', true)
                .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                .find('#<%= lblStatusReadMoreMsg.ClientID %>')
                .show();
        })
        .bind('change', function () {
            if ($(this).is(':checked')) $('.JSNews #<%= cbShowReadMore.ClientID %>')
                .prop('disabled', false)
                .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                .find('#<%= lblStatusReadMoreMsg.ClientID %>')
                .hide();
            else $('.JSNews #<%= cbShowReadMore.ClientID %>')
                .prop('disabled', true)
                .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                .find('#<%= lblStatusReadMoreMsg.ClientID %>')
                .show();
        });

        $('.JSNews #<%= cbShowReadMore.ClientID %>')
            .each(function () {
                if ($(this).is(':checked'))
                    $('.JSNews #<%= cbShowNewsImg.ClientID %>')
                    .prop('disabled', false)
                    .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                        .find('#<%= lblStatusImgMsg.ClientID %>')
                        .hide();
            else
                $('.JSNews #<%= cbShowNewsImg.ClientID %>')
                    .prop('disabled', true)
                    .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                        .find('#<%= lblStatusImgMsg.ClientID %>')
                        .show();
        })
        .bind('change', function () {
            if ($(this).is(':checked'))
                $('.JSNews #<%= cbShowNewsImg.ClientID %>')
                    .prop('disabled', false)
                    .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                        .find('#<%= lblStatusImgMsg.ClientID %>')
                        .hide();
            else
                $('.JSNews #<%= cbShowNewsImg.ClientID %>')
                    .prop('disabled', true)
                    .closest('#<%= pnlReadMoreNewsGroup.ClientID %>')
                        .find('#<%= lblStatusImgMsg.ClientID %>')
                        .show();
        });
    })(jQuery, window.Sys);
</script>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="18" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="19" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSNewsModule/Js/main.min.js" Priority="21" />
