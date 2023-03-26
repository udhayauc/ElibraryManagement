using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            }
            else
            {
                signUpNewUser();
            }
        }

        //user defiend function

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strSelect = "Select * from member_master_tbl where member_id = @memID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@memID", txt_userID.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;

            }
        }

        void signUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "INSERT INTO member_master_tbl(full_name,dob,contact_no," +
                    "email,state,city,pincode,full_address,member_id,password,account_status)" +
                    "values (@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address," +
                    "@member_id,@password,@account_status)";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@full_name", txt_fullName.Text);
                cmd.Parameters.AddWithValue("@dob", txt_dob.Text);
                cmd.Parameters.AddWithValue("@contact_no", txt_contactno.Text);
                cmd.Parameters.AddWithValue("@email", txt_emailID.Text);
                cmd.Parameters.AddWithValue("@state", txt_state.Text);
                cmd.Parameters.AddWithValue("@city", txt_city.Text);
                cmd.Parameters.AddWithValue("@pincode", txt_pinCode.Text);
                cmd.Parameters.AddWithValue("@full_address", txt_fulladdress.Text);
                cmd.Parameters.AddWithValue("@member_id", txt_userID.Text);
                cmd.Parameters.AddWithValue("@password", txt_password.Text);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}