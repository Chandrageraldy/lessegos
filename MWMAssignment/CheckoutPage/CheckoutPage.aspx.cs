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
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("../AuthPage/LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadItems();
                LoadUser();
            }
        }

        private void LoadUser()
        {
            string userId = Session["userId"].ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT * FROM userTable WHERE userId = @userId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@userId", userId);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                customerFirstName.Text = reader["firstName"].ToString();
                customerLastName.Text = reader["lastName"].ToString();
                customerEmail.Text = reader["email"].ToString();
                customerAddress.Text = reader["address"].ToString();
                customerPostCode.Text = reader["postCode"].ToString();
                customerPhoneNumber.Text = reader["phoneNumber"].ToString();
                customerCardHolderName.Text = reader["cardHolderName"].ToString();
                customerCardNumber.Text = reader["cardNumber"].ToString();
                customerCvv.Text = reader["cvv"].ToString();
                customerExp.Text = reader["exp"].ToString();
            }

            con.Close();
        }

        private void LoadItems()
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
                    (p.productPrice * c.selectedQuantity) AS productTotal
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

                        decimal total = 0;
                        foreach (DataRow row in dt.Rows)
                        {
                            total += Convert.ToDecimal(row["productTotal"]);
                        }

                        if (dt.Rows.Count == 0)
                        {
                            checkoutButton.Enabled = false;
                        }

                        itemGrid.DataSource = dt;
                        itemGrid.DataBind();

                        subtotalPrice.Text = "Rp " + total.ToString("N0");
                        totalPrice.Text = "Rp " + (total + 15000).ToString("N0");
                    }
                }
            }
        }

        protected void checkoutButton_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            if (deliveryCheckbox.Checked)
            {
                string updateDeliveryInformationQuery = @"UPDATE userTable SET phoneNumber = @phoneNumber, address = @address, postCode = @postCode WHERE userId = @userId";
                SqlCommand updateDeliveryInformationCommand = new SqlCommand(updateDeliveryInformationQuery, con);
                updateDeliveryInformationCommand.Parameters.AddWithValue("@phoneNumber", customerPhoneNumber.Text);
                updateDeliveryInformationCommand.Parameters.AddWithValue("@address", customerAddress.Text);
                updateDeliveryInformationCommand.Parameters.AddWithValue("@postCode", customerPostCode.Text);
                updateDeliveryInformationCommand.Parameters.AddWithValue("@userId", userId);
                updateDeliveryInformationCommand.ExecuteNonQuery();
            }

            if (paymentCheckbox.Checked)
            {
                string updatePaymentInformationQuery = @"UPDATE userTable SET cardHolderName = @cardHolderName, cardNumber = @cardNumber, exp = @exp, cvv = @cvv WHERE userId = @userId";
                SqlCommand updatePaymentInformationCommand = new SqlCommand(updatePaymentInformationQuery, con);
                updatePaymentInformationCommand.Parameters.AddWithValue("@cardHolderName", customerCardHolderName.Text);
                updatePaymentInformationCommand.Parameters.AddWithValue("@cardNumber", customerCardNumber.Text);
                updatePaymentInformationCommand.Parameters.AddWithValue("@exp", customerExp.Text);
                updatePaymentInformationCommand.Parameters.AddWithValue("@cvv", customerCvv.Text);
                updatePaymentInformationCommand.Parameters.AddWithValue("@userId", userId);
                updatePaymentInformationCommand.ExecuteNonQuery();
            }

            string insertOrderQuery = @"
                INSERT INTO orderTable(userId, customerEmail, customerAddress, customerPostCode, customerPhoneNumber, orderStatus) 
                VALUES (@userId, @customerEmail, @customerAddress, @customerPostCode, @customerPhoneNumber, @orderStatus);
                SELECT SCOPE_IDENTITY();";

            SqlCommand insertOrderCommand = new SqlCommand(insertOrderQuery, con);
            insertOrderCommand.Parameters.AddWithValue("@userId", userId);
            insertOrderCommand.Parameters.AddWithValue("@customerEmail", customerEmail.Text);
            insertOrderCommand.Parameters.AddWithValue("@customerAddress", customerAddress.Text);
            insertOrderCommand.Parameters.AddWithValue("@customerPostCode", customerPostCode.Text.ToLower());
            insertOrderCommand.Parameters.AddWithValue("@customerPhoneNumber", customerPhoneNumber.Text);
            insertOrderCommand.Parameters.AddWithValue("@orderStatus", "Pending");

            int orderId = Convert.ToInt32(insertOrderCommand.ExecuteScalar());

            string getCartItemsQuery = @"
                SELECT 
                    p.productName, 
                    c.selectedSize, 
                    p.productPrice, 
                    c.selectedQuantity
                FROM cartTable c
                INNER JOIN productTable p ON c.productId = p.productId
                WHERE c.userId = @userId AND p.isEnabled = 1";
            SqlCommand getCartItemsCommand = new SqlCommand(getCartItemsQuery, con);
            getCartItemsCommand.Parameters.AddWithValue("@userId", userId);

            SqlDataReader reader = getCartItemsCommand.ExecuteReader();
            List<Tuple<string, decimal, int, string>> cartItems = new List<Tuple<string, decimal, int, string>>();

            while (reader.Read())
            {
                cartItems.Add(new Tuple<string, decimal, int, string>(
                    reader["productName"].ToString(),
                    Convert.ToDecimal(reader["productPrice"]),
                    Convert.ToInt32(reader["selectedQuantity"]),
                    reader["selectedSize"].ToString()
                ));
            }
            reader.Close();

            foreach (var item in cartItems)
            {
                string insertOrderProductQuery = @"INSERT INTO productOrderTable(orderId, productName, productPrice, selectedQuantity, selectedSize) 
                                           VALUES (@orderId, @productName, @productPrice, @selectedQuantity, @selectedSize)";
                SqlCommand insertOrderProductCommand = new SqlCommand(insertOrderProductQuery, con);
                insertOrderProductCommand.Parameters.AddWithValue("@orderId", orderId);
                insertOrderProductCommand.Parameters.AddWithValue("@productName", item.Item1);
                insertOrderProductCommand.Parameters.AddWithValue("@productPrice", item.Item2);
                insertOrderProductCommand.Parameters.AddWithValue("@selectedQuantity", item.Item3);
                insertOrderProductCommand.Parameters.AddWithValue("@selectedSize", item.Item4);
                insertOrderProductCommand.ExecuteNonQuery();

                string updateProductQuantityQuery = @"
                    UPDATE productTable 
                    SET 
                        productSSizeQuantity = CASE WHEN @selectedSize = 'S' THEN productSSizeQuantity - @selectedQuantity ELSE productSSizeQuantity END,
                        productMSizeQuantity = CASE WHEN @selectedSize = 'M' THEN productMSizeQuantity - @selectedQuantity ELSE productMSizeQuantity END,
                        productLSizeQuantity = CASE WHEN @selectedSize = 'L' THEN productLSizeQuantity - @selectedQuantity ELSE productLSizeQuantity END,
                        productXLSizeQuantity = CASE WHEN @selectedSize = 'XL' THEN productXLSizeQuantity - @selectedQuantity ELSE productXLSizeQuantity END
                    WHERE productName = @productName";

                SqlCommand updateProductQuantityCommand = new SqlCommand(updateProductQuantityQuery, con);
                updateProductQuantityCommand.Parameters.AddWithValue("@selectedSize", item.Item4);
                updateProductQuantityCommand.Parameters.AddWithValue("@selectedQuantity", item.Item3);
                updateProductQuantityCommand.Parameters.AddWithValue("@productName", item.Item1);
                updateProductQuantityCommand.ExecuteNonQuery();
            }

            string clearCartQuery = "DELETE FROM cartTable WHERE userId = @userId";
            SqlCommand clearCartCommand = new SqlCommand(clearCartQuery, con);
            clearCartCommand.Parameters.AddWithValue("@userId", userId);
            clearCartCommand.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../CheckoutPage/CheckoutPage.aspx");
        }
    }
}