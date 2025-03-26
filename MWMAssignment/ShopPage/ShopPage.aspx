<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShopPage.aspx.cs" Inherits="MWMAssignment.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ShopPage/ShopPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="shop-page">
        <section class="shop-section">
            <h2 class="shop-title">SHOP ALL</h2>
            <div class="shop-container row">
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
