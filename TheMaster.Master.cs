using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP
{
    public partial class TheMaster : System.Web.UI.MasterPage
    {
        public static int a =0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null)
            {
                Button2.Visible = true;
                Button3.Visible = true;
                Button4.Visible = false;
                Button5.Visible = false;
                
                
            }
            else if(Session["Name"] != null && Convert.ToBoolean(Session["active"].ToString()) != true)
            {
                Response.Redirect("Active.aspx");

            }
            else if (Session["Name"] != null && Convert.ToBoolean(Session["active"].ToString()) == true)
            {
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = true;
                Button5.Visible = true;

            }
            if (!IsPostBack)
            {
                if (a == 1) {
                   
                }
                
            }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Search.aspx?ser="+TextBox1.Text+"");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("sign/chose.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userdb/Info.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Index.aspx");
        }
    }
}