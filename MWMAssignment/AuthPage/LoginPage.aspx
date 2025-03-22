<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="MWMAssignment.WebForm2" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../AuthPage/AuthPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="auth-page">
        <section>
            <div class="auth-container">
                <h2>LOGIN</h2>
                <div class="auth-error-message-container" runat="server" id="authErrorMessageContainer">
                    <asp:Label runat="server" ID="authErrorMessage" CssClass="auth-error">AUTH ERROR</asp:Label>
                </div>
                <div class="auth-text-field-container">
                    <p>EMAIL:</p>
                    <asp:TextBox runat="server" ID="email" placeholder="E-mail" class="auth-text-field" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="email" ErrorMessage="Please enter a valid email address" CssClass="validation-message" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="email" ErrorMessage="Email is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="auth-text-field-container">
                    <p>PASSWORD:</p>
                    <asp:TextBox runat="server" ID="password" placeholder="Password" class="auth-text-field" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="password" ErrorMessage="Password must be at least 8 characters long" CssClass="validation-message" ValidationExpression="^.{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="Password is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:Button runat="server" class="auth-button" Text="SIGN IN" ID="loginButton" OnClick="loginButton_Click" />
                <a href="RegistrationPage.aspx">New customer? Create an account</a>
            </div>
        </section>
    </div>
</asp:Content>
