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

namespace CharityApplication.unrestrictedPages
{
    public partial class regPage : System.Web.UI.Page
    {
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
            if (txtPassword.Text != txtPassword2.Text)
            {
                ltMessage.Text = "<font color='red'>Passwords do not match!</font>";
            }
            else
            {


                //opening db to check if email has already been registered into the database and preventing registering it again.
                Boolean flag = false;
                SqlConnection usercheckcon = new SqlConnection();
                usercheckcon.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";
                SqlCommand cmd = usercheckcon.CreateCommand();
                usercheckcon.Open();

                try
                {
                    cmd.CommandText = ("SELECT userEmail FROM [User]");
                    SqlDataReader reader = cmd.ExecuteReader();
                    string Email = txtEmail.Text;

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            if (Email == reader.GetString(0))
                            {
                                flag = true;
                            }
                        }
                        usercheckcon.Close();
                    }
                }
                catch (SqlException ex)
                {

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
                    string skillSet = txtSkillSet.Text;
                    string postcode = txtPostCode.Text;
                    int volunteer = 1;
                    int store = 0;
                    int charityumbrella = 0;
                    string imgPath = "~/Images/Default.jpg";




                            usercheckcon.Open();
                            SqlCommand cmd2 = new SqlCommand("INSERT INTO [User] ([userEmail], [userPassword], [userForename], [userSurname], [userVolunteer], [userStore], [userSkillSet], [userPostCode], [imagePath],[charityUmbrella]) VALUES ('" + email + "', '" + GetHash(password) + "', '" + firstName + "', '" + lastName + "'," + volunteer + "," + store + ",'" + skillSet + "','" + postcode + "', '" + imgPath + "'," + charityumbrella + ")", usercheckcon);
                            cmd2.ExecuteNonQuery();
                            usercheckcon.Close();



                    Response.Redirect("loginPage.aspx");









                }
            }
        }
    }
}