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
    public partial class memberdetails : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayGrid.DataBind();
        }
        //Go LinkButton
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        //Active LinkButton
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Active");
        }
        //Pending LinkButton
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Pending");
        }

        //Deactive LinkButton
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Deactive");

        }
        //Delete Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        //user defined func..
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                string strSelect = "SELECT * FROM member_master_tbl where member_id = @memberID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@memberID", txt_memberID.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txt_memberName.Text = dr.GetValue(0).ToString();
                        txt_Dob.Text = dr.GetValue(1).ToString();
                        txt_contNo.Text = dr.GetValue(2).ToString();
                        txt_emailID.Text = dr.GetValue(3).ToString();
                        txt_State.Text = dr.GetValue(4).ToString();
                        txt_City.Text = dr.GetValue(5).ToString();
                        txt_pinCode.Text = dr.GetValue(6).ToString();
                        txt_fullAddress.Text = dr.GetValue(7).ToString();
                        txt_accStatus.Text = dr.GetValue(10).ToString();
                    }
                }
                
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateMemberStatusByID(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strCon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    string strSelect = "UPDATE member_master_tbl SET account_status = '" + status + "' where member_id = @memberID;";
                    SqlCommand cmd = new SqlCommand(strSelect, con);
                    cmd.Parameters.AddWithValue("@memberID", txt_memberID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    displayGrid.DataBind();
                    Response.Write("<script>alert('Member Status Updated Successfully');</script>");
                    clearForm();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
                clearForm();
            }
            
        }

        void deleteMemberByID()
        {
            if(checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strCon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    string strInsert = "DELETE from member_master_tbl where member_id = @memberID";
                    SqlCommand cmd = new SqlCommand(strInsert, con);
                    cmd.Parameters.AddWithValue("@memberID", txt_memberID.Text);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member Deleted Permenently');</script>");
                    clearForm();
                    displayGrid.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
                clearForm();
            }
        }

        void clearForm()
        {
            txt_memberID.Text = "";
            txt_memberName.Text = "";
            txt_Dob.Text = "";
            txt_contNo.Text = "";
            txt_emailID.Text = "";
            txt_State.Text = "";
            txt_City.Text = "";
            txt_pinCode.Text = "";
            txt_fullAddress.Text = "";
            txt_accStatus.Text = "";
        }

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strSelect = "SELECT * FROM member_master_tbl where member_id = @memberID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@memberID", txt_memberID.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
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
    }
}