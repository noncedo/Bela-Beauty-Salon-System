using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DayPilot.Web.Ui;
using belabeautyBLL;
using DayPilot.Web.Ui.Events;
using Microsoft.AspNet.Identity;
using belabeautyDAL;
using System.Data.SqlTypes;

//Email settings
using System.Net;
using System.Net.Mail;


namespace baleflorbeaultysalon.Booking
{
    public partial class frmAddBooking : System.Web.UI.Page
    {
        // Int32 index;
        DataTable dtEmpbySchedule = new DataTable();
        DataTable dtService = new DataTable();

        Employee employee = new Employee();
        Client client = new Client();

        Appointment appointment = new Appointment();
        CalendarAppointment calendar = new CalendarAppointment();
        Service service = new Service();
        ServiceType servType = new ServiceType();

        DataTable dtAppointment = new DataTable();
        DataTable dtClient = new DataTable();
        //DataTable dtService = new DataTable();

        //Email
        SmtpClient smtp = new SmtpClient();
        MailMessage message = new MailMessage();



        protected void Page_Load(object sender, EventArgs e)
        {

            ///
          
            //drpServiceType.SelectedIndex = 0;
            //drpServiceType.Items.Add(new ListItem("Select Service Type", "0"));
            //drpServiceType.Dispose();

            //ddlServices.SelectedIndex = 0;
            //ddlServices.Items.Add(new ListItem("Select service", "0"));
            //ddlServices.Dispose();

            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            Wizard1.DisplaySideBar = true;
            // dropSaturday.Visible = true;
            dropSlotTime.Visible = true;






            //modalPopTimeStart.Show();
            if (!IsPostBack)
            {

                //drpServiceType.SelectedIndex = 0;
                //drpServiceType.Items.Add(new ListItem("Select Service Type", "0"));
                //drpServiceType.Dispose();

                //I would like the dtService to be  filled so I can access price and duration
                if (drpServiceType.SelectedIndex >= 0)
                {

                    if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
                    {
                        dropSlotTime.Enabled = true;
                        int typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                        dtService = service.GetService(typeID);

                        ddlServices.DataSource = dtService;
                        ddlServices.DataValueField = "servID";
                        ddlServices.DataTextField = "servName";
                        ddlServices.DataBind();
                    }
                }
                //Wizard1.BackColor = System.Drawing.Color.BlueViolet;

                //modalPopTimeStart.Show();

                ddlEmployee.DataSource = employee.SelectEmployeesByManager();
                ddlEmployee.DataValueField = "empID";
                ddlEmployee.DataTextField = "fullname";
                ddlEmployee.DataBind();

                //Wizard must always start index 0
                Wizard1.ActiveStepIndex = 0;
                ServiceType servType = new ServiceType();


                drpServiceType.DataSource = servType.SelectServiceTypes();
                drpServiceType.DataValueField = "servTypeID";
                drpServiceType.DataTextField = "servTypeName";
                drpServiceType.DataBind();

                //calStep1.SelectedDate = DateTime.Today.Date;
                // lblServDuration.Text = "Service duration:";

                if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
                {
                    int typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                    dtService = service.GetService(typeID);
                    ddlServices.DataSource = dtService;
                    ddlServices.DataValueField = "servID";
                    ddlServices.DataTextField = "servName";
                    ddlServices.DataBind();
                }
            }
        }
        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (Page.IsValid && calStep1.SelectedDate >= DateTime.Today.Date)
            {
                if (User.Identity.IsAuthenticated)
                {
                    if (drpServiceType.SelectedIndex >= 0)
                    {
                        if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
                        {
                            int typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                            dtService = service.GetService(typeID);
                            drpServiceType.Items.Add(new ListItem("select service", "1"));
                            ddlServices.DataSource = dtService;
                            ddlServices.DataValueField = "servID";
                            ddlServices.DataTextField = "servName";
                            ddlServices.DataBind();

                        }

                    }

                    try
                    {
                        if ((lblEmp.Text != "")
                            && (lblDate.Text != "")
                            && (lblTmeStep3.Text != "")
                            && (lblPrice.Text != "")
                            && (lblDuration.Text != ""))
                        {
                            dtClient = client.SelectClients();

                            int indexInsert = 0;
                            //int clientID=0;
                            string userID = User.Identity.GetUserId();

                            calendar.Date = Convert.ToDateTime(calStep1.SelectedDate);
                            calendar.StartTime = DateTime.Parse(calendar.Date.ToShortDateString() + " " + dropSlotTime.SelectedItem.Text);
                            calendar.EndTime = DateTime.Parse(calendar.Date.ToShortDateString() + " " + dropSlotTime.SelectedItem.Text);

                            calendar.EndTime = calendar.EndTime.AddMinutes(Convert.ToDouble(lblDuration.Text));
                            calendar.EmpID = Convert.ToInt32(ddlEmployee.SelectedValue);
                            //Set availability to false after booking or not7777
                            calendar.IsAvaliable = true;
                            //= Convert.ToInt32(DayPilotCalendar1.DataIdField);
                            DataTable dtCal = new DataTable();
                            dtCal = calendar.GetCalendarByManager(calendar);
                            //??????????????????
                            calendar.CalendarID = Convert.ToInt32(dtCal.Rows[0]["calendarID"]);

                            appointment.CalendarID = calendar.CalendarID;
                            appointment.AppointmentDate = calStep1.SelectedDate;
                            appointment.Active = true;
                            appointment.ServID = int.Parse(ddlServices.SelectedValue);
                            appointment.SlotID = int.Parse(dropSlotTime.SelectedValue);
                            appointment.UserCharID = User.Identity.GetUserId();
                            appointment.StartTime = calendar.StartTime;
                            appointment.EndTime = calendar.EndTime;
                            appointment.EmpID = calendar.EmpID;
                            appointment.StateID = 1;

                            //Might Delete this refenrence to use asp userCharID
                            //appointment.ClientID =Convert.ToInt32( ClientID.ToString());
                            dtAppointment = appointment.SelectAppointments();
                            indexInsert = dtAppointment.Rows.Count;
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
                                if ((appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                                    && appStartT.ToShortTimeString() == calendar.StartTime.ToShortTimeString()
                                    && appEndT.ToShortTimeString() == calendar.EndTime.ToShortTimeString()
                                    && temEmpID == calendar.EmpID)
                                    )
                                {
                                    checkDulcate = true;
                                    break;
                                }//Check starttime, date and empID
                                else if (appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                                && appStartT.ToShortTimeString() == calendar.StartTime.ToShortTimeString()
                                && temEmpID == calendar.EmpID)
                                {

                                    checkDulcate = true;
                                    break;
                                }//Check endtime, date and empID
                                else
                                  if (
                            appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                            && calendar.StartTime < appEndT
                            && calendar.EndTime > appStartT
                            && temEmpID == calendar.EmpID
                            )
                                {
                                    checkDulcate = true;
                                    break;
                                }
                                else
                        if (
                            appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                            && calendar.StartTime > appEndT
                            && calendar.EndTime < appStartT
                            && temEmpID == calendar.EmpID
                            )
                                {
                                    checkDulcate = true;
                                    break;
                                }
                            }

                            if (checkDulcate == false)
                            {
                                calendar.IsAvaliable = true;
                                if (appointment.InsertAppointment(appointment))
                                {
                                    if (calendar.UpdateCalendar(calendar))
                                    {
                                        Wizard1.Visible = false;
                                        pnlUpdate.Visible = true;
                                        //MsgBox("You're appointment has been booked successfully!", this.Page, this);


                                    }




                                    try
                                    {
                                        if (chkSend.Checked)
                                        {
                                            string msg = "Your appointment was booked successfully";
                                            msg += "\n";

                                            msg += "\n Specialist:\t" + ddlEmployee.SelectedItem.Text;
                                            msg += "\n Date:\t" + appointment.AppointmentDate.ToShortDateString();
                                            msg += "\n Time:\t" + dropSlotTime.SelectedItem.Text;
                                            msg += "\n Service:\t" + ddlServices.SelectedItem.Text;
                                            msg += "\n Price:\tR" + lblPrice.Text;

                                            message.Subject = "BelaFlor Beauty Salon Booking";
                                            message.Body = msg;


                                            message.To.Add(new MailAddress(User.Identity.GetUserName()));
                                            message.From = new MailAddress("s212354000@live.nmmu.ac.za");
                                            SmtpClient client = new SmtpClient("email.nmmu.ac.za", 25);
                                            client.Send(message);

                                        }



                                    }
                                    catch (Exception emx)
                                    {
                                        Session["ErrorMessage"] = emx.ToString();
                                        Response.Redirect("~/frmError.aspx");
                                        throw;
                                    }

                                }




                            }
                            else
                            {
                                lblMessage.Text = "Sorry but this slot has been taken";
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                            }

                        }
                        else
                        {
                            lblMessage.Text = "Please select all the fields";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }



                    }
                    catch (Exception emx)
                    {
                        Session["ErrorMessage"] = emx.ToString();
                        Response.Redirect("~/frmError.aspx");
                        throw;
                    }
                }
                else
                {
                    Response.Redirect("~/Account/Login.aspx");
                }

            }
            else
            {
                lblMessageStep1.Text = "Please select a date";
                Wizard1.ActiveStepIndex = 0;
                Page.Validate("submitAll");
            }


        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblMessageStep1.Visible = false;
            //modalPopTimeStart.Show();
            //DayPilotCalendar1.StartDate = calStep1.SelectedDate;

