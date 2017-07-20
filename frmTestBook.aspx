<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmTestBook.aspx.cs" Inherits="baleflorbeaultysalon.Booking.frmTestBook" %>

<%--<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="qsf" Namespace="Telerik.QuickStart" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <div id="rootwizard">
	<div class="navbar">
	  <div class="navbar-inner">
	    <div class="container">
	<ul>
	  	<li><a href="#tab1" data-toggle="tab">First</a></li>
		<li><a href="#tab2" data-toggle="tab">Second</a></li>
		<li><a href="#tab3" data-toggle="tab">Third</a></li>
		<li><a href="#tab4" data-toggle="tab">Forth</a></li>
		<li><a href="#tab5" data-toggle="tab">Fifth</a></li>
		<li><a href="#tab6" data-toggle="tab">Sixth</a></li>
		<li><a href="#tab7" data-toggle="tab">Seventh</a></li>
	</ul>
	 </div>
	  </div>
	</div>
	<div id="bar" class="progress progress-striped active">
	  <div class="bar"></div>
	</div>
	<div class="tab-content">
	    <div class="tab-pane" id="tab1">
	      1
	    </div>
	    <div class="tab-pane" id="tab2">
	      2
	    </div>
		<div class="tab-pane" id="tab3">
			3
	    </div>
		<div class="tab-pane" id="tab4">
			4
	    </div>
		<div class="tab-pane" id="tab5">
			5
	    </div>
		<div class="tab-pane" id="tab6">
			6
	    </div>
		<div class="tab-pane" id="tab7">
			7
	    </div>
		<ul class="pager wizard">
			<li class="previous first" style="display:none;"><a href="#">First</a></li>
			<li class="previous"><a href="#">Previous</a></li>
			<li class="next last" style="display:none;"><a href="#">Last</a></li>
		  	<li class="next"><a href="#">Next</a></li>
		</ul>
	</div>	
</div>

    
<script>
    $(document).ready(function () {
        $('#rootwizard').bootstrapWizard({
            onTabShow: function (tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index + 1;
                var $percent = ($current / $total) * 100;
                $('#rootwizard').find('.bar').css({ width: $percent + '%' });
            }
        });
    });
</script>
 
<%--<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ConfiguratorPanel1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadWizard1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ConfiguratorPanel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="demo-container size-medium">
        <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard1" runat="server"  Height="320px">
            <WizardSteps>
                <telerik:RadWizardStep Title="Log in" CssClass="loginStep">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserNameTextBox" Text="User name:"></asp:Label>
                    <telerik:RadTextBox RenderMode="Lightweight" ID="UserNameTextBox" runat="server" ></telerik:RadTextBox>
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="PasswordTextBox" Text="Password:"></asp:Label>
                    <telerik:RadTextBox RenderMode="Lightweight" ID="PasswordTextBox" runat="server" ></telerik:RadTextBox>
                </telerik:RadWizardStep>
                <telerik:RadWizardStep Title="Attach Database">
                    <label>Please select a data base file:</label>
                    <telerik:RadAsyncUpload RenderMode="Lightweight" ID="DataBaseUpload" runat="server"  AllowedFileExtensions=".mdf"></telerik:RadAsyncUpload>
                </telerik:RadWizardStep>
                <telerik:RadWizardStep Title="Approximately Load">
                    <label>Number of visiting users:</label>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="UsersNumber" runat="server"  Width="300px">
                        <Items>
                            <telerik:RadComboBoxItem Text="50-100 Users" Value="50" />
                            <telerik:RadComboBoxItem Text="500-1000 Users" Value="500" />
                            <telerik:RadComboBoxItem Text="Above 2000" Value="2000" />
                        </Items>
                    </telerik:RadComboBox>
                </telerik:RadWizardStep>
            </WizardSteps>
        </telerik:RadWizard>
    </div>
    <qsf:ConfiguratorPanel ID="ConfiguratorPanel1" runat="server">
        <Views>
            <qsf:View runat="server">
                <ul class="fb-group">
                    <li>
                        <qsf:DropDownList ID="NavigationBarPosition" runat="server" AutoPostBack="true" OnSelectedIndexChanged="NavigationBarPosition_SelectedIndexChanged" Label="Navigation Bar Position">
                            <Items>
                                <telerik:DropDownListItem Text="Top" Value="Top" />
                                <telerik:DropDownListItem Text="Right" Value="Right" />
                                <telerik:DropDownListItem Text="Bottom" Value="Bottom" />
                                <telerik:DropDownListItem Text="Left" Value="Left" />
                            </Items>
                        </qsf:DropDownList>
                    </li>
                    <li>
                        <qsf:DropDownList ID="ProgressBarPosition" runat="server" AutoPostBack="true" Label="Progress Bar Position">
                            <Items>
                                <telerik:DropDownListItem Text="Top" Value="Top" />
                                <telerik:DropDownListItem Text="Bottom" Value="Bottom" />
                            </Items>
                        </qsf:DropDownList>
                    </li>
                </ul>
            </qsf:View>
        </Views>
    </qsf:ConfiguratorPanel>
    
</body>
</html>--%>
</asp:Content>
