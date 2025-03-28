using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWMAssignment
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            imageValidationMessage.Visible = false;

            if (!IsPostBack)
            {
                LoadCategories();
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

        protected void createProductButton_Click(object sender, EventArgs e)
        {
            string frontImageUrl = string.Empty;
            string backImageUrl = string.Empty;
            string alt1ImageUrl = string.Empty;
            string alt2ImageUrl = string.Empty;

            if (!productFrontImage.HasFile || !productBackImage.HasFile)
            {
                imageValidationMessage.Visible = true;
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string folderPath = Server.MapPath("~/UploadedImage/Product/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                frontImageUrl = "~/UploadedImage/Product/" + this.productFrontImage.FileName.ToString();
                backImageUrl = "~/UploadedImage/Product/" + this.productBackImage.FileName.ToString();

                productFrontImage.SaveAs(folderPath + Path.GetFileName(productFrontImage.FileName));
                productBackImage.SaveAs(folderPath + Path.GetFileName(productBackImage.FileName));

                if (productAlt1Image.HasFile)
                {
                    alt1ImageUrl = "~/UploadedImage/Product/" + this.productAlt1Image.FileName.ToString();
                    productAlt1Image.SaveAs(folderPath + Path.GetFileName(productAlt1Image.FileName));
                }
                if (productAlt2Image.HasFile)
                {
                    alt2ImageUrl = "~/UploadedImage/Product/" + this.productAlt2Image.FileName.ToString();
                    productAlt2Image.SaveAs(folderPath + Path.GetFileName(productAlt2Image.FileName));
                }

                string query = "INSERT INTO productTable(categoryId, productName, productDesc, productPrice, productFrontImage, productBackImage, productAlt1Image, productAlt2Image, productSSizeQuantity, productMSizeQuantity, productLSizeQuantity, productXLSizeQuantity) VALUES (@categoryId, @productName, @productDesc, @productPrice, @productFrontImage, @productBackImage, @productAlt1Image, @productAlt2Image, @productSSizeQuantity, @productMSizeQuantity, @productLSizeQuantity, @productXLSizeQuantity) ";
                SqlCommand command = new SqlCommand(query, con);

                command.Parameters.AddWithValue("@categoryId", int.Parse(categoryDropdown.SelectedValue));
                command.Parameters.AddWithValue("@productName", productName.Text);
                command.Parameters.AddWithValue("@productDesc", productDesc.Text);
                command.Parameters.AddWithValue("@productPrice", int.Parse(productPrice.Text));
                command.Parameters.AddWithValue("@productFrontImage", frontImageUrl);
                command.Parameters.AddWithValue("@productBackImage", backImageUrl);
                command.Parameters.AddWithValue("@productAlt1Image", string.IsNullOrEmpty(alt1ImageUrl) ? (object)DBNull.Value : alt1ImageUrl);
                command.Parameters.AddWithValue("@productAlt2Image", string.IsNullOrEmpty(alt2ImageUrl) ? (object)DBNull.Value : alt2ImageUrl);
                command.Parameters.AddWithValue("@productSSizeQuantity", int.Parse(productSSizeQuantity.Text));
                command.Parameters.AddWithValue("@productMSizeQuantity", int.Parse(productMSizeQuantity.Text));
                command.Parameters.AddWithValue("@productLSizeQuantity", int.Parse(productLSizeQuantity.Text));
                command.Parameters.AddWithValue("@productXLSizeQuantity", int.Parse(productXLSizeQuantity.Text));
                command.ExecuteNonQuery();

                con.Close();

                Response.Redirect("../ManageProductsAdminPage/ManageProductsAdminPage.aspx");
            }
        }
    }
}