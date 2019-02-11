using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DHTMLX.Scheduler.Data;


namespace CharityApplication
{
    /// <summary>
    /// Summary description for Data
    /// </summary>
    public class Data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
            SchedulerAjaxData data;
            var dc = new SchedulerDataContext();

             data = new SchedulerAjaxData(dc.Events);
           

            context.Response.ContentType = "text/json";
            context.Response.Write(data.ToString());
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}