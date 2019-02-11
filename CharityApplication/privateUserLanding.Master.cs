using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Text;
using System.Security.Cryptography;

namespace CharityApplication
{
    public partial class privateUserLanding : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HiddenField1_ValueChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int oxfam = 0;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";
            SqlCommand cmd = con.CreateCommand();

            con.Open();

            SqlCommand cmd2 = new SqlCommand("select * from [CharityOrganisation] where charityOrganisation = 'Oxfam Ireland'", con);
            cmd2.ExecuteNonQuery();
            SqlDataReader login = cmd2.ExecuteReader();


            if (login.HasRows)
            {
                while (login.Read())
                {
                    oxfam = login.GetInt32(0);


                }
                con.Close();
                Response.Redirect("charityStoreOverview.aspx?charityID="  + oxfam);
            }
        }
    }
  }
