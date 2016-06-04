<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.UI.UserControls.TextEditor" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/labelControl.ascx" %>

<asp:Panel ID="PanelTextEditor" runat="server" CssClass="dnnTextPanel">
    <div class="dnnFormItem">
        <asp:Panel ID="PanelView" runat="server" CssClass="dnnTextPanelView">
            <dnn:label id="plView" runat="server" controlname="optView" CssClass="dnnFormLabelNoFloat" />
            <asp:RadioButtonList ID="OptView" runat="server"
                AutoPostBack="True" RepeatDirection="Vertical" RepeatLayout="Flow" />
        </asp:Panel>
    </div>

    <div id="DivBasicTextBox" runat="server" visible="false">
        <div class="dnnFormItem">
            <dnn:label ID="lblContent" runat="server" />
            <asp:TextBox ID="TxtDesktopHTML" runat="server" CssClass="form-control body-txt"
                TextMode="multiline" Placeholder="Enter Full Text" />
        </div>
        <div id="DivBasicRender" runat="server" class="dnnFormItem">
            <dnn:label id="plRender" runat="server" controlname="optRender" />
            <asp:RadioButtonList ID="OptRender" runat="server"
                AutoPostBack="True" RepeatDirection="Vertical" RepeatLayout="Flow" />
        </div>
    </div>

    <div id="DivRichTextBox" runat="server" visible="false" class="dnnFormItem rich-text-editor">
        <asp:PlaceHolder ID="PlcEditor" runat="server" />
    </div>
</asp:Panel>
