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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["productId"] != null)
                {
                    string productId = Request.QueryString["productId"];
                    hideAllSizeQuantity();
                    productSSizeQuantity.Visible = true;
                    validationMessage.Visible = false;
                    LoadProductDetails(productId);
                }
                else
                {
                    Response.Redirect("../ShopPage/ShopPage.aspx");
                }
            }
        }

        protected void LoadProductDetails(string productId)
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
                productPrice.Text = "Rp " + Convert.ToDecimal(reader["productPrice"]).ToString("N0");
                productDesc.Text = reader["productDesc"].ToString();
                productFrontImage.ImageUrl = reader["productFrontImage"].ToString();
                productBackImage.ImageUrl = reader["productBackImage"].ToString();

                string alt1ImageUrl = reader["productAlt1Image"]?.ToString();
                string alt2ImageUrl = reader["productAlt2Image"]?.ToString();

                if (!string.IsNullOrEmpty(alt1ImageUrl))
                {
                    productAlt1Image.ImageUrl = alt1ImageUrl;
                    alt1Container.Visible = true;
                    alt1Button.Visible = true;
                }
                else
                {
                    alt1Container.Visible = false;
                    alt1Button.Visible = false;
                }

                if (!string.IsNullOrEmpty(alt2ImageUrl))
                {
                    productAlt2Image.ImageUrl = alt2ImageUrl;
                    alt2Container.Visible = true;
                    alt2Button.Visible = true;
                }
                else
                {
                    alt2Container.Visible = false;
                    alt2Button.Visible = false;
                }

                productSSizeQuantity.Text = reader["productSSizeQuantity"].ToString() + " Remaining";
                productMSizeQuantity.Text = reader["productMSizeQuantity"].ToString() + " Remaining";
                productLSizeQuantity.Text = reader["productLSizeQuantity"].ToString() + " Remaining";
                productXLSizeQuantity.Text = reader["productXLSizeQuantity"].ToString() + " Remaining";
            }

            reader.Close();
            con.Close();
        }

        protected void hideAllSizeQuantity()
        {
            productSSizeQuantity.Visible = false;
            productMSizeQuantity.Visible = false;
            productLSizeQuantity.Visible = false;
            productXLSizeQuantity.Visible = false;
        }

        protected void addToCartButton_Click(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("../AuthPage/LoginPage.aspx");
            }
            else
            {
                if (isQuantityValid())
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();

                    string query = "INSERT INTO cartTable(productId, userId, selectedSize, selectedQuantity) VALUES (@productId, @userId, @selectedSize, @selectedQuantity)";
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@productId", Request.QueryString["productId"]);
                    command.Parameters.AddWithValue("@userId", Session["userId"].ToString());
                    command.Parameters.AddWithValue("@selectedSize", sizeDropdown.SelectedItem.Text);
                    command.Parameters.AddWithValue("@selectedQuantity", selectedQuantity.Text);
                    command.ExecuteNonQuery();
                }
                else
                {
                    return;
                }
            }
        }

        protected bool isQuantityValid()
        {
            if (int.Parse(selectedQuantity.Text) < 1)
            {
                validationMessage.Text = "Please enter a valid quantity.";
                validationMessage.Visible = true;
                return false;
            }

            int availableQty = 0;
            string selectedSize = sizeDropdown.SelectedValue;

            if (selectedSize == "S")
            {
                availableQty = int.Parse(productSSizeQuantity.Text.Split(' ')[0]);
            }
            else if (selectedSize == "M")
            {
                availableQty = int.Parse(productMSizeQuantity.Text.Split(' ')[0]);
            }
            else if (selectedSize == "L")
            {
                availableQty = int.Parse(productLSizeQuantity.Text.Split(' ')[0]);
            }
            else if (selectedSize == "XL")
            {
                availableQty = int.Parse(productXLSizeQuantity.Text.Split(' ')[0]);
            }

            if (int.Parse(selectedQuantity.Text) > availableQty)
            {
                validationMessage.Text = "Selected quantity exceeds available stock.";
                validationMessage.Visible = true;
                return false;
            }
            return true;
        }

        protected void sizeDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (sizeDropdown.SelectedValue == "S")
            {
                hideAllSizeQuantity();
                productSSizeQuantity.Visible = true;
            }
            else if (sizeDropdown.SelectedValue == "M")
            {
                hideAllSizeQuantity();
                productMSizeQuantity.Visible = true;
            }
            else if (sizeDropdown.SelectedValue == "L")
            {
                hideAllSizeQuantity();
                productLSizeQuantity.Visible = true;
            }
            else if (sizeDropdown.SelectedValue == "XL")
            {
                hideAllSizeQuantity();
                productXLSizeQuantity.Visible = true;
            }
        }
    }
}