<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="frmInsertBooking.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.frmInsertBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
     <hr /> 
     <h4>Add Booking for a client</h4>
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Panel ID="pnlAvailableSlots" CssClass="panel panel-primary" runat="server" >
         <div class="panel panel-primary" >
      <div class="panel-heading">AVAILABLE SLOTS</div>
      <div class="panel-body">

            <div class="col-md-8">
           
        </div>

        </div>
             <div class="form-group">
          <asp:Label ID="lblDate" runat="server" Text="Date for appointment" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>

            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate"
            CssClass="text-danger" ErrorMessage="The Date field is required." />
         
            </div>
        </div>
          <div class="form-group">
      </div>
    <div class="form-group">
           <div class="col-md-offset-2 col-md-10">
                 <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-primary" OnClick="btnNext_Click"  />
        </div>
         </div>
      </div>
    </asp:Panel>
    
  <!--Add booking -->
         <asp:Panel ID="pnlAddBooking" CssClass="panel panel-primary" runat="server" >
         <div class="panel panel-primary" >
      <div class="panel-heading">ADD BOOKING FOR A CLIENT</div>
      <div class="panel-body">
     
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Name:</asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="drpClientSelect" runat="server" DataTextField="firstName" DataValueField="clientID" DataSourceID="sqlClient"></asp:DropDownList>
                <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control" Width="200px" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                    CssClass="text-danger" ErrorMessage="The first name field is required." />
            </div>
        </div>
    <!--A MANAGER SHOULD BE ABLE TO ADD CLIENT NAME AND CONTACT NUMBER,EMAIL, JUST IN CASE ITS A NEW BOOKING -->
  
     <ajaxToolkit:ModalPopupExtender ID="modalPopService" runat="server"
    TargetControlID="txtName"
    PopupControlID="pnlService"
    BackgroundCssClass="modalBackground" 
    DropShadow="true" 
    OkControlID="OkButton" 
    OnOkScript="onOk()"
    CancelControlID="CancelButton" 
    PopupDragHandleControlID="pnlService" />
                  <br />

         <div id="pnlService" class="panel panel-default">
  <div class="panel-body">
      <strong><asp:Label ID="lblSlot" runat="server" Text="Sort by"></asp:Label> &nbsp;
       </strong>                     
      <asp:DropDownList runat="server" ID="drpClientType" Height="22px" Width="138px" OnSelectedIndexChanged="drpClientType_SelectedIndexChanged">
          <asp:ListItem>
          </asp:ListItem>
      </asp:DropDownList>
      <br />
      <br />
       <asp:GridView ID="grdClient" CssClass="table table-hover table-bordered" runat="server" DataSourceID="sqlClient" AutoGenerateColumns="False" DataKeyNames="clientID,userID" OnSelectedIndexChanged="grdClient_SelectedIndexChanged">
          <Columns  >
              <asp:BoundField DataField="clientID" HeaderText="clientID" ReadOnly="True" InsertVisible="False" SortExpression="clientID" Visible="false"></asp:BoundField>
              <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID" Visible="false"></asp:BoundField>
              <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName"></asp:BoundField>
              <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName"></asp:BoundField>
              <asp:BoundField DataField="contactNo" HeaderText="contactNo" SortExpression="contactNo"></asp:BoundField>
           <%--<asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
              <asp:BoundField DataField="postalCode" HeaderText="postalCode" SortExpression="postalCode"></asp:BoundField>
              <asp:BoundField DataField="surburb" HeaderText="surburb" SortExpression="surburb"></asp:BoundField>
              <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName"></asp:BoundField>--%>
          </Columns>
      </asp:GridView>
      <br />
      <asp:Button ID="btnOKGood" runat="server" Text="Ok" CssClass="btn btn-primary" OnClick="btnOKGood_Click" />
  </div>
             </div>
      <asp:SqlDataSource runat="server" ID="sqlClient" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectClientManager" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
      <asp:SqlDataSource runat="server" ID="sqlStartTime" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectStartTime" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
    <div class="form-group">
            <asp:Label ID="lblService" runat="server" Text="Service"  CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="drpService" runat="server" DataSourceID="sqlService" DataTextField="servName" DataValueField="servID"></asp:DropDownList>
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="drpService"
                    CssClass="text-danger" ErrorMessage="The Service field is required." />
                <asp:SqlDataSource runat="server" ID="sqlService" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectService" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                

            </div>

        </div>  
    <div class="form-group">
            <asp:Label ID="lblEmployee" runat="server" Text="Employee" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="drpEmployee" runat="server" DataTextField="firstName" DataValueField="empID" DataSourceID="sqlEmployee" Height="29px" Width="112px"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="drpEmployee"
                    CssClass="text-danger" ErrorMessage="The Employee field is required." />
                <asp:SqlDataSource ID="sqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="uspSelectEmployeeManager" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
        </div>
     
    <div class="form-group">
         <ajaxToolkit:PopupControlExtender ID="PopEx" runat="server"
                TargetControlID="txtDate"
                PopupControlID="cldBooking"
                Position="Right" />
    </div>

    
        <div class="form-group">
            <asp:Button ID="btnSave" runat="server" Text="Save Booking" CssClass="btn btn-primary" OnClick="btnSave_Click" Width="192px" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-dafualt" Width="192px" />

        </div>


      </div>
    </div>
    </asp:Panel>
        
   
</asp:Content>

