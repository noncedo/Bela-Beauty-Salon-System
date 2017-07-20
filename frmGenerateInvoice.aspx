<%@ Page Title="" Language="C#" MasterPageFile="~/masterClient.Master" AutoEventWireup="true" CodeBehind="frmGenerateInvoice.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.frmGenerateInvoice" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    Generate Service Report.
    <asp:DropDownList ID="ddlServTypes" runat="server" AutoPostBack="True" DataSourceID="ReportDatSource" DataTextField="servName" DataValueField="servID"></asp:DropDownList>




    <asp:SqlDataSource ID="ReportDatSource" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="uspGetServiceByServiceTypeID" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlServTypes" Name="serviceTypeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <asp:Chart ID="Chart1" runat="server" DataSourceID="chartDataSource">
        <Series>
            <asp:Series Name="Series1" XValueMember="servName" YValueMembers="servID"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="chartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="uspGetServiceByServiceTypeID" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlServTypes" Name="serviceTypeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
