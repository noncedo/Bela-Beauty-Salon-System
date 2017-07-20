using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using belabeautyBLL;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data;
using System.IO;
using iTextSharp.text.html.simpleparser;



namespace baleflorbeaultysalon.pageBooking
{


    public partial class frmViewAppointment : System.Web.UI.Page
    {


        #region Declarations
        //IAppointment myAppointment; //= new Appointment();
        DataTable myDTapp = new DataTable();
        int selectRow = 0;
        Employee emp = new Employee();
        Appointment app = new Appointment();
        int selectedRowIndex;

        int updateTrue = 99;
        int viewInvoiceTrue = 99;
        
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ddlSelectEmp.SelectedIndex = 0;
                ddlSelectEmp.Items.Add(new System.Web.UI.WebControls.ListItem("All", "-99"));
                ddlSelectEmp.AppendDataBoundItems = true;
                ddlSelectEmp.DataSource = emp.SelectEmployeesByManager();
                ddlSelectEmp.DataValueField = "empID";
                ddlSelectEmp.DataTextField = "fullname";
                ddlSelectEmp.DataBind();
                ddlSelectEmp.Dispose();

            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/pageBooking/frmAddBooking.aspx");


        }

        protected void grvViewAppoinment_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnConvertToPDF_Click(object sender, EventArgs e)
        {
            //try
            //{

            //    Response.ContentType = "application/pdf";
            //    Response.AddHeader("content-disposition",
            //     "attachment;filename=GridViewExport.pdf");
            //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //    StringWriter sw = new StringWriter();
            //    HtmlTextWriter hw = new HtmlTextWriter(sw);
            //    grvViewAppoinment.AllowPaging = false;
            //    grvViewAppoinment.DataBind();
            //    grvViewAppoinment.RenderControl(hw);
            //    StringReader sr = new StringReader(sw.ToString());
            //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //    pdfDoc.Open();
            //    htmlparser.Parse(sr);
            //    pdfDoc.Close();
            //    Response.Write(pdfDoc);
            //    Response.End();
            //}
            //catch (Exception ex)
            //{
            //    Session["ErrorMessage"] = ex.ToString();
            //    Response.Redirect("~/frmError.aspx");
            //    //Response.Write(ex.ToString());
            //}
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    //Get the button that raised the event
            //    Button btn = (Button)sender;

            //    //Get the row that contains this button
            //    GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //    if (gvr.RowIndex > 0)
            //    {
            //        selectRow = gvr.RowIndex;
            //    }

            //    if (selectRow >= 0)
            //    {
            //        Session["appointmentID"] = grvViewAppoinment.Rows[selectRow].Cells[0].Text;
            //        Session["appointmentDate"] = grvViewAppoinment.Rows[selectRow].Cells[1].Text;

            //        Session["startTime"] = grvViewAppoinment.Rows[selectRow].Cells[2].Text;
            //        Session["endTime"] = grvViewAppoinment.Rows[selectRow].Cells[3].Text;

            //        Session["servName"] = grvViewAppoinment.Rows[selectRow].Cells[4].Text;
            //        Session["UserName"] = grvViewAppoinment.Rows[selectRow].Cells[5].Text;
            //        Session["empID"] = grvViewAppoinment.Rows[selectRow].Cells[6].Text;

            //        Session["firstName"] = grvViewAppoinment.Rows[selectRow].Cells[7].Text;
            //        Session["calendarID"] = grvViewAppoinment.Rows[selectRow].Cells[8].Text;
            //    }
            //}
            //catch (Exception em)
            //{
            //    Session["ErrorMessage"] = em.ToString();
            //    Response.Redirect("~/frmError.aspx");

            //}

            //Response.Redirect("~/pageBooking/frmUpdateAppointment.aspx");
            //grvViewAppoinment_RowCommand(sender,e);

            updateTrue = 1;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            pnlDelete.Visible = true;
            grvViewAppoinment.Visible = false;
            hideGrid.Visible = false;
        }

        protected void drpSortby_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnOKGood_Click(object sender, EventArgs e)
        {
            try
            {
                pnlDelete.Visible = false;

                app.AppointmentID = Convert.ToInt32(lblID.Text);
                app.DeleteAppointment(app);



                grvViewAppoinment.Visible = true;
                hideGrid.Visible = true;

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
            try
            {

                GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

                int RowIndex = gvr.RowIndex;
                selectedRowIndex = RowIndex;

                lblID.Text = (grvViewAppoinment.Rows[selectedRowIndex].FindControl("lblAppID") as Label).Text;
                lblDate.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[1].Text;
                //Accessing TemplateField Column controls
                lblEmployee.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[6].Text;
                lblTime.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[2].Text;
                lblService.Text = grvViewAppoinment.Rows[selectedRowIndex].Cells[4].Text;


                Session["appointmentID"] = lblID.Text;
                Session["appointmentDate"] = grvViewAppoinment.Rows[selectedRowIndex].Cells[1].Text;

                Session["startTime"] = grvViewAppoinment.Rows[selectedRowIndex].Cells[2].Text;
                Session["endTime"] = grvViewAppoinment.Rows[selectedRowIndex].Cells[3].Text;

                Session["servName"] = grvViewAppoinment.Rows[selectedRowIndex].Cells[4].Text;
                Session["UserName"] = grvViewAppoinment.Rows[selectedRowIndex].Cells[5].Text;
                Session["empID"] = (grvViewAppoinment.Rows[selectedRowIndex].FindControl("lblEmpID") as Label).Text;

                Session["firstName"] = grvViewAppoinment.Rows[selectedRowIndex].Cells[7].Text;
                Session["calendarID"] = (grvViewAppoinment.Rows[selectedRowIndex].FindControl("lblCalendarID") as Label).Text;
            }

            catch (Exception em)
            {
                Session["ErrorMessage"] = em.ToString();
                Response.Redirect("~/frmError.aspx");

            }
            if (updateTrue==1)
            {
                Response.Redirect("~/pageBooking/frmUpdateAppointment.aspx");
            }
            else if (viewInvoiceTrue==1)
            {
                Response.Redirect("~/pageBooking/frmViewAppoointmentInvoice.aspx", false);
            }
        }

        protected void viewInvoice_Click(object sender, EventArgs e)
        {
            viewInvoiceTrue = 1;

        }

        protected void calFrom_SelectionChanged(object sender, EventArgs e)
        {
            //txtFrom.Text = calFrom.SelectedDate.ToShortDateString();
        }

        protected void calTo_SelectionChanged(object sender, EventArgs e)
        {
            //txtTo.Text = calTo.SelectedDate.ToShortDateString();
        }
    }

}