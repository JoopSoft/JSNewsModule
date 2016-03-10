<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.ascx.cs" Inherits="JS.Modules.JSNewsModule.DetailsView" %>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <asp:Label ID="lblNewsTitle" runat="server" />
                </h3>
                <asp:Label ID="lblNewsDate" runat="server" CssClass="tm_td" /><br />
            </div>
            <div class="panel-body">
                <asp:Image ID="imgNewsImage" runat="server" Width="100" Height="100" /><br />
                <asp:Label ID="lblNewsContent" runat="server" CssClass="body-txt tm_td" /><br />
            </div>
            <div class="panel-footer">
                <div class="btn-group" role="group" aria-label="Navigate buttons">
                    <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-primary" OnClick="btnBack_Click" />
                    <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-primary" href="/"/>
                </div>
                <asp:Panel ID="pnlAdminControls" runat="server" Visible="false" CssClass="pull-right">
                    <div class="btn-group" role="group" aria-label="Control buttons">
                        <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary" ResourceKey="EditItem.Text" Visible="false" Enabled="false" />
                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" OnClick="lnkDelete_Click" />
                    </div>
                </asp:Panel>                
            </div>
        </div>
