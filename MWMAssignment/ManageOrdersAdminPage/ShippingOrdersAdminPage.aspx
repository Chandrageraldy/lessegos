<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ShippingOrdersAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageOrdersAdminPage/ManageOrdersAdminPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="manage-orders-page">
        <!-- HEADER -->
        <section>
            <div class="header-container row">
                <div class="col-xl-6 col-6 p-0">
                    <h2>MANAGE ORDERS</h2>
                </div>
            </div>
        </section>
        <!-- HEADER -->

        <!-- TABBAR -->
        <ul class="nav nav-tabs order-tabbar">
            <li class="nav-item">
                <a class="nav-link" href="../ManageOrdersAdminPage/PendingOrdersAdminPage.aspx">PENDING</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="../ManageOrdersAdminPage/ShippingOrdersAdminPage.aspx">SHIPPING</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../ManageOrdersAdminPage/CompletedOrdersAdminPage.aspx">COMPLETED</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../ManageOrdersAdminPage/CancelledOrdersAdminPage.aspx">CANCELLED</a>
            </li>
        </ul>
        <!-- TABBAR -->

        <!-- MANAGE ORDERS CONTAINER -->
        <section>
            <div class="manage-orders-container">
                <asp:GridView ID="manageOrdersGrid" runat="server" class="table" AutoGenerateColumns="False" EmptyDataText="No shipped orders.">
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
                                <p class="shipping-status-label"><%# Eval("orderStatus") %></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
        <!-- MANAGE ORDERS CONTAINER -->
    </div>
</asp:Content>
