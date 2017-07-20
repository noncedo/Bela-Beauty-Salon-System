<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="frmViewClient.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.frmViewClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <style type="text/css">
         .cssPager td
        {
            padding-left:6px;
            padding-right:6px;                                                                                                                                                      
        }
         
        
    </style>
    <br />
    <br />
    <br />
    <br />
    <hr />
    <h4><%: Title %></h4>

   <h4>View Clients&nbsp;&nbsp;<span class="glyphicon glyphicon-eye-open"></span></h4>
     <br />
    
      <div id="pnlDelete" class="panel panel-default" runat="server" visible="false">
        <div class="panel-body">
            <h4>Are you sure you want to delete <asp:Label ID="lblServName" runat="server" Text=""></asp:Label>?</h4>
          
            <asp:Button ID="btnOK" runat="server" Text="Ok" CssClass="btn btn-primary" OnClick="btnOK_Click"  />
          &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="btnCancel_Click"  />
            <br />
        </div>
    </div>
     &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
 
    <br />
     Search Client Name:
<asp:TextBox ID="txtSearch" runat="server" placeholder="Search"></asp:TextBox>
    &nbsp;
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-primary" />
    <br />
    <br />
    <asp:GridView ID="grvViewClient" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlSelectClientbyManager"  DataKeyNames="userID" AllowPaging="true" PageSize="5" OnRowCommand="grvViewClient_RowCommand">
      <PagerStyle CssClass="cssPager" />
           <PagerSettings Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
         <Columns>
            <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID" InsertVisible="False" ReadOnly="True" Visible="false"/>
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName"  />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="contactNo" HeaderText="Contact Number" SortExpression="contactNo"></asp:BoundField>
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city"></asp:BoundField>
            <asp:BoundField DataField="surburb" HeaderText="Surburb" SortExpression="surburb" />
             <asp:BoundField DataField="postalCode" HeaderText="Postal Code" SortExpression="postalCode" />

             <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" CommandArgument='<%#Bind("userID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                  
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" CssClass="btn btn-default" CommandArgument='<%#Bind("userID") %>' runat="server" Text="Delete" OnClick="btnDelete_Click"  />
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    
    </asp:GridView>
   
   <asp:SqlDataSource ID="sqlSelectClientbyManager" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" FilterExpression="firstName LIKE '{0}%'" SelectCommand="uspSelectClientByMANAGER" SelectCommandType="StoredProcedure"  UpdateCommandType="StoredProcedure" DeleteCommand="uspDeleteUserClientByManager" DeleteCommandType="StoredProcedure" InsertCommand="uspSelectClientByMANAGER" InsertCommandType="StoredProcedure" UpdateCommand="uspUpdateUserClientByManager">
          <FilterParameters>
         <asp:ControlParameter Name="firstName" ControlID="txtSearch" PropertyName="Text" />
          </FilterParameters>
       <DeleteParameters>
            <asp:Parameter Name="userID" Type="Int32" />
            <asp:Parameter Name="active" Type="Boolean" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="userID" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="contactNo" Type="String" />
            <asp:Parameter Name="surburb" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="postalCode" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
   <asp:SqlDataSource runat="server" ID="sqlSelectclientManager" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectClientManager" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <br />
        <asp:Button ID="btnAdd" runat="server" Text="New Client" CssClass="btn btn-primary" OnClick="btnAdd_Click" Width="180px" />

       
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

 