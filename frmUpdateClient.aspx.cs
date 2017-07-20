using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using belabeautyBLL;

namespace baleflorbeaultysalon.pageClient
{
    public partial class frmUpdateClient : System.Web.UI.Page
    {
        Client client = new Client();
        User_Account user = new User_Account();
        Role role = new Role();
        string userID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                drpRole.SelectedIndex = 0;
                drpRole.DataSource = role.SelectRoles();
                drpRole.DataValueField = "roleID";
                drpRole.DataTextField = "roleName";
                drpRole.DataBind();
                drpRole.Dispose();

                drpRole.Enabled = false;
                drpTitle.SelectedIndex = 0;


                try
                {
                    if (Session["userID"] != null)
                    {


                        userID = (string)Session["userID"].ToString();
                        drpTitle.SelectedItem.Text = (string)Session["title"].ToString();
                        txtName.Text = (string)Session["firstName"].ToString();
                        txtLastName.Text = (string)Session["lastName"].ToString();
                        txtEmail.Text = (string)Session["email"].ToString();
                        txtContact.Text = (string)Session["contactNo"].ToString();
                        txtCity.Text = (string)Session["city"].ToString();
                        txtSuburb.Text = (string)Session["surburb"].ToString();
                        txtPostalCode.Text = (string)Session["postalCode"].ToString();

                    }
                }

                catch (Exception em)
                {
                    Session["ErrorMessage"] = em.ToString();
                    Response.Redirect("~/frmError.aspx");

                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmViewClient.aspx");
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    userID = Session["code"].ToString();
            //    Session["title"] = drpTitle.SelectedItem.ToString();
            //    Session["firstName"] = txtName.Text;
            //    Session["lastName"] = txtLastName.Text;
            //    Session["email"] = txtEmail.Text;
            //    Session["contactNo"] = txtContact.Text;
            //    Session["city"] = txtCity.Text;
            //    Session["suburb"] = txtSuburb.Text;
            //    Session["postalCode"] = txtPostalCode.Text;




            //    user.RoleID = Convert.ToInt32(userID);
            //    user.Title = drpTitle.SelectedItem.ToString();
            //    user.FirstName = txtName.Text;
            //    user.LastName = txtLastName.Text;
            //    user.Email = txtEmail.Text;
            //    user.ContactNo = txtContact.Text;
            //    user.City = txtCity.Text;
            //    user.Surburb = txtSuburb.Text;
            //    user.PostalCode = txtPostalCode.Text;


            //}
            //catch (Exception em)
            //{
            //    Session["ErrorMessage"] = em.ToString();
            //    Response.Redirect("~/frmError.aspx");

            //}


            //client.UpdateUserClientByManager(user);
            //{
            //    Response.Redirect("frmViewClient.aspx");
            //}

        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {

            try
            {
                //if (Page.IsValid)
                //{
                    userID = Session["code"].ToString();

                    Session["title"] = drpTitle.SelectedItem.ToString();
                    Session["firstName"] = txtName.Text;
                    Session["lastName"] = txtLastName.Text;
                    Session["email"] = txtEmail.Text;
                    Session["contactNo"] = txtContact.Text;
                    Session["city"] = txtCity.Text;
                    Session["suburb"] = txtSuburb.Text;
                    Session["postalCode"] = txtPostalCode.Text;


                    user.UserID = Convert.ToInt32(userID);
                    user.Title = drpTitle.SelectedItem.ToString();
                    user.FirstName = txtName.Text;
                    user.LastName = txtLastName.Text;
                    user.Email = txtEmail.Text;
                    user.ContactNo = txtContact.Text;
                    user.City = txtCity.Text;
                    user.Surburb = txtSuburb.Text;
                    user.PostalCode = txtPostalCode.Text;


                    if (user.UpdateUserClientByManager(user))
                    {
                        Response.Redirect("frmViewClient.aspx", false);
                    }
                    else
                    {
                        Page.Validate();
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                        lblStatus.Text = "Not updated!";
                    
                    
                }
            }
            catch (Exception em)
            {
                Session["ErrorMessage"] = em.ToString();
                Response.Redirect("~/frmError.aspx");

            }



        }
    }
}