﻿using System;
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
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("../AuthPage/LoginPage.aspx");
            }

            errorMessage.Visible = false;

            if (!IsPostBack)
            {
                LoadUser();
                LoadOrders();
            }
        }

        private void LoadUser()
        {
            string userId = Session["userId"].ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = "SELECT * FROM userTable WHERE userId = @userId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@userId", userId);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                logoutWelcome.Text = "Logged in as " + reader["firstName"].ToString() + " " + reader["lastName"].ToString();
                userName.Text = reader["userName"].ToString();
                firstName.Text = reader["firstName"].ToString();
                lastName.Text = reader["lastName"].ToString();
                email.Text = reader["email"].ToString();
                password.Text = reader["password"].ToString();
                address.Text = reader["address"].ToString();
                postCode.Text = reader["postCode"].ToString();
                phoneNumber.Text = reader["phoneNumber"].ToString();
                cardHolderName.Text = reader["cardHolderName"].ToString();
                cardNumber.Text = reader["cardNumber"].ToString();
                cvv.Text = reader["cvv"].ToString();
                exp.Text = reader["exp"].ToString();
            }

            con.Close();
        }

        protected void updateProfileButton_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string checkEmailQuery = "SELECT COUNT(*) FROM userTable WHERE email = @email AND userId != @userId";
            SqlCommand checkEmailCommand = new SqlCommand(checkEmailQuery, con);
            checkEmailCommand.Parameters.AddWithValue("@email", email.Text.ToLower());
            checkEmailCommand.Parameters.AddWithValue("@userId", userId);
            int checkEmail = Convert.ToInt32(checkEmailCommand.ExecuteScalar().ToString());

            string checkUsernameQuery = "SELECT COUNT(*) FROM userTable WHERE userName = @userName AND userId != @userId";
            SqlCommand checkUsernameCommand = new SqlCommand(checkUsernameQuery, con);
            checkUsernameCommand.Parameters.AddWithValue("@userName", userName.Text);
            checkUsernameCommand.Parameters.AddWithValue("@userId", userId);
            int checkUsername = Convert.ToInt32(checkUsernameCommand.ExecuteScalar().ToString());

            if (checkUsername > 0)
            {
                errorMessage.Visible = true;
                errorMessage.Text = "Username already exists. Please choose another.";
            }
            else if (checkEmail > 0)
            {
                errorMessage.Visible = true;
                errorMessage.Text = "Email already exists. Please use a different email.";
            } else
            {
                string query = @"UPDATE userTable SET userName = @userName, firstName = @firstName, lastName = @lastName, email = @email, address = @address, postCode = @postCode, phoneNumber = @phoneNumber, password = @password, cardHolderName = @cardHolderName, cardNumber = @cardNumber, cvv = @cvv, exp = @exp WHERE userId = @userId";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@userName", userName.Text);
                command.Parameters.AddWithValue("@firstName", firstName.Text);
                command.Parameters.AddWithValue("@lastName", lastName.Text);
                command.Parameters.AddWithValue("@email", email.Text.ToLower());
                command.Parameters.AddWithValue("@userId", userId);
                command.Parameters.AddWithValue("@address", string.IsNullOrEmpty(address.Text) ? (object)DBNull.Value : address.Text);
                command.Parameters.AddWithValue("@postCode", string.IsNullOrEmpty(address.Text) ? (object)DBNull.Value : postCode.Text);
                command.Parameters.AddWithValue("@phoneNumber", string.IsNullOrEmpty(address.Text) ? (object)DBNull.Value :  phoneNumber.Text);
                command.Parameters.AddWithValue("@password", password.Text);
                command.Parameters.AddWithValue("@cardHolderName", string.IsNullOrEmpty(cardHolderName.Text) ? (object)DBNull.Value : cardHolderName.Text);
                command.Parameters.AddWithValue("@cardNumber", string.IsNullOrEmpty(cardNumber.Text) ? (object)DBNull.Value : cardNumber.Text);
                command.Parameters.AddWithValue("@cvv", string.IsNullOrEmpty(cvv.Text) ? (object)DBNull.Value : cvv.Text);
                command.Parameters.AddWithValue("@exp", string.IsNullOrEmpty(exp.Text) ? (object)DBNull.Value : exp.Text);
                command.ExecuteNonQuery();

                Session["userName"] = userName.Text;

                con.Close();

                Response.Redirect("../ManageProfilePage/ManageProfilePage.aspx");
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../AuthPage/LoginPage.aspx");
        }

        private void LoadOrders()
        {
            string userId = Session["userId"].ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT 
                    o.orderId, 
                    o.customerEmail, 
                    o.customerAddress, 
                    o.customerPhoneNumber, 
                    o.customerPostCode, 
                    o.orderStatus,
                    o.orderDateTime,
                    STUFF(
                        (SELECT '<br>' + p.productName + ' (' + p.selectedSize + ') x' + 
                                CAST(p.selectedQuantity AS NVARCHAR(10))
                         FROM productOrderTable p
                         WHERE p.orderId = o.orderId
                         FOR XML PATH (''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 4, ''
                    ) AS products,
                    (SELECT SUM(p.selectedQuantity * p.productPrice) 
                     FROM productOrderTable p 
                     WHERE p.orderId = o.orderId) AS amount
                FROM orderTable o
                WHERE o.userId = @userId
                ORDER BY o.orderId;";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count == 0)
                        {
                            orderHistoryHeader.Visible = false;
                        }

                        orderHistoryGrid.DataSource = dt;
                        orderHistoryGrid.DataBind();
                    }
                }
            }
        }

        protected void orderReceivedButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int orderId = Convert.ToInt32(btn.CommandArgument);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string query = @"UPDATE orderTable SET orderStatus = @orderStatus WHERE orderId = @orderId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@orderStatus", "Completed");
            command.Parameters.AddWithValue("@orderId", orderId);
            command.ExecuteNonQuery();

            con.Close();

            Response.Redirect("../ManageProfilePage/ManageProfilePage.aspx");
        }
    }
}