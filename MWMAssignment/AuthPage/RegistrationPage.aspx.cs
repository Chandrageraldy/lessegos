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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            authErrorMessageContainer.Visible = false;
        }

        protected void createAccountButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string checkUsernameQuery = "SELECT COUNT(*) FROM userTable WHERE userName = @userName";
                SqlCommand checkUsernameCommand = new SqlCommand(checkUsernameQuery, con);
                checkUsernameCommand.Parameters.AddWithValue("@userName", userName.Text);
                int checkUsername = Convert.ToInt32(checkUsernameCommand.ExecuteScalar().ToString());

                string checkEmailQuery = "SELECT COUNT(*) FROM userTable WHERE email = @email";
                SqlCommand checkEmailCommand = new SqlCommand(checkEmailQuery, con);
                checkEmailCommand.Parameters.AddWithValue("@email", email.Text.ToLower());
                int checkEmail = Convert.ToInt32(checkEmailCommand.ExecuteScalar().ToString());

                if (checkUsername > 0)
                {
                    authErrorMessageContainer.Visible = true;
                    authErrorMessage.Text = "Username already exists. Please choose another.";
                    userName.Text = "";
                }
                else if (checkEmail > 0)
                {
                    authErrorMessageContainer.Visible = true;
                    authErrorMessage.Text = "Email already exists. Please use a different email.";
                    email.Text = "";
                }
                else
                {
                    string insertUserQuery = "INSERT INTO userTable(firstName, lastName, userName, email, password) VALUES (@firstName, @lastName, @userName, @email, @password)";
                    SqlCommand insertUserCommand = new SqlCommand(insertUserQuery, con);
                    insertUserCommand.Parameters.AddWithValue("@firstName", firstName.Text);
                    insertUserCommand.Parameters.AddWithValue("@lastName", lastName.Text);
                    insertUserCommand.Parameters.AddWithValue("@userName", userName.Text);
                    insertUserCommand.Parameters.AddWithValue("@email", email.Text.ToLower());
                    insertUserCommand.Parameters.AddWithValue("@password", password.Text);
                    insertUserCommand.ExecuteNonQuery();

                    con.Close();
                    Response.Redirect("../AuthPage/LoginPage.aspx");
                }
            }
            catch (Exception exception)
            {

            }
        }
    }
}