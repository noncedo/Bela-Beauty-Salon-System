using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Data;


namespace baleflorbeaultysalon.pageClient
{

    public partial class frmLoginClient : System.Web.UI.Page
    {
      
        private string Decrypt(string encryptpwd)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
            int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptpwd = new String(decoded_char);
            return decryptpwd;

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            drpRole.SelectedIndex =2;
            drpRole.Enabled = false;



            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                txtUserName.Text = Request.Cookies["UserName"].Value;
                txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
            }

        }

        protected void LoginClient_Click(object sender, EventArgs e)
        {


            string constr = ConfigurationManager.ConnectionStrings["Encompass_SolutionsConnectionString"].ConnectionString;

            DataTable table = new DataTable();
            string query = "uspLoginUserAccounts";
            //int result = 0;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = query;

                    cmd.Parameters.AddWithValue("@roleID", drpRole.SelectedValue);
                    cmd.Parameters.AddWithValue("@userName", txtUserName.Text);
                    cmd.Parameters.AddWithValue("@password",(txtPassword.Text.Trim()));

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        //result = cmd.ExecuteNonQuery();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }


            if (table.Rows.Count > 0)
            {

                if (drpRole.SelectedItem.Text == "Manager")
                {
                    Response.Redirect("~/MANAGER/frmMaintainManager.aspx");

                    Session["userID"] = table.Rows[0]["userID"].ToString();
                    Session["userName"] = table.Rows[0]["useName"].ToString();
                    Session["roleID"] = table.Rows[0]["roleID"].ToString();


                }
                //else if (drpRole.SelectedItem.Text == "Client")
                //{
                //    Session["userID"] = table.Rows[0]["userID"].ToString();
                //    Session["userName"] = table.Rows[0]["userName"].ToString();
                //    Session["roleID"] = table.Rows[0]["roleID"].ToString();


                //    Response.Redirect("~/pageBooking/frmAddBooking.aspx");

                //}
                //else
                //    if (drpRole.SelectedItem.Text == "Employee")
                //{
                //    Session["userID"] = table.Rows[0]["userID"].ToString();
                //    Session["userName"] = table.Rows[0]["userName"].ToString();
                //    Session["roleID"] = table.Rows[0]["roleID"].ToString();
                //}
                else
                {
                    //lblStatus.Text = "Your details dont match please make sure that the username,password and role are correct.";
                    lblStatus.Text = "Invalid login!,Please try again.";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }

            }
                if (RememberMe.Checked)
                {
                    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                }
                Response.Cookies["UserName"].Value = txtUserName.Text.Trim();
                Response.Cookies["Password"].Value = txtPassword.Text.Trim();

            }

        }
    }
