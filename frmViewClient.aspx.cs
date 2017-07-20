using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using belabeautyBLL;
using System.Data;
namespace baleflorbeaultysalon.pageClient
{
    public partial class frmViewClient : System.Web.UI.Page
    {
        Client client = new Client();
        User_Account user = new User_Account();  
        int selectRow = 0;
        Role role = new Role();
        protected void Page_Load(object sender, EventArgs e)
        {


            ////drpRole.SelectedIndex = 0;
            ////drpRole.Items.Add(new ListItem("Select Role Type", "0"));
            //drpRole.AppendDataBoundItems = true;
            //drpRole.DataSource = role.SelectRoles();
            //drpRole.DataValueField = "roleID";
            //drpRole.DataTextField = "roleName";
            //drpRole.DataBind();
            //drpRole.Dispose();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            Response.Redirect("frmInsertClient.aspx", true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                Button btn = (Button)sender;
                string userID = btn.CommandArgument.ToString();
                Session["code"] = userID;

                if (Convert.ToInt32(userID) >= 0)
                {
                    Session["userID"] = grvViewClient.Rows[selectRow].Cells[0].Text;
                    Session["title"] = grvViewClient.Rows[selectRow].Cells[1].Text;
                    Session["firstName"] = grvViewClient.Rows[selectRow].Cells[2].Text;
                    Session["lastName"] = grvViewClient.Rows[selectRow].Cells[3].Text;
                    Session["email"] = grvViewClient.Rows[selectRow].Cells[4].Text;
                    Session["contactNo"] = grvViewClient.Rows[selectRow].Cells[5].Text;
                    Session["city"] = grvViewClient.Rows[selectRow].Cells[6].Text;
                    Session["surburb"] = grvViewClient.Rows[selectRow].Cells[7].Text;
                    Session["postalCode"] = grvViewClient.Rows[selectRow].Cells[8].Text;
                }
            }
            catch (Exception em)
            {
                Session["ErroMessage"] = em.ToString();
                Response.Redirect("~/frmError.aspx");
            }
              Response.Redirect("frmUpdateClient.aspx");
        }
        

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            btnAdd.Visible = false;
            pnlDelete.Visible = true;
            grvViewClient.Visible = false;

            Button btn = (Button)sender;

            string userID = btn.CommandArgument.ToString();
            //lbll.Text = servId.ToString();
            Session["code"] = userID;
           
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {

            try
            {
                int code = Convert.ToInt32(Session["code"]);
                user.DeleteUser_Account(code);

                grvViewClient.DataBind();
                pnlDelete.Visible = false;
                lblServName.Text = "Client deleted!";
                grvViewClient.Visible = true;
                
            }

            catch (Exception em)
            {
                Session["ErrorMessage"] = em.ToString();
                Response.Redirect("~/frmError.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmViewClient.aspx");
        }

        protected void grvViewClient_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int selectedRowIndex = 0;
            GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

            int RowIndex = gvr.RowIndex;
            selectedRowIndex = RowIndex;

            //lblID.Text = (grvViewServices.Rows[selectedRowIndex].FindControl("lblAppID") as Label).Text;
            lblServName.Text = grvViewClient.Rows[selectedRowIndex].Cells[2].Text;
        }
    }
}