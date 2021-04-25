using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.Sign
{ 
    
    public partial class signexpert2 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User u = new User();
            int x = u.checkregistr(TextBox7.Text, TextBox6.Text,
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
               
                Label2.Text ="يوجد لدينا حساب بهذا الرقم";
            }
            else
            {
            Session["number"] = TextBox5.Text ;
            Session["email"] = TextBox6.Text; 
            Session["userName"] = TextBox7.Text;
            Session["password"] = TextBox8.Text;
            Response.Redirect("signexpert3.aspx");
            }
            
        }
    }
}