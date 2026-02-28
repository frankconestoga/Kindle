<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ChigozieNweke_BookStore.Products" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kindle - Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron text-center">
        <h1 class="bookstore-title">Kindle</h1>
        <p class="bookstore-tagline">Your Gateway to Literary Adventures</p>
    </header>
    
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="Default.aspx">Home</a></li>
                <li class="active"><a href="Products.aspx">Products</a></li>
                <li><a href="Cart.aspx">Cart</a></li>
            </ul>
        </div>
    </nav>
    
    <main>
        <form id="form1" runat="server" class="form-horizontal">

            <div class="row">
                <div class="col-sm-8">
                    <h2>Browse Our Collection</h2>
                    
                    <div class="form-group">
                        <label class="col-sm-5">Please select a product:</label>
                        <div class="col-sm-7">
                            <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="Title" 
                                DataValueField="BookID" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString='<%$ ConnectionStrings:BookStoreConnection %>'
                                SelectCommand="SELECT [BookID], [Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear] FROM [Books] ORDER BY [Title]">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    
                    <div class="product-details">
                        <div class="form-group">
                            <div class="col-sm-12"><h3><asp:Label ID="lblTitle" runat="server" CssClass="book-title"></asp:Label></h3></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12"><strong>Author:</strong> <asp:Label ID="lblAuthor" runat="server"></asp:Label></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12"><strong>Genre:</strong> <asp:Label ID="lblGenre" runat="server"></asp:Label></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12"><asp:Label ID="lblShortDescription" runat="server" CssClass="text-muted"></asp:Label></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12"><asp:Label ID="lblLongDescription" runat="server"></asp:Label></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12"><strong>ISBN:</strong> <asp:Label ID="lblISBN" runat="server"></asp:Label></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12"><strong>Publication Year:</strong> <asp:Label ID="lblPublicationYear" runat="server"></asp:Label></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12"><asp:Label ID="lblPrice" runat="server" CssClass="book-price"></asp:Label></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-4">
                    <div class="product-image-container">
                        <asp:Image ID="imgProduct" runat="server" CssClass="img-responsive book-cover" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Quantity:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtQuantity" runat="server" 
                                CssClass="form-control" Text="1"></asp:TextBox>
                        </div>
                        <div class="col-sm-7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                                runat="server" ControlToValidate="txtQuantity" Display="Dynamic" 
                                ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" 
                                ControlToValidate="txtQuantity" Display="Dynamic" 
                                ErrorMessage="Quantity must range from 1 to 100."
                                MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" 
                                onclick="btnAdd_Click" CssClass="btn btn-primary btn-lg" />
                            <asp:Button ID="btnCart" runat="server" Text="Go to Cart" 
                                PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn btn-success btn-lg" />
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </main>
    
    <footer class="text-center">
        <p>&copy; 2025 Kindle. All rights reserved.</p>
    </footer>

</div>
</body>
</html>
