<%@ Page Title="Kindle - Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ChigozieNweke_BookStore.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
</asp:Content>
