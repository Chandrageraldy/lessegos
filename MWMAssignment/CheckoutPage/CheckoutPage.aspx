<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckoutPage.aspx.cs" Inherits="MWMAssignment.WebForm19" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CheckoutPage/CheckoutPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="checkout-page">
        <section class="checkout-section">
            <h2 class="checkout-title">CHECKOUT</h2>
            <div class="checkout-container row">
                <div class="col-xl-8">
                    <div class="delivery-options-container">
                        <div class="delivery-options-header">
                            <h3 class="left-container-header">1. DELIVERY INFORMATION</h3>
                        </div>
                        <div class="text-field-row row">
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">FIRST NAME:</p>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerFirstName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerFirstName" placeholder="" class="text-field" />
                            </div>
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">LAST NAME:</p>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerLastName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerLastName" placeholder="" class="text-field" />
                            </div>
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">EMAIL:</p>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="customerEmail" ErrorMessage="* enter a valid email address" CssClass="validation-message" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerEmail" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerEmail" placeholder="" class="text-field" />
                            </div>
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">PHONE NUMBER:</p>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="customerPhoneNumber" ErrorMessage="* enter a valid phone number" CssClass="validation-message" ValidationExpression="^\+?[0-9]{7,15}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerPhoneNumber" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerPhoneNumber" placeholder="" class="text-field" />
                            </div>
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">ADDRESS:</p>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerAddress" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerAddress" placeholder="" class="text-field" />
                            </div>
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">POST CODE:</p>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerPostCode" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerPostCode" placeholder="" class="text-field" />
                            </div>
                        </div>
                        <div class="checkbox-container">
                            <asp:CheckBox runat="server" CssClass="checkbox" ID="deliveryCheckbox" />
                            <p>Save phone number, address, and post code for next purchase</p>
                        </div>
                    </div>
                    <div class="payment-container">
                        <div class="payment-header">
                            <h3 class="left-container-header">2. PAYMENT</h3>
                        </div>
                        <div class="text-field-row row">
                            <div class="col-xl-12 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">CARD HOLDER NAME:</p>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerCardHolderName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerCardHolderName" placeholder="" class="text-field" />
                            </div>
                            <div class="col-xl-12 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">CARD NUMBER:</p>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerCardNumber" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerCardNumber" placeholder="" class="text-field" />
                            </div>
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">EXP:</p>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="customerExp" ErrorMessage="* enter a valid expiration date (MM/YY)" CssClass="validation-message" ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerExp" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerExp" placeholder="MM/YY" class="text-field" />
                            </div>
                            <div class="col-xl-6 text-field-container">
                                <div class="title-row">
                                    <p class="text-field-title">CVV:</p>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="customerCvv" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox runat="server" ID="customerCvv" placeholder="" class="text-field" />
                            </div>
                        </div>
                        <div class="checkbox-container">
                            <asp:CheckBox runat="server" CssClass="checkbox" ID="paymentCheckbox" />
                            <p>Save payment information for next purchase</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="order-summary-container">
                        <div class="order-summary-header">
                            <h3 class="right-container-header">ORDER SUMMARY</h3>
                        </div>
                        <div class="price-container">
                            <div class="price-row">
                                <p class="total-label">Subtotal</p>
                                <asp:Label runat="server" ID="subtotalPrice" class="total-label"></asp:Label>
                            </div>
                            <div class="price-row">
                                <p class="total-label">Estimated Shipping</p>
                                <p class="total-label">Rp 15.000</p>
                            </div>
                            <div class="price-row">
                                <p class="final-total-label">TOTAL</p>
                                <asp:Label runat="server" ID="totalPrice" class="final-total-label">Rp 215.000</asp:Label>
                            </div>
                        </div>
                        <div class="order-summary-seperator"></div>
                        <div class="item-grid">
                            <asp:GridView ID="itemGrid" runat="server" class="table table-borderless"
                                AutoGenerateColumns="False" EmptyDataText="Your shopping cart is empty.">
                                <Columns>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ImageUrl='<%# Eval("productFrontImage") %>' CssClass="product-image" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:Label runat="server" CssClass="product-name" Text='<%# Eval("productName") %>'></asp:Label>
                                            <asp:Label runat="server" CssClass="selected-size" Text='<%# "Size: " + Eval("selectedSize") + " | " + "Qty: " + Eval("selectedQuantity") + " | " + "Rp " + Eval("productPrice", "{0:N0}") %>'></asp:Label>
                                            <asp:Label runat="server" CssClass="product-price" Text='<%# "Rp " + Eval("productTotal", "{0:N0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:Button runat="server" CssClass="checkout-button" ID="checkoutButton" OnClick="checkoutButton_Click" Text="CHECK OUT" />
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
