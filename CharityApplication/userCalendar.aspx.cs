using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DHTMLX.Scheduler;
using System.Data.SqlClient;
using System.Web.Security;
using System.Text;
using System.Security.Cryptography;

namespace CharityApplication
{
    public partial class userCalendar : System.Web.UI.Page
    {
        public DHXScheduler Scheduler { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Scheduler = new DHXScheduler();


 

            string user = Context.User.Identity.Name;
            

            Scheduler.Config.first_hour = 8;
            Scheduler.Config.last_hour = 19;
            Scheduler.Config.time_step = 30;
            Scheduler.Config.limit_time_select = true;



            Scheduler.DataAction = this.ResolveUrl("~/Data.ashx?" + user);
            Scheduler.SaveAction = this.ResolveUrl("~/Save.ashx" + user);
            Scheduler.EnableDataprocessor = true;

           








        }
    }
}
