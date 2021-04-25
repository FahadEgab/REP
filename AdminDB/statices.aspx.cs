using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    public partial class statices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Classes.Admin u = new Classes.Admin();
            string[] ss = u.getNumberss();

            Label1.Text = ss[0];

            Label2.Text = ss[1];
            if (ss[2] == "")
            {
                Label3.Text = "0";
            }
            else
            {
                Label3.Text = ss[2];
            }
            if(DropDownList1.Items.Count == 0)
            {
                Button1.Enabled = false;

            }
            if (DropDownList2.Items.Count == 0)
            {
                Button2.Enabled = false;

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Classes.Admin u = new Classes.Admin();
            u.stopExpert(Convert.ToInt32(DropDownList1.SelectedValue));
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Classes.Admin u = new Classes.Admin();
            u.startExpert(Convert.ToInt32(DropDownList2.SelectedValue));
        }
    }
}