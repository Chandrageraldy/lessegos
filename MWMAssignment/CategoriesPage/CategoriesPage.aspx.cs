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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        protected void LoadCategories()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = @"
            SELECT 
                c.categoryId, 
                c.categoryName, 
                c.categoryImageUrl, 
                COUNT(p.productId) AS productCount
            FROM categoryTable c
            LEFT JOIN productTable p ON c.categoryId = p.categoryId AND p.isEnabled = 1
            GROUP BY c.categoryId, c.categoryName, c.categoryImageUrl;";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
            DataTable dataTable = new DataTable();

            dataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count == 0)
            {
                noProductsLabel.Visible = true;
            }

            rptCategories.DataSource = dataTable;
            rptCategories.DataBind();

            con.Close();
        }

        protected void category_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string categoryId = btn.CommandArgument;

            Response.Redirect("../CategoryProductPage/CategoryProductPage.aspx?categoryId=" + categoryId);
        }
    }
}