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
    public partial class admimauthor : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayGrid.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID already exists. You cannot add this Author with this same Author ID');</script>");
            }
            else
            {
                addNewAuthor();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                updateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exists');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exists');</script>");
            }
        }

        bool checkIfAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strSelect = "SELECT * FROM author_master_tbl where author_id = @authorID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@authorID", txt_authorID.Text);
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

        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "INSERT INTO author_master_tbl(author_id,author_name)" +
                    "values (@authorID,@authorName)";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@authorID", txt_authorID.Text);
                cmd.Parameters.AddWithValue("@authorName", txt_authorName.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author added Successfully');</script>");
                clearForm();
                displayGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "UPDATE author_master_tbl SET author_name = @authorName where author_id = @authorID";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@authorID", txt_authorID.Text);
                cmd.Parameters.AddWithValue("@authorName", txt_authorName.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                clearForm();
                displayGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "delete from author_master_tbl where author_id = @authorID";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@authorID", txt_authorID.Text);
                cmd.Parameters.AddWithValue("@authorName", txt_authorName.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Deleted Successfully');</script>");
                clearForm();
                displayGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            txt_authorID.Text = "";
            txt_authorName.Text = "";
        }

        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strSelect = "SELECT * FROM author_master_tbl where author_id = @authorID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@authorID", txt_authorID.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_authorName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }
    }
}