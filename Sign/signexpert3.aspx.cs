using REP.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.Sign
{
    public partial class signexpert3 : System.Web.UI.Page
    {
        string imgg;
        string[] certificates;
        string QR;
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton1.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");
            LinkButton2.Attributes.Add("onclick", "document.getElementById('" + FileUpload2.ClientID + "').click(); return false;");
            LinkButton3.Attributes.Add("onclick", "document.getElementById('" + FileUpload3.ClientID + "').click(); return false;");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string filesNam = Session["email"].ToString();
            string[] filesName = filesNam.Split('@');
            filesNam = filesName[0];
            //This for photo
            if (FileUpload1.HasFile)
            {
                string ext = Path.GetExtension(FileUpload1.FileName);
                if (ext == ".png" | ext==".jpg" | ext== ".jpeg")
                {
                 string filename = filesNam;
               
                FileUpload1.SaveAs(Server.MapPath("../UserImage/") + filename + ext);
                imgg = "UserImage/" + filename + ext;
                }
                else
                {
                    imgg = "لاتوجد صورة";
                }
                

            }
            //This for QRCODE
            if (FileUpload3.HasFile)
            {string ext = Path.GetExtension(FileUpload3.FileName);
                if (ext == ".png" | ext == ".jpg" | ext == ".jpeg")
                {
string filename = filesNam;
                
                FileUpload1.SaveAs(Server.MapPath("../QRCodes/") + filename + ext);
                QR = "QRCodes/" + filename + ext;
                }
                else{
                    QR = "لايوجد رمز الدفع ";
                }
                    

            }
            //This for certificstes
            if (FileUpload2.HasFile)
            {
                int cont = 0;
                foreach (HttpPostedFile file in FileUpload2.PostedFiles)
                {
                    string ext = Path.GetExtension(FileUpload2.FileName);
                    if (ext ==".pdf")
                    {
                    string filename = filesNam + cont;
                    
                    file.SaveAs(Server.MapPath("../Certificates/") + filename + ext);
                    cont += 1;
                    }
                    
                }
                string[] certs = new string[cont];
                int contt = 0;
                foreach (HttpPostedFile file in FileUpload2.PostedFiles)
                {
                    string ext = Path.GetExtension(FileUpload2.FileName);

                    if (ext ==".pdf")
                    {
                    string filename = filesNam + contt;
                    certs[contt] = "Certificates/" + filename + ext;
                    contt += 1;
                    }
                    
                }
                certificates = certs;

            }
            //This for skills
            String[] skills = TextBox22.Text.Split('\\');
            //This for companies
            String[] companyes = TextBox23.Text.Split('\\');
            Classes.Experts exp = new Classes.Experts();
            exp.signUp(Session["userName"].ToString(), Session["password"].ToString(), Session["email"].ToString(),
                Session["firstName"].ToString(), Session["lasttName"].ToString(),
                Convert.ToInt32(Session["number"].ToString()),
                Convert.ToDateTime(Session["birth"].ToString()), Session["city"].ToString(),
                Convert.ToChar(Session["gender"].ToString()), imgg, 1);
            exp.signUpExpert(TextBox20.Text, companyes
                , Convert.ToInt32(TextBox19.Text), skills, certificates, TextBox21.Text, QR);
            exp.setExpertSubcategory(Convert.ToInt32(DropDownList4.SelectedValue));
            exp.startExpert();
            email = Session["email"].ToString();
            Session.Clear();
            Response.Redirect("../SignIn.aspx");



        }
    }
}