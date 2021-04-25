using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.Sign
{
    public partial class signUser1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["firstName"] = TextBox1.Text;
            Session["lasttName"] = TextBox2.Text;
            Session["city"] = TextBox3.Text;
            Session["birth"] = Convert.ToDateTime(TextBox4.Text);
            Session["gender"] = DropDownList1.SelectedValue;
            Response.Redirect("signUser2.aspx");
        }
    }
}