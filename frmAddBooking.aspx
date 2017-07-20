<%@ Page Title="" Language="C#" MasterPageFile="~/masterClient.Master" AutoEventWireup="true" CodeBehind="frmAddBooking.aspx.cs" Inherits="baleflorbeaultysalon.Booking.frmAddBooking" %>


<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron" style="align-content:center">
    <asp:Wizard ID="Wizard1" runat="server" OnFinishButtonClick="Wizard1_FinishButtonClick"  Width="649px" Height="375px" ActiveStepIndex="0">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1" StepType="Start">
                <br />
                <h4>Select date for your appointment </h4>
               <%-- <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="70"
                        aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                        <span class="sr-only">33.3% Complete</span>
                    </div>
                </div>--%>
                <div>
            <asp:ImageButton ID="btnHelp" runat="server" ImageUrl="~/Images/helpIcon.jpg" Height="29px" ToolTip="Need help on how to book an appointment?" />
                </div>
                    <asp:Calendar ID="calStep1" runat="server" OnDayRender="Calendar1_DayRender" 
                    OnSelectionChanged="Calendar1_SelectionChanged" 
                    SelectionMode="Day" ShowGridLines="true" 
                    SelectedDate="<%# DateTime.Today %>" VisibleDate="0001/01/01 12:00:00 AM">
                    <SelectedDayStyle BackColor="Navy" />
                </asp:Calendar>
               
                <asp:CustomValidator ID="cstValCal" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
                <h3>
                    <asp:Label ID="lblMessageStep1" runat="server" Text="" ForeColor="Red"></asp:Label>
                </h3>
                <br />
                <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                <br />
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                <br />
                  <h4>Add details for your appointment</h4>
             <%--   <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="70"
                        aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                        <span class="sr-only">66.6% Complete</span>
                    </div>
                </div>--%>
                    <br />

                  <div>
                      <h5>
                          <strong>
                            <asp:Label ID="lblDateStep2" runat="server" Text="Selected Date :"></asp:Label>
                        </strong>
                            <asp:Label ID="lblDateStep2Display" runat="server" Text=""></asp:Label>
                      </h5>
                      
                      <br />
                        <strong>
                            <asp:Label ID="lblSpecalist" runat="server" Text="SPECIALIST:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </strong>
                        <asp:DropDownList runat="server" ID="ddlEmployee" ToolTip="Select specialist" Height="29px" Width="138px" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged" AutoPostBack="true">
            
                        </asp:DropDownList>
                        <strong>&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;
                      <br />
                        <asp:Label ID="lblServType" runat="server" Text="SERVICE TYPE:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="drpServiceType" runat="server" ToolTip="Select service type" AutoPostBack="True" Height="29px" OnSelectedIndexChanged="drpServiceType_SelectedIndexChanged" Width="138px">
                        
                        </asp:DropDownList>
                               <asp:CompareValidator ID="compServ" runat="server" ErrorMessage="Please select" ControlToValidate="drpServiceType" Operator="NotEqual" ValueToCompare="0" SetFocusOnError="false" CssClass="text-danger" ></asp:CompareValidator>
                        &nbsp;<br />
                      <br />
                      &nbsp;<asp:Label ID="lblItem" runat="server" Text="SERVICE:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlServices" ToolTip="Select service" runat="server" Height="34px" AutoPostBack="True" OnSelectedIndexChanged="ddlServices_SelectedIndexChanged" Width="35%">
                            
                        </asp:DropDownList>
                             <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please select" ControlToValidate="ddlServices" Operator="NotEqual" ValueToCompare="0" SetFocusOnError="false" CssClass="text-danger" ></asp:CompareValidator>
                        </strong>
                      &nbsp;<asp:Label ID="lblStep2Duration" runat="server" Text=""></asp:Label>
                      <asp:Label ID="lblMinutes" runat="server" Text="Min" Visible="false"></asp:Label>
                      &nbsp;&nbsp;<asp:Label ID="lblStep2Price" runat="server" Text=""></asp:Label>
                      <br />
                        <asp:RequiredFieldValidator ID="rqdValDrpEmp" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="ddlEmployee" ValidationGroup="submitAll"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="uspSelectEmployeeManager" SelectCommandType="StoredProcedure" OnSelecting="SqlEmployee_Selecting"></asp:SqlDataSource>
                       
                    </div>
                    <div class="form-group">
                        <div>
                            <strong>
                                <asp:Label ID="lblSlot" runat="server" Text="START TIME:"></asp:Label>
                            :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="dropSlotTime" runat="server" ToolTip="Select start time" AutoPostBack="True" DataSourceID="sqlStartTime" DataTextField="startTime" DataValueField="slotID" Height="40px" OnSelectedIndexChanged="dropSlotTime_SelectedIndexChanged" Width="138px" Enabled="false">
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;
                            </strong>
                            <div>
                  
                            </div>
                        </div>
                    </div>
                <h3>
                    <asp:Label ID="lblMessageStep2" runat="server" Text="" ForeColor="Red"></asp:Label>
                </h3>
                      
                 <asp:SqlDataSource runat="server" ID="sqlStartTime" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectSlot" SelectCommandType="StoredProcedure" OnSelecting="sqlStartTime_Selecting"></asp:SqlDataSource>
                
                
                <div>
                   <strong>
                    </strong>
                </div>
                <div>
                    <h4>Booked Slots:</h4>
                    <asp:GridView ID="grdAppointment" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="appointmentID,id,appointmentID1,servID1,Id1,empID,userID2" DataSourceID="sqEmpSchedule" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <h4> Booked</h4>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="appointmentID" HeaderText="appointmentID" ReadOnly="True" InsertVisible="False" SortExpression="appointmentID" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="appointmentDate"  DataFormatString="{0: yyyy-MM-dd}" HeaderText="Date" SortExpression="appointmentDate" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="appStartTime" HeaderText="Start Time" DataFormatString="{0:hh:mm:ss tt}" SortExpression="appStartTime"></asp:BoundField>
                            <asp:BoundField DataField="appEndTime" HeaderText="End Time" DataFormatString="{0:hh:mm:ss tt}" SortExpression="appEndTime"></asp:BoundField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource runat="server" ID="sqEmpSchedule" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspGetAppointmentEmpScheduleDay" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlEmployee" PropertyName="SelectedValue" Name="appEmpID" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="lblDateStep2Display" DbType="Date" Name="dateApp" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                
                <div>
                    
                    <asp:Label ID="lblTime" runat="server" Text="Selected Time:" Font-Bold="true" Visible="false"></asp:Label>&nbsp;
                            <asp:Label ID="lblSelectedTime" runat="server" Text="" Visible="false"></asp:Label>
                </div>
             
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" Title="Final Step">
                <br />
              
                <h4>View Appointment Details</h4>
                <%--<div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="70"
                        aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                        <span class="sr-only">100% Complete</span>
                    </div>
                </div>--%>
                <div>

                    <p>
                        <strong>Your Appointment details:
                        </strong>
                        <br />
                        <br />

                        <strong>Specialist:
                        </strong>&nbsp;
                        <asp:Label ID="lblEmp" runat="server" Text=""></asp:Label>

                        <br />
                        <strong>Date:
                        </strong>&nbsp;
                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                        <br />
                        <strong>Time:
                        </strong>&nbsp;
                        <asp:Label ID="lblTmeStep3" runat="server" Text=""></asp:Label>

                        <br />
                        <strong>Service:
                        </strong>&nbsp;
                        <asp:Label ID="lblService" runat="server" Text=""></asp:Label>

                        <br />
                        <strong>Price
                        </strong>&nbsp;
                        R&nbsp;<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>,00

                        <br />
                        <strong>Duration
                        </strong>&nbsp;
                        <asp:Label ID="lblDuration" runat="server" Text=""></asp:Label>&nbsp;Min
                        
                        <br />
                        <h3>
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </h3>
                        <asp:CheckBox ID="chkSend" runat="server" Visible="true" Text="Send me an email" />


                    </p>
                </div>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
            </div>
        </div>
    <br />
    <br />
    <br />
    <div id="pnlUpdate" class="panel panel-default" runat="server" visible="false">
        <div class="panel-body">
            <br />
            <h2>You're appointment has been booked successfully!</h2>
            <br />
            <asp:Button ID="btnOKGood" runat="server" Text="Ok" CssClass="btn btn-primary" OnClick="btnOKGood_Click" />
            <br />
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <!-- Customzing day pilot cells-->
    <!--Source for code : https://doc.daypilot.org/calendar/cell-customization/ -->
</asp:Content>


