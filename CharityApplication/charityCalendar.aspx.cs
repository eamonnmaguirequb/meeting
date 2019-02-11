using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web.UI.DataVisualization;
using DHTMLX.Scheduler;
using System.Web.Security;
using System.Security.Cryptography;

namespace CharityApplication
{
    public partial class charityCalendar : System.Web.UI.Page
    {
        public DHXScheduler Scheduler { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Scheduler = new DHXScheduler();





            Scheduler.Config.first_hour = 8;
            Scheduler.Config.last_hour = 19;
            Scheduler.Config.time_step = 30;
            Scheduler.Config.limit_time_select = true;

            Scheduler.DataAction = this.ResolveUrl("~/Data.ashx");
            Scheduler.SaveAction = this.ResolveUrl("~/Save.ashx");
            Scheduler.EnableDataprocessor = true;


            if (!Page.IsPostBack)
            {
                string eventconn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(eventconn);
                string sqlquery = "SELECT * FROM [User]";
                SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
                sqlconn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                StringBuilder sb = new StringBuilder();
                sb.Append("<table>");
                sb.Append("<tr>");
                for (int i = 0; i < dt.Columns.Count; i++)
                    sb.Append("<td>" + dt.Columns[i].ColumnName + "</td>");
                sb.Append("</tr>");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sb.Append("<tr>");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        sb.Append("<td>" + dt.Rows[i][j].ToString() + "</td>");
                        sb.Append("</tr>");
                    }
                    sb.Append("</table>");

                }



            }

          

        }
        public static string ConvertDataTableToHTML(DataTable dt)
        {
            string html = "<table>";
            //add header row
            html += "<tr>";
            for (int i = 0; i < dt.Columns.Count; i++)
                html += "<td>" + dt.Columns[i].ColumnName + "</td>";
            html += "</tr>";
            //add rows
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                html += "<tr>";
                for (int j = 0; j < dt.Columns.Count; j++)
                    html += "<td>" + dt.Rows[i][j].ToString() + "</td>";
                html += "</tr>";
            }
            html += "</table>";
            return html;
        }
    }

}