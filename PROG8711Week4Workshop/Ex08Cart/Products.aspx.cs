using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChigozieNweke_BookStore
{
    public partial class Products : System.Web.UI.Page
    {
        private Book selectedBook;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ddlProducts.DataBind();
                }
                
                selectedBook = this.GetSelectedBook();
                lblTitle.Text = selectedBook.Title;
                lblAuthor.Text = selectedBook.Author;
                lblGenre.Text = selectedBook.Genre;
                lblShortDescription.Text = selectedBook.ShortDescription;
                lblLongDescription.Text = selectedBook.LongDescription;
                lblPrice.Text = selectedBook.Price.ToString("c") + " each";
                lblISBN.Text = selectedBook.ISBN;
                lblPublicationYear.Text = selectedBook.PublicationYear.ToString();

                string imagePath = "Images/Books/" + selectedBook.ImageFile;
                if (System.IO.File.Exists(Server.MapPath(imagePath)))
                {
                    imgProduct.ImageUrl = imagePath;
                }
                else
                {
                    imgProduct.ImageUrl = "Images/Books/placeholder.png";
                }
            }
            catch (Exception ex)
            {
                lblTitle.Text = "Error loading product: " + ex.Message;
            }
        }

        private Book GetSelectedBook()
        {
            DataView booksTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            booksTable.RowFilter = "BookID = '" + ddlProducts.SelectedValue + "'";
            DataRowView row = booksTable[0];

            Book book = new Book();
            book.BookID = row["BookID"].ToString();
            book.Title = row["Title"].ToString();
            book.Author = row["Author"].ToString();
            book.Genre = row["Genre"].ToString();
            book.ShortDescription = row["ShortDescription"].ToString();
            book.LongDescription = row["LongDescription"].ToString();
            book.Price = (decimal)row["Price"];
            book.ISBN = row["ISBN"].ToString();
            book.ImageFile = row["ImageFile"].ToString();
            book.PublicationYear = Convert.ToInt32(row["PublicationYear"]);
            
            return book;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    CartItemList cart = CartItemList.GetCart();
                    CartItem cartItem = cart[selectedBook.BookID];

                    if (cartItem == null)
                    {
                        cart.AddItem(selectedBook, Convert.ToInt32(txtQuantity.Text));
                    }
                    else
                    {
                        cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                    }
                    Response.Redirect("~/Cart");
                }
            }
            catch (Exception ex)
            {
                lblTitle.Text = "Error adding to cart: " + ex.Message;
            }
        }
    }
}
