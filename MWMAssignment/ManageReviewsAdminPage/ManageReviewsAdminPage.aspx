<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ManageReviewsAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageReviewsAdminPage/ManageReviewsAdminPage.css" rel="stylesheet" />
    <script>
        function setDeleteReviewId(reviewId) {
            document.getElementById('<%= hiddenReviewId.ClientID %>').value = reviewId;
            var deleteModal = new bootstrap.Modal(document.getElementById("confirmDeleteModal"));
            deleteModal.show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="manage-reviews-page">
        <!-- HEADER -->
        <section>
            <div class="header-container">
                <h2>MANAGE REVIEWS</h2>
            </div>
        </section>
        <!-- HEADER -->

        <!-- SEARCH CONTAINER -->
        <section>
            <div class="search-container">
                <asp:TextBox runat="server" ID="searchTextField" CssClass="search-text-field" placeholder="Search review"></asp:TextBox>
                <asp:Button runat="server" ID="searchButton" OnClick="searchButton_Click" Text="Search" CssClass="search-button" CausesValidation="false" />
            </div>
        </section>
        <!-- SEARCH CONTAINER -->

        <!-- MANAGE REVIEWS CONTAINER -->
        <section>
            <div class="manage-reviews-container table-responsive">
                <asp:GridView ID="reviewGrid" runat="server" class="table"
                    AutoGenerateColumns="False" EmptyDataText="No reviews.">
                    <Columns>
                        <asp:BoundField DataField="reviewId" HeaderText="ID" />
                        <asp:BoundField DataField="userName" HeaderText="Username" />
                        <asp:BoundField DataField="productName" HeaderText="Product" />
                        <asp:BoundField DataField="review" HeaderText="Content" />
                        <asp:TemplateField HeaderText="">
                            <ItemStyle CssClass="action-column" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="deleteReviewButton" CommandArgument='<%# Eval("reviewId") %>' OnClientClick='<%# "setDeleteReviewId(" + Eval("reviewId") + "); return false;" %>'><i class="fa-solid fa-trash delete-review-button"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
        <!-- MANAGE REVIEWS CONTAINER -->

        <!-- DELETE CONFIRMATION MODAL -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4>Confirm Delete</h4>
                        <p class="delete-message">Are you sure you want to permanently delete this review?</p>
                        <div class="delete-modal-action-row">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button runat="server" ID="confirmDeleteButton" CssClass="btn btn-danger" Text="Delete"
                                OnClick="confirmDeleteButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- HIDDEN FIELD TO STORE REVIEW ID -->
        <asp:HiddenField runat="server" ID="hiddenReviewId" />
    </div>
</asp:Content>
