<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="frmLoginClient.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.frmLoginClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .panel{
             margin-bottom: 0px;
             width: 800px;
             height: 500px;
             position:center;
                  }
    </style>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="panel panel-info">
    <div class="panel-heading">
    <h3 class="panel-title"></h3>
        </div>
      <div class="panel-body">
    <h2><strong>Manager Login &nbsp;&nbsp;</strong><span class="glyphicon glyphicon-lock"></span></h2>
       
    <br />
          <%--<asp:ValidationSummary ID="vldSummary" runat="server" CssClass="text-danger"  />--%>
           <br />
            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </asp:PlaceHolder>
     <%-- <h4>Login page for the Manager Only</h4>--%>

    <br />
    <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label"><strong>Username:</strong></asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" ID="txtUserName" TextMode="SingleLine" CssClass="form-control" Width="220px" placeholder="Username" />
             <asp:RequiredFieldValidator ID="rqUsername" runat="server" ControlToValidate="txtUsername"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
        </div>
    </div>
    <br />
    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
           <div class="form-group">
               <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label"><strong>Password:</strong></asp:Label>
               <div class="col-md-10">
                   <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" Width="220px" placeholder="Password" />
                   <asp:RequiredFieldValidator runat="server" ID="rqPassword" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
               </div>
           </div>
    <br />
    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="drpRole" CssClass="col-md-2 control-label"><strong>Role:</strong></asp:Label>
        <div class="col-md-10">
            <asp:DropDownList ID="drpRole" runat="server" DataSourceID="dbRole" DataTextField="roleName" DataValueField="roleID" Width="220px"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="dbRole" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectRole" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rqRole" runat="server" ErrorMessage="field is required" ControlToValidate="drpRole" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <br />
    <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
            <asp:Button runat="server" Text="Login" CssClass="btn btn-primary" OnClick="LoginClient_Click" Width="220px" />
        </div>
    </div>
    <br />
    <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
            <div  class="checkbox">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox runat="server" ID="RememberMe" />
                <asp:Label runat="server" AssociatedControlID="RememberMe">&nbsp;Remember me?</asp:Label>
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
</asp:Content>
