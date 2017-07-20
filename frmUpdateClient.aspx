<%@ Page Title="" Language="C#" MasterPageFile="~/masterClient.Master" AutoEventWireup="true" CodeBehind="frmUpdateClient.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.frmUpdateClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <style type="text/css">
        .panel {
            margin-bottom: 0px;
            width: 800px;
            height: 1000px;
            vertical-align:central;
            display: inline-block;
            margin: 1em;
       
                }
    </style>

    <br />
    <br />
    <br />
    <br />
    <hr /> 
       <h4>Update client&nbsp;&nbsp;<span class="glyphicon glyphicon-edit"></span></h4>
    <br />
    <br />
     &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
     <div class="panel panel-info">
    <div class="panel-heading">
    <h3 class="panel-title">Client Details</h3>
    </div>
     <div class="panel-body">
     <div class="form-group">
     <asp:ValidationSummary runat="server" CssClass="text-danger" />

         <br />
           
         <asp:Label runat="server" AssociatedControlID="drpTitle" CssClass="col-md-2 control-label">Title:</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="drpTitle" runat="server" Width="160px">
                    <asp:ListItem Value="0">Select Title</asp:ListItem>
                    <asp:ListItem Value="1">Mr</asp:ListItem>
                    <asp:ListItem Value="2">Miss</asp:ListItem>
                    <asp:ListItem Value="3">Mrs</asp:ListItem>
                    <asp:ListItem Value="4">Ms</asp:ListItem>

                </asp:DropDownList>
                  <asp:RequiredFieldValidator runat="server" ControlToValidate="drpTitle" ValidationGroup="Title" InitialValue="0"
                    CssClass="text-danger" ErrorMessage ="Title field is required." Display= "None"/>
                <asp:CompareValidator ID="compTitle" runat="server" ErrorMessage="Title field is required." ControlToValidate="drpTitle" Operator="NotEqual" ValueToCompare="0" SetFocusOnError="false" CssClass="text-danger"  Display="None"></asp:CompareValidator>

                
            </div>
        </div>
        &nbsp;&nbsp;
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">First Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control" Width="280px" placeholder="Name" /> 
            </div>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" CssClass="text-danger" ErrorMessage="Firstname field  is required." Display= "None" />
               </div>
  &nbsp;&nbsp;
           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-2 control-label">Last Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtLastName" TextMode="SingleLine" CssClass="form-control" Width="280px" placeholder="Last Name" />
                </div>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" Display= "None"
                    CssClass="text-danger" ErrorMessage="Lastname field is required" />
            
        </div>
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" Width="280px" placeholder="Email" ViewStateMode="Enabled"  />
                 </div> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Display="None" 
                    CssClass="text-danger" ErrorMessage="Email field is required."/>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContact"   ForeColor="Red"></asp:RegularExpressionValidator>
        </div> 
    &nbsp;&nbsp;
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtContact" CssClass="col-md-2 control-label">Contact No:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtContact" TextMode="SingleLine" CssClass="form-control" Width="120px" placeholder="Contact No"  MaxLength="10"/>
                </div>
             
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContact" Display="None"
                    CssClass="text-danger" ErrorMessage="Contact Number field is required."/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContact"     ForeColor="Red" Display="Dynamic" ValidationExpression="(^((0|(\(0\)))?|(00|(\(00\)))?(\s?|-?)(27|\(27\))|((\+27))|(\(\+27\))|\(00(\s?|-?)27\))( |-)?(\(?0?\)?)( |-)?\(?(1[0-9]|2[1-4,7-9]|3[1-6,9]|4[0-9]|5[1,3,6-9]|7[1-4,6,8,9]|8[0-9])\)?(\s?|-?)((\d{3}(\s?|-?)\d{4}$)|((\d{4})(\s?|-?)(\d{3})$)|([0-2](\s?|-?)(\d{3}(\s?|-?)\d{3}$))))" ErrorMessage="Invalid mobile number!"></asp:RegularExpressionValidator>
        </div> 
  &nbsp;&nbsp;
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">City:</asp:Label>
            <div class="col-md-10">
                 <asp:TextBox runat="server" ID="txtCity" TextMode="SingleLine" CssClass="form-control" Width="120px" placeholder="City"/>
           </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" CssClass="text-danger" ErrorMessage="City field is required." Display= "None" />

        </div> 
    &nbsp;&nbsp;
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Suburb:</asp:Label>
            <div class="col-md-10">
                 <asp:TextBox runat="server" ID="txtSuburb" TextMode="SingleLine" CssClass="form-control" Width="120px" placeholder="Suburb"/>
           </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSuburb" CssClass="text-danger" ErrorMessage="Suburb field is required." Display= "None" />

        </div> 
    &nbsp;&nbsp;
    <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Postal Code:</asp:Label>
            <div class="col-md-10">
                 <asp:TextBox runat="server" ID="txtPostalCode" TextMode="SingleLine" CssClass="form-control" Width="120px" placeholder="Postal Code" MaxLength="4" />
           </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPostalCode" CssClass="text-danger" ErrorMessage="Postal Code field is required" Display= "None" />

        </div> 
    &nbsp;&nbsp;
    <br />
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="drpRole"  CssClass="col-md-2 control-label">Role:</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="drpRole" runat="server" Width="192px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="drpRole" ValidationGroup="ClientType" InitialValue="0"
                    CssClass="text-danger" ErrorMessage="*" ToolTip="Client type is a required field is a required field"/>
            </div>
        </div>
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <div class="form-group">
           <div class="col-md-offset-2 col-md-10">
<%--              <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" Width="100px" OnClick="btnUpdate_Click1"/>&nbsp;--%>

               <asp:Button ID="btnUpdate" runat="server" Text="Update"   CssClass="btn btn-primary" Width="100px" CausesValidation="False" OnClick="btnUpdate_Click"/>
            <asp:Button ID="btnCancel" CssClass="btn btn-default" runat="server" Text="Cancel" Width="100px" CausesValidation="False" OnClick="btnCancel_Click" />
             </div>
         </div>
    <asp:Label ID="lblStatus" runat="server" Text="Client Updated!"></asp:Label>
             </div>
         </div>
      

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />   
       

</asp:Content>