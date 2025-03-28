using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWMAssignment
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["productId"] != null)
                {
                    string productId = Request.QueryString["productId"];
                    LoadCategories();
                    LoadProduct(productId);
                }
                else
                {
                    Response.Redirect("../ManageProductsAdminPage/ManageProductsAdminPage.aspx");
                }
            }
        }
        private void LoadCategories()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT categoryId, categoryName FROM categoryTable";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.HasRows)
            {
                categoryDropdown.DataSource = dataReader;
                categoryDropdown.DataTextField = "categoryName";
                categoryDropdown.DataValueField = "categoryId";
                categoryDropdown.DataBind();
            }

            dataReader.Close();
            con.Close();
        }

        protected void LoadProduct(string productId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT * FROM productTable WHERE productId = @productId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@productId", productId);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                productName.Text = reader["productName"].ToString();
                productDesc.Text = reader["productDesc"].ToString();
                productPrice.Text = reader["productPrice"].ToString();
                productSSizeQuantity.Text = reader["productSSizeQuantity"].ToString();
                productMSizeQuantity.Text = reader["productMSizeQuantity"].ToString();
                productLSizeQuantity.Text = reader["productLSizeQuantity"].ToString();
                productXLSizeQuantity.Text = reader["productXLSizeQuantity"].ToString();
                categoryDropdown.SelectedValue = reader["categoryId"].ToString();
                currentProductFrontImage.ImageUrl = reader["productFrontImage"].ToString();
                currentProductBackImage.ImageUrl = reader["productBackImage"].ToString();

                string alt1ImageUrl = reader["productAlt1Image"]?.ToString();
                string alt2ImageUrl = reader["productAlt2Image"]?.ToString();

                if (!string.IsNullOrEmpty(alt1ImageUrl))
                {
                    currentProductAlt1Image.ImageUrl = alt1ImageUrl;
                }
                else
                {
                    currentProductAlt1Image.Visible = false;
                }

                if (!string.IsNullOrEmpty(alt2ImageUrl))
                {
                    currentProductAlt2Image.ImageUrl = alt2ImageUrl;
                }
                else
                {
                    currentProductAlt2Image.Visible = false;
                }
            }

            con.Close();
        }

        protected void editProductButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string productId = Request.QueryString["productId"];
            string frontImageUrl = currentProductFrontImage.ImageUrl;
            string backImageUrl = currentProductBackImage.ImageUrl;
            string alt1ImageUrl = currentProductAlt1Image.Visible ? currentProductAlt1Image.ImageUrl : null;
            string alt2ImageUrl = currentProductAlt2Image.Visible ? currentProductAlt2Image.ImageUrl : null;

            if (productFrontImage.HasFile)
            {
                string filePath = "~/UploadedImage/Product/" + productFrontImage.FileName;
                productFrontImage.SaveAs(Server.MapPath(filePath));
                frontImageUrl = filePath;
            }

            if (productBackImage.HasFile)
            {
                string filePath = "~/UploadedImage/Product/" + productBackImage.FileName;
                productBackImage.SaveAs(Server.MapPath(filePath));
                backImageUrl = filePath;
            }

            if (productAlt1Image.HasFile)
            {
                string filePath = "~/UploadedImage/Product/" + productAlt1Image.FileName;
                productAlt1Image.SaveAs(Server.MapPath(filePath));
                alt1ImageUrl = filePath;
            }

            if (productAlt2Image.HasFile)
            {
                string filePath = "~/UploadedImage/Product/" + productAlt2Image.FileName;
                productAlt2Image.SaveAs(Server.MapPath(filePath));
                alt2ImageUrl = filePath;
            }

            string query = @"UPDATE productTable SET productName = @productName, productDesc = @productDesc, productPrice = @productPrice, productSSizeQuantity = @productSSizeQuantity, productMSizeQuantity = @productMSizeQuantity, productLSizeQuantity = @productLSizeQuantity, productXLSizeQuantity = @productXLSizeQuantity, categoryId = @categoryId, productFrontImage = @productFrontImage, productBackImage = @productBackImage, productAlt1Image = @productAlt1Image, productAlt2Image = @productAlt2Image WHERE productId = @productId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@productId", productId);
            command.Parameters.AddWithValue("@productName", productName.Text);
            command.Parameters.AddWithValue("@productDesc", productDesc.Text);
            command.Parameters.AddWithValue("@productPrice", productPrice.Text);
            command.Parameters.AddWithValue("@productSSizeQuantity", productSSizeQuantity.Text);
            command.Parameters.AddWithValue("@productMSizeQuantity", productMSizeQuantity.Text);
            command.Parameters.AddWithValue("@productLSizeQuantity", productLSizeQuantity.Text);
            command.Parameters.AddWithValue("@productXLSizeQuantity", productXLSizeQuantity.Text);
            command.Parameters.AddWithValue("@categoryId", categoryDropdown.SelectedValue);
            command.Parameters.AddWithValue("@productFrontImage", frontImageUrl);
            command.Parameters.AddWithValue("@productBackImage", backImageUrl);
            command.Parameters.AddWithValue("@productAlt1Image", (object)alt1ImageUrl ?? DBNull.Value);
            command.Parameters.AddWithValue("@productAlt2Image", (object)alt2ImageUrl ?? DBNull.Value);
            command.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../ManageProductsAdminPage/ManageProductsAdminPage.aspx");
        }
    }
}