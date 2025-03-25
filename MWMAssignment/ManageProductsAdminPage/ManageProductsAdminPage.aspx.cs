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

        protected void LoadProducts()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT * FROM productTable";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
            DataTable dataTable = new DataTable();

            dataAdapter.Fill(dataTable);

            rptProducts.DataSource = dataTable;
            rptProducts.DataBind();

            con.Close();
        }

        protected void createNewButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CreateProductAdminPage/CreateProductAdminPage.aspx");
        }

        protected void editUserButton_Click(object sender, EventArgs e)
        {

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
    }
}