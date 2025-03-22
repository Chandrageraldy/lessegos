﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ManageProductsAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageProductsAdminPage/ManageProductsAdminPage.css" rel="stylesheet" />
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
                    <button type="button" class="btn create-new-button" data-bs-toggle="modal" data-bs-target="#createProductModal">
                        + CREATE NEW
                    </button>
                </div>
            </div>
        </section>
        <!-- HEADER -->

        <!-- MODAL -->
        <div class="modal fade" id="createProductModal" tabindex="-1" aria-labelledby="createProductModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-body">
                        <h3>CREATE NEW PRODUCT</h3>
                        <div class="title-desc-category-text-field-container">
                            <p class="text-field-title">PRODUCT TITLE:</p>
                            <asp:TextBox runat="server" ID="productTitle" placeholder="" class="text-field" />
                        </div>
                        <div class="title-desc-category-text-field-container">
                            <p class="text-field-title">PRODUCT DESCRIPTION:</p>
                            <asp:TextBox runat="server" ID="productDesc" placeholder="" class="text-field" />
                        </div>
                        <div class="row">
                            <div class="image-upload-container col-xl-6">
                                <p class="text-field-title">FRONT:</p>
                                <asp:FileUpload runat="server" class="form-control" ID="FrontUploadedImage"/>
                            </div>
                            <div class="image-upload-container col-xl-6">
                                <p class="text-field-title">BACK:</p>
                                <asp:FileUpload runat="server" class="form-control" ID="BackUploadedImage"/>
                            </div>
                            <div class="image-upload-container col-xl-6">
                                <p class="text-field-title">ALT1:</p>
                                <asp:FileUpload runat="server" class="form-control" ID="Alt1UploadedImage"/>
                            </div>
                            <div class="image-upload-container col-xl-6">
                                <p class="text-field-title">ALT2:</p>
                                <asp:FileUpload runat="server" class="form-control" ID="Alt2UploadedImager"/>
                            </div>
                        </div>
                        <div class="quantity-text-field-container">
                            <p class="text-field-title">QUANTITY</p>
                            <div class="quantity-text-field-row row">
                                <div class="col-xl-6">
                                    <asp:TextBox runat="server" ID="Ssize" placeholder="S" class="text-field" />
                                </div>
                                <div class="col-xl-6">
                                    <asp:TextBox runat="server" ID="MSize" placeholder="M" class="text-field" />
                                </div>
                                <div class="col-xl-6">
                                    <asp:TextBox runat="server" ID="LSize" placeholder="L" class="text-field" />
                                </div>
                                <div class="col-xl-6">
                                    <asp:TextBox runat="server" ID="XLSize" placeholder="XL" class="text-field" />
                                </div>
                            </div>
                        </div>
                        <div class="title-desc-category-text-field-container">
                            <p class="text-field-title">CATEGORY:</p>
                            <asp:DropDownList runat="server" class="category-dropdown"></asp:DropDownList>
                        </div>
                        <asp:Button runat="server" class="create-product-button" Text="Create Product" />
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL -->

        <!-- MANAGE PRODUCTS CONTAINER -->
        <section>
            <div class="manage-products-container row g-4">
                <div class="col-xl-3 col-sm-4 col-6 d-flex justify-content-center align-items-start">
                    <div class="card" style="width: 16rem;">
                        <img src="../Assets/shirt1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="product-name">White Oversize Fleur Peace</h5>
                            <p class="product-price">Rp 200.000</p>
                            <div class="row">
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Edit" class="edit-action-button " />
                                </div>
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Delete" class="delete-action-button " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-4 col-6 d-flex justify-content-center align-items-start">
                    <div class="card" style="width: 16rem;">
                        <img src="../Assets/shirt2.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="product-name">Black Boxy True Friends</h5>
                            <p class="product-price">Rp 200.000</p>
                            <div class="row">
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Edit" class="edit-action-button " />
                                </div>
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Delete" class="delete-action-button " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-4 col-6 d-flex justify-content-center align-items-start">
                    <div class="card" style="width: 16rem;">
                        <img src="../Assets/shirt3.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="product-name">White Oversize Asesino Craneo</h5>
                            <p class="product-price">Rp 200.000</p>
                            <div class="row">
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Edit" class="edit-action-button " />
                                </div>
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Delete" class="delete-action-button " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-4 col-6 d-flex justify-content-center align-items-start">
                    <div class="card" style="width: 16rem;">
                        <img src="../Assets/shirt4.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="product-name">Black Oversize Helios Cat Mask</h5>
                            <p class="product-price">Rp 200.000</p>
                            <div class="row">
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Edit" class="edit-action-button " />
                                </div>
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Delete" class="delete-action-button " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-4 col-6 d-flex justify-content-center align-items-start">
                    <div class="card" style="width: 16rem;">
                        <img src="../Assets/shirt4.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="product-name">Black Oversize Helios Cat Mask</h5>
                            <p class="product-price">Rp 200.000</p>
                            <div class="row">
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Edit" class="edit-action-button " />
                                </div>
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Delete" class="delete-action-button " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-4 col-6 d-flex justify-content-center align-items-start">
                    <div class="card" style="width: 16rem;">
                        <img src="../Assets/homeHeader.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="product-name">Mock Item</h5>
                            <p class="product-price">Rp 200.000</p>
                            <div class="row">
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Edit" class="edit-action-button " />
                                </div>
                                <div class="col-xl-6">
                                    <asp:Button runat="server" Text="Delete" class="delete-action-button " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- MANAGE PRODUCTS CONTAINER -->
    </div>
    ipt>ipt>
</asp:Content>
