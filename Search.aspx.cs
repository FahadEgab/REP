using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP
{
    public partial class Search : System.Web.UI.Page
    {
        public static string subcs = "0";
        public static string id_expert = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ser"] != null)
            {
                Label1.Text = "نتائج بحثك عن " + Convert.ToString(Request.QueryString["ser"]) + " في التخصصات";
                Subcategory sub = new Subcategory();
                Literal1.Text = sub.getCategorySearch(Convert.ToString(Request.QueryString["ser"]));
                Label2.Text = "نتائج بحثك عن " + Convert.ToString(Request.QueryString["ser"]) + " في الخبراء";
                Classes.Experts expe = new Classes.Experts();
                Literal2.Text = expe.getExpertsSearch(Convert.ToString(Request.QueryString["ser"]));

            }
            else
            {
                Response.Redirect("Index.aspx");
            }

            if (!this.IsPostBack)
            {
                if (id_expert != "0")
                {
                    
                    Response.Redirect("ExpertProfile.aspx?expert=" + id_expert + "");
                }
                if (subcs != "0")
                {

                    Response.Redirect("Experts.aspx?category=" + subcs + "");

                }
            }


        }
        [WebMethod]
        public static void SetSession(string id)
        {
            subcs = id;

        }
        [WebMethod]
        public static void SetSess(string id)
        {
            id_expert = id;
        }
    }
}