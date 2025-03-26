<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ManageProductsAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm6" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageProductsAdminPage/ManageProductsAdminPage.css" rel="stylesheet" />
    <script>
        function setDeleteProductId(productId) {
            document.getElementById('<%= hiddenProductId.ClientID %>').value = productId;
            var deleteModal = new bootstrap.Modal(document.getElementById("confirmDeleteModal"));
            deleteModal.show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="manage-products-page">
        <!-- HEADER -->
        <section>
            <div class="header-container row">
                <div class="col-xl-6 col-6 p-0">
                    <h2>MANAGE PRODUCTS</h2>
                </div>
                <div class="col-xl-6 col-6 text-end p-0">
                    <asp:Button runat="server" type="button" class="create-new-button" Text="+ CREATE NEW" ID="createNewButton" OnClick="createNewButton_Click" />
                </div>
            </div>
        </section>
        <!-- HEADER -->

        <!-- MANAGE PRODUCTS CONTAINER -->
        <section>
            <div class="manage-products-container">
                <asp:GridView ID="productGrid" runat="server" class="table"
                    AutoGenerateColumns="False" EmptyDataText="No records found.">
                    <Columns>
                        <asp:BoundField DataField="productId" HeaderText="ID" />

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image runat="server" ImageUrl='<%# Eval("productFrontImage") %>' CssClass="product-image" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="productName" HeaderText="Product Name" />
                        <asp:TemplateField HeaderText="Product Price">
                            <ItemTemplate>
                                Rp <%# Eval("productPrice", "{0:N0}") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="totalQuantity" HeaderText="Total Quantity" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span style='<%# Convert.ToBoolean(Eval("isEnabled")) ? "color: green; font-weight: bold;": "color: red; font-weight: bold;" %>'>
                                    <%# Convert.ToBoolean(Eval("isEnabled")) ? "Enabled" : "Disabled" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemStyle CssClass="action-column" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="editProductButton" CommandArgument='<%# Eval("productId") %>' OnClick="editProductButton_Click"><i class="fa-solid fa-pen-to-square edit-product-button"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="deleteProductButton" CommandArgument='<%# Eval("productId") %>' OnClientClick='<%# "setDeleteProductId(" + Eval("productId") + "); return false;" %>'><i class="fa-solid fa-trash delete-product-button"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="toggleStatusButton" CommandArgument='<%# Eval("productId") %>' OnClick="toggleStatusButton_Click">
                    <i class='<%# Convert.ToBoolean(Eval("isEnabled")) ? "fa-solid fas fa-ban disable-product-button" : "fa-solid fas fa-unlock enable-product-button" %>'></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
        <!-- MANAGE PRODUCTS CONTAINER -->

        <!-- DELETE CONFIRMATION MODAL -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4>Confirm Delete</h4>
                        <p class="delete-message">Are you sure you want to permanently delete this product?</p>
                        <div class="delete-modal-action-row">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button runat="server" ID="confirmDeleteButton" CssClass="btn btn-danger" Text="Delete"
                                OnClick="confirmDeleteButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- HIDDEN FIELD TO STORE PRODUCT ID -->
        <asp:HiddenField runat="server" ID="hiddenProductId" />
    </div>
</asp:Content>
