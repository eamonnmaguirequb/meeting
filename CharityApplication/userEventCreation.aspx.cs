using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CharityApplication
{
    public partial class userEventCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection charityEvent = new SqlConnection();
            charityEvent.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";


            Boolean flag = false;

            try
            {
                string eventname = eventName.Text;
                string startdate = eventStartDate.Text;
                string enddate = eventEndDate.Text;
                string eventdesc = eventDesc.Text;
                string eventloc = eventLocation.Text;
                string eventmanager = Context.User.Identity.Name;

                DateTime start = DateTime.Parse(startdate);
                DateTime end = DateTime.Parse(enddate);
                double totalDays = (end - start).TotalDays;
                string eventLeader = Context.User.Identity.Name;
                bool dateFlag = false;

                //checking that end date is after start
                charityEvent.Open();
                SqlCommand cmd3 = new SqlCommand("select * from [CharityEvent] where eventManagement='" + eventmanager + "'", charityEvent);
                cmd3.ExecuteNonQuery();
                SqlDataReader reader2 = cmd3.ExecuteReader();

                if (reader2.HasRows)
                {
                    while (reader2.Read())
                    {
                        DateTime checkStartDate = reader2.GetDateTime(4);
                        DateTime checkEndDate = reader2.GetDateTime(4);

                        if ((start <= checkEndDate) && (end >= checkStartDate))
                        {
                            dateFlag = true;
                        }
                    }
                }
                charityEvent.Close();
                if (start > end)
                {
                    ltMessage.Text = "<font color='red'>End Date Cannot be before start date</font>";
                    charityEvent.Close();
                }
                else if (dateFlag == true)

                {
                    ltMessage.Text = "<font color='red'>Another sprint in this project clashes with chosen dates</font>";
                    charityEvent.Close();
                }
                else if (totalDays > 30)
                {
                    ltMessage.Text = "<font color='red'>You are about to create a sprint of over 30 days. Please confirm you are happy to proceed</font>";
                    charityEvent.Close();
                    btnConfirm.Visible = true;
                    btnNo.Visible = true;
                    btnSubmit.Visible = false;
                    eventStartDate.Enabled = false;
                    eventEndDate.Enabled = false;
                    eventDesc.Enabled = false;
                }
                else
                {


                    charityEvent.Close();


                    charityEvent.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO [CharityEvent] ([eventManagement], [eventName], [eventStartDate], [eventEndDate], [eventDescription], [eventLocation]) VALUES ('" + eventLeader + "', '" + eventname + "', '" + startdate + "','" + enddate + "', '" + eventdesc + "','" + eventloc + "')", charityEvent);
                    cmd.ExecuteNonQuery();
                    charityEvent.Close();
                    Response.Redirect("charityStoreOverview.aspx");
                }
            }
            catch (SqlException ex)
            {
                ltMessage.Text = ("<font color='red'>Error Detected</font>" + ex);

            }

        }


        protected void btnConfirm_Click(object sender, EventArgs e)
        {
        string eventname = eventName.Text;
        string startdate = eventStartDate.Text;
        string enddate = eventEndDate.Text;
        string eventdesc = eventDesc.Text;
        string eventloc = eventLocation.Text;
        string eventmanager = Context.User.Identity.Name;

        DateTime start = DateTime.Parse(startdate);
        DateTime end = DateTime.Parse(enddate);
        double totalDays = (end - start).TotalDays;
        string eventLeader = Context.User.Identity.Name;



        SqlConnection charityEvent = new SqlConnection();
            charityEvent.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\charitySQL.mdf;Integrated Security=True";


            SqlCommand cmd = new SqlCommand("INSERT INTO [CharityEvent] ([eventManagement], [eventName], [eventStartDate], [eventEndDate], [eventDescription], [eventLocation]) VALUES ('" + eventLeader + "', '" + eventname + "', '" + startdate + "','" + enddate + "', '" + eventdesc + "','" + eventloc + "')", charityEvent);
            cmd.ExecuteNonQuery();
            charityEvent.Close();
            Response.Redirect("charityStoreOverview.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            btnConfirm.Visible = false;
            btnNo.Visible = false;
            btnSubmit.Visible = true;
            ltMessage.Text = "";
        }
    }
}

