using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace ElibraryManagement
{
    public partial class bookdetails : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillAuthorPublisherValues();
            displayGrid.DataBind();
        }

        protected void btnGo(object sender, EventArgs e)
        {
            getBookByID();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('The Book is already exists');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            deleteBook();
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl;",con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlAuthorName.DataSource = dt;
                ddlAuthorName.DataValueField = "author_name";
                ddlAuthorName.DataBind();

                cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                ddlPublisherName.DataSource = dt;
                ddlPublisherName.DataValueField = "publisher_name";
                ddlPublisherName.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strSelect = "SELECT * FROM book_master_tbl where book_id = @bookID OR book_name = @bookName;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@bookID", txt_bookID.Text);
                cmd.Parameters.AddWithValue("@bookName", txt_bookName.Text);
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

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach(int i in lbox_genre.GetSelectedIndices())
                {
                    genres = genres + lbox_genre.Items[i] + ",";
                }
                //genres = Adventure,Action,
                genres = genres.Remove(genres.Length - 1);

                string filePath = "/book_inventory/bookdetails.png";
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + fileName));
                filePath = "book_inventory/" + fileName;
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                string strSelect = "INSERT INTO book_master_tbl (book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_shock,current_shock,book_img_link)" +
                    "values (@bookID,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_shock,@current_shock,@book_img_link);";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@bookID", txt_bookID.Text);
                cmd.Parameters.AddWithValue("@book_name", txt_bookName.Text);
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txt_publishDate.Text);
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txt_Edition.Text);
                cmd.Parameters.AddWithValue("@book_cost", txt_bookCost.Text);
                cmd.Parameters.AddWithValue("@no_of_pages", txt_pages.Text);
                cmd.Parameters.AddWithValue("@book_description", txt_bookDesc.Text);
                cmd.Parameters.AddWithValue("@actual_shock", txt_actualStock.Text);
                cmd.Parameters.AddWithValue("@current_shock", txt_actualStock.Text);
                cmd.Parameters.AddWithValue("@book_img_link", filePath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                displayGrid.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "delete from book_master_tbl where book_id = @bookID";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@bookID", txt_bookID.Text);

                int x = cmd.ExecuteNonQuery();
                con.Close();
                if(x > 0)
                Response.Write("<script>alert('Book Deleted Successfully');</script>");
                else
                Response.Write("<script>alert('Invalid Book ID');</script>");
                displayGrid.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                string strSelect = "SELECT * FROM book_master_tbl where book_id = @bookID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@bookID", txt_bookID.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txt_bookID.Text = dr.GetValue(0).ToString();
                        txt_bookName.Text = dr.GetValue(1).ToString();
                        lbox_genre.Text = dr.GetValue(2).ToString();
                        ddlAuthorName.Text = dr.GetValue(3).ToString();
                        ddlPublisherName.Text = dr.GetValue(4).ToString();
                        txt_publishDate.Text = dr.GetValue(5).ToString();
                        ddlLanguage.Text = dr.GetValue(6).ToString();
                        txt_Edition.Text = dr.GetValue(7).ToString();
                        txt_bookCost.Text = dr.GetValue(8).ToString();
                        txt_pages.Text = dr.GetValue(9).ToString();
                        txt_bookDesc.Text = dr.GetValue(10).ToString();
                        txt_actualStock.Text = dr.GetValue(11).ToString();
                        txt_currentStock.Text = dr.GetValue(11).ToString();
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
        
        void clearForm()
        {
            txt_bookID.Text = "";
            txt_bookName.Text = "";
            lbox_genre.Text = "";
            txt_publishDate.Text = "";
            ddlLanguage.Text = "";
            txt_Edition.Text = "";
            txt_bookCost.Text = "";
            txt_pages.Text = "";
            txt_bookDesc.Text = "";
            txt_actualStock.Text = "";
            txt_currentStock.Text = "";
        }
    }
}