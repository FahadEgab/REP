using REP.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP
{
    public partial class Consulting : System.Web.UI.Page
    {
        private static string attachedFile = "لايوجد ملف";
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton1.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");
            try
            {
                Session["Id"].ToString();
            }
            catch
            {
                Response.Redirect("SignIn.aspx");
            }


        }

        protected void chkOnOff_CheckedChanged(object sender, EventArgs e)
        {
            if (chkOnOff.Checked == true)
            {
                Label1.Text = "سرعة الإستشارة : سريعة";
            }
            else
            {
                Label1.Text = "سرعة الإستشارة : طبيعية";
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Consultings c = new Consultings();
            if (FileUpload1.HasFile)
            {


                
                FileUpload1.SaveAs(Server.MapPath("AttachedFiles/") + FileUpload1.FileName );
                attachedFile = "../AttachedFiles/" + FileUpload1.FileName;

            }
            c.write(Convert.ToInt32(Session["ExpertChoseId"].ToString()), Convert.ToInt32(Session["Id"].ToString()),
                TextBox1.Text, TextBox2.Text, attachedFile,
                chkOnOff.Checked, TextBox4.Text);
            Response.Redirect("UserDB/consult.aspx");
        }
    }
}