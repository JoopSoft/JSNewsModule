<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSNewsModule.View" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>

<asp:Repeater ID="rptItemListView" Visible="false" runat="server" OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
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
                    <asp:HyperLink ID="btnReadMore" runat="server" CssClass="btn btn-primary" Text='<%#DataBinder.Eval(Container.DataItem,"ReadMoreText").ToString() %>' Visible='<%#((DataBinder.Eval(Container.DataItem,"ShowReadMore")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"ShowReadMore")==true)) %>' />
                </div>
                <asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="pull-right">
                    <div class="btn-group" role="group" aria-label="Control buttons">
                        <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary" ResourceKey="EditItem.Text" Visible="false" Enabled="false" CommandName="Edit" />
                        <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary" ResourceKey="AddItem.Text" Visible="false" Enabled="false" CommandName="Add" />
                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" />
                    </div>
                </asp:Panel>                
            </div>
        </div>

        <%--        </li>--%>
    </ItemTemplate>
    <FooterTemplate>
        <%--    </ul>--%>

        <div class="panel-footer">
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-primary">View All</button>
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%--<span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>--%>
                    <i class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">News item 1</a></li>
                    <li><a href="#">News item 2</a></li>
                    <li><a href="#">News item 3</a></li>
                    <li><a href="#">News item 4</a></li>
                </ul>
            </div>
            <div class="btn-group pull-right">
                <a class="btn btn-default" href="#"><i class="fa fa-angle-left"></i></a>
                <a class="btn btn-default" href="#"><i class="fa fa-angle-right"></i></a>
            </div>
        </div>

    </FooterTemplate>
</asp:Repeater>

<asp:Repeater ID="rptItemAccordionView" runat="server" OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
    <%--<HeaderTemplate>
        <ul class="tm_tl">
    </HeaderTemplate>--%>

    <ItemTemplate>
        <%--<li class="tm_t">--%>
        <asp:HyperLink ID="btnReadMore" runat="server">
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
            </div>
            <div class="panel-footer">
                <div class="btn-group" role="group" aria-label="Navigate buttons">
                </div>
                <asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="pull-right">
                    <div class="btn-group" role="group" aria-label="Control buttons">
                        <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary" ResourceKey="EditItem.Text" Visible="false" Enabled="false" CommandName="Edit" />
                        <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary" ResourceKey="AddItem.Text" Visible="false" Enabled="false" CommandName="Add" />
                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" />
                    </div>
                </asp:Panel>                
            </div>
        </div>
        </asp:HyperLink>

        <%--        </li>--%>
    </ItemTemplate>
       <FooterTemplate>
       <%--  </ul>--%>
           <div class="panel-footer">
               <!-- Split button -->
               <div class="btn-group">
                   <button type="button" class="btn btn-primary">View All</button>
                   <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <%--<span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>--%>
                       <i class="fa fa-angle-down"></i>
                   </button>
                   <ul class="dropdown-menu">
                       <li><a href="#">News item 1</a></li>
                       <li><a href="#">News item 2</a></li>
                       <li><a href="#">News item 3</a></li>
                       <li><a href="#">News item 4</a></li>
                   </ul>
               </div>
               <div class="btn-group pull-right">
                   <a class="btn btn-default" href="#"><i class="fa fa-angle-left"></i></a>
                   <a class="btn btn-default" href="#"><i class="fa fa-angle-right"></i></a>
               </div>
           </div>
    </FooterTemplate>
</asp:Repeater>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            <dnn:TITLE runat="server" id="dnnTITLE" CssClass="TitleH3" />
        </h3>
    </div>
    <div class="panel-body">
        <div id="ContentPane" runat="server"></div>
    </div>

    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Collapsible Group Item #1
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <span class="badge">6</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">11</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">124</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Collapsible Group Item #2
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <span class="badge">6</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">11</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">124</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Collapsible Group Item #3
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <span class="badge">6</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">11</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">124</span>
                        <h4 class="list-group-item-heading">List group item heading</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-footer">
        <!-- Split button -->
        <div class="btn-group">
            <button type="button" class="btn btn-primary">View All</button>
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <%--<span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>--%>
                <i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#">News item 1</a></li>
                <li><a href="#">News item 2</a></li>
                <li><a href="#">News item 3</a></li>
                <li><a href="#">News item 4</a></li>
            </ul>
        </div>
        <div class="btn-group pull-right">
            <a class="btn btn-default" href="#"><i class="fa fa-angle-left"></i></a>
            <a class="btn btn-default" href="#"><i class="fa fa-angle-right"></i></a>
        </div>
    </div>
</div>
<div class="clear"></div>