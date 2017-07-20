<%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="frmUpdateAppointment.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.frmUpdateAppointment" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .panel {
            margin-bottom: 0px;
            width: 800px;
            height: 700px;
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
    <h2>Update Appointment&nbsp;&nbsp;<span class="glyphicon glyphicon-edit"></span></h2>

    <br />
    <br />

    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Label ID="lblDuration" runat="server" Text="" Visible="false"></asp:Label>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Appointment Details</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <br />
                <div class="form-group">
                <asp:Label ID="lblClientName" runat="server" Text="ClientName:"></asp:Label>
                    <div class="col-md-15">
                    <asp:TextBox ID="txtClientName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblServType" runat="server" Text="Select service type:"></asp:Label>
                    <div class="col-md-15">
                    <asp:DropDownList ID="drpServiceType" runat="server" AutoPostBack="true" Height="22px"
                        OnSelectedIndexChanged="drpServiceType_SelectedIndexChanged" Width="138px">
                    </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblStatus" runat="server" Text="ststus:"></asp:Label>
                    <div class="col-md-15">
                        <asp:DropDownList ID="drpStatus" runat="server" AutoPostBack="true" Height="22px"
                            Width="138px" DataSourceID="sqlStatus" DataTextField="stateName" DataValueField="stateID">
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="sqlStatus" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectStatus" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblService" runat="server" Text="Service"></asp:Label>
                    <div class="col-md-15">
                    <asp:DropDownList ID="drpService" runat="server" CssClass="form-control" Height="30px" Width="194px"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblEmployee" runat="server" Text="Employee"></asp:Label>
                    <div class="col-md-15">
                    <asp:DropDownList ID="drpEmployee" runat="server" CssClass="form-control" Height="30px" Width="194px" DataSourceID="sqlEmp" DataTextField="firstName" DataValueField="empID" />
                    <asp:SqlDataSource runat="server" ID="sqlEmp" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>'
                        SelectCommand="uspSelectEmployeeManager" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDate" runat="server" Text="Date:"></asp:Label>
                     <div class="col-md-15">
                     <asp:TextBox ID="txtDate" runat="server" TextMode="DateTime" CssClass="form-control" Height="40px" Width="194px"></asp:TextBox>
                     <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate" DaysModeTitleFormat="MMMM d" />
                     </div>
                 </div>
                <div class="form-group">
                    <asp:Label ID="lblStartTime" runat="server" Text="Start Time:"></asp:Label>
                    <div class="col-md-15">
                    <asp:TextBox ID="txtStartTime" runat="server" CssClass="form-control" Height="40px" Width="194px" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                     <div class="col-md-15">
                     <asp:DropDownList ID="dropSlotTime" runat="server" AutoPostBack="True" DataSourceID="sqlStartTime" DataTextField="startTime" DataValueField="slotID" Height="22px"
                         OnSelectedIndexChanged="dropSlotTime_SelectedIndexChanged" Width="138px">
                     </asp:DropDownList>
                     <asp:SqlDataSource runat="server" ID="sqlStartTime" ConnectionString='<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>' SelectCommand="uspSelectSlot" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                     </div>
                 </div>
                <div class="form-group">
                    <asp:Label ID="lblEndTime" runat="server" Text="End Time:"></asp:Label>
                    <div class="col-md-15">
                        <asp:TextBox ID="txtEndTime" runat="server" CssClass="form-control" Height="40px" Width="194px" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-group">
                     <%--<div class="col-md-offset-2 col-md-10">--%>
                     <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" Width="91px" OnClick="btnSave_Click" />
                     &nbsp;&nbsp; 
                     <asp:Button ID="btnCancel" CssClass="btn btn-defualt" runat="server" Text="Cancel" Width="91px" OnClick="btnCancel_Click" />
                     <%--</div>--%>
                 </div>

            </div>
        </div>
    </div>

    <br />
    <br />

    <div id="pnlUpdate" class="panel panel-default" runat="server" visible="false">
        <div class="panel-body">
            <br />
            <h2>You're appointment has been updated successfully!</h2>
            <br />
            <asp:Button ID="btnOKGood" runat="server" Text="Ok" CssClass="btn btn-primary" OnClick="btnOKGood_Click" />
            <br />
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


</asp:Content>
