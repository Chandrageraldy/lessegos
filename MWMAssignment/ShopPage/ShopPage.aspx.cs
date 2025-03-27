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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        protected void LoadProducts()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT * FROM productTable WHERE isEnabled = 1";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
            DataTable dataTable = new DataTable();

            dataAdapter.Fill(dataTable);

            rptProducts.DataSource = dataTable;
            rptProducts.DataBind();

            con.Close();
        }

        protected void item_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string productId = btn.CommandArgument;
            Response.Redirect("../ProductDetailsPage/ProductDetailsPage.aspx?productId=" + productId);
        }
    }
}