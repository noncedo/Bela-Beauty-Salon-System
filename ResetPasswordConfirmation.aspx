<%@ Page Title="Password Changed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="baleflorbeaultysalon.Account.ResetPasswordConfirmation" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <br />
    <br />
    <br />
    <br />
     <br />
    <br />
    <br />
    <br />
    <h1><%: Title %>.</h1>
    <div>
        <h3><strong>Password has been changed. Click </strong><asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login"><strong>here</strong></asp:HyperLink> <strong> login </strong></h3>
    </div>
    <br />
    <br />
    <br />
    <br />
     <br />
</asp:Content>
