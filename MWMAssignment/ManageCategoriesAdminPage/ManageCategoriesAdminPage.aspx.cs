using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

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

        private void LoadCategories(string searchQuery = "")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT categoryId, categoryName, categoryImageUrl FROM categoryTable WHERE categoryName LIKE @searchQuery OR categoryId LIKE @searchQuery";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            categoryGrid.DataSource = dataTable;
            categoryGrid.DataBind();

            con.Close();
        }

        protected void createCategoryButton_Click(object sender, EventArgs e)
        {
            string categoryImageUrl = string.Empty;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            if (categoryUploadedImage.HasFile)
            {

                string folderPath = Server.MapPath("~/UploadedImage/Category/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                categoryImageUrl = "~/UploadedImage/Category/" + this.categoryUploadedImage.FileName.ToString();
                categoryUploadedImage.SaveAs(folderPath + Path.GetFileName(categoryUploadedImage.FileName));
            } else
            {
                categoryImageUrl = "~/UploadedImage/Category/" + "Category Placeholder.png";
            }

            string query = "INSERT INTO categoryTable(categoryName, categoryImageUrl) VALUES (@categoryName, @categoryImageUrl)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@categoryName", categoryName.Text);
            command.Parameters.AddWithValue("@categoryImageUrl", categoryImageUrl);
            command.ExecuteNonQuery();

            categoryName.Text = "";

            con.Close();
            Response.Redirect("../ManageCategoriesAdminPage/ManageCategoriesAdminPage.aspx");
        }

        protected void editCategoryButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int categoryId = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("../EditCategoryAdminPage/EditCategoryAdminPage.aspx?categoryId=" + categoryId);
        }

        protected void confirmDeleteButton_Click(object sender, EventArgs e)
        {
            string categoryId = hiddenCategoryId.Value;
            Response.Write(categoryId);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "DELETE FROM categoryTable WHERE categoryId = @categoryId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@categoryId", categoryId);
            command.ExecuteNonQuery();

            con.Close();
            Response.Redirect("../ManageCategoriesAdminPage/ManageCategoriesAdminPage.aspx");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTextField.Text.Trim();
            LoadCategories(searchQuery);
        }
    }
}