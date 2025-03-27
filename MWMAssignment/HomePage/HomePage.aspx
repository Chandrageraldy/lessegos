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
                        <asp:Button runat="server" Text="SHOP NOW" ID="shopNowButton1" class="shop-now-button" OnClick="shopNowButton1_Click" />
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
                    <asp:Button runat="server" Text="SHOP NOW" class="shop-now-button" ID="shopNowButton2" OnClick="shopNowButton2_Click" />
                </div>
            </div>
        </section>
        <section class="new-release-section">
            <asp:Label runat="server" ID="newReleaseTitle" class="new-release-title">NEW RELEASE  </asp:Label>
            <div class="new-release-container row">
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-3 col-md-3 col-6">
                            <asp:LinkButton runat="server" ID="item" CommandArgument='<%# Eval("productId") %>' OnClick="item_Click">
                                <asp:Image runat="server" ImageUrl='<%# Eval("productFrontImage") %>' CssClass="item-image"/>
                                <asp:Label runat="server" class="item-name" Text='<%# Eval("productName") %>'></asp:Label>
                                <asp:Label runat="server" class="item-price" Text='<%# "Rp " + String.Format("{0:N0}", Eval("productPrice")) %>'></asp:Label>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <asp:Button runat="server" class="browse-all-button" Text="BROWSE ALL" OnClick="browseAllButton_Click" ID="browseAllButton" />
        </section>
    </div>
</asp:Content>
