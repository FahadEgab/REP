using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.UserDB
{
    public partial class complimants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SuggestionsComplaints sc = new SuggestionsComplaints(TextBox4.Text, TextBox5.Text, Convert.ToInt32(Session["Id"].ToString()));
            sc.write();
        }
    }
}