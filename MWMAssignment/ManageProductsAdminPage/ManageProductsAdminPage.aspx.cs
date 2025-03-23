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
                loadCategories();
            }
        }

        private void loadCategories()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT categoryId, categoryName FROM categoryTable";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.HasRows)
            {
                categoryDropdown.DataSource = dataReader;
                categoryDropdown.DataTextField = "categoryName";
                categoryDropdown.DataValueField = "categoryId";
                categoryDropdown.DataBind();
            }

            dataReader.Close();
            con.Close();
        }
    }
}