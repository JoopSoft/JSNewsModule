<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSNewsModule.View" %>

<script src="<%=ModulePath %>/Ellipsis/jquery.ellipsis.min.js" type="text/javascript"></script>

<div class="panel panel-default">

    <%--LIST VIEW--%>
    <div class="rpt-list">
        <asp:Repeater ID="rptItemListView" Visible="false" runat="server"
            OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
            <HeaderTemplate>
            </HeaderTemplate>

            <ItemTemplate>

                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="lblNewsTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>' />
                    </h3>
                    <asp:Label ID="lblNewsDate" runat="server" CssClass="" Text='<%#DataBinder.Eval(Container.DataItem,"NewsDate").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsDate")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsDate")==true)) %>' />
                </div>

                <div class="list-group">
                    <div class="list-group-item">
                        <asp:Image ID="imgNewsImage" runat="server" Width="100" Height="100" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsImg")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsImg")==true)) %>' />
                        <asp:Label ID="lblNewsTeaserText" runat="server" CssClass="teaser-txt" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTeaserText").ToString() %>' />
                        <asp:HyperLink ID="btnReadMore" runat="server" CssClass="btn btn-primary" Text='<%#DataBinder.Eval(Container.DataItem,"ReadMoreText").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowReadMore")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowReadMore")==true)) %>' />

                        <asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="pnl-admin">
                            <div class="btn-group" role="group" aria-label="Control buttons">
                                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-default link-edit" ResourceKey="EditItem.Text" Visible="false" Enabled="false" CommandName="Edit" />
                                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-default link-add" ResourceKey="AddItem.Text" Visible="false" Enabled="false" CommandName="Add" />
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>

            </ItemTemplate>
            <FooterTemplate>
                <div class="panel-footer">
                    <asp:LinkButton ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" ResourceKey="AllItems.Text" Visible="True" Enabled="True" CommandName="AllNews" />
                    <div class="btn-group pull-right">
                        <asp:LinkButton ID="lnkPrev" runat="server" CssClass="btn btn-primary link-prev" ResourceKey="PrevItem.Text" Visible="True" Enabled="True" CommandName="Previous" />
                        <asp:LinkButton ID="lnkNext" runat="server" CssClass="btn btn-primary link-next" ResourceKey="NextItem.Text" Visible="True" Enabled="True" CommandName="Next" />
                    </div>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <%--ACCORDION VIEW--%>
    <div class="rpt-accordion">
        <asp:Repeater ID="rptItemAccordionView" runat="server"
            OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
            <HeaderTemplate>
            </HeaderTemplate>

            <ItemTemplate>
                <div class="list-group">
                    
                    <div class="list-group-item">
                    <asp:HyperLink ID="btnReadMore" runat="server" CssClass="">
                        <span class="badge">
                            <asp:Label ID="lblNewsDate" runat="server" CssClass="" Text='<%#DataBinder.Eval(Container.DataItem,"NewsDate").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsDate")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsDate")==true)) %>' />
                        </span>
                        <h4 class="list-group-item-heading">
                            <asp:Label ID="lblNewsTitle" runat="server" CssClass="" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>' />
                        </h4>
                        <p class="list-group-item-text">
                            <%--<asp:Image ID="imgNewsImage" runat="server" CssClass="" Width="50" Height="50" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsImg")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsImg")==true)) %>' />--%>
                            <asp:Label ID="lblNewsTeaserText" runat="server" CssClass="teaser-txt" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTeaserText").ToString() %>' />
                        </p>
                        <asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="pnl-admin">
                            <div class="btn-group" role="group" aria-label="Control buttons">
                                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-default link-edit" ResourceKey="EditItem.Text" Visible="false" Enabled="false" CommandName="Edit" />
                                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-default link-add" ResourceKey="AddItem.Text" Visible="false" Enabled="false" CommandName="Add" />
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" />
                            </div>
                        </asp:Panel>
                    </asp:HyperLink>
                        </div>

                </div>
            </ItemTemplate>
            <FooterTemplate>
                <div class="panel-footer">
                    <asp:LinkButton ID="lnkAll" runat="server" CssClass="btn btn-primary link-all" ResourceKey="AllItems.Text" Visible="True" Enabled="True" CommandName="AllNews" />
                    <div class="btn-group pull-right">
                        <asp:LinkButton ID="lnkPrev" runat="server" CssClass="btn btn-primary link-prev" ResourceKey="PrevItem.Text" Visible="True" Enabled="True" CommandName="Previous" />
                        <asp:LinkButton ID="lnkNext" runat="server" CssClass="btn btn-primary link-next" ResourceKey="NextItem.Text" Visible="True" Enabled="True" CommandName="Next" />
                    </div>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
<div class="clear"></div>

<script type="text/javascript">
    $(document).ready(function () {

        var $lnkEdit = '<i class="fa fa-pencil"></i>',
            $lnkAdd = '<i class="fa fa-plus-circle"></i>',
            $lnkDelete = '<i class="fa fa-trash-o"></i>',
            $lnkAll = '<i class="fa fa-external-link"></i>',

            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';


        $('.collapse').collapse();

        $('.rpt-accordion .link-edit').html($lnkEdit);
        $('.rpt-accordion .link-add').html($lnkAdd);
        $('.rpt-accordion .link-delete').html($lnkDelete);
        $('.rpt-accordion .link-all').prepend($lnkAll + ' ');
        $('.rpt-accordion .link-prev').html($lnkPrev);
        $('.rpt-accordion .link-next').html($lnkNext);

        $('.rpt-accordion .teaser-txt').ellipsis({
            row: 2,
            onlyFullWords: true
        });


        $('.rpt-list .link-edit').prepend($lnkEdit + ' ');
        $('.rpt-list .link-add').prepend($lnkAdd + ' ');
        $('.rpt-list .link-delete').prepend($lnkDelete + ' ');
        $('.rpt-list .link-all').prepend($lnkAll + ' ');
        $('.rpt-list .link-prev').prepend($lnkPrev + ' ');
        $('.rpt-list .link-next').append(' ' +$lnkNext);

        $('.rpt-list .teaser-txt').ellipsis({
            row: 5,
            onlyFullWords: true
        });




    });
</script>
