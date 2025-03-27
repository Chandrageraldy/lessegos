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
                selectedQuantity.Attributes["max"] = reader["productSSizeQuantity"].ToString();
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "showToast();", true);

                string userId = Session["userId"].ToString();
                string productId = Request.QueryString["productId"];
                string selectedSize = sizeDropdown.SelectedItem.Text;
                int quantityToAdd = int.Parse(selectedQuantity.Text);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string checkQuery = "SELECT COUNT(*) FROM cartTable WHERE userId = @userId AND productId = @productId AND selectedSize = @selectedSize";
                SqlCommand checkCommand = new SqlCommand(checkQuery, con);
                checkCommand.Parameters.AddWithValue("@userId", userId);
                checkCommand.Parameters.AddWithValue("@productId", productId);
                checkCommand.Parameters.AddWithValue("@selectedSize", selectedSize);

                int itemCount = (int)checkCommand.ExecuteScalar();

                if (itemCount > 0)
                {
                    string updateQuery = "UPDATE cartTable SET selectedQuantity = selectedQuantity + @quantity WHERE userId = @userId AND productId = @productId AND selectedSize = @selectedSize";
                    SqlCommand updateCommand = new SqlCommand(updateQuery, con);
                    updateCommand.Parameters.AddWithValue("@quantity", quantityToAdd);
                    updateCommand.Parameters.AddWithValue("@userId", userId);
                    updateCommand.Parameters.AddWithValue("@productId", productId);
                    updateCommand.Parameters.AddWithValue("@selectedSize", selectedSize);
                    updateCommand.ExecuteNonQuery();
                }
                else
                {
                    string query = "INSERT INTO cartTable(productId, userId, selectedSize, selectedQuantity) VALUES (@productId, @userId, @selectedSize, @selectedQuantity)";
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@productId", Request.QueryString["productId"]);
                    command.Parameters.AddWithValue("@userId", Session["userId"].ToString());
                    command.Parameters.AddWithValue("@selectedSize", sizeDropdown.SelectedItem.Text);
                    command.Parameters.AddWithValue("@selectedQuantity", selectedQuantity.Text);
                    command.ExecuteNonQuery();
                }
            }
        }

        protected bool isQuantityValid()
        {
            return true;
        }

        protected void sizeDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            hideAllSizeQuantity();
            string availableQty = "1";

            if (sizeDropdown.SelectedValue == "S")
            {
                productSSizeQuantity.Visible = true;
                availableQty = productSSizeQuantity.Text.Split(' ')[0];
            }
            else if (sizeDropdown.SelectedValue == "M")
            {
                productMSizeQuantity.Visible = true;
                availableQty = productMSizeQuantity.Text.Split(' ')[0];
            }
            else if (sizeDropdown.SelectedValue == "L")
            {
                productLSizeQuantity.Visible = true;
                availableQty = productLSizeQuantity.Text.Split(' ')[0];
            }
            else if (sizeDropdown.SelectedValue == "XL")
            {
                productXLSizeQuantity.Visible = true;
                availableQty = productXLSizeQuantity.Text.Split(' ')[0];
            }

            selectedQuantity.Attributes["max"] = availableQty;
        }
    }
}