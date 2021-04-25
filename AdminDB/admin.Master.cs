using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["Name"] != null && Session["Role"].ToString() == "1")
            {
                Response.Redirect("../ExpertDB/Info.aspx");
            }
            else if (Session["Name"] != null && Session["Role"].ToString() == "0")
            {
                Response.Redirect("../UserDB/Info.aspx");
            }
            else if(Session["Name"] != null && Session["Role"].ToString() == "2")
            {

            }
            else
            {
                Response.Redirect("../Index.aspx");
            }
            if (!IsPostBack)
            {
                if (Session["Name"] != null && Session["Role"].ToString() == "1")
                {
                    Response.Redirect("../ExpertDB/Info.aspx");
                }
                else if (Session["Name"] != null && Session["Role"].ToString() == "0")
                {
                    Response.Redirect("../UserDB/Info.aspx");
                }
                else if (Session["Name"] != null && Session["Role"].ToString() == "2")
                {

                }
                else
                {
                    Response.Redirect("../Index.aspx");
                }

            }
            string[] ss = new string[2];
            Classes.Admin adm = new Classes.Admin();
            ss= adm.getNotifyy();
            Label1.Text =ss[0];
            Label2.Text = ss[1];
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Index.aspx");
        }
    }
}