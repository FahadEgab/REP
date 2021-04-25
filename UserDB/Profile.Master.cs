using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.UserDB
{
    public partial class Profile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] != null && Session["Role"].ToString()=="2")
            {
                Response.Redirect("../AdminDB/dashboard.aspx");
            }
            else if (Session["Name"] != null && Session["Role"].ToString() == "1")
            {
                Response.Redirect("../ExpertDB/Info.aspx");
            }
            User u = new User();
            Label2.Text=u.getNotify(Convert.ToInt32(Session["Id"].ToString()));
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Index.aspx");
        }
    }
}