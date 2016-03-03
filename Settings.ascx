<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="JS.Modules.JSNewsModule.Settings" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>



	<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
	<fieldset>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowNewsDate" runat="server" /> 
            <asp:CheckBox ID="cbShowNewsDate" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowNewsImg" runat="server" /> 
            <asp:CheckBox ID="cbShowNewsImg" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowReadMore" runat="server" /> 
            <asp:CheckBox ID="cbShowReadMore" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblReadMoreText" runat="server" /> 
            <asp:TextBox ID="txtReadMoreText" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowBack" runat="server" /> 
            <asp:CheckBox ID="cbShowBack" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblBackText" runat="server" /> 
            <asp:TextBox ID="txtBackText" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowHome" runat="server" /> 
            <asp:CheckBox ID="cbShowHome" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblHomeText" runat="server" /> 
            <asp:TextBox ID="txtHomeText" runat="server" />
        </div>
    </fieldset>


