using REP.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.UserDB
{
    public partial class Consulttt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Consult.consultID == 0)
            {
                Response.Redirect("consult.aspx");
            }
            int consultID = Consult.consultID;
            
            Consultings co = new Consultings();
            string[] info = co.getConsulting(consultID);
            //Name of consult 
            TextBox1.Text = info[4].ToString();
            
            //type of consult

            TextBox3.Text = info[0].ToString();
            //Text of consult
            TextBox4.Text = info[8].ToString();
            //attached files
            Literal1.Text = "<a href=\"..\\" + info[14].ToString() + "\" target=\"blank\" class=\"browse btn btn-primary px-4\" style=\"width: 100%;\">اضغط هنا لإستعراض الملف المرفق </a>";
            //Quick
            if (info[9].ToString() == "True")
            {
                Label1.Text = "سرعة الإستشارة : سريعة";

            }
            else
            {
                Label1.Text = "سرعة الإستشارة : طبيعية";

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Consultings cons = new Consultings();
            cons.edit(Consult.consultID,TextBox1.Text,TextBox4.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Consultings cons = new Consultings();
            cons.delete(Consult.consultID);
        }
    }
}