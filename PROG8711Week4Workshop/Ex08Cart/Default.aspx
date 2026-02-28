Inherits="ChigozieNweke_BookStore.Default"

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kindle - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Your one-stop shop for books of all genres." />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron text-center">
        <h1 class="bookstore-title">Welcome to Kindle</h1>
        <p class="bookstore-tagline">Your Gateway to Literary Adventures</p>
    </header>
    
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Default.aspx">Home</a></li>
                <li><a href="Products.aspx">Products</a></li>
                <li><a href="Cart.aspx">Cart</a></li>
            </ul>
        </div>
    </nav>
    
    <main>
        <form id="form1" runat="server">
            <div class="row">
                <div class="col-sm-12">
                    <div class="welcome-section">
                        <h2>Discover Your Next Great Read</h2>
                        <p class="lead">Browse our extensive collection of books across multiple genres. From timeless classics to contemporary bestsellers, find the perfect book for every moment.</p>
                        
                        <div class="home-features">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="feature-box">
                                        <h3>Wide Selection</h3>
                                        <p>Explore books across multiple genres including Fiction, Mystery, Science Fiction, Romance, and more.</p>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="feature-box">
                                        <h3>Easy Shopping</h3>
                                        <p>Browse, add to cart, and checkout with our simple and intuitive shopping experience.</p>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="feature-box">
                                        <h3>Secure Checkout</h3>
                                        <p>Your information is safe with our secure checkout process.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="text-center home-actions">
                            <asp:Button ID="btnBrowseProducts" runat="server" Text="Browse Products" 
                                PostBackUrl="~/Products.aspx" CssClass="btn btn-primary btn-lg" />
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
