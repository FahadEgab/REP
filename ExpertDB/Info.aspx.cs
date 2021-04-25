using REP.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.ExpertDB
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

            User u = new User(Session["Name"].ToString());
            string[] ss = u.getInformation();

            Label1.Text = ss[2];
            Label2.Text = ss[3];
            Label3.Text = ss[10];
            Label4.Text = ss[8];
            if (ss[11] == "M")
            {
                Label5.Text = "ذكر";
            }
            else
            {
                Label5.Text = "انثى";
            }

            Label6.Text = ss[6];
            Label7.Text = ss[5];
            Label8.Text = ss[1];
            Label9.Text = ss[0];
            Label10.Text = ss[7];
       
           SqlConnection s = new SqlConnection("Data Source=.\\;Initial Catalog=REP;Integrated Security=True");
            s.Open();
            String sql = "select sum(Price)*0.05 from Expert expr, consulting c, STCPAY s"+
                          " where expr.Id = " + Convert.ToInt32(Session["Id"].ToString()) + "  and c.Id = s.Consulting_Id and expr.Id = c.Expert_Id and s.Payed =0";
            SqlCommand command = new SqlCommand(sql, s);
            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            if (reader[0].ToString() == "")
            {
            Label11.ForeColor = System.Drawing.SystemColors.GrayText;
            Label11.Text = "0 ريال";
                Button1.Enabled = false;
            s.Close();
            }
            else
            {
                Label11.Text = reader[0].ToString()+" ريال";
                s.Close();
            }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection s = new SqlConnection("Data Source=.\\;Initial Catalog=REP;Integrated Security=True");
            s.Open();
            String sql = "Insert into messagess(name_sender,msg,email_sender,title) Values('" + Label1.Text + "','لقد تم إرسال الاموال و قيمتها"+Label11.Text+"','" + Label7.Text + "','الاموال المترتبة على خبير')";
            SqlCommand command = new SqlCommand(sql, s);
            command.ExecuteNonQuery();
            Label11.ForeColor =System.Drawing.SystemColors.GrayText;
            Label11.Text = "ستتغير القيمة الى صفر ريال في حال تأكيد وصول المبالغ من خلال الادارة الخاصة في منصتنا نتمنى لك السعادة دوما.";
            s.Close();
        }
    }
}