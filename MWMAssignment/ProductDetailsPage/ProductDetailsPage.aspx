<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetailsPage.aspx.cs" Inherits="MWMAssignment.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ProductDetailsPage/ProductDetailsPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="product-details-page">
        <section>
            <div class="main-container row">
                <div class="col-xl-6 text-center product-image-column">
                    <!--CAROUSEL-->
                    <div id="productCarousel" class="carousel slide carousel-dark" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <asp:Button runat="server" ID="alt1Button" type="button" data-bs-target="#productCarousel" data-bs-slide-to="2" aria-label="Slide 3"></asp:Button>
                            <asp:Button runat="server" ID="alt2Button" type="button" data-bs-target="#productCarousel" data-bs-slide-to="3" aria-label="Slide 4"></asp:Button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <asp:Image runat="server" ID="productFrontImage" class="d-block w-100" />
                            </div>
                            <div class="carousel-item">
                                <asp:Image runat="server" ID="productBackImage" class="d-block w-100" />
                            </div>
                            <div runat="server" class="carousel-item" id="alt1Container">
                                <asp:Image runat="server" ID="productAlt1Image" class="d-block w-100" />
                            </div>
                            <div runat="server" class="carousel-item" id="alt2Container">
                                <asp:Image runat="server" ID="productAlt2Image" class="d-block w-100" />
                            </div>
                        </div>
                    </div>
                    <!--CAROUSEL-->
                </div>
                <div class="col-xl-6 product-details-column">
                    <asp:Label runat="server" Text="WHITE OVERSIZE FLEUR PEACE" ID="productName" CssClass="product-name"></asp:Label>
                    <asp:Label runat="server" Text="Rp 200.000" class="product-price" ID="productPrice"></asp:Label>
                    <div class="size-dropdown-container">
                        <p class="select-size-label">SELECT SIZE:</p>
                        <asp:DropDownList runat="server" ID="sizeDropdown" AutoPostBack="true" class="size-dropdown-button" OnSelectedIndexChanged="sizeDropdown_SelectedIndexChanged">
                            <asp:ListItem Text="S" Value="S"></asp:ListItem>
                            <asp:ListItem Text="M" Value="M"></asp:ListItem>
                            <asp:ListItem Text="L" Value="L"></asp:ListItem>
                            <asp:ListItem Text="XL" Value="XL"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label runat="server" class="product-remaining-label" ID="productSSizeQuantity"></asp:Label>
                        <asp:Label runat="server" class="product-remaining-label" ID="productMSizeQuantity"></asp:Label>
                        <asp:Label runat="server" class="product-remaining-label" ID="productLSizeQuantity"></asp:Label>
                        <asp:Label runat="server" class="product-remaining-label" ID="productXLSizeQuantity"></asp:Label>
                    </div>
                    <asp:Label runat="server" ID="productDesc"></asp:Label>
                    <div class="quantity-container">
                        <p class="quantity-label">QUANTITY:</p>
                        <asp:TextBox runat="server" ID="selectedQuantity" class="selected-quantity-text-field" TextMode="Number" Text="1"></asp:TextBox>
                        <asp:Label runat="server" class="validation-message" ID="validationMessage" Text="Select a valid quantity"></asp:Label>
                    </div>
                    <asp:Button runat="server" class="add-to-cart-button" Text="ADD TO CART" OnClick="addToCartButton_Click" ID="addToCartButton" />
                </div>
            </div>
        </section>
    </div>
</asp:Content>
