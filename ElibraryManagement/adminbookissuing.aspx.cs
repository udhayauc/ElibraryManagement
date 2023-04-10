using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement
{
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayGrid.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getNames();
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if(checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already has this book');</script>");
                }
                else
                {
                    issueBook();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This book does not exists');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }

        //user defined function
        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date) values(@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)", con);
                cmd.Parameters.AddWithValue("@member_id",txt_memberID.Text);
                cmd.Parameters.AddWithValue("@member_name",txt_memName.Text);
                cmd.Parameters.AddWithValue("@book_id",txt_BookID.Text);
                cmd.Parameters.AddWithValue("@book_name",txt_bookName.Text);
                cmd.Parameters.AddWithValue("@issue_date",txt_startDate.Text);
                cmd.Parameters.AddWithValue("@due_date",txt_endDate.Text);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl set current_shock = current_shock-1 WHERE book_id=@book_id",con);
                cmd.Parameters.AddWithValue("@book_id",txt_BookID.Text);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book Issued Successfully');</script>");
                displayGrid.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from book_issue_tbl WHERE book_id=@book_id AND member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@member_id", txt_memberID.Text);
                cmd.Parameters.AddWithValue("@book_id", txt_BookID.Text);
                int result = cmd.ExecuteNonQuery();
                if(result > 0)
                {
                    cmd = new SqlCommand("UPDATE book_master_tbl set current_shock = current_shock+1 WHERE book_id=@book_id", con);
                    cmd.Parameters.AddWithValue("@book_id", txt_BookID.Text);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Book Returned Successfully');</script>");
                    displayGrid.DataBind();
                    con.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }

        bool checkIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id=@book_id AND current_shock > 0", con);
                cmd.Parameters.AddWithValue("@book_id", txt_BookID.Text);
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
                return false;
            }
        }

        bool checkIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@member_id", txt_memberID.Text);
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
                return false;
            }
        }

        bool checkIfIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE book_id=@book_id AND member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@book_id", txt_BookID.Text);
                cmd.Parameters.AddWithValue("@member_id", txt_memberID.Text);
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
                return false;
            }
        }
        void getNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id=@book_id", con);
                cmd.Parameters.AddWithValue("@book_id",txt_BookID.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    txt_bookName.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book ID');</script>");
                }

                cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@member_id", txt_memberID.Text);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_memName.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Member ID');</script>");
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void displayGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if(e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Condition
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }                
            }
            catch (Exception ex)
            {
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
    }
}