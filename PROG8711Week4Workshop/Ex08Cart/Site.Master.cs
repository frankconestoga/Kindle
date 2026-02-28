using System;
using System.Web;

namespace ChigozieNweke_BookStore
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Part 3: Check session or cookie for user name
            string userName = null;

            if (Session["UserName"] != null)
            {
                userName = Session["UserName"].ToString();
            }
            else if (Request.Cookies["UserName"] != null)
            {
                userName = Request.Cookies["UserName"].Value;
            }

            if (!string.IsNullOrEmpty(userName))
            {
                lblWelcome.Text = "Hello, " + userName;
                lblWelcome.Visible = true;
            }
            else
            {
                lblWelcome.Text = "Hello, Guest";
                lblWelcome.Visible = true;
            }
        }
    }
}
