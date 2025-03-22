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
                            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../Assets/shirt1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../Assets/shirt1back.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../Assets/shirt1alt1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../Assets/shirt1alt2.png" class="d-block w-100" alt="...">
                            </div>
                        </div>
                    </div>
                    <!--CAROUSEL-->
                </div>
                <div class="col-xl-6 product-details-column">
                    <h3>WHITE OVERSIZE FLEUR PEACE</h3>
                    <p class="product-price">Rp 200.000</p>
                    <div class="size-button-row">
                        <asp:Button runat="server" type="button" class="btn product-size-button" Text="S" ID="smallSizeButton" OnClick="smallSizeButton_Click" />
                        <asp:Button runat="server" type="button" class="btn product-size-button" Text="M" ID="mediumSizeButton" OnClick="mediumSizeButton_Click" />
                        <asp:Button runat="server" type="button" class="btn product-size-button" Text="L" ID="largeSizeButton" OnClick="largeSizeButton_Click" />
                        <asp:Button runat="server" type="button" class="btn product-size-button" Text="XL" ID="extraLargeSizeButton" OnClick="extraLargeSizeButton_Click" />
                    </div>
                    <p>
                        • 100% cotton short sleeve tee<br>
                        • Printed artwork on front and back<br>
                        • HUF woven label at interior neck<br>
                        • Soft and breathable fabric for all-day comfort<br>
                        • Relaxed fit for a casual streetwear look
                    </p>
                    <div class="quantity-container">
                        <p class="quantity-label">QUANTITY:</p>
                        <asp:TextBox runat="server" ID="productQuantity" class="product-quantity-text-field" TextMode="Number" Text="1"></asp:TextBox>
                    </div>

                </div>
            </div>
        </section>
    </div>
</asp:Content>
