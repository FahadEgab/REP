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
    public partial class Category : System.Web.UI.Page
    {
        public static string subcs="0";


        protected void Page_Load(object sender, EventArgs e)
        {
            
            Subcategory sc = new Subcategory();
            Literal1.Text = sc.getSubCategory();
           

            if (!this.IsPostBack)
            {

                if (Convert.ToInt32(subcs) != 0)
                {
                    Response.Redirect("Experts.aspx?cate="+subcs+"");
                    
                }
            }
            
        }
       


        [WebMethod]
        public static void SetSession(string id)
        {
            subcs = id;
            
        }

    }
}
