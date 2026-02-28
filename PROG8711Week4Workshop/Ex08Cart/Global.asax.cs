using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ChigozieNweke_BookStore
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            AppDomain.CurrentDomain.SetData("DataDirectory",
                System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Models"));
        }
    }
}