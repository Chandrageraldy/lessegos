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
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string checkUserQuery = "SELECT COUNT(*) FROM userTable WHERE email = @email AND password = @password";
                SqlCommand checkUserCommand = new SqlCommand(checkUserQuery, con);
                checkUserCommand.Parameters.AddWithValue("@email", email.Text);
                checkUserCommand.Parameters.AddWithValue("@password", password.Text);
                int checkUser = Convert.ToInt32(checkUserCommand.ExecuteScalar().ToString());

                if (checkUser > 0)
                {
                    string getUsernameQuery = "SELECT userName FROM userTable where email = @email";
                    SqlCommand getUsernameCommand = new SqlCommand(getUsernameQuery, con);
                    getUsernameCommand.Parameters.AddWithValue("@email", email.Text);
                    SqlDataReader getUsernameDataReader = getUsernameCommand.ExecuteReader();

                    while (getUsernameDataReader.Read())
                    {
                        Session["userName"] = getUsernameDataReader["userName"].ToString().Trim();
                    }

                    Response.Redirect("../HomePage/HomePage.aspx");
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
            catch (Exception exception)
            {

            }
        }
    }
}