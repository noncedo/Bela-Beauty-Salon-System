<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="baleflorbeaultysalon.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
 <style type="text/css">
        .panel {
            margin-bottom: 0px;
            width: 800px;
            height: 350px;
            vertical-align: central;
            display: inline-block;
            margin: 1em;
        }

        .pnlUpdate {
        }
    </style>
      <hr />
    <br />
    <br />
   
    <br />
    <br />
   <%-- <h4><%: Title %></h4>--%>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

 
        <h4>Create a new account</h4>
       
    <div class="container">
    <div class="jumbotron">
        
        <p>Password must include at least one uppercase letter [A-Z], and lowercase[a-z]<br /> 
          one special character [!@#],<br />
          and at least one numeric characters[0-9].</p>
        
        <br />
        <br />
       <div class="panel panel-info">
    <div class="panel-heading">
    <h3 class="panel-title">Register</h3>
    </div>
     <div class="panel-body">
     <div class="form-group">
        <div class="form-group">
            <asp:ValidationSummary runat="server" CssClass="text-danger" Visible="true" />
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label"><strong>Email:</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Display="None"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Email" ForeColor="Red" Display="Dynamic" ValidationExpression="^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+([;.](([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+)*$" ErrorMessage="Invalid email address!"></asp:RegularExpressionValidator>
            </div>
        </div>
          &nbsp;&nbsp;&nbsp;
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label"><strong>Password:</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Display="None"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
          &nbsp;&nbsp;&nbsp;
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label"><strong>Confirm password:</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="None" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="None"
                    CssClass="text-danger"  ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
          &nbsp;&nbsp;&nbsp;
       <%-- <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtContact" CssClass="col-md-2 control-label"><strong>Contact No:</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtContact" TextMode="SingleLine" CssClass="form-control" Width="120px" placeholder="Contact No"  MaxLength="10"/>
                </div>
             
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContact" Display="None"
                    CssClass="text-danger" ErrorMessage="Contact field is required" ToolTip="Contact No is a required field"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContact" ForeColor="Red" Display="Dynamic" ValidationExpression="(^((0|(\(0\)))?|(00|(\(00\)))?(\s?|-?)(27|\(27\))|((\+27))|(\(\+27\))|\(00(\s?|-?)27\))( |-)?(\(?0?\)?)( |-)?\(?(1[0-9]|2[1-4,7-9]|3[1-6,9]|4[0-9]|5[1,3,6-9]|7[1-4,6,8,9]|8[0-9])\)?(\s?|-?)((\d{3}(\s?|-?)\d{4}$)|((\d{4})(\s?|-?)(\d{3})$)|([0-2](\s?|-?)(\d{3}(\s?|-?)\d{3}$))))" ErrorMessage="Invalid mobile number!"></asp:RegularExpressionValidator>
        </div> --%>
        <br />
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
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
</asp:Content>
