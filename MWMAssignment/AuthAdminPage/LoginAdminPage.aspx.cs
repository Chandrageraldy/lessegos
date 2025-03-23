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
    public partial class WebForm5 : System.Web.UI.Page
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

                string checkAdminQuery = "SELECT COUNT(*) FROM adminTable WHERE email = @email AND password = @password";
                SqlCommand checkAdminCommand = new SqlCommand(checkAdminQuery, con);
                checkAdminCommand.Parameters.AddWithValue("@email", email.Text);
                checkAdminCommand.Parameters.AddWithValue("@password", password.Text);
                int checkUser = Convert.ToInt32(checkAdminCommand.ExecuteScalar().ToString());

                if (checkUser > 0)
                {
                    string getUsernameQuery = "SELECT email FROM adminTable WHERE email = @email";
                    SqlCommand getUsernameCommand = new SqlCommand(getUsernameQuery, con);
                    getUsernameCommand.Parameters.AddWithValue("@email", email.Text);
                    SqlDataReader getUsernameDataReader = getUsernameCommand.ExecuteReader();

                    while (getUsernameDataReader.Read())
                    {
                        Session["email"] = getUsernameDataReader["email"].ToString().Trim();
                    }

                    Response.Redirect("../HomeAdminPage/HomeAdminPage.aspx");
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