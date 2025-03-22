<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ManageCategoriesAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageCategoriesAdminPage/ManageCategoriesAdminPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="manage-categories-page">
        <!-- HEADER -->
        <section>
            <div class="header-container row">
                <div class="col-xl-6 col-6 p-0">
                    <h2>MANAGE CATEGORIES</h2>
                </div>
                <div class="col-xl-6 col-6 text-end p-0">
                    <button type="button" class="btn create-new-button" data-bs-toggle="modal" data-bs-target="#createCategoryModal">
                        + CREATE NEW
                    </button>
                </div>
            </div>
        </section>
        <!-- HEADER -->

        <!-- MODAL -->
        <div class="modal fade" id="createCategoryModal" tabindex="-1" aria-labelledby="createProductModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-body">
                        <h3>CREATE NEW CATEGORY</h3>
                        <div class="title-text-field-container">
                            <p class="text-field-title">CATEGORY TITLE:</p>
                            <asp:TextBox runat="server" ID="categoryName" placeholder="" class="text-field" />
                        </div>
                        <div class="image-upload-container">
                            <p class="text-field-title">IMAGE:</p>
                            <asp:FileUpload runat="server" class="form-control" ID="categoryUploadedImage" />
                        </div>
                        <asp:Button runat="server" class="create-category-button" Text="Create Category" ID="createCategoryButton" OnClick="createCategoryButton_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL -->

        <!-- MANAGE CATEGORIES CONTAINER -->
        <section>
            <div class="manage-categories-container">
                <asp:GridView ID="categoryGrid" runat="server" class="table"
                    AutoGenerateColumns="False" EmptyDataText="No records found.">
                    <Columns>
                        <asp:BoundField DataField="categoryId" HeaderText="ID"/>
                        <asp:BoundField DataField="categoryName" HeaderText="Category Name" />
                        <asp:TemplateField HeaderText="">
                            <ItemStyle CssClass="action-column" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="editCategoryButton" CommandArgument='<%# Eval("categoryId") %>' OnClick="editCategoryButton_Click"><i class="fa-solid fa-pen-to-square edit-category-button"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="deleteCategoryButton" CommandArgument='<%# Eval("categoryId") %>' OnClick="deleteCategoryButton_Click"><i class="fa-solid fa-trash delete-category-button"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
        <!-- MANAGE CATEGORIES CONTAINER -->
    </div>
</asp:Content>
