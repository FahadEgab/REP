using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP
{
    public partial class change : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Session["code"].ToString()!=TextBox1.Text)
            {
                Label1.Text = "الرجاء التأكد من الرمز بحيث ان الرمز المدخل لايتوافق مع الرمز المرسل";
            }
            else
            {
                User u = new User(Convert.ToInt32(Session["Id"].ToString()));
                u.changePass(TextBox2.Text);
                Session.Clear();
                Response.Redirect("SignIn.aspx");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sign/chose.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("signin.aspx");
        }
    }
}