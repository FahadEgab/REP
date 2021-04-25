using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
           
                User u = new User();
                u.deleteAccount(true, Convert.ToInt32(DropDownList1.SelectedValue));
                
                Response.Redirect("Users.aspx");
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User u = new User();
            u.deleteAccount(false, Convert.ToInt32(DropDownList2.SelectedValue));

            Response.Redirect("Users.aspx");
        }
    }

   
    }
