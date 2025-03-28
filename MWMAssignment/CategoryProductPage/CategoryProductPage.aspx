<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CategoryProductPage.aspx.cs" Inherits="MWMAssignment.WebForm14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CategoryProductPage/CategoryProductPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="category-product-page">
        <section class="category-product-section">
            <asp:Label runat="server" ID="categoryProductTitle" class="category-product-title">CATEGORIES</asp:Label>
            <asp:Label ID="noProductsLabel" runat="server" CssClass="no-products-label" Text="No products available for this category." Visible="false"></asp:Label>
            <div class="category-product-container row">
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
        </section>
    </div>
</asp:Content>
