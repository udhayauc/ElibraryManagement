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
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {   
            try
            {
                if (!Page.IsPostBack)
                {
                    getUserProfile();
                }
                    if (Session["username"] == null || Session["username"].ToString().Equals(""))
                    {
                        Response.Write("<script>alert('Session Expired Login Again');</script>");
                        Response.Redirect("userlogin.aspx");
                    }
                    else
                    {
                        getUserBookData();

                       if (!Page.IsPostBack)
                       {
                        getUserDetails();
                       }
                    }
                //displayGrid.DataBind();
            }
            
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateDetails();
            }
        }

        //user defined function
        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                string strSelect = "SELECT * FROM book_issue_tbl where member_id = @member_id;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                displayGrid.DataSource = dt;
                displayGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getUserDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string strSelect = "SELECT * FROM member_master_tbl where member_id = @member_id;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txt_fullname.Text = dt.Rows[0]["full_name"].ToString();
                txt_dob.Text = dt.Rows[0]["dob"].ToString();
                txt_Contno.Text = dt.Rows[0]["contact_no"].ToString();
                txt_emailID.Text = dt.Rows[0]["email"].ToString();
                txt_state.Text = dt.Rows[0]["state"].ToString();
                txt_city.Text = dt.Rows[0]["city"].ToString();
                txt_pincode.Text = dt.Rows[0]["pincode"].ToString();
                txt_fulladdress.Text = dt.Rows[0]["full_address"].ToString();
                txt_userID.Text = dt.Rows[0]["member_id"].ToString();
                txt_OldPassword.Text = dt.Rows[0]["password"].ToString();

                lblStatus.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().ToLower().Trim() == "active")
                {
                    lblStatus.Attributes.Add("class", "badge rounded-pill text-bg-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    lblStatus.Attributes.Add("class", "badge rounded-pill text-bg-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    lblStatus.Attributes.Add("class", "badge rounded-pill text-bg-danger");
                }
                else
                {
                    lblStatus.Attributes.Add("class", "badge rounded-pill text-bg-info");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void updateDetails()
        {
            string password = "";
            if (txt_NewPassword.Text.Trim() == "")
            {
                password = txt_OldPassword.Text.Trim();
            }
            else
            {
                password = txt_NewPassword.Text.Trim();

            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string strUpdate = "UPDATE member_master_tbl set full_name=@full_name,dob=@dob,contact_no=@contact_no,email=@email,state=@state,city=@city,pincode=@pincode,full_address=@full_address,password=@password,account_status=@account_status WHERE member_id = @member_id;";
                SqlCommand cmd = new SqlCommand(strUpdate, con);

                cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString().Trim());
                cmd.Parameters.AddWithValue("@full_name", txt_fullname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txt_dob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txt_Contno.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_emailID.Text.Trim());
                cmd.Parameters.AddWithValue("@state", txt_state.Text.Trim());
                cmd.Parameters.AddWithValue("@city", txt_city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txt_pincode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txt_fulladdress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();

                if(result > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Succesfully');</script>");
                    getUserDetails();
                    getUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Entry');</script>");
                }
            }
            catch (Exception ex)
            {

            }
            }

        void getUserProfile()
        {

        }
    }
}