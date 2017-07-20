<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="frmRegisterClient.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.frmRegisterClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <style type="text/css">
        .panel{
             margin-bottom: 0px;
             width: 800px;
             height: 800px;
             position:center;
                  }
    </style>
    <br />
    <br />
    <br />
    <br />
    <hr />


   
        <h4>Registration</h4>
        <br>

        <div class="panel panel-info">
            <div class="panel-heading">
              </div>
            <div class="panel-body panel-height = 100px">
                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <div class="form-group">
                 <asp:Label runat="server" AssociatedControlID="drpTitle" CssClass="col-md-2 control-label"><strong>Title:</strong></asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="drpTitle" runat="server" Width="160px">
                    <asp:ListItem Value="0">Select one</asp:ListItem>
                    <asp:ListItem Value="1">Mr</asp:ListItem>
                    <asp:ListItem Value="2">Miss</asp:ListItem>
                    <asp:ListItem Value="3">Mrs</asp:ListItem>
                    <asp:ListItem Value="4">Ms</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rqGender" runat="server" ErrorMessage="*required field" CssClass="text-danger" ControlToValidate="drpTitle">
                </asp:RequiredFieldValidator>
                </div>
            </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label">Username:</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="txtUsername" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="Username" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                        CssClass="text-danger" ErrorMessage="The username field is required." />
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;
       <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password:</asp:Label>
           <div class="col-md-10">
               <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" Width="220px" placeholder="Password" />
               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                   CssClass="text-danger" ErrorMessage="The password field is required." />
           </div>
       </div>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" TextMode="Password" CssClass="col-md-2 control-label">Confirm Password:</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" Width="220px" placeholder="Confirm Password" />
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Password and confirm password mismatch" Text="*" ControlToValidate="txtPassword"
                        ControlToCompare="txtConfirmPassword" ForeColor="Red" CssClass="text-danger" />
                </div>
            </div>
        
    
   
            &nbsp;&nbsp;&nbsp;&nbsp;
       <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-2 control-label">Name:</asp:Label>
           <div class="col-md-10">
               <asp:TextBox runat="server" ID="txtFirstName" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="First Name" />
               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName"
                   CssClass="text-danger" ErrorMessage="The first name field is required." />
           </div>
       </div>
              &nbsp;&nbsp;&nbsp;&nbsp;
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-2 control-label">Surname:</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="txtLastName" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="Surname" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName"
                        CssClass="text-danger" ErrorMessage="The last name field is required." />
                </div>
            </div>


              &nbsp;&nbsp;&nbsp;&nbsp;
           <div class="form-group">
               <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email:</asp:Label>
               <div class="col-md-10">
                   <asp:TextBox runat="server" ID="txtEmail" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="Email" />
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Text="*"
                       CssClass="text-danger" ErrorMessage="The email field is required." />
                   <asp:RegularExpressionValidator runat="server" ErrorMessage="invalid email address.correct email format is someone@encompass.com." CssClass="text-danger" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
               </div>
           </div>
              &nbsp;&nbsp;&nbsp;&nbsp;
          <div class="form-group">
              <asp:Label runat="server" AssociatedControlID="txtContactNo" CssClass="col-md-2 control-label">Contact No:</asp:Label>
              <div class="col-md-10">
                  <asp:TextBox runat="server" ID="txtContactNo" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="Contact No" />
                  <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactNo"
                      CssClass="text-danger" ErrorMessage="The contact number field is required." />
              </div>
          </div>
         
     
    &nbsp;&nbsp;&nbsp;&nbsp;
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtSuburb" CssClass="col-md-2 control-label">Suburb:</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="txtSuburb" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="Surburb" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSuburb"
                        CssClass="text-danger" ErrorMessage="The suburb field is required." />
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;
       <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="txtCity" CssClass="col-md-2 control-label">City:</asp:Label>
           <div class="col-md-10">
               <asp:TextBox runat="server" ID="txtCity" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="City" />
               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity"
                   CssClass="text-danger" ErrorMessage="The city field is required." />
           </div>
       </div>
            &nbsp;&nbsp;&nbsp;&nbsp;
          <div class="form-group">
              <asp:Label runat="server" AssociatedControlID="txtPostalCode" CssClass="col-md-2 control-label">Postal code:</asp:Label>
              <div class="col-md-10">
                  <asp:TextBox runat="server" ID="txtPostalCode" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="Postal code" />
                  <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPostalCode"
                      CssClass="text-danger" ErrorMessage="The postal code field is required." />
              </div>
          </div>

     

    &nbsp;&nbsp;&nbsp;&nbsp;
    <%--           <div class="form-group">
         <ajaxToolkit:PopupControlExtender ID="PopBirth" runat="server"
                TargetControlID="txtBirthday"
                PopupControlID="cldBirthDay"
                Position="Right" />
        <asp:Label ID="lblBirthDay" runat="server" Text="Date Of Birth:" CssClass="col-md-2 control-label"></asp:Label>
        <div class="col-md-8">
            <asp:TextBox ID="txtBirthDay" runat="server" TextMode="Date" Width="220px"></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate = "txtDate"   
                ValidationExpression = "^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$"
                 runat="server" ErrorMessage="Invalid Date format. Valid Date Format dd/MM/yyyy">
                 </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBirthDay"
            CssClass="text-danger" ErrorMessage="The birth day field is required." />
         
        </div>
    </div>--%>


     &nbsp;&nbsp;&nbsp;&nbsp;

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="drpClientType" CssClass="col-md-2 control-label">Client Type:</asp:Label><br />
                <div class="col-md-10">
                    <asp:DropDownList ID="drpClientType" runat="server" Width="194px"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="drpClientType" ValidationGroup="ClientType"
                        CssClass="text-danger" ErrorMessage="The client type  field is required." />
                </div>
            </div>

            &nbsp; &nbsp; &nbsp; &nbsp
          <div class="form-group">
              <asp:Label runat="server" AssociatedControlID="flUploadPic" CssClass="col-md-2 control-label">Picture:</asp:Label>
              <br />
              <div class="col-md-10">
                  <asp:FileUpload ID="flUploadPic" runat="server" />
                  <br />
                  <asp:Label ID="lblStatus" runat="server" Text="File uploaded successfully" ForeColor="Green" Visible="false"></asp:Label>
                  <asp:RequiredFieldValidator runat="server" ID="rqImage" ErrorMessage="Image required" ControlToValidate="flUploadPic" CssClass="text-danger"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="flUploadPic" ForeColor="Red" Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" ErrorMessage="Please select a valid image format">
                  </asp:RegularExpressionValidator>
              </div>
          </div>
            &nbsp;&nbsp;&nbsp;&nbsp;
             <div class="form-group">
                 <div class="col-md-offset-2 col-md-10">
                     <asp:Button runat="server" Text="Register" CssClass="btn btn-primary" CausesValidation="False" ForeColor="Black" Width="107px" OnClick="Register_Click" />
                 </div>
             </div>
       
                 </div>
             </div>
       
    
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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
