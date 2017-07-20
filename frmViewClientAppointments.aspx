<%@ Page Title="" Language="C#" MasterPageFile="~/masterClient.Master" AutoEventWireup="true" CodeBehind="frmViewClientAppointments.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.frmViewClientAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h4>Bookings</h4>
    <br />

    <div id="pnlDelete" class="panel panel-default" runat="server" visible="false">
        <div class="panel-body">
            <h4>Are you sure you want to delete this appointment?</h4>
            <strong>Date:<asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                <br />
                Time:<asp:Label ID="lblTime" runat="server" Text=""></asp:Label>
                <br />
                Service:<asp:Label ID="lblService" runat="server" Text=""></asp:Label>
                <br />
                Specialist:<asp:Label ID="lblEmployee" runat="server" Text=""></asp:Label>
            </strong>
            <%--<br />--%>
            <br />
            <asp:Button ID="btnOKGood" runat="server" Text="Ok" CssClass="btn btn-primary" OnClick="btnOKGood_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="btnCancel_Click" />
            <br />
        </div>
    </div>
    <asp:Label ID="lblUser" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
    
    <strong>
        <asp:Label ID="lblMessage" runat="server" Text="" Visible="false"></asp:Label>
    </strong>
    
    <asp:GridView ID="grvViewAppoinment" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" 
        OnSelectedIndexChanged="grvViewAppoinment_SelectedIndexChanged" DataSourceID="sqlAppointmentClient" AllowPaging="True"
        OnRowCommand="grvViewAppoinment_RowCommand">

        <Columns>
             <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblAppID" runat="server" Text='<%#Eval("appointmentID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" Visible="false" />
            <asp:BoundField DataField="appointmentDate" DataFormatString="{0: yyyy-MM-dd}" HeaderText="Date" SortExpression="appointmentDate" />
            <asp:BoundField DataField="fullname" HeaderText="Specialist" SortExpression="fullname"></asp:BoundField>
            <asp:BoundField DataField="appStartTime" HeaderText="Start Time" DataFormatString="{0:hh:mm:ss tt}" SortExpression="appStartTime"></asp:BoundField>
            <asp:BoundField DataField="appEndTime" HeaderText="End Time" DataFormatString="{0:hh:mm:ss tt}" SortExpression="appEndTime"></asp:BoundField>
            <asp:BoundField DataField="servName" HeaderText="Service" SortExpression="servName" />
            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
            <asp:BoundField DataField="appEmpID" HeaderText="Employee" SortExpression="appEmpID" Visible="false"></asp:BoundField>
            <asp:BoundField DataField="calendarID" HeaderText="CalendarID" SortExpression="calendarID" Visible="false"></asp:BoundField>
            <asp:BoundField DataField="servCost" HeaderText="Cost" SortExpression="servCost" DataFormatString="{0:c}"/>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-defaul" OnClick="btnDelete_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="sqlAppointmentClient" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspGetAppointmentByClient" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblUser" PropertyName="Text" Name="userID" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <br />



    <div class="modal" id="pnlDelModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <p>Are Sure?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <%--<asp:SqlDataSource runat="server" ID="sqlViewAppointment" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectAppointmentManager" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
    <br />
    <asp:Button ID="btnAdd" runat="server" Text="New Appointment" CssClass="btn btn-primary" OnClick="btnAdd_Click" Width="180px" />
    <br />
    <br />
</asp:Content>
