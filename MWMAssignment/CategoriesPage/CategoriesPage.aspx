<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CategoriesPage.aspx.cs" Inherits="MWMAssignment.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CategoriesPage/CategoriesPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="category-page">
        <section class="category-section">
            <h2 class="category-title">CATEGORIES</h2>
            <div class="category-container row">
                <asp:Repeater ID="rptCategories" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-3 col-md-3 col-6 mb-5">
                            <asp:LinkButton runat="server" ID="category" CommandArgument='<%# Eval("categoryId") %>' OnClick="category_Click">
                                <div class="category-image-container">
                                    <asp:Image runat="server" ImageUrl='<%# Eval("categoryImageUrl") %>' class="category-image" />
                                </div>
                                <asp:Label runat="server" class="category-name" Text='<%# Eval("categoryName") %>'></asp:Label>
                                <asp:Label runat="server" class="product-count" Text='<%# Eval("productCount") + " items" %>'></asp:Label>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
    </div>
</asp:Content>
