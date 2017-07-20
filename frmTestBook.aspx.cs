using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Telerik.Web.UI;

namespace baleflorbeaultysalon.Booking
{
    public partial class frmTestBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void Page_PreRender(object sender, EventArgs e)
        //{
        //    RadWizard1.NavigationBarPosition = (RadWizardNavigationBarPosition)Enum.Parse(typeof(RadWizardNavigationBarPosition), NavigationBarPosition.SelectedValue);
        //    RadWizard1.ProgressBarPosition = (RadWizardProgressBarPosition)Enum.Parse(typeof(RadWizardProgressBarPosition), ProgressBarPosition.SelectedValue);
        //}



        //protected void PopulatePosition(string selectedPosition, RadDropDownList dropDownList)
        //{
        //    if (selectedPosition == "Top" || selectedPosition == "Bottom")
        //    {
        //        dropDownList.Items.Clear();
        //        dropDownList.Items.Add(new DropDownListItem() { Text = "Top", Value = "Top" });
        //        dropDownList.Items.Add(new DropDownListItem() { Text = "Bottom", Value = "Bottom" });
        //    }
        //    else
        //    {
        //        dropDownList.Items.Clear();
        //        dropDownList.Items.Add(new DropDownListItem() { Text = "Left", Value = "Left" });
        //        dropDownList.Items.Add(new DropDownListItem() { Text = "Right", Value = "Right" });
        //    }
        //}

        //protected void NavigationBarPosition_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        //{
        //    PopulatePosition(e.Value, ProgressBarPosition);
        //}
    }
}