            if (calStep1.SelectedDate != calStep1.SelectedDate)
            {
                lblStatus.Text = "Please select date to proceed with you appointment.";
            }

            lblDateStep2Display.Text = calStep1.SelectedDate.ToShortDateString();
            //lblService.Text
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            lblDateStep2Display.Text = calendar.Date.ToShortDateString();
            if (e.Day.Date < DateTime.Today.AddDays(1))
            {
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Day.IsSelectable = false;
            }

            if (e.Day.Date.DayOfWeek != DayOfWeek.Sunday) return;
            e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.Red });
            e.Day.IsSelectable = false;


            //IM TRYING TO SET THAT WHEN Saturday is selected the page displays the dropdown for saturday is displayed.
            if (e.Day.Date.DayOfWeek == DayOfWeek.Saturday)
            {
                dropSlotTime.Visible = false;
                // dropSaturday.Visible = true;
            }


            else
                dropSlotTime.Visible = true;
            //  dropSaturday.Visible = false;


            // e.Cell.Text = String.Format("<a href='frmUpdateAppointment.aspx?day={0:d}' style='color:" + color + "; text-decoration:none font-weight:"
            //  + fontWeight + "'>{1}</a>", e.Day.Date, e.Day.Date.Day);
        }


        private bool isThereEvent(DateTime date)
        {
            DateTime today = DateTime.Now;
            DateTime tommorrow = today.AddDays(1);
            DateTime anotherDay = today.AddDays(3);

            //there are events today
            if ((date.DayOfYear == today.DayOfYear) && (date.Year == today.Year))
                return true;
            //there are events tommorrow
            if ((date.DayOfYear == tommorrow.DayOfYear) && (date.Year == tommorrow.Year))
                return true;

            //there are events on another day
            if ((date.DayOfYear == anotherDay.DayOfYear) && (date.Year == anotherDay.Year))
                return true;
            return false;
        }

        protected void dsServices_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {

            lblMessageStep2.Visible = false;
            lblMessage.Visible = false;
            lblMessageStep1.Visible = false;

            calendar.EmpID = int.Parse(ddlEmployee.SelectedValue);
            dtAppointment = appointment.GetAppointmentEmpSchedule(appointment);


        }

        protected void btnOKGood_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/pageClient/frmViewClientAppointments.aspx");
            //modalPopTimeStart.Show();
        }

        protected void DayPilotCalendar1_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.Calendar.BeforeEventRenderEventArgs e)
        {

            if ((string)e.DataItem["appointmentDate"] == "special")  // "type" field must be available in the DataSource
            {
                e.CssClass = "special";
                e.BackgroundColor = "blueViolet";
                e.Html = "<i>WARNING: slot reserved!" + e.Html;
            }

        }

        protected void DayPilotCalendar1_EventClick(object sender, EventClickEventArgs e)
        {
            //DayPilotCalendar1.BackColor = System.Drawing.Color.MediumPurple;
            //modalPopTimeStart.Show();

        }

        protected void TimeRangeSelected_Event(object sender, TimeRangeSelectedEventArgs e)
        {
            if (e.Start.DayOfWeek == DayOfWeek.Sunday)
            {
                //N.B ---disable cell click
            }
            //lblTime.Text = "" + e.Start;

        }

        protected void btnAddItems_Click(object sender, EventArgs e)
        {
            //Adding all items required by the user
            if (ddlServices.SelectedItem != null)
            {
                // lstItems.Items.Add(ddlServices.SelectedItem);
            }
            //modalPopTimeStart.Show();
        }

        protected void DayPilotCalendar1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
        {


        }

        protected void drpServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {

            dropSlotTime.Enabled = true;

            lblMessageStep2.Visible = false;
            lblMessage.Visible = false;
            lblMessageStep1.Visible = false;

            if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
            {
                int typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                dtService = service.GetService(typeID);
                ddlServices.DataSource = dtService;
                ddlServices.DataValueField = "servID";
                ddlServices.DataTextField = "servName";
                ddlServices.DataBind();

            }

            #region Assign labels
            if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
            {
                int typeID = Convert.ToInt32(drpServiceType.SelectedValue);
                dtService = service.GetService(typeID);
            }

            for (int i = 0; i < dtService.Rows.Count; i++)
            {
                if (ddlServices.SelectedValue.ToString() == dtService.Rows[i][0].ToString())
                {
                    lblStep2Duration.Text = dtService.Rows[i]["servDuration"].ToString();
                    lblMinutes.Visible = true;
                    //lblStep2Price.Text= dtService.Rows[i]["servCost"].ToString();
                    lblDuration.Text = dtService.Rows[i]["servDuration"].ToString();
                    lblPrice.Text = dtService.Rows[i]["servCost"].ToString();
                }
            }

            setLabels();

            if (drpServiceType.SelectedItem == null && ddlServices.SelectedItem == null && dropSlotTime.SelectedItem == null)
            {
                lblStatus.Text = "Make sure you have selected the service type and time !";
            }
            #endregion

            // modalPopTimeStart.Show();

        }

        protected void setLabels()
        {


            lblTmeStep3.Text = dropSlotTime.SelectedItem.Text;
            lblDate.Text = calStep1.SelectedDate.ToShortDateString();
            lblDateStep2Display.Text = calStep1.SelectedDate.ToShortDateString();

            lblEmp.Text = ddlEmployee.SelectedItem.Text;
            lblSelectedTime.Text = dropSlotTime.SelectedItem.Text;
            lblTime.Text = "Selected time: " + TimeRangeSelectedEventHandler.Combine();

            if (ddlServices.SelectedItem != null)
            {
                lblService.Text = ddlServices.SelectedItem.Text;
            }


        }
        protected void ddlServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            #region Assign labels
            //if (Convert.ToInt32(drpServiceType.SelectedValue.ToString()) >= 0)
            //{
            //    int typeID = Convert.ToInt32(drpServiceType.SelectedValue);
            //    dtService = service.GetService(typeID);
            //}

            for (int i = 0; i < dtService.Rows.Count; i++)
            {
                if (ddlServices.SelectedValue.ToString() == dtService.Rows[i][0].ToString())
                {
                    lblStep2Duration.Text = dtService.Rows[i]["servDuration"].ToString();
                    lblMinutes.Visible = true;
                    //lblStep2Price.Text= dtService.Rows[i]["servCost"].ToString();
                    lblDuration.Text = dtService.Rows[i]["servDuration"].ToString();
                    lblPrice.Text = dtService.Rows[i]["servCost"].ToString();
                }
            }

            setLabels();

            if (drpServiceType.SelectedItem == null && ddlServices.SelectedItem == null && dropSlotTime.SelectedItem == null)
            {
                lblStatus.Text = "Make sure you have selected the service type and time !";
            }
            #endregion
        }

        protected void dropSlotTime_SelectedIndexChanged(object sender, EventArgs e)
        {


            lblMessageStep2.Visible = false;
            lblMessageStep1.Visible = false;
            dtAppointment = appointment.SelectAppointments();
            lblTmeStep3.Text = dropSlotTime.SelectedItem.Text;

            try
            {

                dtClient = client.SelectClients();

                int indexInsert = 0;
                //int clientID=0;
                string userID = User.Identity.GetUserId();

                calendar.Date = Convert.ToDateTime(calStep1.SelectedDate);
                calendar.StartTime = DateTime.Parse(calendar.Date.ToShortDateString() + " " + dropSlotTime.SelectedItem.Text);
                calendar.EndTime = DateTime.Parse(calendar.Date.ToShortDateString() + " " + dropSlotTime.SelectedItem.Text);
                calendar.EndTime = calendar.EndTime.AddMinutes(Convert.ToDouble(lblDuration.Text));
                calendar.EmpID = Convert.ToInt32(ddlEmployee.SelectedValue);
                //Set availability to false after booking
                calendar.IsAvaliable = true;
                //= Convert.ToInt32(DayPilotCalendar1.DataIdField);
                DataTable dtCal = new DataTable();
                dtCal = calendar.GetCalendarByManager(calendar);
                //??????????????????
                calendar.CalendarID = Convert.ToInt32(dtCal.Rows[0]["calendarID"]);

                appointment.CalendarID = calendar.CalendarID;
                appointment.AppointmentDate = calStep1.SelectedDate;
                appointment.Active = true;
                appointment.ServID = int.Parse(ddlServices.SelectedValue);
                appointment.SlotID = int.Parse(dropSlotTime.SelectedValue);
                appointment.UserCharID = User.Identity.GetUserId();
                appointment.StartTime = calendar.StartTime;
                appointment.EndTime = calendar.EndTime;
                appointment.EmpID = calendar.EmpID;

                //Might Delete this refenrence to use asp userCharID
                //appointment.ClientID =Convert.ToInt32( ClientID.ToString());
                dtAppointment = appointment.GetAppointmentEmpSchedule(appointment);
                indexInsert = dtAppointment.Rows.Count;
                DateTime appDate = new DateTime();
                DateTime appStartT = new DateTime();
                DateTime appEndT = new DateTime();
                int temEmpID = 0;



                //check duplicate
                bool checkDulcate = false;
                foreach (DataRow row in dtAppointment.Rows)
                {
                    lblMessageStep2.Visible = false;
                    lblMessage.Visible = false;
                    lblMessageStep1.Visible = false;


                    appDate = Convert.ToDateTime(row["appointmentDate"].ToString());
                    if (row["appStartTime"].ToString() != "")
                    {
                        appStartT = Convert.ToDateTime(row["appStartTime"].ToString());
                        appEndT = Convert.ToDateTime(row["appEndTime"].ToString());
                        temEmpID = Convert.ToInt32(row["appEmpID"]);

                    }



                    //Check Identical duplicate
                    if ((appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                        && appStartT.ToShortTimeString() == calendar.StartTime.ToShortTimeString()
                        && appEndT.ToShortTimeString() == calendar.EndTime.ToShortTimeString()
                        && temEmpID == calendar.EmpID)
                        )
                    {
                        checkDulcate = true;
                        break;
                    }//Check starttime, date and empID
                    else if (appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                    && appStartT.ToShortTimeString() == calendar.StartTime.ToShortTimeString()
                    && temEmpID == calendar.EmpID)
                    {

                        checkDulcate = true;
                        break;
                    }//Check endtime, date and empID
                    else
                    if (
                        appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                        && calendar.StartTime < appEndT
                        && calendar.EndTime > appStartT
                        && temEmpID == calendar.EmpID
                        )
                    {
                        checkDulcate = true;
                        break;
                    }
                    else
                    if (
                        appDate.ToShortDateString() == calendar.Date.ToShortDateString()
                        && calendar.StartTime > appEndT
                        && calendar.EndTime < appStartT
                        && temEmpID == calendar.EmpID
                        )
                    {
                        checkDulcate = true;
                        break;
                    }

                }

                if (checkDulcate == true)
                {
                    lblMessageStep2.Visible = true;
                    lblMessage.Visible = true;

                    lblMessageStep2.Text = "Sorry but this slot has been taken";
                    lblMessage.Text = "Sorry but this slot has been taken";
                    lblMessage.ForeColor = System.Drawing.Color.Red;

                }
                //Step 2: if true then update appointment table



            }
            catch (Exception emx)
            {
                Session["ErrorMessage"] = emx.ToString();
                Response.Redirect("~/frmError.aspx");
                //throw;
            }

            //modalPopTimeStart.Show();
        }

        protected void lstItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            //for (int i = 0; i < lstItems.SelectedIndex; i++)
            //{

            //    index = lstItems.SelectedIndex[lstItems.SelectedIndex[i];
            //    lstItems.Items.RemoveAt(index);
            //}
        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        protected void dropSaturday_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlEmployee_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void sqlStartTime_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnHelp_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("frmBookingHelp.aspx");
        }

      

    
    }


}
