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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            authErrorMessageContainer.Visible = false;
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string userName = "";
            bool isEnabled = false;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string checkUserQuery = "SELECT userId, userName, isEnabled FROM userTable WHERE email = @email AND password = @password";
            SqlCommand checkUserCommand = new SqlCommand(checkUserQuery, con);
            checkUserCommand.Parameters.AddWithValue("@email", email.Text);
            checkUserCommand.Parameters.AddWithValue("@password", password.Text);

            SqlDataReader reader = checkUserCommand.ExecuteReader();

            if (reader.Read())
            {
                userName = reader["userName"].ToString().Trim();
                isEnabled = Convert.ToBoolean(reader["isEnabled"]);
            }

            reader.Close();

            if (userName != null)
            {
                if (isEnabled)
                {
                    Session["userName"] = userName;
                    Response.Redirect("../HomePage/HomePage.aspx");
                }
                else
                {
                    authErrorMessageContainer.Visible = true;
                    authErrorMessage.Text = "Your account is temporarily disabled. Please contact the admin for more info.";
                    email.Text = "";
                    password.Text = "";
                }
            }
            else
            {
                authErrorMessageContainer.Visible = true;
                authErrorMessage.Text = "Email does not exist or password is incorrect.";
                email.Text = "";
                password.Text = "";
            }

            con.Close();
        }
    }
}