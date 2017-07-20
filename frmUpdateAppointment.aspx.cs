using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using belabeautyBLL;
using System.Data;

namespace baleflorbeaultysalon.pageBooking
{
    public partial class frmUpdateAppointment : System.Web.UI.Page
    {
        #region Declarations

        Appointment myAppointment = new Appointment();
        Client myCleint = new Client();
        User_Account myUser = new User_Account();
        Service myServ = new Service();
        CalendarAppointment calApp = new CalendarAppointment();
        DataTable dtUser = new DataTable();
        DataTable dtAppointment = new DataTable();

        ServiceType servType = new ServiceType();
        DataTable dtService = new DataTable();
        Service service = new Service();
        #endregion

        //string appDate = "";
        string servName = "";
        string appID = "";
        string empID = "";
        string calID = "";
        int typeID;

        protected void Page_Load(object sender, EventArgs e)
        {
            //txtClientName.Enabled = false;


            #region load text boxes

            try
            {
                if ((string)Session["appointmentID"] != null)
                {
                    myAppointment.AppointmentID = Convert.ToInt32((string)Session["appointmentID"].ToString());
                    myAppointment.AppointmentDate = Convert.ToDateTime((string)Session["appointmentDate"].ToString());


                    txtDate.Text = (string)Session["appointmentDate"].ToString();
                    txtClientName.Text = (string)Session["UserName"].ToString();
                    servName = (string)Session["servName"].ToString();

                    appID = (string)Session["appointmentID"].ToString();
                    empID = (string)Session["empID"].ToString();
                    calID = (string)Session["calendarID"].ToString();

                    txtStartTime.Text = Convert.ToDateTime((string)Session["startTime"].ToString()).ToShortTimeString();
                    txtEndTime.Text = Convert.ToDateTime((string)Session["endTime"].ToString()).ToShortTimeString();

                    //drpService.SelectedItem.Text =servName;
                    //drpEmployee.SelectedValue = empID;

                    //drpEmployee.SelectedValue = appID;

                }
            }
            catch (Exception em)
            {
                Session["ErrorMessage"] = em.ToString();
                Response.Redirect("~/frmError.aspx");

            }

            #endregion


            if (!IsPostBack)
            {

                drpServiceType.DataSource = servType.SelectServiceTypes();
                drpServiceType.DataValueField = "servTypeID";
                drpServiceType.DataTextField = "servTypeName";
                drpServiceType.DataBind();

                if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
                {
                    typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                    dtService = service.GetService(typeID);
                    drpService.DataSource = dtService;
                    drpService.DataValueField = "servID";
                    drpService.DataTextField = "servName";
                    drpService.DataBind();
                }
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmViewAppointment.aspx");

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            #region Check for duplicates
            try
            {
                if (Page.IsValid)
                {
                    myAppointment.AppointmentID = Convert.ToInt32(appID);
                    myAppointment.AppointmentDate = DateTime.Parse(txtDate.Text);
                    myAppointment.ServID = Convert.ToInt32(drpService.SelectedValue);
                    //myAppointment.UserCharID = txtClientName.Text;
                    myAppointment.CalendarID = Convert.ToInt32(calID);
                    myAppointment.EmpID = Convert.ToInt32(drpEmployee.SelectedValue);


                    //myAppointment
                    try
                    {
                        //myAppointment.CalendarID = calendar.CalendarID;
                        myAppointment.AppointmentDate = Convert.ToDateTime(txtDate.Text);
                        myAppointment.Active = true;
                        myAppointment.ServID = int.Parse(drpService.SelectedValue);
                        //myAppointment.SlotID = int.Parse(dropSlotTime.SelectedValue);
                        //myAppointment.UserCharID = User.Identity.GetUserId();
                        myAppointment.StartTime = Convert.ToDateTime(txtStartTime.Text);
                        myAppointment.EndTime = Convert.ToDateTime(txtStartTime.Text);
                     //   myAppointment.EndTime.AddMinutes(Convert.ToDouble(lblDuration.Text));
                        myAppointment.EmpID = Convert.ToInt32(drpEmployee.SelectedValue);

                        txtEndTime.Text = myAppointment.EndTime.ToShortTimeString();

                        //Might Delete this refenrence to use asp userCharID
                        //appointment.ClientID =Convert.ToInt32( ClientID.ToString());
                        dtAppointment = myAppointment.SelectAppointments();
                        //indexInsert = dtAppointment.Rows.Count;
                        DateTime appDate = new DateTime();
                        DateTime appStartT = new DateTime();
                        DateTime appEndT = new DateTime();
                        int temEmpID = 0;

                        //check duplicate
                        bool checkDulcate = false;
                        foreach (DataRow row in dtAppointment.Rows)
                        {
                            appDate = Convert.ToDateTime(row["appointmentDate"].ToString());
                            if (row["appStartTime"].ToString() != "")
                            {
                                appStartT = Convert.ToDateTime(row["appStartTime"].ToString());
                                appEndT = Convert.ToDateTime(row["appEndTime"].ToString());
                                temEmpID = Convert.ToInt32(row["appEmpID"]);
                            }


                            //Check Identical duplicate
                            if ((appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                                && appStartT.ToShortTimeString() == myAppointment.StartTime.ToShortTimeString()
                                && appEndT.ToShortTimeString() == myAppointment.EndTime.ToShortTimeString()
                                && temEmpID == myAppointment.EmpID)
                                )
                            {
                                checkDulcate = true;
                                break;
                            }//Check starttime, date and empID
                            else if (appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                            && appStartT.ToShortTimeString() == myAppointment.StartTime.ToShortTimeString()
                            && temEmpID == myAppointment.EmpID)
                            {

                                checkDulcate = true;
                                break;
                            }//Check endtime, date and empID
                            else
                              if (
                        appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                        && myAppointment.StartTime < appEndT
                        && myAppointment.EndTime > appStartT
                        && temEmpID == myAppointment.EmpID
                        )
                            {
                                checkDulcate = true;
                                break;
                            }
                            else
                    if (
                        appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                        && myAppointment.StartTime > appEndT
                        && myAppointment.EndTime < appStartT
                        && temEmpID == myAppointment.EmpID
                        )
                            {
                                checkDulcate = true;
                                break;
                            }
                        }

                        if (checkDulcate == true)
                        {

                            lblMessage.Text = "Sorry but this slot has been taken";
                            lblMessage.ForeColor = System.Drawing.Color.Red;

                        }
 




                    }
                    catch (Exception emx)
                    {
                        Session["ErrorMessage"] = emx.ToString();
                        Response.Redirect("~/frmError.aspx", false);

                    }

                    if (myAppointment.UpdateAppointment(myAppointment))
                    {
                        Response.Redirect("~/pageBooking/frmViewAppointment.aspx", false);
                    }
                }
                else
                {
                    Page.Validate();
                }
            }
            catch (Exception em)
            {
                Session["ErrorMessage"] = em.ToString();
                Response.Redirect("~/frmError.aspx");

            }
            #endregion

        }


        protected void btnOKGood_Click(object sender, EventArgs e)
        {

        }

        protected void dropSlotTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtStartTime.Text="";
            txtStartTime.Text = dropSlotTime.SelectedItem.ToString();

            #region Check for duplicates
            try
            {
                myAppointment.AppointmentID = Convert.ToInt32(appID);
                    myAppointment.AppointmentDate = DateTime.Parse(txtDate.Text);
                    myAppointment.ServID = Convert.ToInt32(drpService.SelectedValue);
                    //myAppointment.UserCharID = txtClientName.Text;
                    myAppointment.CalendarID = Convert.ToInt32(calID);
                    myAppointment.EmpID = Convert.ToInt32(drpEmployee.SelectedValue);


                    //myAppointment
                    try
                    {
                        //myAppointment.CalendarID = calendar.CalendarID;
                        myAppointment.AppointmentDate = Convert.ToDateTime(txtDate.Text);
                        myAppointment.Active = true;
                        myAppointment.ServID = int.Parse(drpService.SelectedValue);
                        //myAppointment.SlotID = int.Parse(dropSlotTime.SelectedValue);
                        //myAppointment.UserCharID = User.Identity.GetUserId();
                        myAppointment.StartTime = Convert.ToDateTime(txtStartTime.Text);
                        myAppointment.EndTime = Convert.ToDateTime(txtStartTime.Text);
                   // myAppointment.EndTime=myAppointment.EndTime.AddMinutes(Convert.ToDouble(lblDuration.Text));

                        txtEndTime.Text = myAppointment.EndTime.ToShortTimeString();
                        myAppointment.EmpID = Convert.ToInt32(drpEmployee.SelectedValue);


                        //Might Delete this refenrence to use asp userCharID
                        //appointment.ClientID =Convert.ToInt32( ClientID.ToString());
                        dtAppointment = myAppointment.SelectAppointments();
                        //indexInsert = dtAppointment.Rows.Count;
                        DateTime appDate = new DateTime();
                        DateTime appStartT = new DateTime();
                        DateTime appEndT = new DateTime();
                        int temEmpID = 0;

                        //check duplicate
                        bool checkDulcate = false;
                        foreach (DataRow row in dtAppointment.Rows)
                        {
                            appDate = Convert.ToDateTime(row["appointmentDate"].ToString());
                            if (row["appStartTime"].ToString() != "")
                            {
                                appStartT = Convert.ToDateTime(row["appStartTime"].ToString());
                                appEndT = Convert.ToDateTime(row["appEndTime"].ToString());
                                temEmpID = Convert.ToInt32(row["appEmpID"]);
                            }


                            //Check Identical duplicate
                            if ((appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                                && appStartT.ToShortTimeString() == myAppointment.StartTime.ToShortTimeString()
                                && appEndT.ToShortTimeString() == myAppointment.EndTime.ToShortTimeString()
                                && temEmpID == myAppointment.EmpID)
                                )
                            {
                                checkDulcate = true;
                                break;
                            }//Check starttime, date and empID
                            else if (appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                            && appStartT.ToShortTimeString() == myAppointment.StartTime.ToShortTimeString()
                            && temEmpID == myAppointment.EmpID)
                            {

                                checkDulcate = true;
                                break;
                            }//Check endtime, date and empID
                            else
                              if (
                        appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                        && myAppointment.StartTime < appEndT
                        && myAppointment.EndTime > appStartT
                        && temEmpID == myAppointment.EmpID
                        )
                            {
                                checkDulcate = true;
                                break;
                            }
                            else
                    if (
                        appDate.ToShortDateString() == myAppointment.AppointmentDate.ToShortDateString()
                        && myAppointment.StartTime > appEndT
                        && myAppointment.EndTime < appStartT
                        && temEmpID == myAppointment.EmpID
                        )
                            {
                                checkDulcate = true;
                                break;
                            }
                        }

                        
                        if (checkDulcate == true)
                        {

                            lblMessage.Text = "Sorry but this slot has been taken";
                            lblMessage.ForeColor = System.Drawing.Color.Red;

                        }





                    }
                    catch (Exception emx)
                    {
                        Session["ErrorMessage"] = emx.ToString();
                        Response.Redirect("~/frmError.aspx", false);

                    }

            }
            catch (Exception em)
            {
                Session["ErrorMessage"] = em.ToString();
                Response.Redirect("~/frmError.aspx");

            }
            #endregion


        }

        protected void drpServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
            {
                typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                dtService = service.GetService(typeID);
                drpService.DataSource = dtService;
                drpService.DataValueField = "servID";
                drpService.DataTextField = "servName";
                drpService.DataBind();
            }
        }

        protected void drpService_SelectedIndexChanged(object sender, EventArgs e)
        {
            #region Assign labels
            if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
            {
                int typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                dtService = service.GetService(typeID);
            }

            for (int i = 0; i < dtService.Rows.Count; i++)
            {
                if (drpService.SelectedValue.ToString() == dtService.Rows[i][0].ToString())
                {

                    //lblDuration.Text = dtService.Rows[i]["servDuration"].ToString();

                }
            }

            #endregion

        }
    }
}