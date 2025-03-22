<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="LoginAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../AuthAdminPage/AuthAdminPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auth-page">
        <section>
            <div class="auth-container">
                <h2>ADMIN LOGIN</h2>
                <div class="auth-text-field-container">
                    <p>EMAIL:</p>
                    <asp:TextBox runat="server" ID="email" placeholder="E-mail" class="auth-text-field" />
                </div>
                <div class="auth-text-field-container">
                    <p>PASSWORD:</p>
                    <asp:TextBox runat="server" ID="password" placeholder="Password" class="auth-text-field" />
                </div>
                <asp:Button runat="server" class="auth-button" Text="SIGN IN" />
            </div>
        </section>
    </div>
</asp:Content>
