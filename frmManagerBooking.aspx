<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="frmManagerBooking.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.frmManagerBooking" %>
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
    <br />
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="drpSpecialist" CssClass="col-md-2 control-label">Specialist:</asp:Label><br />
            <div class="col-md-10">
                <asp:DropDownList ID="drpSpecialist" runat="server" Width="194px" ></asp:DropDownList>
            </div>
        </div>
    <br />
         <div class="form-group">
          <asp:Label ID="lblDate" runat="server" Text="Date for appointment" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
             <%--  <asp:TextBox ID="txtDate" runat="server" TextMode="Date" ></asp:TextBox>--%>
               <asp:Calendar runat="server" ID="calApp" OnDayRender="calApp_DayRender" SelectionMode="Day" >
                 <SelectedDayStyle BackColor="Navy" />
               </asp:Calendar>
                </div>
                </div>
    <br />
    <br />
            <div class="form-group">
           <div class="col-md-10">
                <asp:DropDownList ID="drpTime" runat="server" Width="70px" DataSourceID="sqlDTime" DataTextField="startTime" DataValueField="timeID" ></asp:DropDownList>
                <br />
                <asp:SqlDataSource ID="sqlDTime" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="SELECT [startTime], [timeID] FROM [slotStartTime]"></asp:SqlDataSource>
               <asp:RequiredFieldValidator ID="rqTime" runat="server" ControlToValidate="drpTime"
            CssClass="text-danger" ErrorMessage="The field is required." />
            </div>
        </div>
   <br />
    <br />
     <div class="form-group">
          <asp:Label ID="lblServiceType" runat="server" Text="Service Type:" CssClass="col-md-2 control-label"></asp:Label>
           
              <div class="col-md-10">
                <asp:DropDownList ID="drpServiceType" runat="server" Width="194px" ></asp:DropDownList>
            </div>
          
        </div>
    <br />
    <br />
     <div class="form-group">
          <asp:Label ID="lblService" runat="server" Text="Service:" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="drpService" runat="server" Width="194px" ></asp:DropDownList>
            </div>
        </div>
    <br />
    
    <div class="form-group">
          <asp:Label ID="Label2" runat="server" Text="Client Name:" CssClass="col-md-2 control-label"></asp:Label>
            <br />
            <div class="col-md-10">
                <asp:DropDownList ID="drpClient" runat="server" Width="194px" DataSourceID="sqlClient" DataTextField="firstName" DataValueField="clientID" ></asp:DropDownList>
                <asp:SqlDataSource ID="sqlClient" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="uspSelectClientManager" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
        </div>
    <br />
    <br />
    
         <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Width="91px" OnClick="btnSave_Click"  /> 
                &nbsp;
              <asp:Button runat="server" Text="Cancel" CssClass="btn btn-default" Width="91px"   /> 

        </div>
        </div>


</asp:Content>
