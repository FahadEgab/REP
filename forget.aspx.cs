using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP
{
    public partial class forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
            s.Open();
            String sql = "select * from userr where userr.Email='"+TextBox1.Text+"'";
            SqlCommand command = new SqlCommand(sql, s);
            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            Session["Id"] = reader[0].ToString();
            Session["emi"] = TextBox1.Text;
            s.Close();
            Random generator = new Random();
            String r = generator.Next(0, 1000000).ToString("D6");
            string body = "أهلا بك في منصة الخبراء المتقاعدين يمكنك تغيير كلمة المرور من خلال ادخال الرمز التالي في الموقع :" +
               "<h1>" + r + "</h1><br /> نتمنى لك حياة سعيدة.";
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            var mail = new MailMessage();
            mail.From = new MailAddress("Fto2520@gmail.com");
            mail.To.Add(Session["emi"].ToString()); // receiver email address or [string]Session["email"] 

            mail.Subject = "رسالة رمز التفعيل منصة الخبراء المتقاعدين";
            mail.IsBodyHtml = true;
            mail.Body = body;// [string]Session["name"]
            SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential("Fto2520@gmail.com", "Password");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            Session["code"] = r;
            Response.Redirect("change.aspx");
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