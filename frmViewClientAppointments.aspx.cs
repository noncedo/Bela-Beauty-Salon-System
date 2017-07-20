using belabeautyBLL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baleflorbeaultysalon.pageClient
{
    public partial class frmViewClientAppointments : System.Web.UI.Page
    {
        Appointment app = new Appointment();
        DataTable dtAppointment = new DataTable();
        int selectedRowIndex;

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
            if (User.Identity.IsAuthenticated)
            {
                lblUser.Text = User.Identity.GetUserId();
            }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
        protected void grvViewAppoinment_SelectedIndexChanged(object sender, EventArgs e)
        {
           

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/pageBooking/frmAddBooking.aspx", false);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            pnlDelete.Visible = true;
            grvViewAppoinment.Visible = false;
        }
        protected void loadGrid()
        {
            if (User.Identity.IsAuthenticated)
            {
                //app.UserCharID = User.Identity.GetUserId();
                //dtAppointment = app.GetAppointmentByClient(app);
                //grvViewAppoinment.DataSource = dtAppointment;
                //grvViewAppoinment.DataBind();
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx", false);
            }

        }



        protected void btnOKGood_Click(object sender, EventArgs e)
        {
            try
            {
                pnlDelete.Visible = false;

                app.AppointmentID = Convert.ToInt32(lblID.Text);
                app.DeleteAppointment(app);
                grvViewAppoinment.Visible = true;

                Response.Redirect(Request.RawUrl,false);

            }
            catch (Exception emx)
            {
                Session["ErrorMessage"] = emx.ToString();
                Response.Redirect("~/frmError.aspx");
                //throw;
            }

            

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlDelete.Visible = false;
        }

        protected void grvViewAppoinment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

            int RowIndex = gvr.RowIndex;
            selectedRowIndex = RowIndex;

            lblID.Text= (grvViewAppoinment.Rows[selectedRowIndex].FindControl("lblAppID") as Label).Text;
            lblDate.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[2].Text;
            //Accessing TemplateField Column controls
            lblEmployee.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[3].Text;
            lblTime.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[4].Text;
            lblService.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[6].Text;

        }



    }
}