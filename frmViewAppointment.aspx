<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="~/pageBooking/frmViewAppointment.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.frmViewAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />

    <%--<div class="jumbotron" style="align-content:center">--%>
    <h4>View Appointment</h4>
    
    <br />
    <br />

    <div id="pnlDelete" class="panel panel-default" runat="server" visible="false   ">
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

    <div id="hideGrid" runat="server">
        
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
    <h5>
        View by:&nbsp;&nbsp;<asp:DropDownList ID="ddlSelectEmp" runat="server" AutoPostBack="True" Width="15%" ></asp:DropDownList>
    </h5>
      <p style="text-align:right">
    From:<asp:TextBox ID="txtFrom" runat="server" placeholder="Search date"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regFrom" runat="server" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$" ErrorMessage="Invalid date" ControlToValidate="txtFrom" CssClass="text-danger"></asp:RegularExpressionValidator>
    &nbsp;To:<asp:TextBox ID="txtTo" runat="server" placeholder="Search date"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regTo" runat="server" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$" ErrorMessage="Invalid date" ControlToValidate="txtTo" CssClass="text-danger" ></asp:RegularExpressionValidator>
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-primary" /> &nbsp;(date format:yyyy-MM-dd)
   </p>
           <br />
        <br />
        <asp:Calendar ID="calFrom" runat="server" OnSelectionChanged="calFrom_SelectionChanged"></asp:Calendar>
        <asp:Calendar ID="calTo" runat="server" OnSelectionChanged="calTo_SelectionChanged"></asp:Calendar>
        <ajaxToolkit:PopupControlExtender ID="PopEx" runat="server"
    TargetControlID="txtFrom"
    PopupControlID="calFrom"
    Position="Bottom" />
<ajaxToolkit:PopupControlExtender ID="PopupControlExtender1" runat="server"
    TargetControlID="txtTo"
    PopupControlID="calTo"
    Position="Bottom" />

    <asp:GridView ID="grvViewAppoinment" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlViewAppointment" AllowSorting="true" 
        OnSelectedIndexChanged="grvViewAppoinment_SelectedIndexChanged" AllowPaging="True" OnRowCommand="grvViewAppoinment_RowCommand">
            <Columns>
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblAppID" runat="server" Text='<%#Eval("appointmentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="appointmentID" Visible="false" />--%>
                <asp:BoundField DataField="appointmentDate" DataFormatString="{0: yyyy-MM-dd}" HeaderText="Date"  />
                <asp:BoundField DataField="appStartTime" HeaderText="Start Time" DataFormatString="{0:hh:mm:ss tt}" ></asp:BoundField>
                <asp:BoundField DataField="appEndTime" HeaderText="End Time" DataFormatString="{0:hh:mm:ss tt}" ></asp:BoundField>
                <asp:BoundField DataField="servName" HeaderText="Service"  />
                <asp:BoundField DataField="UserName" HeaderText="Username"  />
                <asp:BoundField DataField="stateName" HeaderText="Status"  />
                    
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblEmpID" runat="server" Text='<%#Eval("appEmpID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
           
                <asp:BoundField DataField="fullname" HeaderText="Specialist" ></asp:BoundField>
                

               
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblCalendarID" runat="server" Text='<%#Eval("calendarID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblServCost" runat="server" Text='<%#Eval("servCost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" CssClass="btn btn-default" runat="server" Text="Delete" OnClick="btnDelete_Click1"/>
                    </ItemTemplate>
                </asp:TemplateField>    
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="viewInvoice" Text="View Invoice" CssClass="btn btn-default" OnClick="viewInvoice_Click" Width="180px" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    <div class="modal">
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
    <asp:SqlDataSource runat="server" ID="sqlViewAppointment" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' FilterExpression="appointmentDate >= '#{0}#' AND appointmentDate <= '#{1}#'" SelectCommand="uspGetEmpSheduleDrpSort" SelectCommandType="StoredProcedure">
        <FilterParameters>
            <asp:ControlParameter Name="appointmentDate" ControlID="txtFrom" 
                Type="DateTime" PropertyName="Text" />
            <asp:ControlParameter Name="appointmentDate" ControlID="txtTo" 
                Type="DateTime" PropertyName="Text" />
        </FilterParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSelectEmp" PropertyName="SelectedValue" Name="appEmpID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="New Appointment" CssClass="btn btn-primary" OnClick="btnAdd_Click" Width="180px" /> <br /><br />
        <asp:Button ID="btnConvertToPDF" runat="server" Text="Save to PDF" CssClass="btn btn-default" OnClick="btnConvertToPDF_Click" Width="127px" />
        
        </div>
      <%--</div>--%>
    <%--</div>--%>
   <!--NB:Specialist--> 
</asp:Content>
