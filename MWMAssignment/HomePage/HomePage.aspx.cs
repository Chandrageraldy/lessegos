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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecentProducts();
            }
        }

        protected void LoadRecentProducts()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT TOP 4 * FROM productTable WHERE isEnabled = 1 ORDER BY created_at DESC";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
            DataTable dataTable = new DataTable();

            dataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count == 0)
            {
                newReleaseTitle.Visible = false;
                browseAllButton.Visible = false;
            }

            rptProducts.DataSource = dataTable;
            rptProducts.DataBind();

            con.Close();
        }

        protected void browseAllButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ShopPage/ShopPage.aspx");
        }

        protected void shopNowButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ShopPage/ShopPage.aspx");
        }

        protected void shopNowButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ShopPage/ShopPage.aspx");
        }

        protected void item_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string productId = btn.CommandArgument;
            Response.Redirect("../ProductDetailsPage/ProductDetailsPage.aspx?productId=" + productId);
        }
    }
}