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
    public partial class Acceptance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Consult.consultID == 0)
            {
                Response.Redirect("consult.aspx");
            }
            int consultID = Consult.consultID;
            int expertID = Consult.expertID;
            Consultings co = new Consultings();
            string[] info = co.getConsulting(consultID);
            //Name of consult 
            TextBox1.Text = info[4].ToString();
            //type of consult

            TextBox3.Text = info[0].ToString();
            //Text of consult
            TextBox4.Text = info[8].ToString();
            //Quick
            if (info[9].ToString() == "True")
            {
                Label1.Text = "سرعة الإستشارة : سريعة";

            }
            else
            {
                Label1.Text = "سرعة الإستشارة : طبيعية";

            }

            //price
            //QRCODE
            SqlConnection s = new SqlConnection("Data Source=.\\;Initial Catalog=REP;Integrated Security=True");
            s.Open();
            String sql = "select QRExpert from Expert where Id=" + expertID;
            SqlCommand command = new SqlCommand(sql, s);
            SqlDataReader readd = command.ExecuteReader();
            readd.Read();
            Literal1.Text = "<img style=\"margin-right:30%\" width=\"200\" height=\"200\" src=\"../"+readd["QRExpert"].ToString()+"\" class=\"img-thumbnail\">";
            sql = "select Price from STCPAY where Consulting_Id=" + consultID;
            readd.Close();
            command = new SqlCommand(sql, s);
            readd = command.ExecuteReader();
            readd.Read();
            TextBox5.Text = readd["Price"].ToString();
            readd.Close();
            s.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Consultings co = new Consultings();
            co.acceptThePrice(Consult.consultID, true);
            Response.Redirect("Consult.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Consultings co = new Consultings();
            co.acceptThePrice(Consult.consultID, false);
            Response.Redirect("Consult.aspx");
        }
    }
}