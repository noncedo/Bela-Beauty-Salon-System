<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="baleflorbeaultysalon.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .panel {
            margin-bottom: 0px;
            width: 800px;
            height: 500px;
            position: center;
        }
        .jumbotron{
           
            width:900px;
            height:900px;
            border-color:blueviolet;
           border-style:double;

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
    <div class="container">
    <div class="jumbotron">
        
        <p>Password must include at least one uppercase letter [A-Z], and lowercase[a-z]<br /> 
          one special character [!@#],<br />
          and at least one numeric characters[0-9].</p>
       <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"></h3>
        </div>
        <div class="panel-body">
            <h2><strong>Login &nbsp;&nbsp;</strong><span class="glyphicon glyphicon-lock"></span></h2>
            <h4>Use a local account to log in.</h4>

            <br />
            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </asp:PlaceHolder>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label"><strong>Email:</strong></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" Width="195px" Height="19px" placeholder="Email" ToolTip="enter your email e.g someone@somewhere.com" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
            </div>
            &nbsp;&nbsp;
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label"><strong>Password:</strong></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" Width="193px" Height="22px" placeholder="Password" ToolTip="Your password must contain uppercase,lowercase,numbers and characters" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
            <br />
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" Width="200px" />
                      <div class="form-group">
                         
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" Visible="false"/>
                                <asp:Label runat="server" Visible="false" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <asp:Button runat="server" ID="ResendConfirm" OnClick="SendEmailConfirmationToken" Text="Resend confirmation" Visible="false" CssClass="btn btn-primary" />
                     <div class="row">
                        <p>
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Register as a new user</asp:HyperLink><br />
                            <%--Enable this once you have account confirmation enabled for password reset functionality--%>
                            <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Forgot your password?</asp:HyperLink>

                        </p>
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
    <br />
    <br />
</asp:Content>
