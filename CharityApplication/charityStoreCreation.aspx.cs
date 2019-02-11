using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization;

namespace CharityApplication.charityPages
{
    public partial class charityStoreCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection charityStore = new SqlConnection();
            charityStore.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";
            SqlCommand charityRetreive = charityStore.CreateCommand();

            string charityName = string.Empty;

            charityStore.Open();



            charityRetreive.CommandText = ("SELECT [charityOrganisation] FROM [CharityOrganisation] WHERE [charityContact] ='" + Context.User.Identity.Name) + "'";
            SqlDataReader reader = charityRetreive.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    charityName = reader.GetString(0);
                }
                charityStore.Close();

            }






            //setting variables based on input and user logged in
            string storeEmail = txtStoreEmail.Text;
            string charitystoreLocation = txtstoreLocation.Text;

            charityStore.Open();
            SqlCommand storeInsert = new SqlCommand("INSERT INTO [Charity] ([charityOrganiser], [charityName], [charityLocation]) VALUES ( '" + storeEmail + "', '" + charityName + "', '" + charitystoreLocation + "')", charityStore);
            storeInsert.ExecuteNonQuery();
            charityStore.Close();

            Response.Redirect("charityStoreOverview.aspx");
        }
    }
}