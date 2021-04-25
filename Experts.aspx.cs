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
    public partial class Experts : System.Web.UI.Page
    {
        string subcategory_id;
        public static string id_expert = "0";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                
                if (Category.subcs == "0" && Search.subcs=="0"&& subcategory_id !="")
                {
                    Classes.Experts experts = new Classes.Experts();
                    Literal1.Text = experts.getExperts(Convert.ToInt32(subcategory_id));
                    
                }
                else if (Search.subcs!="0")
                {
                    subcategory_id = Search.subcs;
                    Classes.Experts experts = new Classes.Experts();
                    Literal1.Text = experts.getExperts(Convert.ToInt32(subcategory_id));
                    Search.subcs = "0";
                }
                 else if(Category.subcs !="0")
                {    
                    subcategory_id = Category.subcs;
                    Classes.Experts experts = new Classes.Experts();
                    Literal1.Text = experts.getExperts(Convert.ToInt32(subcategory_id));
                    Category.subcs = "0";
                    
                }
                else
                {
                    Classes.Experts experts = new Classes.Experts();
                    Literal1.Text = experts.getExperts(Convert.ToInt32(Request.QueryString["cate"]));
                    Category.subcs = "0";
                    Search.subcs = "0";
                }
                if (id_expert != "0")
                {
                    Response.Redirect("ExpertProfile.aspx?expert="+id_expert+"");
                }


            }

        }
        [WebMethod]
        public static void SetSession(string id)
        {
            id_expert = id;
        }

        
    }
}