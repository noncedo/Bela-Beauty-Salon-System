   <%@ Page Title="" Language="C#" MasterPageFile="~/masterManager.Master" AutoEventWireup="true" CodeBehind="frmInsertClient.aspx.cs" Inherits="baleflorbeaultysalon.pageClient.frmInsertClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
     <style type="text/css">
        .panel {
            margin-bottom: 0px;
            width: 800px;
            height:800px;
            vertical-align:central;
            display: inline-block;
            margin: 1em;
        }
    </style> 

  
    <br />
    <br />
    <br />
     <hr /> 
     <h4>Add new client&nbsp;&nbsp;<span class="glyphicon glyphicon-plus"></span></h4>
    <br />

    
     &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
     <div class="panel panel-info">
    <div class="panel-heading">
    <h3 class="panel-title">Client Details</h3>
    </div>
     <div class="panel-body" style="height:auto">
     <div class="form-group">
           <asp:Label ID="lblFileExists" runat="server" Text="" Font-Bold="true" Font-Size="Medium" CssClass="text-danger"></asp:Label>
          <asp:Label ID="Label1" runat="server" Text="" Font-Bold="true" Font-Size="Medium" CssClass="text-danger"></asp:Label>
                  <asp:ValidationSummary runat="server" CssClass="text-danger" />
         <asp:Label ID="lblRequired" runat="server" Text="" Font-Bold="true" CssClass="text-danger"></asp:Label>
         <asp:CustomValidator ID="csServices" runat="server" ErrorMessage="all fields marked with (*) are required" CssClass="text-danger"></asp:CustomValidator>
          <div>
            <asp:Label ID="Label2" runat="server" Text="All fields marked with(*) are required!"  Font-Bold="true" Font-Size="Small" CssClass="text-info"></asp:Label>
             </div>
         <br />
            <asp:Label runat="server" AssociatedControlID="drpTitle" CssClass="col-md-2 control-label">Title:<asp:Label ID="valTit" Text="*" CssClass="text-danger" runat="server" Font-Bold="true"></asp:Label></asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="drpTitle" runat="server" Width="160px">
                    <asp:ListItem Value="0">Select one</asp:ListItem>
                    <asp:ListItem Value="1">Mr</asp:ListItem>
                    <asp:ListItem Value="2">Miss</asp:ListItem>
                    <asp:ListItem Value="3">Mrs</asp:ListItem>
                    <asp:ListItem Value="4">Ms</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rqGender" runat="server" ErrorMessage="Title field required" CssClass="text-danger" ControlToValidate="drpTitle" Display="None" Operator="NotEqual" ValueToCompare="0" SetFocusOnError="false">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compServType" runat="server" ErrorMessage="Title field is required." ControlToValidate="drpTitle" Operator="NotEqual" ValueToCompare="0" SetFocusOnError="false" CssClass="text-danger"  Display="None"></asp:CompareValidator>

            </div>
        </div>
        &nbsp;&nbsp;
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">First Name:<asp:Label ID="valName" Text="*" CssClass="text-danger" runat="server" Font-Bold="true"></asp:Label></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control" Width="280px" placeholder="Name" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" Display="None"
                    CssClass="text-danger" ErrorMessage="First name field is required." />
            </div>
        </div>
  &nbsp;&nbsp;
           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-2 control-label">Last Name:<asp:Label ID="valLname" Text="*" CssClass="text-danger" runat="server" Font-Bold="true"></asp:Label></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtLastName" TextMode="SingleLine" CssClass="form-control" Width="280px" placeholder="Last Name" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" Display="None"
                    CssClass="text-danger" ErrorMessage="Last name field is required." />
            </div>
        </div>
   &nbsp;&nbsp;
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email:<asp:Label ID="valEmail" Text="*" CssClass="text-danger" runat="server" Font-Bold="true"></asp:Label></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail" TextMode="SingleLine" CssClass="form-control" Width="280px" placeholder="Email"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Display="None"
                    CssClass="text-danger" ErrorMessage="Email field is required." />
            </div>
        </div> 
    &nbsp;&nbsp;
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtContact" CssClass="col-md-2 control-label">Contact No:<asp:Label ID="valContactNo" Text="*" CssClass="text-danger" runat="server" Font-Bold="true" MaxLength="10"></asp:Label></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtContact" TextMode="SingleLine" CssClass="form-control" Width="280px" placeholder="Contact No"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContact" Display="None"
                    CssClass="text-danger" ErrorMessage="Contact number field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContact"     ForeColor="Red" Display="Dynamic" ValidationExpression="(^((0|(\(0\)))?|(00|(\(00\)))?(\s?|-?)(27|\(27\))|((\+27))|(\(\+27\))|\(00(\s?|-?)27\))( |-)?(\(?0?\)?)( |-)?\(?(1[0-9]|2[1-4,7-9]|3[1-6,9]|4[0-9]|5[1,3,6-9]|7[1-4,6,8,9]|8[0-9])\)?(\s?|-?)((\d{3}(\s?|-?)\d{4}$)|((\d{4})(\s?|-?)(\d{3})$)|([0-2](\s?|-?)(\d{3}(\s?|-?)\d{3}$))))" ErrorMessage="Invalid mobile number!"></asp:RegularExpressionValidator>

           </div>
        </div> 
         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
             <div class="form-group">
          <asp:Label runat="server" AssociatedControlID="drpCity" CssClass="col-md-2 control-label">City:<asp:Label ID="valCity" Text="*" CssClass="text-danger" runat="server" Font-Bold="true"></asp:Label></asp:Label><br />
             <div class="col-md-10">
              <asp:DropDownList ID="drpCity" runat="server" TextMode="SingleLine" CssClass="form-control" Width="220px" Height="40px" DataSourceID="sqlCity" DataTextField="cityName" DataValueField="cityID" AutoPostBack="true"></asp:DropDownList>
                 <asp:SqlDataSource ID="sqlCity" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="SELECT [cityID], [cityName] FROM [City] ORDER BY [cityName]"></asp:SqlDataSource>
              </div>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="City field required" CssClass="text-danger" ControlToValidate="drpCity" Display="None" Operator="NotEqual" ValueToCompare="0" SetFocusOnError="false">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="City field is required." ControlToValidate="drpCity" Operator="NotEqual" ValueToCompare="0" SetFocusOnError="false" CssClass="text-danger"  Display="None"></asp:CompareValidator>
           </div>
               &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
          <div class="form-group">
         <asp:Label runat="server" AssociatedControlID="drpSuburb" CssClass="col-md-2 control-label" >Suburb:<asp:Label ID="valSuburb" Text="*" CssClass="text-danger" runat="server" Font-Bold="true"></asp:Label></asp:Label><br />
             <div class="col-md-10">
              <asp:DropDownList ID="drpSuburb" runat="server" TextMode="SingleLine" CssClass="form-control" Width="220px" Height="40px"  DataSourceID="sqlSuburb" DataTextField="suburbName" DataValueField="subID" ></asp:DropDownList>
                <asp:SqlDataSource ID="sqlSuburb" runat="server" ConnectionString="<%$ ConnectionStrings:Encompass_SolutionsConnectionString %>" SelectCommand="SELECT [subID], [suburbName], [cityID] FROM [Suburb] WHERE ([cityID] = @cityID)">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="drpCity" Name="cityID" PropertyName="SelectedValue" Type="Int32" />
                      </SelectParameters>
                 </asp:SqlDataSource>
                 </div>
    &nbsp;&nbsp;
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPostalCode" CssClass="col-md-2 control-label">Postal Code:<asp:Label ID="valPostal" Text="*" CssClass="text-danger" runat="server" Font-Bold="true"></asp:Label></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPostalCode" TextMode="SingleLine" CssClass="form-control" Width="280px" placeholder="Postal Code" MaxLength="4" />
                  <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContact" Display="None"
                    CssClass="text-danger" ErrorMessage="Postal Code field is required." />
                <br />
           </div>
        </div> 
    <br />
    <br />
      <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="drpRole"  CssClass="col-md-2 control-label">Role:</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="drpRole" runat="server" Width="192px">
                    <asp:ListItem Value="0">Select Role</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="drpRole" ValidationGroup="ClientType" InitialValue="0"
                    CssClass="text-danger" ErrorMessage="The client type field is required." />
            </div>
        </div>
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <div class="form-group">
           <div class="col-md-offset-2 col-md-10">
              <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" Width="100px"  OnClick="btnSave_Click" CausesValidation="true"/>&nbsp;
            <asp:Button ID="btnCancel" CssClass="btn btn-default" runat="server" Text="Cancel" Width="100px" CausesValidation="False" OnClick="btnCancel_Click" />
        </div>
         </div>
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
 
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
    <br />
    <br />
    <br />
    <br />
    <br />
        

</asp:Content>
