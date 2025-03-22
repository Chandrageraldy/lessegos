<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="MWMAssignment.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../HomePage/HomePage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="home-page">
        <header>
            <div class="header-container row">
                <div class="col-xl-5 column">
                    <div class="header-content-container">
                        <p class="caption">LESSEGOS CLOTHING</p>
                        <h1 class="title">WELCOME TO LESSEGOS</h1>
                        <p class="description">An Indonesian streetwear storytelling brand that pays homage to the culture, nostalgia, and everyday experiences of growing up in Indonesia.</p>
                        <button class="shop-now-button">SHOP NOW</button>
                    </div>
                </div>
                <div class="col-xl-7 column">
                    <img src="../Assets/homeHeader.jpg" alt="home-header-image" class="home-header-image" />
                </div>
            </div>
        </header>
        <section>
            <div class="middle-container">
                <img src="../Assets/homeMiddle.png" alt="home-middle-image" class="home-middle-image" />
                <div class="middle-content-container">
                    <p class="caption">NEW COLLECTION</p>
                    <h1 class="title">PLEASURE CLUB</h1>
                    <p class="description">A tribute to indulgence, freedom, and self-expression. Inspired by Indonesia’s vibrant underground culture, this collection embodies the thrill of living unapologetically. Welcome to the club.</p>
                    <button class="shop-now-button">SHOP NOW</button>
                </div>
            </div>
        </section>
        <section class="best-seller-section">
            <h2 class="best-seller-title">BEST SELLERS  </h2>
            <div class="best-seller-container row">
                <div class="col-xl-3 col-md-3 col-6 best-seller-col">
                    <img src="../Assets/shirt1.png" alt="Shirt 1" class="item" />
                    <p class="item-name">White Oversize Fleur Peace</p>
                    <p class="item-price">Rp 250.000</p>
                </div>
                <div class="col-xl-3 col-md-3 col-6 best-seller-col">
                    <img src="../Assets/shirt3.png" alt="Shirt 2" class="item" />

                    <p class="item-name">Black Boxy True Friends</p>
                    <p class="item-price">Rp 250.000</p>
                </div>
                <div class="col-xl-3 col-md-3 col-6 best-seller-col">
                    <img src="../Assets/shirt2.png" alt="Shirt 3" class="item" />
                    <p class="item-name">White Oversize Asesino Craneo</p>
                    <p class="item-price">Rp 250.000</p>
                </div>
                <div class="col-xl-3 col-md-3 col-6 best-seller-col">
                    <img src="../Assets/shirt4.png" alt="Shirt 4" class="item" />
                    <p class="item-name">Black Oversize Helios Cat Mask</p>
                    <p class="item-price">Rp 250.000</p>
                </div>
            </div>
            <asp:Button runat="server" class="browse-all-button" Text="BROWSE ALL" OnClick="browseAllButton_Click" ID="browseAllButton" />
        </section>
    </div>
</asp:Content>
