using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace CharityApplication.charityPages
{
    public partial class charityUserCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

                ViewState["RefUrl"] = Request.UrlReferrer.ToString();

        }
        public static string GetHash(string input)
        {
            //encrypting the password used for registration
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            //opening db to check if email has already been registered into the database and preventing registering it again.
            Boolean flag = false;
            SqlConnection charityAdmin = new SqlConnection();
            charityAdmin.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";

            if (txtPassword.Text != txtPassword2.Text)
            {
                ltMessage.Text = "<font color='red'>Passwords do not match!</font>";
            }
            else
            {



                SqlCommand cmd = charityAdmin.CreateCommand();

                string Email = txtEmail.Text;
                string charityUmbrella = string.Empty;

                try
                {
                    charityAdmin.Open();
                    cmd.CommandText = ("SELECT userEmail FROM [User]");
                    SqlDataReader reader = cmd.ExecuteReader();


                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            if (Email == reader.GetString(0))
                            {
                                flag = true;
                            }
                        }
                        charityAdmin.Close();
                    }
                }
                catch (SqlException ex)
                {

                }


            }

            if (flag == true)
            {
                ltMessage.Text = ("<font color='red> Email already exists</font>");
            }
            else
            {
                ltMessage.Text = ("");
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string postcode = txtPostCode.Text;
                int store = 1;
                string imgPath = "~/userImages/Default.jpg";
                int volunteer = 0;
                string skillset = "admin";
                int charityUmbrella = 0;

                charityAdmin.Open();

                SqlCommand adminInsert = new SqlCommand("INSERT INTO [User] ([userEmail], [userPassword], [userForename], [userSurname],[userVolunteer], [userStore],[userSkillset],[charityUmbrella], [userPostCode], [imagePath]) VALUES ('" + email + "', '" + GetHash(password) + "', '" + firstName + "', '" + lastName + "'," + volunteer + "," + store + ",'" + skillset + "'," + charityUmbrella + ",'" + postcode + "', '" + imgPath + "')", charityAdmin);
                adminInsert.ExecuteNonQuery();
                charityAdmin.Close();










            }
        }

        protected void Return_Button1(object sent, EventArgs e)
        {
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }
    }
}