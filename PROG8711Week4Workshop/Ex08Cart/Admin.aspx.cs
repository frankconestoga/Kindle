using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ChigozieNweke_BookStore
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null && Request.Cookies["UserName"] == null)
            {
                Response.Redirect("~/Login");
                return;
            }

            if (!IsPostBack && gvBooks.Rows.Count > 0)
            {
                gvBooks.SelectedIndex = 0;
            }
        }

        protected void btnAddGenre_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BookStoreConnection"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Genre (GenreName, Description) VALUES (@GenreName, @Description)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@GenreName", txtNewGenreName.Text.Trim());
                        command.Parameters.AddWithValue("@Description", txtNewGenreDescription.Text.Trim());

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                txtNewGenreName.Text = string.Empty;
                txtNewGenreDescription.Text = string.Empty;

                ddlGenres.DataBind();
                dlBooksByGenre.DataBind();
                gvGenreAdmin.DataBind();

                lblAdminMessage.Text = "Genre added successfully.";
            }
            catch (Exception ex)
            {
                lblAdminMessage.Text = "Error adding genre: " + ex.Message;
            }
        }
    }
}
