<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="MWMAssignment.WebForm1" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../AuthPage/AuthPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="auth-page">
        <section>
            <div class="auth-container">
                <h2>CREATE ACCOUNT</h2>
                <div class="auth-error-message-container" runat="server" id="authErrorMessageContainer">
                    <asp:Label runat="server" ID="authErrorMessage" CssClass="auth-error">AUTH ERROR</asp:Label>
                </div>
                <div class="auth-text-field-container">
                    <p>FIRST NAME:</p>
                    <asp:TextBox runat="server" ID="firstName" placeholder="First Name" class="auth-text-field" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="First name is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="auth-text-field-container">
                    <p>LAST NAME:</p>
                    <asp:TextBox runat="server" ID="lastName" placeholder="Last Name" class="auth-text-field" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="Last name is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="auth-text-field-container">
                    <p>USERNAME:</p>
                    <asp:TextBox runat="server" ID="userName" placeholder="Username" class="auth-text-field" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="userName" ErrorMessage="Username must be at least 8 characters long" CssClass="validation-message" ValidationExpression="^.{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="userName" ErrorMessage="Username is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="auth-text-field-container">
                    <p>EMAIL:</p>
                    <asp:TextBox runat="server" ID="email" placeholder="E-mail" class="auth-text-field" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="email" ErrorMessage="Please enter a valid email address" CssClass="validation-message" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="email" ErrorMessage="Email is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="auth-text-field-container">
                    <p>PASSWORD:</p>
                    <asp:TextBox runat="server" ID="password" placeholder="Password" class="auth-text-field" TextMode="Password"/>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="password" ErrorMessage="Password must be at least 8 characters long" CssClass="validation-message" ValidationExpression="^.{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="Password is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:Button runat="server" class="auth-button" Text="CREATE ACCOUNT" ID="createAccountButton" OnClick="createAccountButton_Click" />
                <a href="LoginPage.aspx">Already have an account? Sign in</a>
            </div>
        </section>
    </div>
</asp:Content>
