<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="MWMAssignment.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ShoppingCartPage/ShoppingCartPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="shopping-cart-page">
        <section class="shopping-cart-section">
            <h2 class="shopping-cart-title">SHOPPING CART</h2>
            <div class="shopping-cart-container row">
                <div class="col-xl-8 shopping-cart-grid">
                    <asp:GridView ID="shoppingCartGrid" runat="server" class="table table-borderless"
                        AutoGenerateColumns="False" EmptyDataText="Your shopping cart is empty.">
                        <Columns>
                            <asp:TemplateField HeaderText="Product">
                                <ItemTemplate>
                                    <asp:Image runat="server" ImageUrl='<%# Eval("productFrontImage") %>' CssClass="product-image" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Label runat="server" CssClass="product-name" Text='<%# Eval("productName") %>'></asp:Label>
                                    <asp:Label runat="server" CssClass="selected-size" Text='<%# "Size: " + Eval("selectedSize") %>'></asp:Label>
                                    <asp:Label runat="server" CssClass="product-price" Text='<%# "Rp " + Eval("productPrice", "{0:N0}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" CssClass="selected-quantity" Text='<%# Eval("selectedQuantity") %>' TextMode="Number" min="1" max='<%# Eval("availableQuantity") %>' ID="quantity" OnTextChanged="quantity_TextChanged" />
                                    <asp:HiddenField ID="cartIdHiddenField" runat="server" Value='<%# Eval("cartId") %>' />
                                    <asp:LinkButton runat="server" Text="Remove" CssClass="remove-button" ID="removeButton" OnClick="removeButton_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    Rp <%# Eval("productTotal", "{0:N0}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-xl-4">
                    <div class="payment-container">
                        <div class="total-row">
                            <h3 class="total-label">TOTAL</h3>
                            <asp:Label runat="server" ID="totalLabel" CssClass="total-label">400.000</asp:Label>
                        </div>
                        <p>Shipping & taxes calculated at checkout</p>
                        <asp:Button runat="server" CssClass="checkout-button" ID="checkoutButton" OnClick="checkoutButton_Click" Text="CHECK OUT" />
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
