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
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["categoryId"] != null)
                {
                    string categoryId = Request.QueryString["categoryId"];
                    LoadCategory(categoryId);
                }
                else
                {
                    Response.Redirect("../ManageCategoriesAdminPage/ManageCategoriesAdminPage.aspx");
                }
            }
        }

        private void LoadCategory(string categoryId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT * FROM categoryTable WHERE categoryId = @categoryId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@categoryId", categoryId);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                categoryName.Text = reader["categoryName"].ToString();

                string categoryImageUrl = reader["categoryImageUrl"]?.ToString();

                if (!string.IsNullOrEmpty(categoryImageUrl))
                {
                    currentCategoryImage.ImageUrl = categoryImageUrl;
                }
                else
                {
                    currentCategoryImage.Visible = false;
                }
            }

            con.Close();
        }

        protected void editCategoryButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string categoryId = Request.QueryString["categoryId"];
            string categoryImageUrl = currentCategoryImage.Visible ? currentCategoryImage.ImageUrl : null;

            if (categoryImage.HasFile)
            {
                string filePath = "~/UploadedImage/Category/" + categoryImage.FileName;
                categoryImage.SaveAs(Server.MapPath(filePath));
                categoryImageUrl = filePath;
            }

            string query = @"UPDATE categoryTable SET categoryName = @categoryName, categoryImageUrl = @categoryImageUrl WHERE categoryId = @categoryId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@categoryId", categoryId);
            command.Parameters.AddWithValue("@categoryName", categoryName.Text);
            command.Parameters.AddWithValue("@categoryImageUrl", (object)categoryImageUrl ?? DBNull.Value);
            command.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../ManageCategoriesAdminPage/ManageCategoriesAdminPage.aspx");
        }
    }
}