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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadReviews();
            }
        }

        private void LoadReviews(string searchQuery = "")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = @"SELECT r.reviewId, u.userName, p.productName, r.review FROM reviewTable r INNER JOIN userTable u ON r.userId = u.userId INNER JOIN productTable p ON r.productId = p.productId WHERE r.reviewId LIKE @searchQuery OR u.userName LIKE @searchQuery OR p.productName LIKE @searchQuery OR r.review LIKE @searchQuery";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            reviewGrid.DataSource = dataTable;
            reviewGrid.DataBind();

            con.Close();
        }

        protected void confirmDeleteButton_Click(object sender, EventArgs e)
        {
            string reviewId = hiddenReviewId.Value;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "DELETE FROM reviewTable WHERE reviewId = @reviewId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@reviewId", reviewId);
            command.ExecuteNonQuery();

            con.Close();
            Response.Redirect("../ManageReviewsAdminPage/ManageReviewsAdminPage.aspx");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTextField.Text.Trim();
            LoadReviews(searchQuery);
        }
    }
}