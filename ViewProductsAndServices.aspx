<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="ViewProductsAndServices.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.ViewProductsAndServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .productItem {
            width: 140px;
            float: left;
            padding: 5px;
            margin: 5px;
        }

        .groupSeparator {
            border-top: 1px dotted Gray;
            height: 1px;
            clear: both;
        }

        .itemSeparator {
            height: 180px;
            width: 1px;
            border-left: 1px dotted Gray;
            margin-top: 5px;
            margin-bottom: 5px;
            float: left;
        }
       
        
    </style>
    <h2><%: Title %></h2>

    <br />
    <br />
    <br />
    <p>
        <div class="jumbotron" style="align-content:center">
    <h3>Our services</h3>
    <br />
    <br />
        
            View:&nbsp;&nbsp;<asp:DropDownList ID="ddlServType" runat="server" AutoPostBack="True" Width="15%" ></asp:DropDownList>
       
    <br />
    <br />
        </p>
   <p style="text-align:right">
     &nbsp;<asp:TextBox ID="txtSearch" runat="server" placeholder="Search service" ToolTip="Search service" ></asp:TextBox>
    &nbsp;
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-primary" />
        </p>
    <br />
    <br />
    <%--DataSourceID="sqlServiceType" DataTextField="servTypeName" DataValueField="servTypeID"--%>
    <%-- <asp:SqlDataSource ID="SqlServName" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>--%>
    <%--<asp:SqlDataSource runat="server" ID="sqlServiceType" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectService_Type" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
    <p>&nbsp;</p>
    <asp:DataList runat="server" RepeatColumns="4" ID="dlData" ItemStyle-Wrap="true" Width="100%" Height="100%" DataSourceID="sqlService" >
        <HeaderStyle Font-Underline="True" />
        <ItemStyle Wrap="True"></ItemStyle>
        <ItemTemplate>
            <div class="container-fluid">
 
            <div class="productItem">

                <div>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photoPath") %>' Height="100%" Width="100%" />

                </div>
                <div>
                    <b>
                        <%# Eval("servName") %>
                      
                    </b>

                </div>

                <div>
                    <%# Eval("servDesc") %>
                </div>

                <div>
                    <%# Eval("servDuration") %> Min

                </div>
                <br />
                <div>
                    <%#:String.Format("{0:c}", Eval("servCost")) %>
                </div>
                <br />

                <asp:Button ID="btnBookNow" CssClass="btn btn-primary" runat="server" Text="Book Now" OnClick="btnBookNow_Click" />
        </ItemTemplate>
        <SeparatorStyle Wrap="true" />
    </asp:DataList>
    
    </div>
    <asp:SqlDataSource runat="server" ID="sqlService" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' FilterExpression="servName LIKE '{0}%'" SelectCommand="uspGetServiceByServiceTypeID" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlServType" PropertyName="SelectedValue" Name="serviceTypeID" Type="Int32" ></asp:ControlParameter>
        </SelectParameters>
        <FilterParameters>
         <asp:ControlParameter Name="servName" ControlID="txtSearch" PropertyName="Text" />
          </FilterParameters>
        
    </asp:SqlDataSource>
   
   <%-- <nav>
        <ul class="pager">
            <li><a href="#">Previous</a></li>
            <li><a href="#">Next</a></li>
        </ul>
    </nav>--%>
  <%--  <footer>
        <asp:LinkButton ID="lnkButton1" Text="Previous" runat="server" OnClick="lnkButton1_Click"></asp:LinkButton>
         <asp:LinkButton ID="lnkButton2" Text="Next" runat="server" OnClick="lnkButton2_Click"></asp:LinkButton>
    </footer>--%>


    <%--<%--<asp:ListView runat="server" ID="listView" DataSourceID="datasourceServices" Visible="true" >
        <LayoutTemplate>
            <div style="width: 500px;">
                <asp:PlaceHolder runat="server" ID="groupPlaceHolder"  />
            </div>
        </LayoutTemplate>
        <GroupTemplate>
            <div style="clear: both;">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="productItem">
                
              
                <div>
                    <b>
                        <%# Eval("servName") %>
                         </b>

                </div>
                 <div>
                     <%# Eval("servDesc") %>

                 </div>
                <div>
                     <%# Eval("servDuration") %> Min

                </div>
                <div>
                      <%#:String.Format("{0:c}", Eval("servCost")) %></div>
                <br />

                <asp:Button ID="btnBookNow" CssClass="btn btn-primary" runat="server" Text="Book Now" OnClick="btnBookNow_Click" />
           
  
        </ItemTemplate>
        <ItemSeparatorTemplate>
            <div class="itemSeparator">
            </div>
        </ItemSeparatorTemplate>
        <GroupSeparatorTemplate>
            <div class="groupSeparator">
       <div>
        
            </div>
        </GroupSeparatorTemplate>
        <EmptyDataTemplate>
        </EmptyDataTemplate>
    </asp:ListView>

    <!--this code doesnt or is not suppose to display in browser-->

        <%--panel-group class="row"
        
                     
     <%--<asp:ListView ID="lstServices" runat="server" DataSourceID="datasourceServices" GroupItemCount="3" Visible="false">
         
         <GroupTemplate>
             <tr id="itemPlaceholderContainer" runat="server">
                 <td id="itemPlaceholder" runat="server"></td>
             </tr>
         </GroupTemplate>

         <ItemTemplate>
             
                 <td runat="server" style="">
                     <div class="panel panel-default">
                         <div id="pnlBody" runat="server" class="panel-body">
                             
                             
                             <asp:Label ID="lblServName" runat="server" Text="Service:" Font-Bold="true" />
                             <asp:Label ID="servNameLabel" runat="server" Text='<%# Eval("servName") %>' />
                             <br />
                             <asp:Label ID="lblDesc" runat="server" Text="Description:" Font-Bold="true" />
                             <asp:Label ID="servDescLabel" runat="server" Text='<%# Eval("servDesc") %>' />
                             <br />
                             <asp:Label ID="lblServCost" runat="server" Text="Cost: "  Font-Bold="true"/>
                             <asp:Label ID="servCostLabel" runat="server" Text='<%#:String.Format("{0:c}", Eval("servCost")) %>' />
                             <br />
                             <asp:Label ID="lblDuration" runat="server" Text="Duration:" Font-Bold="true" />
                             <asp:Label ID="servDurationLabel" runat="server" Text='<%# Eval("servDuration") %>' />
                             <asp:Label ID="lblMin" runat="server" Text="Min" />
                             <br />

                             <asp:Button ID="btnBookNow" CssClass="btn btn-primary" runat="server" Text="Book Now" />
                         </div>
                     </div>          
             </td>
       
         </ItemTemplate>
        <LayoutTemplate>

             <table runat="server">
                 <tr runat="server">
                     <td runat="server">
                         <table id="groupPlaceholderContainer" runat="server" border="0" style="width:200% ">
                            
                             <tr id="groupPlaceholder" runat="server">
                             </tr>
                         </table>
                     </td>
                 </tr>
                 <tr runat="server">
                     <td runat="server" style=""></td>
                 </tr>
             </table>
         </LayoutTemplate>
         <SelectedItemTemplate>
             <td runat="server" style="">
                 <asp:Label ID="servNameLabel" runat="server" Text='<%# Eval("servName") %>' />
                 <br />

                 <asp:Label ID="servDescLabel" runat="server" Text='<%# Eval("servDesc") %>' />
                 <br />

                 <asp:Label ID="servCostLabel" runat="server" Text='<%# Eval("servCost") %>' />
                 <br />

                 <asp:Label ID="servDurationLabel" runat="server" Text='<%# Eval("servDuration") %>' />
                 <br />
             </td>
         </SelectedItemTemplate>
     </asp:ListView>
     <asp:SqlDataSource ID="datasourceServices" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="SELECT [servName], [servDesc], [servCost], [servDuration] FROM [Service]"></asp:SqlDataSource>
    <br />

    <asp:SqlDataSource ID="dsServices" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="SELECT [servName], [servDesc], [servCost], [servDuration], [photo] FROM [Service]"></asp:SqlDataSource>--%>


    <!--Testing displaying services in collapsible panels

         <div class="text-center">
    <h2>Pricing</h2>
    <h4>Choose a service</h4>
  </div>
  <div class="row">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Basic</h1>
        </div>
        <div class="panel-body">
          <p><strong>20</strong> Lorem</p>
          <p><strong>15</strong> Ipsum</p>
          <p><strong>5</strong> Dolor</p>
          <p><strong>2</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$19</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>
    </div>
      </div>
        -->


    <!-- Source :http://www.prepbootstrap.com/bootstrap-template/collapsepanels -->

    <style>
        .panel-heading span {
            margin-top: -20px;
            font-size: 15px;
        }

        .row {
            margin-top: 40px;
            padding: 0 10px;
        }

        .clickable {
            cursor: pointer;
        }
    </style>
     <br />
    <br />
    <br />
     <br />
    <br />
    <br />
    <br />
    <br />
    <br />
     <br />
    <br />
    <br />
</asp:Content>


