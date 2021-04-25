using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.Sign
{
    public partial class signUser2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User uu = new User();
            int x = uu.checkregistr(TextBox7.Text, TextBox6.Text,
                Convert.ToInt32(TextBox5.Text));
            if (x == 1)
            {
                Label3.Text = "تم استخدام اسم المستخدم هذا";


            }
            else if (x == 2)
            {

                Label1.Text = "يوجد لدينا حساب بهذا البريد";

            }
            else if (x == 3)
            {

                Label2.Text = "يوجد لدينا حساب بهذا الرقم";
            }
            else
            {
                User u = new User();
                u.signUp(TextBox7.Text, TextBox8.Text, TextBox6.Text,
                    Session["firstName"].ToString(), Session["lasttName"].ToString(), Convert.ToInt32(TextBox5.Text),
                    Convert.ToDateTime(Session["birth"]), Session["city"].ToString(),
                    Convert.ToChar(Session["gender"].ToString()), "لاتوجد صورة", 0);
                Session.Clear();
                
                Response.Redirect("../SignIn.aspx");
            }
        }
    }
}