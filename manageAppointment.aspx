<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="manageAppointment.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.manageAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />

    <h2>Manage Appointments</h2>
    <%--<h4>Click on the links below to manage appointments</h4>--%>
    <asp:Image ID="imgLink" runat="server" AlternateText="The Salon" ImageUrl="~/Images/Appointment.jpg" Height="500px" Width="1000px" />
    <div><asp:HyperLink ID="hypAdd" runat="server" Font-Bold="true" Font-Size="X-Large" NavigateUrl="~/pageBooking/frmManagerBooking.aspx" >Add Appointments</asp:HyperLink></div>
    <div><asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="true" Font-Size="X-Large" NavigateUrl="~/pageBooking/frmUpdateAppointment.aspx" >Update Appointments</asp:HyperLink></div>
    <div><asp:HyperLink ID="hyperUpdate" runat="server" Font-Bold="true" Font-Size="X-Large" NavigateUrl="frmViewAppointment.aspx"  >View Appointments</asp:HyperLink></div>

</asp:Content>
