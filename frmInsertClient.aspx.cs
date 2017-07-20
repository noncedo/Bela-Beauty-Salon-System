using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using belabeautyBLL;
using belabeautyDAL;
using System.Data;
using System.Drawing;

namespace baleflorbeaultysalon.pageClient
{
    public partial class frmInsertClient : System.Web.UI.Page
    {
       
        Client client = new Client();
        User_Account user = new User_Account();
        Role role = new Role();
        DataTable dtClients = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpCity.SelectedIndex = 0;
                drpCity.Items.Add(new ListItem("Select city", "0"));
                drpCity.AppendDataBoundItems = true;

                drpRole.SelectedIndex = 0;
                drpRole.DataSource = role.SelectRoles();
                drpRole.DataValueField = "roleID";
                drpRole.DataTextField = "roleName";
                drpRole.DataBind();
                drpRole.Dispose();
               
            }

            if (IsPostBack)
            {
              
            }
          
            drpRole.Enabled = false;
            
                   
            //string dateString = @"20/05/2012";

            //user.DateOfBirth = Convert.ToDateTime(txtBirthDay.ToString());
           
            
        }
      
        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblStatus.Visible = false;
            
            try
            {
                user.Title = drpTitle.SelectedItem.Text;

                //user.Title = drpTitle.SelectedValue.ToString();
                user.FirstName = txtName.Text;
                user.LastName = txtLastName.Text;
                user.Email = txtEmail.Text;
                user.ContactNo = txtContact.Text;
                //user.City = txtCity.Text;
                //user.Surburb = txtSurburb.Text;
                user.City = drpCity.SelectedItem.Text;
                user.Surburb = drpSuburb.SelectedItem.Text;
                user.PostalCode = txtPostalCode.Text;
                user.RoleID = Convert.ToInt32(drpRole.SelectedValue);
                //user.DateOfBirth = DateTime.Today.Date;
                user.Active = Convert.ToBoolean(1);
                dtClients = user.SelectUser_Accounts();
                string firstname = txtName.Text;



                 bool checkDup = false;
                {
                    foreach (DataRow row in dtClients.Rows)
                    {
                        if (row["firstName"].ToString() != "")
                        {
                            firstname = row["firstName"].ToString();

                            if (firstname.ToString() == user.FirstName)
                            {

                                checkDup = true;
                                break;
                            }
                               
                                if (checkDup == true)
                                {
                                    lblStatus.Visible = true;
                                    lblStatus.Text = "Client name already exists,Please enter a new service name";
                                }
                                //checking duplicate records

                                else
                                {
                                    lblStatus.Visible = false;
                                }
                            }

                        }
                        

                        //if (txtName.Text == null && txtLastName.Text == null && txtEmail.Text == null && txtContact.Text == null && txtCity.Text == null && txtSurburb.Text == null && txtPostalCode.Text == null & drpTitle.SelectedIndex == 0)
                        //{
                        //    lblRequired.Visible = true;
                        //    lblRequired.ForeColor = Color.Bisque;
                        //    lbl
                        //}



                        if (checkDup == false)

                        {

                            user.InsertUserClientByManager(user);

                            Response.Redirect("~/pageClient/frmViewClient.aspx", false);
                        }

                    }
                
                    
             }
            catch (Exception emx)
            {
                Session["ErrorMessage"] = emx.ToString();
                Response.Redirect("~/frmError.aspx");
                throw;
            }
            Response.Redirect("frmViewClient.aspx");
        }
            

        protected void btnCancel_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("frmViewClient.aspx",false);
        }
    }
}