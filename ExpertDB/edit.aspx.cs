using REP.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.ExpertDB
{
    public partial class edit : System.Web.UI.Page
    {
        public static string email;
        string img;
        string QR;
        string certif;
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton1.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");

            LinkButton2.Attributes.Add("onclick", "document.getElementById('" + FileUpload2.ClientID + "').click(); return false;");

            LinkButton3.Attributes.Add("onclick", "document.getElementById('" + FileUpload3.ClientID + "').click(); return false;");
            if (!IsPostBack)
            {


                User u = new User(Session["Name"].ToString());
                string[] ss = u.getInformation();

                TextBox1.Text = ss[2];
                TextBox2.Text = ss[3];
                TextBox3.Text = ss[10];
                TextBox4.Text = ss[8];
                if (ss[11] == "M")
                {
                    TextBox5.Text = "ذكر";
                }
                else
                {
                    TextBox5.Text = "انثى";
                }

                TextBox6.Text = ss[6];
                TextBox7.Text = ss[5];
                TextBox8.Text = ss[1];
                TextBox9.Text = ss[0];
                TextBox10.Text = ss[7];
                email = ss[5];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User u = new User(Convert.ToInt32(Session["id"].ToString()));
            u.editProfile(TextBox1.Text, TextBox2.Text, Convert.ToInt32(TextBox6.Text), TextBox3.Text, TextBox7.Text);
            if (TextBox11.Text == TextBox12.Text && TextBox11.Text != "")
            {
                u.changePass(TextBox12.Text);
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Classes.Experts exp = new Classes.Experts();
            exp.changeCategory(Convert.ToInt32(Session["Id"].ToString()), Convert.ToInt32(DropDownList4.SelectedValue));

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string filesNam = email;
            string[] filesName = filesNam.Split('@');
            filesNam = filesName[0];
            if (FileUpload2.HasFile)
            {
                string ext = Path.GetExtension(FileUpload2.FileName);
                if (ext == ".png" | ext == ".jpg" | ext == ".jpeg")
                {

                    string path = Server.MapPath("../UserImage/" + filesNam + ".png");
                    FileInfo file = new FileInfo(path);
                    string path2 = Server.MapPath("../UserImage/" + filesNam + ".jpg");
                    FileInfo file2 = new FileInfo(path2);
                    string path3 = Server.MapPath("../UserImage/" + filesNam + ".jpeg");
                    FileInfo file3 = new FileInfo(path3);
                    if (file.Exists)//check file exsit or not  
                    {
                        file.Delete();
                    }
                    if (file2.Exists)
                    {
                        file2.Delete();
                    }
                    if (file3.Exists)
                    {
                        file3.Delete();
                    }
                    string filename = filesNam;

                    FileUpload2.SaveAs(Server.MapPath("../UserImage/") + filename + ext);
                    img = "UserImage/" + filename + ext;
                    Classes.Experts exp = new Classes.Experts();
                    exp.changePhoto(Convert.ToInt32(Session["Id"].ToString()), img);

                }
                else
                {
                    img = "لاتوجد صورة";
                }
            }
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            string filesNam = email;
            string[] filesName = filesNam.Split('@');
            filesNam = filesName[0];
            if (FileUpload1.HasFile)
            {
                string ext = Path.GetExtension(FileUpload1.FileName);
                if (ext == ".png" | ext == ".jpg" | ext == ".jpeg")
                {
                    string path = Server.MapPath("../QRCodes/" + filesNam + ".png");
                    FileInfo file = new FileInfo(path);
                    string path2 = Server.MapPath("../QRCodes/" + filesNam + ".jpg");
                    FileInfo file2 = new FileInfo(path2);
                    string path3 = Server.MapPath("../QRCodes/" + filesNam + ".jpeg");
                    FileInfo file3 = new FileInfo(path3);
                    if (file.Exists)//check file exsit or not  
                    {
                        file.Delete();
                    }
                    if (file2.Exists)
                    {
                        file2.Delete();
                    }
                    if (file3.Exists)
                    {
                        file3.Delete();
                    }

                    string filename = filesNam;
                    FileUpload1.SaveAs(Server.MapPath("../QRCodes/") + filename + ext);
                    QR = "QRCodes/" + filename + ext;
                    Classes.Experts exp = new Classes.Experts();
                    exp.changeQR(Convert.ToInt32(Session["Id"].ToString()), img);
                }
                else
                {
                    QR = "لايوجد رمز الدفع ";
                }
            }

        }
        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pa = "../" + GridView4.SelectedRow.Cells[2].Text;
            string path = Server.MapPath(pa);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not  
            {
                file.Delete();
                Classes.Experts exp = new Classes.Experts();
                exp.deleteCertificate(GridView4.SelectedRow.Cells[2].Text);
            }
            

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string filesNam = email;
            string[] filesName = filesNam.Split('@');
            filesNam = filesName[0];
            Random generator = new Random();
            String r = generator.Next(0, 100000000).ToString("D8");
            if (FileUpload3.HasFile)
            {
                string ext = Path.GetExtension(FileUpload3.FileName);
                if (ext == ".pdf")
                {
                    string filename = filesNam+r;
                    FileUpload3.SaveAs(Server.MapPath("../Certificates/") + filename + ext);
                    certif = "Certificates/" + filename + ext;
                    Classes.Experts exp = new Classes.Experts();
                    exp.addCertificate(Convert.ToInt32(Session["Id"].ToString()), certif);
                }
                else
                {

                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            String[] companyes = TextBox23.Text.Split('\\');
            Classes.Experts exp = new Classes.Experts();
            exp.addCompanies(Convert.ToInt32(Session["Id"].ToString()), companyes);

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            String[] skills = TextBox22.Text.Split('\\');
            Classes.Experts exp = new Classes.Experts();
            exp.addSkills(Convert.ToInt32(Session["Id"].ToString()), skills);

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                User u = new User();
                u.deleteAccount(true, Convert.ToInt32(Session["Id"].ToString()));
                Session.Clear();
                Response.Redirect("../Index.aspx");
            }
        }
    }
}
