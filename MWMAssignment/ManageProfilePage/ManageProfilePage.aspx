﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageProfilePage.aspx.cs" Inherits="MWMAssignment.WebForm18" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageProfilePage/ManageProfilePage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="manage-profile-page">
        <header>
            <div class="header-container">
                <h2>MANAGE PROFILE</h2>
                <div class="logout-container">
                    <asp:Label ID="logoutWelcome" runat="server" class="logout-welcome"></asp:Label>
                    <p class="logout-seperator">|</p>
                    <asp:LinkButton runat="server" CssClass="logout-button" ID="logout" OnClick="logout_Click" Text="Logout"></asp:LinkButton>
                </div>
            </div>
        </header>

        <section>
            <div class="profile-details-container">
                <h3>Account Details</h3>
                <div class="row">
                    <div class="col-xl-12 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">USERNAME:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="userName" ErrorMessage="* must be at least 8 characters" CssClass="validation-message" ValidationExpression="^.{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="userName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="userName" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">FIRST NAME:</p>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="firstName" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">LAST NAME:</p>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="lastName" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">EMAIL:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="email" ErrorMessage="* enter a valid email address" CssClass="validation-message" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="email" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="email" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">PASSWORD:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="password" ErrorMessage="* must be at least 8 characters" CssClass="validation-message" ValidationExpression="^.{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="* required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox runat="server" ID="password" placeholder="" class="text-field" />
                    </div>
                </div>
            </div>
            <div class="profile-details-container">
                <h3>Address Details</h3>
                <div class="row">
                    <div class="col-xl-12 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">ADDRESS:</p>
                        </div>
                        <asp:TextBox runat="server" ID="address" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">POST CODE:</p>
                        </div>
                        <asp:TextBox runat="server" ID="postCode" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">PHONE NUMBER:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="phoneNumber" ErrorMessage="* enter a valid phone number" CssClass="validation-message" ValidationExpression="^\+?[0-9]{7,15}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <asp:TextBox runat="server" ID="phoneNumber" placeholder="" class="text-field" />
                    </div>
                </div>
            </div>
            <div class="profile-details-container">
                <h3>Payment Details</h3>
                <div class="row">
                    <div class="col-xl-12 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">CARD HOLDER NAME:</p>
                        </div>
                        <asp:TextBox runat="server" ID="cardHolderName" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-12 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">CARD NUMBER:</p>
                        </div>
                        <asp:TextBox runat="server" ID="cardNumber" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">EXP:</p>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="exp" ErrorMessage="* enter a valid expiration date (MM/YY)" CssClass="validation-message" ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <asp:TextBox runat="server" ID="exp" placeholder="MM/YY" class="text-field" />
                    </div>
                    <div class="col-xl-6 text-field-container">
                        <div class="title-row">
                            <p class="text-field-title">CVV:</p>
                        </div>
                        <asp:TextBox runat="server" ID="cvv" placeholder="" class="text-field" />
                    </div>
                    <div class="col-xl-12 text-field-container">
                        <asp:Button runat="server" class="update-profile-button" Text="UPDATE PROFILE" ID="updateProfileButton" OnClick="updateProfileButton_Click" />
                        <asp:Label runat="server" ID="errorMessage" CssClass="error-message">Email already exists. Please use a different email.</asp:Label>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="order-history-container table-responsive">
                <asp:Label runat="server" ID="orderHistoryHeader" CssClass="order-history-header">Order History</asp:Label>
                <asp:GridView ID="orderHistoryGrid" runat="server" class="table" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                # <%# Eval("orderId") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="orderDateTime" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />

                        <asp:TemplateField HeaderText="Delivery Information">
                            <ItemTemplate>
                                <div>
                                    <%# Eval("customerAddress") %>
                                    <br />
                                    <%# Eval("customerPostCode") %>
                                    <br />
                                    <%# Eval("customerPhoneNumber") %>
                                    <br />
                                    <%# Eval("customerEmail") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Products">
                            <ItemTemplate>
                                <%# Eval("products") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                Rp <%# Eval("amount", "{0:N0}") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Button ID="orderReceivedButton" runat="server" Text="Order Received" CssClass="order-received-button" CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("orderStatus").ToString() == "Shipping" %>' OnClick="orderReceivedButton_Click" />

                                <asp:Label ID="statusLabel" runat="server"
                                    CssClass='<%# Eval("orderStatus").ToString() == "Pending" ? "pending-status-label" :
                                      Eval("orderStatus").ToString() == "Completed" ? "completed-status-label" :
                                      Eval("orderStatus").ToString() == "Cancelled" ? "cancelled-status-label" : "" %>'
                                    Visible='<%# Eval("orderStatus").ToString() != "Shipping" %>'>
                                    <%# Eval("orderStatus") %>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
    </div>
</asp:Content>
