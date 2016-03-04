<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSNewsModule.View" %>
<asp:Repeater ID="rptItemList" runat="server" OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
    <%--<HeaderTemplate>
        <ul class="tm_tl">
    </HeaderTemplate>--%>

    <ItemTemplate>
        <%--<li class="tm_t">--%>

        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <asp:Label ID="lblNewsTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>' />
                </h3>
                <asp:Label ID="lblNewsDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsDate").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsDate")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsDate")==true)) %>' CssClass="tm_td" /><br />
            </div>
            <div class="panel-body">
                <asp:Image ID="imgNewsImage" runat="server" Width="100" Height="100" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowNewsImg")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowNewsImg")==true)) %>' /><br />
                <asp:Label ID="lblNewsTeaserText" runat="server" CssClass="teaser-txt tm_td" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTeaserText").ToString() %>'  /><br />
                <asp:Label ID="lblNewsContent" runat="server" CssClass="body-txt tm_td" Text='<%#DataBinder.Eval(Container.DataItem,"NewsContent").ToString() %>' /><br />
            </div>
            <div class="panel-footer">
                <div class="btn-group" role="group" aria-label="Navigate buttons">
                    <asp:LinkButton ID="btnReadMore" runat="server" CssClass="btn btn-primary" Text='<%#DataBinder.Eval(Container.DataItem,"ReadMoreText").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowReadMore")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowReadMore")==true)) %>' />
                    <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-primary" Text='<%#DataBinder.Eval(Container.DataItem,"BackText").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowBack")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowBack")==true)) %>' />
                    <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-primary" Text='<%#DataBinder.Eval(Container.DataItem,"HomeText").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowHome")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowHome")==true)) %>' />
                </div>
                <asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="pull-right">
                    <div class="btn-group" role="group" aria-label="Control buttons">
                        <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary" ResourceKey="EditItem.Text" Visible="false" Enabled="false" />
                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-primary" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" />
                    </div>
                </asp:Panel>                
            </div>
        </div>

        <%--        </li>--%>
    </ItemTemplate>
    <%--    <FooterTemplate>
        </ul>
    </FooterTemplate>--%>
</asp:Repeater>


