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
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["categoryId"] != null)
            {
                string categoryId = Request.QueryString["categoryId"];
                LoadProducts(categoryId);
            }
            else
            {
                Response.Redirect("../CategoriesPage/CategoriesPage.aspx");
            }
        }

        protected void LoadProducts(string categoryId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string getCategoryQuery = "SELECT categoryName FROM categoryTable WHERE categoryId = @categoryId";
            SqlCommand getCategoryCommand = new SqlCommand(getCategoryQuery, con);
            getCategoryCommand.Parameters.AddWithValue("@categoryId", categoryId);
            SqlDataReader reader = getCategoryCommand.ExecuteReader();

            if (reader.Read())
            {
                categoryProductTitle.Text = reader["categoryName"].ToString().ToUpper();
            }
            reader.Close();

            string getProductQuery = "SELECT * FROM productTable WHERE isEnabled = 1 AND categoryId = @categoryId";
            SqlCommand getProductCommand = new SqlCommand(getProductQuery, con);
            getProductCommand.Parameters.AddWithValue("@categoryId", categoryId);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(getProductCommand);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count == 0)
            {
                noProductsLabel.Visible = true;
            }

            rptProducts.DataSource = dataTable;
            rptProducts.DataBind();

            con.Close();
        }

        protected void item_Click(object sender, EventArgs e)
        {

        }
    }
}