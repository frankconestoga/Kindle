<%@ Page Title="Kindle - Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ChigozieNweke_BookStore.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                            PostBackUrl="~/Products"
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>
