using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization;

using System.Web.UI.WebControls;

namespace CharityApplication.charityPages
{
    public partial class charityOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

              SqlConnection usercheckcon = new SqlConnection();
              usercheckcon.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";
               SqlCommand cmd = usercheckcon.CreateCommand();

              string username = string.Empty;
            string signIn = Context.User.Identity.Name;

                usercheckcon.Open();
                    cmd.CommandText = ("SELECT charityOrganisation FROM [CharityOrganisation] where charityContact='" + signIn + "'");
                   SqlDataReader reader = cmd.ExecuteReader();


                   if (reader.HasRows)
                   {
                      while (reader.Read())
                      {
                      username = reader.GetString(0);
                      }
                     usercheckcon.Close();
                   }

            //string userName = Context.User.Identity.Name;

            userLoggedIn.Text = username;

            sqlImage.SelectParameters["charityAdmin"].DefaultValue = Context.User.Identity.Name;
           
        }

    }
}