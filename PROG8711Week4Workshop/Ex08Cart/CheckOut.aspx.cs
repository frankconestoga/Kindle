using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChigozieNweke_BookStore
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    rblContact.SelectedValue = "Email";
                    lblMessage.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading checkout: " + ex.Message;
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    return;
                }

                CartItemList.GetCart().Clear();
                ClearForm();
                lblMessage.Text = "Order Placed";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error placing order: " + ex.Message;
            }
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            try
            {
                ClearForm();
                Response.Redirect("Cart.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        private void ClearForm()
        {
            txtEmail.Text = string.Empty;
            txtEmailConfirm.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtZip.Text = string.Empty;
            ddlState.SelectedIndex = 0;

            chkNewProducts.Checked = false;
            chkNewEditions.Checked = false;
            chkSpecialOffers.Checked = false;
            chkLocalEvents.Checked = false;
            rblContact.SelectedValue = "Email";

            calDob.SelectedDates.Clear();
            calDob.VisibleDate = DateTime.Today;
        }
    }
}