<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSNewsModule.View" %>
<asp:Repeater ID="rptItemList" runat="server" OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
    <HeaderTemplate>
        <ul class="tm_tl">
    </HeaderTemplate>

    <ItemTemplate>
        <li class="tm_t">
            <h3>
                <asp:Label ID="lblNewsTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTitle").ToString() %>' />
            </h3>
            <asp:Label ID="lblNewsDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsDate").ToString() %>' CssClass="tm_td" /><br />
            <asp:Image ID="imgNewsImage" runat="server" Width="100" Height="100" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' /><br />
            <asp:Label ID="lblNewsTeaserText" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsTeaserText").ToString() %>' CssClass="tm_td" /><br />
            <asp:Label ID="lblNewsContent" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NewsContent").ToString() %>' CssClass="tm_td" />

            <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
                <asp:HyperLink ID="lnkEdit" runat="server" ResourceKey="EditItem.Text" Visible="false" Enabled="false" />
                <asp:LinkButton ID="lnkDelete" runat="server" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" />
            </asp:Panel>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
