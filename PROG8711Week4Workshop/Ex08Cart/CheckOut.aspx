<%@ Page Title="Kindle - Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="ChigozieNweke_BookStore.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">

        <h1>Checkout</h1>

        <asp:ValidationSummary ID="vsCheckout" runat="server" CssClass="validation-summary" 
            HeaderText="Please correct the following errors:" />

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>

        <div class="checkout-section">
            <h3>Contact Information</h3>

            <div class="form-group">
                <label class="control-label col-sm-2">Email Address:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ErrorMessage="Email address" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" CssClass="text-danger" Display="Dynamic"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Must be a valid email address"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Email Re-entry:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtEmailConfirm" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvEmailConfirm" runat="server" 
                        ErrorMessage="Email re-entry" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmailConfirm"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvEmailMatch" runat="server" 
                        ControlToCompare="txtEmail" ControlToValidate="txtEmailConfirm" 
                        CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Must match first email address"></asp:CompareValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">First Name:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ErrorMessage="First name is required" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Last Name:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ErrorMessage="Last name is required" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Phone Number:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                        ErrorMessage="Phone number" Text="Phone number is required." CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                        ControlToValidate="txtPhone" CssClass="text-danger" Display="Dynamic"
                        ValidationExpression="^\d{3}-\d{3}-\d{4}$"
                        ErrorMessage="Use this format: 123-456-7890"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Date of Birth:</label>
                <div class="col-sm-10">
                    <asp:Calendar ID="calDob" runat="server"></asp:Calendar>
                </div>
            </div>
        </div>

        <div class="checkout-section">
            <h3>Billing Address</h3>

            <div class="form-group">
                <label class="control-label col-sm-2">Address:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                        ErrorMessage="Address is required" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">City:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                        ErrorMessage="City is required" Text="City is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">State:</label>
                <div class="col-sm-4">
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Select State --" Value=""></asp:ListItem>
                        <asp:ListItem>CA</asp:ListItem>
                        <asp:ListItem>FL</asp:ListItem>
                        <asp:ListItem>IL</asp:ListItem>
                        <asp:ListItem>NY</asp:ListItem>
                        <asp:ListItem>TX</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                        ErrorMessage="Billing state" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="ddlState" InitialValue=""></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Zip Code:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                        ErrorMessage="Zip code is required" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revZip" runat="server" 
                        ControlToValidate="txtZip" CssClass="text-danger" Display="Dynamic"
                        ValidationExpression="^\d{5}(-\d{4})?$"
                        ErrorMessage="Enter a valid zip code"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>

        <div class="checkout-section">
            <h3>Optional Data</h3>

            <div class="form-group">
                <label class="control-label col-sm-2">Interests:</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><asp:CheckBox ID="chkNewProducts" runat="server" /> New products</label>
                    </div>
                    <div class="checkbox">
                        <label><asp:CheckBox ID="chkNewEditions" runat="server" /> New editions</label>
                    </div>
                    <div class="checkbox">
                        <label><asp:CheckBox ID="chkSpecialOffers" runat="server" /> Special offers</label>
                    </div>
                    <div class="checkbox">
                        <label><asp:CheckBox ID="chkLocalEvents" runat="server" /> Local events</label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Please contact me via:</label>
                <div class="col-sm-10">
                    <asp:RadioButtonList ID="rblContact" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Twitter</asp:ListItem>
                        <asp:ListItem>Facebook</asp:ListItem>
                        <asp:ListItem>Text message</asp:ListItem>
                        <asp:ListItem Selected="True">Email</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12">
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" 
                    CssClass="btn btn-success btn-lg" onclick="btnPlaceOrder_Click" />
                <asp:Button ID="btnCancelOrder" runat="server" Text="Go back to Cart" 
                    CssClass="btn btn-warning btn-lg" CausesValidation="False" 
                    onclick="btnCancelOrder_Click" />
                <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" 
                    CssClass="btn btn-primary btn-lg" CausesValidation="False" 
                    onclick="btnContinueShopping_Click" />
            </div>
        </div>

    </div>
</asp:Content>
