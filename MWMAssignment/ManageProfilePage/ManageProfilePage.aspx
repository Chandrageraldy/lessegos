<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageProfilePage.aspx.cs" Inherits="MWMAssignment.WebForm18" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageProfilePage/ManageProfilePage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="manage-profile-page">
        <header>
            <div class="header-container">
                <h2>MANAGE PROFILE</h2>
                <div class="logout-container">
                    <asp:Label ID="logoutWelcome" runat="server" class="logout-welcome"></asp:Label>
                    <p class="logout-seperator">|</p>
                    <asp:LinkButton runat="server" CssClass="logout-button" ID="logout" OnClick="logout_Click" Text="Logout"></asp:LinkButton>
                </div>
            </div>
        </header>

        <section>
            <div class="account-details-container">
                <h3>Account Details</h3>
                <div class="row">
                    <div class="col-xl-12 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">USERNAME:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="userName" ErrorMessage="* must be at least 8 characters" CssClass="validation-message" ValidationExpression="^.{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="userName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="userName" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">FIRST NAME:</p>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="firstName" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">LAST NAME:</p>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="lastName" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">EMAIL:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="email" ErrorMessage="* enter a valid email address" CssClass="validation-message" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="email" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="email" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">PASSWORD:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="password" ErrorMessage="* must be at least 8 characters" CssClass="validation-message" ValidationExpression="^.{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="password" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-12 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">ADDRESS:</p>
                        </div>
                        <asp:TextBox runat="server" ID="address" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">POST CODE:</p>
                        </div>
                        <asp:TextBox runat="server" ID="postCode" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">PHONE NUMBER:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="phoneNumber" ErrorMessage="* enter a valid phone number" CssClass="validation-message" ValidationExpression="^\+?[0-9]{7,15}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <asp:TextBox runat="server" ID="phoneNumber" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-12 text-field-container">
                        <asp:Button runat="server" class="update-profile-button" Text="Update Profile" ID="updateProfileButton" OnClick="updateProfileButton_Click" />
                        <asp:Label runat="server" ID="errorMessage" CssClass="error-message">Email already exists. Please use a different email.</asp:Label>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="order-history-container">
                <h3>Order History</h3>
            </div>
        </section>
    </div>
</asp:Content>
