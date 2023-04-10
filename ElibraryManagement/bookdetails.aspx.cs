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
using System.Reflection;

namespace ElibraryManagement
{
    public partial class bookdetails : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
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
            if (checkIfBookExists())
            {
                updateBookbyID();
            }
            else
            {
                Response.Write("<script>alert('The Book is does not exists');</script>");

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                deleteBook();
            }
            else
            {
                Response.Write("<script>alert('The Book is does not exists');</script>");

            }           
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

        void updateBookbyID()
        {
            try
            {
                int actual_stock = Convert.ToInt32(txt_actualStock.Text);
                int current_stock = Convert.ToInt32(txt_currentStock.Text);
                if(global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if(actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('Actuall stock value cannot be less than the issued books');</script>");
                        return;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        txt_currentStock.Text = "" + current_stock;
                    }
                }

                string genres = "";
                foreach (int i in lbox_genre.GetSelectedIndices())
                {
                    genres = genres + lbox_genre.Items[i] + ",";
                }
                //genres = Adventure,Action,
                genres = genres.Remove(genres.Length - 1);

                string filePath = "/book_inventory/bookdetails.png";
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if(fileName == "" || fileName == null)
                {
                    filePath = global_filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + fileName));
                    filePath = "book_inventory/" + fileName;
                }

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl set genre=@genre,author_name=@author_name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages,book_description=@book_description,actual_shock=@actual_shock,book_img_link=@book_img_link where book_id=@book_id OR book_name=@book_name", con);
                cmd.Parameters.AddWithValue("@book_id", txt_bookID.Text);
                cmd.Parameters.AddWithValue("@book_name", txt_bookName.Text);
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedValue);
                cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedValue);
                cmd.Parameters.AddWithValue("@publish_date", txt_publishDate.Text);
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedValue);
                cmd.Parameters.AddWithValue("@edition", txt_Edition.Text);
                cmd.Parameters.AddWithValue("@book_cost", txt_bookCost.Text);
                cmd.Parameters.AddWithValue("@no_of_pages", txt_pages.Text);
                cmd.Parameters.AddWithValue("@book_description", txt_bookDesc.Text);
                cmd.Parameters.AddWithValue("@actual_shock", actual_stock.ToString());
                cmd.Parameters.AddWithValue("@current_shock", current_stock.ToString());
                cmd.Parameters.AddWithValue("@book_img_link", filePath);
                cmd.ExecuteNonQuery();
                con.Close();
                displayGrid.DataBind();
                Response.Write("<script>alert('Book Updated Succesfully');</script>");
            }
            catch (Exception ex)
            {

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
                cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedValue);
                cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedValue);
                cmd.Parameters.AddWithValue("@publish_date", txt_publishDate.Text);
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedValue);
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
                        ddlAuthorName.SelectedValue = dr.GetValue(3).ToString();
                        ddlPublisherName.SelectedValue = dr.GetValue(4).ToString();
                        txt_publishDate.Text = dr.GetValue(5).ToString();
                        ddlLanguage.SelectedValue = dr.GetValue(6).ToString();
                        txt_Edition.Text = dr.GetValue(7).ToString();
                        txt_bookCost.Text = dr.GetValue(8).ToString();
                        txt_pages.Text = dr.GetValue(9).ToString().Trim();
                        txt_bookDesc.Text = dr.GetValue(10).ToString();
                        txt_actualStock.Text = dr.GetValue(11).ToString();
                        txt_currentStock.Text = dr.GetValue(12).ToString(); 
                        txt_issuedBooks.Text = ""+(Convert.ToInt32(dr.GetValue(11).ToString()) - Convert.ToInt32(dr.GetValue(12).ToString()));
                        lbox_genre.ClearSelection();
                        string[] genre = dr.GetValue(2).ToString().Trim().Split(',');
                        for(int i=0; i < genre.Length; i++)
                        {
                            for(int j = 0; j < lbox_genre.Items.Count; j++)
                            {
                                if (lbox_genre.Items[j].ToString() == genre[i])
                                {
                                    lbox_genre.Items[j].Selected = true;
                                }
                            }
                        }
                        global_actual_stock = Convert.ToInt32(dr.GetValue(11).ToString().Trim());
                        global_current_stock = Convert.ToInt32(dr.GetValue(12).ToString().Trim());
                        global_issued_books = global_actual_stock - global_current_stock;
                        global_filepath = dr.GetValue(13).ToString();
                    }
                }

                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
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
            lbox_genre.ClearSelection();
        }
    }
}