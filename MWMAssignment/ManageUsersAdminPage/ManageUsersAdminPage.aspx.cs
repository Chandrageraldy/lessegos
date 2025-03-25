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

        private void LoadUsers()
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                string query = "SELECT userId, firstName, lastName, userName, email, isEnabled FROM userTable";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        userGrid.DataSource = dt;
                        userGrid.DataBind();
                    }
                }
            }
        }

        protected void editUserButton_Click(object sender, EventArgs e)
        {

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
    }
}