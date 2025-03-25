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
            <div class="manage-products-container row g-4">
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-3 col-sm-4 col-6 d-flex justify-content-center align-items-start">
                            <div class="card" style="width: 16rem;">
                                <asp:Image runat="server" class="card-img-top" ImageUrl='<%# Eval("productFrontImage") %>' />
                                <div class="card-body">
                                    <asp:Label runat="server" class="product-name" Text='<%# Eval("productName") %>'></asp:Label>
                                    <asp:Label runat="server" class="product-price" Text='<%# "Rp " + Eval("productPrice") %>'></asp:Label>
                                    <div class="row">
                                        <div class="col-xl-6">
                                            <asp:Button runat="server" Text="Edit" class="edit-action-button" CommandArgument='<%# Eval("productId") %>' ID="editUserButton" OnClick="editUserButton_Click"/>
                                        </div>
                                        <div class="col-xl-6">
                                            <asp:Button runat="server" Text="Delete" class="delete-action-button" CommandArgument='<%# Eval("productId") %>' OnClientClick='<%# "setDeleteProductId(" + Eval("productId") + "); return false;" %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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

        <!-- HIDDEN FIELD TO STORE USER ID -->
        <asp:HiddenField runat="server" ID="hiddenProductId" />
    </div>
</asp:Content>
