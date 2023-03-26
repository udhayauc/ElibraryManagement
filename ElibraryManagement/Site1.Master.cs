using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Caching;

namespace ElibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString().Equals(""))
                {
                    LinkButton2.Visible = true; //userlogin linkbutton
                    LinkButton3.Visible = true; //signup linkbutton

                    LinkButton4.Visible = false; //logout linkbutton
                    LinkButton5.Visible = false; //hellouser linkbutton

                    LinkButton6.Visible = true; //adminlogin linkbutton
                    LinkButton7.Visible = false; //author linkbutton
                    LinkButton8.Visible = false; //publisher linkbutton
                    LinkButton9.Visible = false; //bookinventory linkbutton
                    LinkButton10.Visible = false; //bookissuing linkbutton
                    LinkButton11.Visible = false; //memberdetails linkbutton
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton2.Visible = false; //userlogin linkbutton
                    LinkButton3.Visible = false; //signup linkbutton

                    LinkButton4.Visible = true; //logout linkbutton
                    LinkButton5.Visible = true; //hellouser linkbutton
                    LinkButton5.Text = "Hello " + Session["username"].ToString();

                    LinkButton6.Visible = true; //adminlogin linkbutton
                    LinkButton7.Visible = false; //author linkbutton
                    LinkButton8.Visible = false; //publisher linkbutton
                    LinkButton9.Visible = false; //bookinventory linkbutton
                    LinkButton10.Visible = false; //bookissuing linkbutton
                    LinkButton11.Visible = false; //member management
                }

                else if (Session["role"].Equals("admin"))
                {
                    LinkButton2.Visible = false; //userlogin linkbutton
                    LinkButton3.Visible = false; //signup linkbutton

                    LinkButton4.Visible = true; //logout linkbutton
                    LinkButton5.Visible = true; //hellouser linkbutton
                    LinkButton5.Text = "Hello Admin";

                    LinkButton6.Visible = false; //adminlogin linkbutton
                    LinkButton7.Visible = true; //author linkbutton
                    LinkButton8.Visible = true; //publisher linkbutton
                    LinkButton9.Visible = true; //bookinventory linkbutton
                    LinkButton10.Visible = true; //bookissuing linkbutton
                    LinkButton11.Visible = true; //member management
                }

            }

            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthor.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublisher.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookdetails.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissue.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("memberdetails.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookdetails.aspx");
        }
        //logout button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton2.Visible = true; //userlogin linkbutton
            LinkButton3.Visible = true; //signup linkbutton

            LinkButton4.Visible = false; //logout linkbutton
            LinkButton5.Visible = false; //hellouser linkbutton

            LinkButton6.Visible = true; //adminlogin linkbutton
            LinkButton7.Visible = false; //author linkbutton
            LinkButton8.Visible = false; //publisher linkbutton
            LinkButton9.Visible = false; //bookinventory linkbutton
            LinkButton10.Visible = false; //bookissuing linkbutton
            LinkButton11.Visible = false; //memberdetails linkbutton

            Response.Redirect("homepage.aspx");
        }

    }
}