<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="manageClients.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.manageClients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <br />
    <br />
    <h2>Manage Clients</h2>
    <%--<h4>Click on the links below to manage clients</h4>--%>
    <asp:Image ID="imgLink" runat="server" AlternateText="Beauty" ImageUrl="~/Images/services.jpg" Height="500px" Width="1000px" />
    <div><asp:HyperLink ID="hyperAdd" runat="server" Font-Bold="true" Font-Size="X-Large" NavigateUrl="~/pageClient/frmInsertClient.aspx" >Add Clients</asp:HyperLink></div>
    <div><asp:HyperLink ID="hyperUpdate" runat="server" Font-Bold="true" Font-Size="X-Large" NavigateUrl="~/pageClient/frmUpdateClient.aspx"  >Update Clients</asp:HyperLink></div>
    <div><asp:HyperLink ID="hyperViewAll" runat="server" Font-Bold="true" Font-Size="X-Large" NavigateUrl="~/pageClient/frmViewClient.aspx"> View Clients</asp:HyperLink></div>

</asp:Content>
