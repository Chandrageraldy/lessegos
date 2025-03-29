<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="EditUserAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm17" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../EditUserAdminPage/EditUserAdminPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit-user-page">
        <!-- HEADER -->
        <section>
            <div class="header-container row">
                <div class="col-xl-6 col-6 p-0">
                    <h2>EDIT USER</h2>
                </div>
            </div>
        </section>
        <!-- HEADER -->

        <section>
            <div class="edit-user-container">
                <div class="text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">FIRST NAME:</p>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox runat="server" ID="firstName" placeholder="" class="text-field" />
                </div>
                <div class="text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">LAST NAME:</p>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox runat="server" ID="lastName" placeholder="" class="text-field" />
                </div>
                <div class="text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">USER NAME:</p>
                    </div>
                    <asp:TextBox runat="server" ID="userName" placeholder="" class="text-field" ReadOnly="true" />
                </div>
                <div class="text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">EMAIL:</p>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="email" ErrorMessage="* enter a valid email address" CssClass="validation-message" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="email" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox runat="server" ID="email" placeholder="" class="text-field" />
                </div>
                <div class="text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">PASSWORD:</p>
                    </div>
                    <asp:TextBox runat="server" ID="password" Text="********" class="text-field" ReadOnly="true" />
                </div>
                <asp:Button runat="server" class="edit-user-button" Text="Edit User" ID="editUserButton" OnClick="editUserButton_Click" />
                <asp:Label runat="server" ID="errorMessage" CssClass="error-message">Email already exists. Please use a different email.</asp:Label>
            </div>
        </section>
    </div>
</asp:Content>
