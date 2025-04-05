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
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers(string searchQuery = "")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT userId, firstName, lastName, userName, email, isEnabled FROM userTable WHERE userName LIKE @searchQuery OR userId LIKE @searchQuery";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            userGrid.DataSource = dataTable;
            userGrid.DataBind();

            con.Close();
        }

        protected void toggleStatusButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int userId = Convert.ToInt32(btn.CommandArgument);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string getIsEnabledQuery = "SELECT isEnabled FROM userTable WHERE userId = @userId";
            SqlCommand getIsEnabledCommand = new SqlCommand(getIsEnabledQuery, con);
            getIsEnabledCommand.Parameters.AddWithValue("@userId", userId);
            bool isEnabled = Convert.ToBoolean(getIsEnabledCommand.ExecuteScalar());

            // Toggle status
            bool newStatus = !isEnabled;

            string updateIsEnabledQuery = "UPDATE userTable SET isEnabled = @newStatus WHERE userId = @userId";
            SqlCommand updateIsEnabledCommand = new SqlCommand(updateIsEnabledQuery, con);
            updateIsEnabledCommand.Parameters.AddWithValue("@userId", userId);
            updateIsEnabledCommand.Parameters.AddWithValue("@newStatus", newStatus);
            updateIsEnabledCommand.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../ManageUsersAdminPage/ManageUsersAdminPage.aspx");
        }

        protected void confirmDeleteButton_Click(object sender, EventArgs e)
        {
            string userId = hiddenUserId.Value;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "DELETE FROM userTable WHERE userId = @userId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@userId", userId);
            command.ExecuteNonQuery();

            con.Close();
            Response.Redirect("../ManageUsersAdminPage/ManageUsersAdminPage.aspx");
        }

        protected void editUserButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int userId = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("../EditUserAdminPage/EditUserAdminPage.aspx?userId=" + userId);
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTextField.Text.Trim();
            LoadUsers(searchQuery);
        }
    }
}