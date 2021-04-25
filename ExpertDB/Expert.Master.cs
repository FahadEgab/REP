using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.ExpertDB
{
    public partial class Expert : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
           

            if (Session["Name"] != null && Session["Role"].ToString() == "2")
            {
                Response.Redirect("../AdminDB/dashboard.aspx");
            }
            else if (Session["Name"] != null && Session["Role"].ToString() == "1")
            {

            }
            else if (Session["Name"] != null && Session["Role"].ToString() == "0")
            {
                Response.Redirect("Info.aspx");
            }
            else
            {
                Response.Redirect("../Index.aspx");
            }
            Classes.Experts exp = new Classes.Experts();
            Label2.Text=exp.getNotifyy(Convert.ToInt32(Session["Id"].ToString()));

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Index.aspx");
        }
    }
}
