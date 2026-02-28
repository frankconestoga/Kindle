using System;
using System.Web;

namespace ChigozieNweke_BookStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtFirstName.Text.Trim() + " " + txtLastName.Text.Trim();

            if (chkRememberMe.Checked)
            {
                // Store in persistent cookie with 1 week expiry
                HttpCookie cookie = new HttpCookie("UserName", userName);
                cookie.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(cookie);
            }
            else
            {
                // Store in session variable
                Session["UserName"] = userName;
            }

            Response.Redirect("~/Products");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default");
        }
    }
}
