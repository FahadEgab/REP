using REP.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    public partial class signUpExpert : System.Web.UI.Page
    {
        string img;
        string QR;
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton1.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");

            LinkButton2.Attributes.Add("onclick", "document.getElementById('" + FileUpload2.ClientID + "').click(); return false;");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User u = new User();
            int x = u.checkregistr(TextBox7.Text, TextBox6.Text,
                50);
            if (x == 1)
            {
                Label3.Text = "تم استخدام اسم المستخدم هذا";


            }
            else if (x == 2)
            {

                Label1.Text = "يوجد لدينا حساب بهذا البريد";

            }
           
            else
            {
                Admin a = new Admin();
                bool check  = a.signUpUsers(Convert.ToInt32(DropDownList1.SelectedValue), TextBox7.Text, TextBox8.Text, TextBox1.Text, TextBox2.Text
                    , TextBox6.Text, TextBox3.Text, img, Convert.ToDateTime(TextBox4.Text), Convert.ToChar(DropDownList2.SelectedValue));
                if (check == true)
                {
                    string filesNam = TextBox6.Text;
                    string[] filesName = filesNam.Split('@');
                    filesNam = filesName[0];
                    //This for photo
                    if (FileUpload2.HasFile)
                    {
                        string ext = Path.GetExtension(FileUpload2.FileName);
                        if (ext == ".png" | ext == ".jpg" | ext == ".jpeg")
                        {
                            string filename = filesNam;

                            FileUpload1.SaveAs(Server.MapPath("../UserImage/") + filename + ext);
                            img = "UserImage/" + filename + ext;
                        }
                        else
                        {
                            img = "لاتوجد صورة";
                        }


                    }
                    //This for QRCODE
                    if (FileUpload1.HasFile)
                    {
                        string ext = Path.GetExtension(FileUpload1.FileName);
                        if (ext == ".png" | ext == ".jpg" | ext == ".jpeg")
                        {
                            string filename = filesNam;

                            FileUpload1.SaveAs(Server.MapPath("../QRCodes/") + filename + ext);
                            QR = "QRCodes/" + filename + ext;
                        }
                        else
                        {
                            QR = "لايوجد رمز الدفع ";
                        }


                    }
                    //This for skills
                    String[] skills = TextBox13.Text.Split('\\');
                    //This for companies
                    String[] companyes = TextBox14.Text.Split('\\');


                    a.signUpExpert(Convert.ToInt32(DropDownList1.SelectedValue), TextBox11.Text
                        , companyes, Convert.ToInt32(TextBox10.Text), skills, TextBox12.Text, QR);
                    a.activate(Convert.ToInt32(DropDownList1.SelectedValue), true);
                    a.setExpertSubcategory(Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DropDownList4.SelectedValue));
                }
              
            }
        }
    }
}