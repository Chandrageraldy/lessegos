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
                if (Session["userName"] != null)
                {
                    profileButton.Visible = true;
                    signInButton.Visible = false;
                    profileButton.Text = Session["userName"].ToString();
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

        protected void shoppingCartButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ShoppingCartPage/ShoppingCartPage.aspx");
        }
    }
}