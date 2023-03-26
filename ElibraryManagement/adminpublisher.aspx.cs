using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ElibraryManagement
{
    public partial class adminpublisher : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayGrid.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher with this ID already exists. You cannot add this Publisher with this same Publisher ID');</script>");
            }
            else
            {
                addNewPublisher();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                updatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exists');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if(checkIfPublisherExists())
            {
                deletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exists');</script>");
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getPublisherByID();
        }

        bool checkIfPublisherExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strSelect = "SELECT * FROM publisher_master_tbl where publisher_id = @publisherID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@publisherID", txt_publisherID.Text);
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

        void addNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "INSERT INTO publisher_master_tbl(publisher_id,publisher_name)" +
                    "values (@publisherID,@publisherName)";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@publisherID", txt_publisherID.Text);
                cmd.Parameters.AddWithValue("@publisherName", txt_publisherName.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher added Successfully');</script>");
                clearForm();
                displayGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "UPDATE publisher_master_tbl SET publisher_name = @publisherName where publisher_id = @publisherID";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@publisherID", txt_publisherID.Text);
                cmd.Parameters.AddWithValue("@publisherName", txt_publisherName.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Updated Successfully');</script>");
                clearForm();
                displayGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strInsert = "delete from publisher_master_tbl where publisher_id = @publisherID";
                SqlCommand cmd = new SqlCommand(strInsert, con);
                cmd.Parameters.AddWithValue("@publisherID", txt_publisherID.Text);
                cmd.Parameters.AddWithValue("@publisherName", txt_publisherName.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
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
            txt_publisherID.Text = "";
            txt_publisherName.Text = "";
        }

        void getPublisherByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                string strSelect = "SELECT * FROM publisher_master_tbl where publisher_id = @publisherID;";
                SqlCommand cmd = new SqlCommand(strSelect, con);
                cmd.Parameters.AddWithValue("@publisherID", txt_publisherID.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_publisherName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Publisher ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }

}