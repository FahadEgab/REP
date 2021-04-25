using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.UserDB
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User u = new User(Session["Name"].ToString());
                string[] ss = u.getInformation();

                TextBox1.Text = ss[2];
                TextBox2.Text = ss[3];
                TextBox3.Text = ss[10];
                TextBox4.Text = ss[8];
                if (ss[11] == "M")
                {
                    TextBox5.Text = "ذكر";
                }
                else
                {
                    TextBox5.Text = "انثى";
                }

                TextBox6.Text = ss[6];
                TextBox7.Text = ss[5];
                TextBox8.Text = ss[1];
                TextBox9.Text = ss[0];
                TextBox10.Text = ss[7];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User u = new User(Convert.ToInt32(Session["id"].ToString()));
            u.editProfile(TextBox1.Text, TextBox2.Text, Convert.ToInt32(TextBox6.Text), TextBox3.Text, TextBox7.Text);
            if (TextBox11.Text == TextBox12.Text & TextBox11.Text != "")
            {
                u.changePass(TextBox12.Text);
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked==true)
            {
            User u = new User();
            u.deleteAccount(false, Convert.ToInt32(Session["Id"].ToString()));
                Session.Clear();
                Response.Redirect("../Index.aspx");
            }
            

        }
    }
}