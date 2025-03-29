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
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../AuthAdminPage/LoginAdminPage.aspx");
            }

            errorMessage.Visible = false;

            if (!IsPostBack)
            {
                if (Request.QueryString["userId"] != null)
                {
                    string userId = Request.QueryString["userId"];
                    LoadUser(userId);
                }
                else
                {
                    Response.Redirect("../ManageProductsAdminPage/ManageProductsAdminPage.aspx");
                }
            }
        }

        private void LoadUser(string userId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT * FROM userTable WHERE userId = @userId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@userId", userId);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                firstName.Text = reader["firstName"].ToString();
                lastName.Text = reader["lastName"].ToString();
                userName.Text = reader["userName"].ToString();
                email.Text = reader["email"].ToString();
            }

            con.Close();
        }

        protected void editUserButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string userId = Request.QueryString["userId"];

            string checkEmailQuery = "SELECT COUNT(*) FROM userTable WHERE email = @email AND userId != @userId";
            SqlCommand checkEmailCommand = new SqlCommand(checkEmailQuery, con);
            checkEmailCommand.Parameters.AddWithValue("@email", email.Text.ToLower());
            checkEmailCommand.Parameters.AddWithValue("@userId", userId);
            int checkEmail = Convert.ToInt32(checkEmailCommand.ExecuteScalar().ToString());

            if (checkEmail > 0)
            {
                errorMessage.Visible = true;
            }
            else
            {
                string query = @"UPDATE userTable SET firstName = @firstName, lastName = @lastName, email = @email WHERE userId = @userId";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@firstName", firstName.Text);
                command.Parameters.AddWithValue("@lastName", lastName.Text);
                command.Parameters.AddWithValue("@email", email.Text.ToLower());
                command.Parameters.AddWithValue("@userId", userId);
                command.ExecuteNonQuery();

                con.Close();

                Response.Redirect("../ManageUsersAdminPage/ManageUsersAdminPage.aspx");
            }
        }
    }
}