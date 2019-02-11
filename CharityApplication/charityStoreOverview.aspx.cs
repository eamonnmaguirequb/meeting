using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;
using System.Configuration;

namespace CharityApplication
{
    public partial class charityStoreOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection usercheckcon = new SqlConnection();
            usercheckcon.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";
            SqlCommand cmd = usercheckcon.CreateCommand();

            string username = string.Empty;
            string location = string.Empty;
            string signIn = Context.User.Identity.Name;

            usercheckcon.Open();
            cmd.CommandText = ("SELECT [charityName],[charityLocation] FROM [Charity] where charityOrganiser='" + signIn + "'");
            SqlDataReader reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    username = reader.GetString(0);
                    location = reader.GetString(1);
                }
                usercheckcon.Close();
            }





            userLoggedIn.Text = username;
            userLocation.Text = location;





            GetChartData();

            sqlImage.SelectParameters["charityStore"].DefaultValue = Context.User.Identity.Name;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object[] GetChartData()
        {
            List<GoogleChartData> data = new List<GoogleChartData>();
            //Here MyDatabaseEntities  is our dbContext
            using (charitySQLEntities1 dc = new charitySQLEntities1())
            {
                data = dc.GoogleChartDatas.ToList();
            }

            var chartData = new object[data.Count + 1];
            chartData[0] = new object[]{
                    "Product Category",
                    "Revenue Amount"
                };
            int j = 0;
            foreach (var i in data)
            {
                j++;
                chartData[j] = new object[] { i.ProductCategory, i.RevenueAmount };
            }

            return chartData;
        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }
    }
}
