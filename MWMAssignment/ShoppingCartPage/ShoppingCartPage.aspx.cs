using System;
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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("../AuthPage/LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadShoppingCart();
            }
        }

        protected void checkoutButton_Click(object sender, EventArgs e)
        {

        }

        private void LoadShoppingCart()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT 
                    c.cartId,
                    p.productId,
                    p.productFrontImage, 
                    p.productName, 
                    c.selectedSize, 
                    p.productPrice, 
                    c.selectedQuantity, 
                    (p.productPrice * c.selectedQuantity) AS productTotal,
                    CASE 
                        WHEN c.selectedSize = 'S' THEN p.productSSizeQuantity
                        WHEN c.selectedSize = 'M' THEN p.productMSizeQuantity
                        WHEN c.selectedSize = 'L' THEN p.productLSizeQuantity
                        WHEN c.selectedSize = 'XL' THEN p.productXLSizeQuantity
                        ELSE 0
                    END AS availableQuantity
                FROM cartTable c
                INNER JOIN productTable p ON c.productId = p.productId
                WHERE c.userId = @userId AND p.isEnabled = 1";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count == 0)
                        {
                            checkoutButton.Enabled = false;
                        }

                        decimal total = 0;
                        foreach (DataRow row in dt.Rows)
                        {
                            total += Convert.ToDecimal(row["productTotal"]);
                        }

                        shoppingCartGrid.DataSource = dt;
                        shoppingCartGrid.DataBind();

                        totalLabel.Text = "Rp " + total.ToString("N0");
                    }
                }
            }
        }

        protected void quantity_TextChanged(object sender, EventArgs e)
        {
            TextBox quantityTextBox = (TextBox)sender;
            string selectedQuantity = quantityTextBox.Text;

            GridViewRow row = (GridViewRow)quantityTextBox.NamingContainer;
            HiddenField cartIdHiddenField = (HiddenField)row.FindControl("cartIdHiddenField");
            string cartId = cartIdHiddenField.Value;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "UPDATE cartTable SET selectedQuantity = @quantity WHERE cartId = @cartId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@quantity", selectedQuantity);
            command.Parameters.AddWithValue("@cartId", cartId);
            command.ExecuteNonQuery();

            Response.Redirect("../ShoppingCartPage/ShoppingCartPage.aspx");
        }

        protected void removeButton_Click(object sender, EventArgs e)
        {
            LinkButton removeButton = (LinkButton)sender;
            GridViewRow row = (GridViewRow)removeButton.NamingContainer;
            HiddenField cartIdHiddenField = (HiddenField)row.FindControl("cartIdHiddenField");
            string cartId = cartIdHiddenField.Value;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "DELETE FROM cartTable WHERE cartId = @cartId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@cartId", cartId);
            command.ExecuteNonQuery();
            con.Close();

            Response.Redirect("../ShoppingCartPage/ShoppingCartPage.aspx");
        }
    }
}