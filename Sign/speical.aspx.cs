using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.Sign
{
    public partial class speical : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User u = new User();
            if(u.checkregistr("لايوجد","لايوجد", Convert.ToInt32(TextBox2.Text))==3){
                Label1.Text = "يوجد لدينا حساب بهذا الرقم";
            }
            else
            {
                u = new User(Convert.ToInt32(TextBox2.Text), TextBox1.Text);
                Label1.Text = "لقد تم ارسال طلبك انتضر اتصالنا.";
            }
            
        }
    }
}