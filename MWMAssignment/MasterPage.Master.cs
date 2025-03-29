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
                    manageProfileButton.Visible = true;
                    signInButton.Visible = false;
                    manageProfileButton.Text = Session["userName"].ToString();
                }
                else
                {
                    signInButton.Visible = true;
                    manageProfileButton.Visible = false;
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

        protected void manageProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ManageProfilePage/ManageProfilePage.aspx");
        }
    }
}