using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.Site
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                Response.Redirect("~/Index.aspx");
            }
        }

        

        protected void Button1_Click1(object sender, EventArgs e)
        {
            User u = new User();
            bool check = u.signIn(TextBox1.Text, TextBox2.Text);

            if (check == true)
            {

                String[] ss = u.getInformation();
                Session["Id"] = ss[0];
                String x = ss[1];
                String y = ss[4];
                
                bool activ = Convert.ToBoolean(ss[12]);
                Session["active"] = activ;
                string emai = ss[5];

                int z = Convert.ToInt32(ss[9]);

                if (activ == false) {
                    Session["emi"] = emai;
                    Random generator = new Random();
                    String r = generator.Next(0, 1000000).ToString("D6");
                    string body = "أهلا بك في منصة الخبراء المتقاعدين يمكنك الان استخدام الحساب بعد تفعيله من خلال ادخال الرمز التالي في الموقع :" +
                       "<h1>" + r + "</h1><br /> نتمنى لك حياة سعيدة.";
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    var mail = new MailMessage();
                    mail.From = new MailAddress("Fto2520@gmail.com");
                    mail.To.Add(emai); // receiver email address or [string]Session["email"] 

                    mail.Subject = "رسالة رمز التفعيل منصة الخبراء المتقاعدين";
                    mail.IsBodyHtml = true;
                    mail.Body = body;// [string]Session["name"]
                    SmtpServer.Port = 587;
                    SmtpServer.UseDefaultCredentials = false;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("Fto2520@gmail.com", "Password");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                    Session["code"] = r;
                    Response.Redirect("active.aspx");
                }
                else if (y == TextBox2.Text)
                {

                    //if true it is go to session
                    Session["Name"] = x.ToString();

                    if (z == 0)
                    {
                        Session["Role"] = "0";
                        Response.Redirect("~/SignIn.aspx");
                    }
                    else if (z == 1)
                    {
                        Session["Role"] = "1";
                        Response.Redirect("~/Index.aspx");
                    }
                    else if (z == 2)
                    {
                        Session["Role"] = "2";
                        Response.Redirect("~/SignIn.aspx");
                    }

                }


            }
            else
            {
                Label1.Text = "هنالك خطأ في كلمة المرور او اسم المستخدم";
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("signin.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sign/chose.aspx");
        }
    }
}