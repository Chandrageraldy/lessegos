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
    public partial class WebForm23 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadCompletedOrders();
            }
        }

        private void LoadCompletedOrders(string searchQuery = "")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

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
                        WHERE o.orderStatus = 'Completed' 
                        AND (o.orderId LIKE @searchQuery)
                        ORDER BY o.orderId;";

            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            manageOrdersGrid.DataSource = dataTable;
            manageOrdersGrid.DataBind();

            con.Close();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTextField.Text.Trim();
            LoadCompletedOrders(searchQuery);
        }
    }
}