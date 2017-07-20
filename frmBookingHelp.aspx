<%@ Page Title="" Language="C#" MasterPageFile="~/masterClient.Master" AutoEventWireup="true" CodeBehind="frmBookingHelp.aspx.cs" Inherits="baleflorbeaultysalon.pageBooking.frmBookingHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .panel {
            margin-bottom: 0px;
            width: 1100px;
            height: 2000px;
            vertical-align: central;
            display: inline-block;
            margin: 1em;
        }

        h4 {
            color: red;
        }
    </style>

    <br />
    <br />
    <br />
    <hr />
    <h2>How to make a booking&nbsp;&nbsp;<span class="glyphicon glyphicon-question-sign"></span></h2>
    <br />


    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
     <div class="panel panel-info">
         <div class="panel-heading">
             <h3 class="panel-title"></h3>
         </div>
         <div class="panel-body" style="height: auto">
             <div class="form-group">
                 <h4>Before making a booking you must be a registered user because the system has limited access to different kinds of users,
              it only allows registered users.
                 </h4>
                 <br />

                 <h5><strong>Step 1: </strong>Select a date on the calendar and click the "Next" button when finished selecting a date.</h5>
                 <br />
                 <asp:Image ID="Image1" ImageUrl="~/Images/step 1.png" runat="server" Width="90%" Height="90%" />
                 <hr />

                 <br />
                 <br />
                 <h5><strong>Step 2: </strong>Select your preferred Specialist(there is a default Specialist selected).<br />
                     - Select Service type.<br />
                     - Select Service
                     <br />
                     - And lastly select the Start Time for that appointment.<br />
                     You must make sure that you select all the required fields in order to make a successful booking.<br />
                     Make sure your appointment details are correct before clicking on the finish button.
                     <br />
                     (Optional) Check the "Send me an email"checkbox if you want to receive a notification via email.
                 </h5>
                 <br />
                 <asp:Image ID="Image2" ImageUrl="~/Images/step2.png" runat="server" Width="90%" Height="90%" />
                 <hr />

                 <br />
                 <br />
                 <h5><strong>Step 3: </strong>Check your appointment details on the final step.To save the appointment click on the "Finish" button.</h5>

                 <br />
                 <asp:Image ID="Image3" ImageUrl="~/Images/step3.png" runat="server" Width="90%" Height="90%" />
                 <hr />
             </div>


         </div>
     </div>
       
</asp:Content>
