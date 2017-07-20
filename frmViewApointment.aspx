<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="frmViewApointment.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.frmViewApointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2>View Appointment</h2>
    <br />
    
    <div class="form-group">
        <asp:GridView ID="grvViewAppoinment" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False">

        <Columns>
            <asp:BoundField DataField="appointmentDate" HeaderText="Date" />
           <asp:TemplateField>
               <ItemTemplate>
                   <asp:Button ID="btnUpdate" CssClass="btn btn-default" runat="server" Text="Update" />
                   
               </ItemTemplate>
               
           </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" CssClass="btn btn-default" runat="server" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add New Appointment" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
    </div>

</asp:Content>
