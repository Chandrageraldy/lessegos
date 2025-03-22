<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="MWMAssignment.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../AuthPage/AuthPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="auth-page">
        <section>
            <div class="auth-container">
                <h2>CREATE ACCOUNT</h2>
                <div class="auth-text-field-container">
                    <p>FIRST NAME:</p>
                    <asp:TextBox runat="server" ID="firstName" class="auth-text-field" />
                </div>
                <div class="auth-text-field-container">
                    <p>LAST NAME:</p>
                    <asp:TextBox runat="server" ID="lastName" class="auth-text-field" />
                </div>
                <div class="auth-text-field-container">
                    <p>EMAIL:</p>
                    <asp:TextBox runat="server" ID="email" class="auth-text-field" />
                </div>
                <div class="auth-text-field-container">
                    <p>PASSWORD:</p>
                    <asp:TextBox runat="server" ID="password" class="auth-text-field" />
                </div>
                <asp:Button runat="server" class="auth-button" Text="CREATE ACCOUNT" />
                <a href="LoginPage.aspx">Already have an account? Sign in</a>
            </div>
        </section>
    </div>
</asp:Content>
