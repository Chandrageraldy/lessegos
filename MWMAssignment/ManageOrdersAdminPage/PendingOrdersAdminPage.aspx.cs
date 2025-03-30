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
    public partial class WebForm20 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadPendingOrders();
            }
        }

        private void LoadPendingOrders()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT 
                    o.orderId, 
                    o.customerEmail, 
                    o.customerAddress, 
                    o.customerPhoneNumber, 
                    o.customerPostCode, 
                    o.orderStatus,
                    o.orderDateTime,
                    STUFF(
                        (SELECT '<br>' + p.productName + ' (' + p.selectedSize + ') x' + 
                                CAST(p.selectedQuantity AS NVARCHAR(10))
                         FROM productOrderTable p
                         WHERE p.orderId = o.orderId
                         FOR XML PATH (''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 4, ''
                    ) AS products,
                    (SELECT SUM(p.selectedQuantity * p.productPrice) 
                     FROM productOrderTable p 
                     WHERE p.orderId = o.orderId) AS amount
                     
                FROM orderTable o
                WHERE o.orderStatus = 'Pending'
                ORDER BY o.orderId;";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        manageOrdersGrid.DataSource = dt;
                        manageOrdersGrid.DataBind();
                    }
                }
            }
        }

        protected void shippingButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int orderId = Convert.ToInt32(btn.CommandArgument);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = @"UPDATE orderTable SET orderStatus = @orderStatus WHERE orderId = @orderId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@orderId", orderId);
            command.Parameters.AddWithValue("@orderStatus", "Shipping");
            command.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../ManageOrdersAdminPage/PendingOrdersAdminPage.aspx");
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int orderId = Convert.ToInt32(btn.CommandArgument);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = @"UPDATE orderTable SET orderStatus = @orderStatus WHERE orderId = @orderId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@orderId", orderId);
            command.Parameters.AddWithValue("@orderStatus", "Cancelled");
            command.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../ManageOrdersAdminPage/PendingOrdersAdminPage.aspx");
        }
    }
}