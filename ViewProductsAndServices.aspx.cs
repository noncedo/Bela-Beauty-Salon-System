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
    public partial class ViewProductsAndServices : System.Web.UI.Page
    {


        //Service serv;
        ServiceType servType = new ServiceType();
        protected void Page_Load(object sender, EventArgs e)
        {


            //ddlServType.SelectedIndex = 0;
            //ddlServType.Items.Add(new ListItem("All",""));
            //ddlServType.DataSource = servType.SelectServiceTypes();
            //ddlServType.DataBind();
            //ddlServType.Enabled = false;

            if (!IsPostBack)
            {
                ddlServType.SelectedIndex = 0;
                ddlServType.Items.Add(new ListItem("All","99"));
                ddlServType.AppendDataBoundItems = true;
                ddlServType.DataSource = servType.SelectServiceTypes();
                ddlServType.DataValueField = "servTypeID";
                ddlServType.DataTextField = "servTypeName";
                ddlServType.DataBind();
                ddlServType.Dispose();

            }


            dlData.ItemStyle.HorizontalAlign = HorizontalAlign.Left;

            //try
            //{
                if (!IsPostBack)
                {
                    // listView.DataBind();
                    CurrentPageIndex = 0;



                }


                int pg = 0;
                {
                    PagedDataSource pgd = new PagedDataSource();

                    //pgd.DataSource = sqlService;

                    pgd.CurrentPageIndex = pgd.CurrentPageIndex;
                    pgd.AllowPaging = true;
                    pgd.PageSize = 8;


                    //lnkButton1.Enabled = !(pgd.IsLastPage);
                    //lnkButton2.Enabled = !(pgd.IsFirstPage);

                //  dlData.DataSource = pgd;


                pg++;
                }
            }
            
         public int CurrentPageIndex
        {
            get
            {
                if (ViewState["pg"] == null)
                    return 0;
                else
                    return Convert.ToInt16(ViewState["pg"]);
            }
            set
            {
                ViewState["pg"] = value;
            }

       
            //catch (Exception eMsg)
            //{
            //    Session["ErrorMessage"] = eMsg.ToString();
            //    Response.Redirect("~/frmError.apsx");
            //    //throw;
            //}


            

        }

       

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {

                Response.Redirect("~/pageBooking/frmAddBooking.aspx",false);
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx",false);
            }
        }

        //protected void ddlServType_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Service serv = new Service();
        //    DataTable dt = new DataTable();
        //    int servCode = Convert.ToInt32(ddlServType.SelectedValue);
        //    dt = serv.GetByServiceType(servCode);
        //    dlData.DataSource = dt;
        //    dlData.DataBind();
        //}

        //protected void lnkButton1_Click(object sender, EventArgs e)
        //{
        //    CurrentPageIndex++;
        //}

        //protected void lnkButton2_Click(object sender, EventArgs e)
        //{
        //    CurrentPageIndex--;
        //}
    }
}