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
                            <asp:TextBox runat="server" ID="productTitle" placeholder="" class="text-field" />
                        </div>
                        <div class="image-upload-container">
                            <p class="text-field-title">IMAGE:</p>
                            <asp:FileUpload runat="server" class="form-control" ID="FrontUploadedImage" />
                        </div>
                        <asp:Button runat="server" class="create-category-button" Text="Create Category" />
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL -->

        <!-- MANAGE CATEGORIES CONTAINER -->
        <section>
            <div class="manage-categories-container">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                    AutoGenerateColumns="False" EmptyDataText="No records found.">
                    <Columns>
                        <asp:BoundField DataField="Day" HeaderText="Day" />
                        <asp:BoundField DataField="ArticleName" HeaderText="Article Name" />
                        <asp:BoundField DataField="Author" HeaderText="Author" />
                        <asp:BoundField DataField="Shares" HeaderText="Shares" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button>
                                <button type="button" class="btn btn-success"><i class="fas fa-edit"></i></button>
                                <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
        <!-- MANAGE CATEGORIES CONTAINER -->
    </div>
</asp:Content>
