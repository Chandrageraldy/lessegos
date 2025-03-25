<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="CreateProductAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm13" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CreateProductAdminPage/CreateProductAdminPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="create-product-page">
        <!-- HEADER -->
        <section>
            <div class="header-container row">
                <div class="col-xl-6 col-6 p-0">
                    <h2>CREATE PRODUCT</h2>
                </div>
            </div>
        </section>
        <!-- HEADER -->

        <section>
            <div class="create-product-container">
                <div class="title-desc-category-text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">PRODUCT NAME:</p>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="productName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox runat="server" ID="productName" placeholder="" class="text-field" />
                </div>
                <div class="title-desc-category-text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">PRODUCT DESCRIPTION:</p>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="productDesc" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox runat="server" ID="productDesc" placeholder="" class="text-field-multiline" TextMode="MultiLine" />
                </div>
                <div class="title-desc-category-text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">PRODUCT PRICE:</p>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="productPrice" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="productPrice" ValidationExpression="^\d+$" ErrorMessage="* enter a valid price" CssClass="validation-message" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <asp:TextBox runat="server" ID="productPrice" placeholder="" class="text-field" />
                </div>
                <div class="row">
                    <div class="image-upload-container col-xl-6">
                        <div class="title-row">
                            <p class="text-field-title">FRONT:</p>
                        </div>
                        <asp:FileUpload runat="server" class="form-control" ID="productFrontImage" />
                    </div>
                    <div class="image-upload-container col-xl-6">
                        <div class="title-row">
                            <p class="text-field-title">BACK:</p>
                        </div>
                        <asp:FileUpload runat="server" class="form-control" ID="productBackImage" />
                    </div>
                    <div class="image-upload-container col-xl-6">
                        <div class="title-row">
                            <p class="text-field-title">ALT1:</p>
                        </div>
                        <asp:FileUpload runat="server" class="form-control" ID="productAlt1Image" />
                    </div>
                    <div class="image-upload-container col-xl-6">
                        <div class="title-row">
                            <p class="text-field-title">ALT2:</p>
                        </div>
                        <asp:FileUpload runat="server" class="form-control" ID="productAlt2Image" />
                    </div>
                </div>
                <div class="quantity-text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">QUANTITY</p>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="productSSizeQuantity" ErrorMessage="* S required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="productMSizeQuantity" ErrorMessage="* M required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="productLSizeQuantity" ErrorMessage="* L required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="productXLSizeQuantity" ErrorMessage="* XL required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="quantity-text-field-row row">
                        <div class="col-xl-6">
                            <asp:TextBox runat="server" ID="productSSizeQuantity" placeholder="S" class="text-field" TextMode="Number" />
                        </div>
                        <div class="col-xl-6">
                            <asp:TextBox runat="server" ID="productMSizeQuantity" placeholder="M" class="text-field" TextMode="Number" />
                        </div>
                        <div class="col-xl-6">
                            <asp:TextBox runat="server" ID="productLSizeQuantity" placeholder="L" class="text-field" TextMode="Number" />
                        </div>
                        <div class="col-xl-6">
                            <asp:TextBox runat="server" ID="productXLSizeQuantity" placeholder="XL" class="text-field" TextMode="Number" />
                        </div>
                    </div>
                </div>
                <div class="title-desc-category-text-field-container">
                    <div class="title-row">
                        <p class="text-field-title">CATEGORY:</p>
                    </div>
                    <asp:DropDownList runat="server" class="category-dropdown" ID="categoryDropdown"></asp:DropDownList>
                </div>
                <asp:Button runat="server" class="create-product-button" Text="Create Product" ID="createProductButton" OnClick="createProductButton_Click" />
                <asp:Label runat="server" ID="imageValidationMessage" CssClass="validation-message">* Upload front and back product image to proceed</asp:Label>
            </div>
        </section>
    </div>
</asp:Content>
