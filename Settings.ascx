<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="JS.Modules.JSNewsModule.Settings" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>



	<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
	<fieldset>
        <div class="dnnFormItem">
            <dnn:Label ID="lblViewMode" runat="server" />
            <asp:DropDownList ID="viewModeList" runat="server" AutoPostBack="true" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowNewsDate" runat="server" /> 
            <asp:CheckBox ID="cbShowNewsDate" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowNewsImg" runat="server" /> 
            <asp:CheckBox ID="cbShowNewsImg" runat="server" OnCheckedChanged="cbShowNewsImg_CheckedChanged" AutoPostBack="true"/>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowReadMore" runat="server" /> 
            <asp:CheckBox ID="cbShowReadMore" runat="server" AutoPostBack="true" OnCheckedChanged="cbShowReadMore_CheckedChanged" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblReadMoreText" runat="server" /> 
            <asp:TextBox ID="txtReadMoreText" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowBack" runat="server" /> 
            <asp:CheckBox ID="cbShowBack" runat="server" AutoPostBack="true" OnCheckedChanged="cbShowBack_CheckedChanged"  />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblBackText" runat="server" /> 
            <asp:TextBox ID="txtBackText" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblShowHome" runat="server" /> 
            <asp:CheckBox ID="cbShowHome" runat="server" AutoPostBack="true" OnCheckedChanged="cbShowHome_CheckedChanged"  />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblHomeText" runat="server" /> 
            <asp:TextBox ID="txtHomeText" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblIsSorted" runat="server" />
            <asp:CheckBox ID="cbIsSorted" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsSorted_CheckedChanged"/>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblSortBy" runat="server" />
            <asp:DropDownList ID="sortByList" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblSortType" runat="server" />
            <asp:DropDownList ID="sortTypeList" runat="server" />
        </div>
    </fieldset>


<script type="text/javascript">
    $(document).ready(function () {

        


    });
</script>