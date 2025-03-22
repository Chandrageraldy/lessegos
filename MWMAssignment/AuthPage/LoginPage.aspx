<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="MWMAssignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../AuthPage/AuthPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="auth-page">
        <section>
            <div class="auth-container">
                <h2>LOGIN</h2>
                <div class="auth-text-field-container">
                    <p>EMAIL:</p>
                    <asp:TextBox runat="server" ID="email" placeholder="E-mail" class="auth-text-field" />
                </div>
                <div class="auth-text-field-container">
                    <p>PASSWORD:</p>
                    <asp:TextBox runat="server" ID="password" placeholder="Password" class="auth-text-field" />
                </div>
                <asp:Button runat="server" class="auth-button" Text="SIGN IN" />
                <a href="RegistrationPage.aspx">New customer? Create an account</a>
            </div>
        </section>
    </div>
</asp:Content>
