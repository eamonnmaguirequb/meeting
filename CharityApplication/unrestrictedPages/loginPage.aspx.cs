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
    public partial class loginPage : System.Web.UI.Page
    {
        public static string GetHash(string input)
        {
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }

        public static Boolean checkForSQLInjection(string userInput)

        {

            bool isSQLInjection = false;
            //Checking common characters used for SQL Injection and preventing its use.
            string[] sqlCheckList = { "--", ";--", ";", "/*", "*/", "@@", "char", "nchar", "varchar", "nvarchar", "alter", "begin", "cast", "create","cursor","declare", "delete", "drop", "end","exec", "execute", "fetch",
                                        "insert", "kill", "select", "sys", "sysobjects","syscolumns", "table", "update" };

            string CheckString = userInput.Replace("'", "''");

            //loop to check variables against user input
            for (int i = 0; i <= sqlCheckList.Length - 1; i++)
            {

                if ((CheckString.IndexOf(sqlCheckList[i], StringComparison.OrdinalIgnoreCase) >= 0))
                {
                    isSQLInjection = true;
                }
            }

            return isSQLInjection;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void lginsubmit_Click1(object sender, EventArgs e)
        {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";
        SqlCommand cmd = con.CreateCommand();


        string userName = txtEmail.Text.ToLower();
        string userPassword = GetHash(txtPassword.Text);
        int volunteer = 1;
        int charityumbrella = 0;
        int store = 0;

        bool isSQLInjection = checkForSQLInjection(userName);

        if (isSQLInjection == true)
        {
            Response.Write("Please Enter the correct Username and Password");
        }
        else
        {

            try
            {
                con.Open();

                SqlCommand cmd2 = new SqlCommand("select * from [User] where userEmail='" + userName + "'AND userPassword='" + userPassword + "'", con);
                cmd2.ExecuteNonQuery();
                SqlDataReader login = cmd2.ExecuteReader();


                if (login.HasRows)
                {
                    while (login.Read())
                    {
                        if ((userName == login.GetString(1)) && (userPassword == login.GetString(2)) && (volunteer == login.GetInt32(5)) && (charityumbrella == login.GetInt32(11)) && (store == login.GetInt32(6)))
                        {
                            FormsAuthentication.SetAuthCookie(userName, true);
                            Response.Redirect("../charityUserOverview.aspx");
                        }


                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
    }
}