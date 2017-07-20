using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using belabeautyBLL;
using System.Data;
using belabeautyDAL;

namespace baleflorbeaultysalon.pageBooking
{
    public partial class frmManagerBooking : System.Web.UI.Page
    {
        /// <summary>
        /// Manage all bookings
        /// </summary>
        ServiceType servType = new ServiceType();
        Service serv = new Service();
        Employee emp = new Employee();
        Slot slot = new Slot();
        CalendarAppointment ca = new CalendarAppointment();
        Client client = new Client();
        User_Account user = new User_Account();

        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (!IsPostBack)
            {
                //Add a created client.
                //string clientName = null;
                //clientName = user.FirstName;
               // drpClient.DataSource = client.SelectClients();
               //drpClient.DataValueField = "userID";
                //drpClient.DataTextField = "userName";
                //drpClient.DataBind();
                drpClient.Dispose();

                //Adding the service type for a client
                drpServiceType.DataSource = servType.SelectServiceTypes();
                drpServiceType.DataValueField = "servTypeID";
                drpServiceType.DataTextField = "servTypeName";
                drpServiceType.DataBind();
                drpServiceType.Dispose();

                //Service according to selected service

                drpService.DataSource = serv.SelectService();
                drpService.DataValueField = "servID";
                drpService.DataTextField = "servName";
                drpService.DataBind();
                drpService.Dispose();

                //Available Specialist
                drpSpecialist.DataSource = emp.SelectEmployeesByManager();
                drpSpecialist.DataValueField = "empID";
                drpSpecialist.DataTextField = "firstName";
                drpSpecialist.DataBind();
                drpSpecialist.Dispose();

                //Allow the manager to select the time retrieved from the database
             // ca.StartTime = Convert.ToDateTime(drpTime.SelectedItem.Text);
               
            }

            calApp.ShowGridLines = true;
            //Adding Appointment

        }

        protected void calApp_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Today)
            {
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Day.IsSelectable = false;
                
            }
            if (e.Day.Date.DayOfWeek != DayOfWeek.Sunday) return;
            e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.Red });
            e.Day.IsSelectable = false;

           
        }

      

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            ca.InsertCalendar();

            
            Response.Redirect("frmViewAppointment.aspx");
        }
    }
}