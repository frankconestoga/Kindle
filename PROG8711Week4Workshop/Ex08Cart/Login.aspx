<%@ Page Title="Kindle - Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ChigozieNweke_BookStore.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">

        <h1>Login</h1>

        <div class="checkout-section">
            <h3>Enter Your Information</h3>

            <div class="form-group">
                <label class="control-label col-sm-3">First Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ErrorMessage="First name is required" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Last Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ErrorMessage="Last name is required" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-5">
                    <div class="checkbox">
                        <label>
                            <asp:CheckBox ID="chkRememberMe" runat="server" /> Remember Me
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-5">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" 
                        CssClass="btn btn-primary btn-lg" OnClick="btnLogin_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                        CssClass="btn btn-default btn-lg" CausesValidation="False" 
                        OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>
