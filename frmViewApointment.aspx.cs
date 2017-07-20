using belabeautyBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baleflorbeaultysalon.pageBooking
{
    public partial class frmViewApointment : System.Web.UI.Page
    {
        Appointment myAppointment = new Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {
            grvViewAppoinment.DataSource = myAppointment.SelectAppointments();
            grvViewAppoinment.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }

    }
}