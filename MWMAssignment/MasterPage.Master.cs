using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWMAssignment
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    profileButton.Visible = true;
                    signInButton.Visible = false;
                    profileButton.Text = Session["UserName"].ToString();
                }
                else
                {
                    signInButton.Visible = true;
                    profileButton.Visible = false;
                }
            }
        }

        protected void signInButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../AuthPage/LoginPage.aspx");
        }
    }
}