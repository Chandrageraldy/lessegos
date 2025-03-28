<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="EditCategoryAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm16" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../EditCategoryAdminPage/EditCategoryAdminPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit-category-page">
        <!-- HEADER -->
        <section>
            <div class="header-container row">
                <div class="col-xl-6 col-6 p-0">
                    <h2>EDIT CATEGORY</h2>
                </div>
            </div>
        </section>
        <!-- HEADER -->

        <section>
            <div class="edit-category-container">
                <div class="text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">CATEGORY NAME:</p>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="categoryName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox runat="server" ID="categoryName" placeholder="" class="text-field" />
                </div>
                <div class="image-upload-container">
                    <div class="title-row">
                        <p class="text-field-title">IMAGE:</p>
                    </div>
                    <div class="upload-image-row">
                        <asp:FileUpload runat="server" class="form-control" ID="categoryImage" />
                        <asp:Image runat="server" ID="currentCategoryImage" CssClass="current-category-image" />
                    </div>
                </div>
                <asp:Button runat="server" class="edit-category-button" Text="Edit Category" ID="editCategoryButton" OnClick="editCategoryButton_Click" />
            </div>
        </section>
    </div>
</asp:Content>
