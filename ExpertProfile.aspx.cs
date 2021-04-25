using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP
{
    public partial class ExpertProfile : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["expert"] != null)
            {
                Classes.Experts exp = new Classes.Experts();
                string[] ss = exp.getExpert(Convert.ToInt32(Request.QueryString["expert"]));
                Label1.Text = ss[0];
                Label3.Text = ss[1];
                Label4.Text = ss[3];
                Label5.Text = ss[2];
                Literal1.Text = "<img height=\"170\"" +
                    " class=\"card-img-top\" src=\"" + ss[4] + "\" " +
                    "alt=\"لاتوجد صورة للخبير \" style=\"width: 100 % \">";
                Session["ExpertChoseId"] = Convert.ToInt32(Request.QueryString["expert"]);
                Experts.id_expert = "0";
                Search.id_expert = "0";
                Index.id_expert = "0";
            }
            else
            {
                Label1.Text = "";
                Label3.Text = "";
                Label4.Text = "";
                Label5.Text = "";
                Literal1.Text = "";
            }
             

        }
    }
}