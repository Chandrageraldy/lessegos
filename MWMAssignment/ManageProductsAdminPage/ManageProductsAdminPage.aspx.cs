﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWMAssignment
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        protected void LoadProducts(string searchQuery = "")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = @"SELECT productId, productName, productPrice, productFrontImage, (ISNULL(productSSizeQuantity, 0) + ISNULL(productMSizeQuantity, 0) + ISNULL(productLSizeQuantity, 0) + ISNULL(productXLSizeQuantity, 0)) AS totalQuantity, isEnabled FROM productTable WHERE productName LIKE @searchQuery OR productId LIKE @searchQuery";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            productGrid.DataSource = dataTable;
            productGrid.DataBind();

            con.Close();
        }

        protected void createNewButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CreateProductAdminPage/CreateProductAdminPage.aspx");
        }

        protected void confirmDeleteButton_Click(object sender, EventArgs e)
        {
            string productId = hiddenProductId.Value;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "DELETE FROM productTable WHERE productId = @productId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@productId", productId);
            command.ExecuteNonQuery();

            con.Close();
            Response.Redirect("../ManageProductsAdminPage/ManageProductsAdminPage.aspx");
        }

        protected void editProductButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string productId = btn.CommandArgument;

            Response.Redirect("../EditProductAdminPage/EditProductAdminPage.aspx?productId=" + productId);
        }

        protected void toggleStatusButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int productId = Convert.ToInt32(btn.CommandArgument);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string getIsEnabledQuery = "SELECT isEnabled FROM productTable WHERE productId = @productId";
            SqlCommand getIsEnabledCommand = new SqlCommand(getIsEnabledQuery, con);
            getIsEnabledCommand.Parameters.AddWithValue("@productId", productId);
            bool isEnabled = Convert.ToBoolean(getIsEnabledCommand.ExecuteScalar());

            // Toggle status
            bool newStatus = !isEnabled;

            string updateIsEnabledQuery = "UPDATE productTable SET isEnabled = @newStatus WHERE productId = @productId";
            SqlCommand updateIsEnabledCommand = new SqlCommand(updateIsEnabledQuery, con);
            updateIsEnabledCommand.Parameters.AddWithValue("@productId", productId);
            updateIsEnabledCommand.Parameters.AddWithValue("@newStatus", newStatus);
            updateIsEnabledCommand.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../ManageProductsAdminPage/ManageProductsAdminPage.aspx");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTextField.Text.Trim();
            LoadProducts(searchQuery);
        }
    }
}