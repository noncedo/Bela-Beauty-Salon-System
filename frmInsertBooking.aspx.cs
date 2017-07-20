
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using belabeautyBLL;

namespace baleflorbeaultysalon.pageBooking
{
    public partial class frmInsertBooking : System.Web.UI.Page
    {

        Appointment myApp = new Appointment();
        Client myClient = new Client();
        ClientType myClientType = new ClientType();
        //belabeautyBLL.Calendar myCalendar = new belabeautyBLL.Calendar();

        protected void Page_Load(object sender, EventArgs e)
        {
            drpClientType.DataSource = myClientType.SelectClientTypes();
            drpClientType.DataValueField = "clientTypeID";
            drpClientType.DataTextField = "clientDesc";
            drpClientType.DataBind();

            //grdClient.DataSource = myClient.SelectClients();
            //grdClient.DataBind();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            myClient.ClientID = Convert.ToInt32(drpClientSelect.SelectedValue);
            myClient.ClientTypeID = Convert.ToInt32(drpClientType.SelectedValue);

            //myCalendar.Date = Convert.ToDateTime(txtDate.Text);
            //myCalendar.EmpID = Convert.ToInt32(drpClientSelect.SelectedValue);
            //myCalendar.IsAvaliable = true;
            
            myApp.AppointmentDate = Convert.ToDateTime(txtDate.Text);
            myApp.ServID = Convert.ToInt32(drpService.SelectedValue);
            myApp.ClientID = Convert.ToInt32(drpClientSelect.SelectedValue);
            myApp.AppointmentDate= Convert.ToDateTime(txtDate.Text);

            try
            {
                if (myApp.InsertAppointment(myApp))
                {
                    Response.Redirect("frmViewAppointment.aspx");
                }
                
            }
            catch (Exception)
            {

                throw;
            }
            //myCalendar.InsertCalendar();

        }

        protected void btnOKGood_Click(object sender, EventArgs e)
        {

        }

        protected void grdClient_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtName.Text = grdClient.SelectedRow.Cells[0].ToString()+ " " + grdClient.SelectedRow.Cells[1].ToString();
            //myClient.ClientID =Convert.ToInt32( grdClient.SelectedRow.Cells[4]);
            //myClient.UserID= Convert.ToInt32(grdClient.SelectedRow.Cells[5]);
        }

        protected void drpClientType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //myCleintType.ClientTypeID =Convert.ToInt32(drpClientType.SelectedValue);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {



        }
    }
}