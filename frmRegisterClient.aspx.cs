using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using belabeautyBLL;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Drawing.Imaging;
using belabeautyDAL;

namespace baleflorbeaultysalon.pageClient
{
    
    public partial class frmRegisterClient : System.Web.UI.Page
    {

        Client client = new Client();
        ClientType clientType = new ClientType();
        User_Account user = new User_Account();
        Role role = new Role();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                drpClientType.Items.Add(new ListItem("Select Client Type", "1"));
                drpClientType.AppendDataBoundItems = true;
                drpClientType.DataSource = clientType.SelectClientTypes();
                drpClientType.DataValueField = "clientTypeID";
                drpClientType.DataTextField = "clientDesc";
                drpClientType.DataBind();
                drpClientType.Dispose();
            }


        }

        private string Encrypt(string password)
        {
            // Source: http://www.dotnetfunda.com/forums/show/16822/decrypt-password-in-aspnet

            string strmsg = string.Empty;
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            strmsg = Convert.ToBase64String(encode);
            return strmsg;
        }



        protected void Register_Click(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            User_Account userAcc = new User_Account();

            client.ClientTypeID = Convert.ToInt32(drpClientType.SelectedValue);
            user.Title = drpTitle.SelectedItem.Text;
            userAcc.UserName = txtUsername.Text;
            userAcc.Password = txtPassword.Text;
            userAcc.ConfirmPassword = txtConfirmPassword.Text;
            userAcc.FirstName = txtFirstName.Text;
            userAcc.LastName = txtLastName.Text;
            //user.DateOfBirth = DateTime.Today.Date;
            userAcc.City = txtCity.Text;
            userAcc.Surburb = txtSuburb.Text;
            userAcc.PostalCode = txtPostalCode.Text;
            userAcc.Email = txtEmail.Text;
            userAcc.ContactNo = txtContactNo.Text;
            //userAcc.PhotoPath = txt


            userAcc.InsertUserClientByManager(userAcc);

            //dt = userAcc.SelectUser_Accounts();

            //client.UserID = Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["userID"]);
            //client.FirstName = txtEmployeeName.Text;
            //client.LastName = txtLastName.Text;
            //client.Email = txtEmployeeEmail.Text;
            //client.EmpTypeID = Convert.ToInt32(drpEmployeeType.SelectedValue);
            //client.EmpHireDate = DateTime.Today.Date;


            //Code source: Stack Overflow

            if (flUploadPic.HasFile == false)
            {

                lblStatus.Text = "Please select file to upload";
            }
            else
            {

                //save file 
                string filePath = Server.MapPath("~/Images/" + flUploadPic.FileName);
                flUploadPic.SaveAs(filePath);

                user.PhotoPath = "~/Images/" + flUploadPic.FileName;


                if (user.InsertUser_Account(user))
                {
                    Response.Redirect("frmViewServices.aspx");
                }

                
                txtUsername.Text = "";
                txtPassword.Text = "";
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtSuburb.Text = "";
                txtCity.Text = "";
                txtPostalCode.Text = "";
                txtEmail.Text = "";
               // txtBirthDay.Text = "";
                txtContactNo.Text = "";

                try
                {

                }
                catch (Exception)
                {

                }

                if (Page.IsValid)
                {
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    lblStatus.Text = "Data saved successfully!";
                }
                else
                {
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblStatus.Text = "Validation Failed! Data not saved.";
                };


                if (user.InsertUser_Account())
                {
                    Response.Redirect("frmViewClients.aspx");
                }



            }

        }

       
       
    }
}