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
    public partial class ShowEnd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Consult.consultID == 0)
            {
                Response.Redirect("Consult.aspx");
            }
            if (!IsPostBack)
            {
                int consultID = Consult.consultID;
                int userID = Consult.expertID;
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
                TextBox5.Text = info[3].ToString();
                Literal2.Text = "<a href=\"..\\" + info[13].ToString() + "\" target=\"blank\" class=\"browse btn btn-primary px-4\" style=\"width: 100%;\">اضغط هنا لإستعراض الملف المرفق </a>"; ;
                TextBox7.Text = info[12].ToString();
                TextBox6.Text = info[11].ToString();
                TextBox8.Text = info[10].ToString();

                if (TextBox6.Text != "" | TextBox8.Text != "")
                {
                    TextBox6.Enabled = false;
                    TextBox8.Enabled = false;
                    Button2.Visible = false;
                    TextBox11.Visible = false;
                    TextBox12.Visible = false;
                    Label2.Visible = false;
                    Label3.Visible = false;
                    
                }
                else
                {
                    Literal3.Text = "<img src = \"../images/star.png\" style = \"height: 30px;\" />";
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Consultings coun = new Consultings();
            coun.rateTheConsulting(Consult.consultID, TextBox8.Text, Convert.ToDouble(TextBox6.Text), true);
            User u = new User();
            u.rateUser(Convert.ToDouble(TextBox11.Text), TextBox12.Text, Convert.ToInt32(Session["Id"].ToString()), Consult.expertID);
            Response.Redirect("consult.aspx");
        }
    }
}