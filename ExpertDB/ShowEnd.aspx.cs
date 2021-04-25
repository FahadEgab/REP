using REP.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.ExpertDB
{
    public partial class ShowEnd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (consult.consultID == 0)
            {
                Response.Redirect("consult.aspx");
            }
            int consultID = consult.consultID;
            int userID = consult.userID;
            Consultings co = new Consultings();
            string[] info = co.getConsulting(consultID);
            //Name of consult 
            TextBox1.Text = info[4].ToString();
            //Name of user 
            SqlConnection s = new SqlConnection("Data Source=.\\;Initial Catalog=REP;Integrated Security=True");
            s.Open();
            String sql = "select Fname, lname from Userr where Id=" + userID;
            SqlCommand command = new SqlCommand(sql, s);
            SqlDataReader readd = command.ExecuteReader();
            readd.Read();
            TextBox2.Text = readd["Fname"].ToString() + " " + readd["lname"].ToString();
            s.Close();
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
            TextBox5.Text =info[3].ToString();
            Literal2.Text = "<a href=\"..\\" + info[13].ToString() + "\" target=\"blank\" class=\"browse btn btn-primary px-4\" style=\"width: 100%;\">اضغط هنا لإستعراض الملف المرفق </a>"; ;
            TextBox7.Text = info[12].ToString();
            TextBox6.Text = info[11].ToString();
            TextBox9.Text = info[10].ToString();
        }
    }
}