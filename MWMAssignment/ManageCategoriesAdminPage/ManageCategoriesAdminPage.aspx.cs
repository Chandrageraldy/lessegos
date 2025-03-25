using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace MWMAssignment
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT categoryId, categoryName, categoryImageUrl FROM categoryTable";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            categoryGrid.DataSource = dataTable;
            categoryGrid.DataBind();

            con.Close();
        }

        protected void createCategoryButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "INSERT INTO categoryTable(categoryName) VALUES (@categoryName)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@categoryName", categoryName.Text);
            command.ExecuteNonQuery();

            categoryName.Text = "";

            con.Close();
            Response.Redirect("../ManageCategoriesAdminPage/ManageCategoriesAdminPage.aspx");
        }

        protected void editCategoryButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int categoryId = Convert.ToInt32(btn.CommandArgument);

            
        }

        protected void confirmDeleteButton_Click(object sender, EventArgs e)
        {
            string categoryId = hiddenCategoryId.Value;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "DELETE FROM categoryTable WHERE categoryId = @categoryId";
            SqlCommand command= new SqlCommand(query, con);
            command.Parameters.AddWithValue("@categoryId", categoryId);
            command.ExecuteNonQuery();

            con.Close();
            Response.Redirect("../ManageCategoriesAdminPage/ManageCategoriesAdminPage.aspx");
        }
    }
}