using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityApplication
{
    public partial class CharityStoreActive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCharityStore.SelectParameters["charityStore"].DefaultValue = Context.User.Identity.Name;
        }

        protected void GridViewCharity_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {

                //Converting the select argument to int 
                int index = Convert.ToInt32(e.CommandArgument);

                //Grabbing the row selected and passing projectID variable
                GridViewRow row = GridViewCharity.Rows[index];
                string charityID = Server.HtmlDecode(row.Cells[0].Text);


                Response.Redirect("CharityStoreOverview.aspx?charityID=" + charityID);
            }
        }
    }
}