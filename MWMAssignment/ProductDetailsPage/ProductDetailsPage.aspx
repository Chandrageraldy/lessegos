<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetailsPage.aspx.cs" Inherits="MWMAssignment.WebForm8" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ProductDetailsPage/ProductDetailsPage.css" rel="stylesheet" />
    <script>
        function showToast() {
            const alertToast = document.getElementById('alertToast');
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(alertToast);
            toastBootstrap.show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
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

                <!--TOAST-->
                <div class="toast-container position-fixed bottom-0 end-0 p-3">
                    <div id="alertToast" class="toast alert-toast" role="alert">
                        <div class="d-flex">
                            <div class="toast-body">
                                Product has been added to your cart
                            </div>
                            <button type="button" class="btn-close btn-close-black me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
                <!--TOAST-->

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
                        <asp:TextBox runat="server" ID="selectedQuantity" class="selected-quantity-text-field" TextMode="Number" Text="1" Min="1" Max=""></asp:TextBox>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button runat="server" class="add-to-cart-button" Text="ADD TO CART" OnClick="addToCartButton_Click" ID="addToCartButton" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="review-row">
                        <div></div>
                        <button type="button" class="btn add-review-modal-button" data-bs-toggle="modal" data-bs-target="#addReviewModal">
                            + Add Review
                        </button>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div runat="server" id="productReviewContainer" class="product-review-container">
                <h2>Product Review</h2>
                <asp:Repeater ID="rptReviews" runat="server">
                    <ItemTemplate>
                        <div class="user-review-container">
                            <asp:Label runat="server" ID="user" class="user" Text='<%# Eval("userName") %>'>></asp:Label>
                            <asp:Label runat="server" ID="review" class="review" Text='<%# Eval("review") %>'>></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>

        <!-- MODAL -->
        <div class="modal fade" id="addReviewModal" tabindex="-1" aria-labelledby="addReviewModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-body">
                        <h3>ADD PRODUCT REVIEW</h3>
                        <div class="title-text-field-container">
                            <div class="title-row">
                                <p class="text-field-title">REVIEW:</p>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="review" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic" ValidationGroup="reviewValidation"></asp:RequiredFieldValidator>
                            </div>
                            <asp:TextBox runat="server" ID="review" placeholder="" class="text-field" TextMode="MultiLine" ValidationGroup="reviewValidation"/>
                        </div>
                        <asp:Button runat="server" class="add-review-button" Text="Add Product Review" ID="addReviewButton" OnClick="addReviewButton_Click" ValidationGroup="reviewValidation"/>
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL -->
    </div>
</asp:Content>
