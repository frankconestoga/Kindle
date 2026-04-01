<%@ Page Title="Kindle - Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ChigozieNweke_BookStore.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <h1>Bookstore Administration</h1>

        <div class="checkout-section">
            <h3>Browse Books by Genre</h3>

            <div class="form-group">
                <label class="control-label col-sm-2">Genre:</label>
                <div class="col-sm-4">
                    <asp:DropDownList ID="ddlGenres" runat="server" CssClass="form-control"
                        DataSourceID="sdsGenres" DataTextField="GenreName" DataValueField="GenreName"
                        AutoPostBack="True">
                    </asp:DropDownList>
                </div>
            </div>

            <asp:DataList ID="dlBooksByGenre" runat="server" DataSourceID="sdsBooksByGenre" RepeatColumns="2" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="feature-box" style="margin-right:15px;">
                        <h4><%# Eval("Title") %></h4>
                        <p><strong>Author:</strong> <%# Eval("Author") %></p>
                        <p><strong>Price:</strong> <%# Eval("Price", "{0:c}") %></p>
                        <p><%# Eval("ShortDescription") %></p>
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource ID="sdsGenres" runat="server"
                ConnectionString="<%$ ConnectionStrings:BookStoreConnection %>"
                SelectCommand="SELECT [GenreID], [GenreName], [Description] FROM [Genre] ORDER BY [GenreName]">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="sdsBooksByGenre" runat="server"
                ConnectionString="<%$ ConnectionStrings:BookStoreConnection %>"
                SelectCommand="SELECT [BookID], [Title], [Author], [Price], [ShortDescription] FROM [Books] WHERE [Genre] = @Genre ORDER BY [Title]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlGenres" Name="Genre" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div class="checkout-section">
            <h3>Genre Maintenance</h3>

            <asp:GridView ID="gvGenreAdmin" runat="server" CssClass="table table-striped table-bordered"
                AutoGenerateColumns="False" DataKeyNames="GenreID" DataSourceID="sdsGenreAdmin">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <asp:BoundField DataField="GenreID" HeaderText="GenreID" ReadOnly="True" SortExpression="GenreID" />
                    <asp:BoundField DataField="GenreName" HeaderText="Genre Name" SortExpression="GenreName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="sdsGenreAdmin" runat="server"
                ConnectionString="<%$ ConnectionStrings:BookStoreConnection %>"
                SelectCommand="SELECT [GenreID], [GenreName], [Description] FROM [Genre] ORDER BY [GenreName]"
                UpdateCommand="UPDATE [Genre] SET [GenreName] = @GenreName, [Description] = @Description WHERE [GenreID] = @GenreID"
                DeleteCommand="DELETE FROM [Genre] WHERE [GenreID] = @GenreID">
                <DeleteParameters>
                    <asp:Parameter Name="GenreID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="GenreName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="GenreID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <h4>Add New Genre</h4>
            <div class="form-group">
                <label class="control-label col-sm-2">Genre Name:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNewGenreName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvNewGenreName" runat="server" ControlToValidate="txtNewGenreName"
                        CssClass="text-danger" ErrorMessage="Genre name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Description:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNewGenreDescription" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnAddGenre" runat="server" CssClass="btn btn-primary" Text="Add Genre" OnClick="btnAddGenre_Click" />
                    <asp:Label ID="lblAdminMessage" runat="server" CssClass="text-info" style="margin-left:10px;"></asp:Label>
                </div>
            </div>
        </div>

        <div class="checkout-section">
            <h3>Book Maintenance</h3>

            <asp:GridView ID="gvBooks" runat="server" CssClass="table table-striped table-bordered"
                AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="sdsBooksGrid"
                AllowSorting="True" AllowPaging="True" PageSize="10">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" SortExpression="BookID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="PublicationYear" HeaderText="Publication Year" SortExpression="PublicationYear" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="sdsBooksGrid" runat="server"
                ConnectionString="<%$ ConnectionStrings:BookStoreConnection %>"
                SelectCommand="SELECT [BookID], [Title], [Author], [Genre], [Price], [PublicationYear] FROM [Books] ORDER BY [Title]">
            </asp:SqlDataSource>

            <h4>Selected Book Details</h4>
            <asp:DetailsView ID="dvBookDetails" runat="server" CssClass="table table-bordered"
                AutoGenerateRows="False" DataKeyNames="BookID" DataSourceID="sdsBookDetails" DefaultMode="ReadOnly">
                <Fields>
                    <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                    <asp:BoundField DataField="ShortDescription" HeaderText="Short Description" SortExpression="ShortDescription" />
                    <asp:BoundField DataField="LongDescription" HeaderText="Long Description" SortExpression="LongDescription" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                    <asp:BoundField DataField="ImageFile" HeaderText="Image File" SortExpression="ImageFile" />
                    <asp:BoundField DataField="PublicationYear" HeaderText="Publication Year" SortExpression="PublicationYear" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

            <asp:SqlDataSource ID="sdsBookDetails" runat="server"
                ConnectionString="<%$ ConnectionStrings:BookStoreConnection %>"
                SelectCommand="SELECT [BookID], [Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear] FROM [Books] WHERE [BookID] = @BookID"
                InsertCommand="INSERT INTO [Books] ([Title], [Author], [Genre], [ShortDescription], [LongDescription], [Price], [ISBN], [ImageFile], [PublicationYear]) VALUES (@Title, @Author, @Genre, @ShortDescription, @LongDescription, @Price, @ISBN, @ImageFile, @PublicationYear)"
                UpdateCommand="UPDATE [Books] SET [Title] = @Title, [Author] = @Author, [Genre] = @Genre, [ShortDescription] = @ShortDescription, [LongDescription] = @LongDescription, [Price] = @Price, [ISBN] = @ISBN, [ImageFile] = @ImageFile, [PublicationYear] = @PublicationYear WHERE [BookID] = @BookID"
                DeleteCommand="DELETE FROM [Books] WHERE [BookID] = @BookID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvBooks" Name="BookID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="BookID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Author" Type="String" />
                    <asp:Parameter Name="Genre" Type="String" />
                    <asp:Parameter Name="ShortDescription" Type="String" />
                    <asp:Parameter Name="LongDescription" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ISBN" Type="String" />
                    <asp:Parameter Name="ImageFile" Type="String" />
                    <asp:Parameter Name="PublicationYear" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Author" Type="String" />
                    <asp:Parameter Name="Genre" Type="String" />
                    <asp:Parameter Name="ShortDescription" Type="String" />
                    <asp:Parameter Name="LongDescription" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ISBN" Type="String" />
                    <asp:Parameter Name="ImageFile" Type="String" />
                    <asp:Parameter Name="PublicationYear" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
