<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ManageUsersAdminPage.aspx.cs" Inherits="MWMAssignment.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../ManageUsersAdminPage/ManageUsersAdminPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="manage-users-page">
        <!-- HEADER -->
        <section>
            <div class="header-container">
                <h2>MANAGE USERS</h2>
            </div>
        </section>
        <!-- HEADER -->

        <!-- MANAGE USERS CONTAINER -->
        <section>
            <div class="manage-users-container">
                <asp:GridView ID="userGrid" runat="server" class="table"
                    AutoGenerateColumns="False" EmptyDataText="No records found.">
                    <Columns>
                        <asp:BoundField DataField="userId" HeaderText="ID" />
                        <asp:BoundField DataField="firstName" HeaderText="First Name" />
                        <asp:BoundField DataField="lastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="userName" HeaderText="Username" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
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
                                <asp:LinkButton runat="server" ID="editUserButton" CommandArgument='<%# Eval("userId") %>' OnClick="editUserButton_Click"><i class="fa-solid fa-pen-to-square edit-user-button"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="deleteUserButton" CommandArgument='<%# Eval("userId") %>' OnClick="deleteUserButton_Click"><i class="fa-solid fa-trash delete-user-button"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="toggleStatusButton" CommandArgument='<%# Eval("userId") %>'
                                    OnClick="toggleStatusButton_Click">
                    <i class='<%# Convert.ToBoolean(Eval("isEnabled")) ? "fa-solid fa-user-slash disable-user-button" : "fa-solid fa-user-check enable-user-button" %>'></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
        <!-- MANAGE USERS CONTAINER -->
    </div>
</asp:Content>
