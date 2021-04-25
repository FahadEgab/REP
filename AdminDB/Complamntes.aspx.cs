using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    
    public partial class Complamntes : System.Web.UI.Page
    {public static int compl = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            SuggestionsComplaints sx = new SuggestionsComplaints();
            String[] ss = sx.show(Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text));
            TextBox1.Text = ss[0].ToString();
            TextBox2.Text = ss[1].ToString();
            compl = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
            TextBox3.Enabled = true;
            Button1.Visible = true;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SuggestionsComplaints sx = new SuggestionsComplaints();
            String[] ss = sx.show(Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text));
            TextBox1.Text = ss[0].ToString();
            TextBox2.Text = ss[1].ToString();
            TextBox3.Text = ss[2].ToString();
            TextBox3.Enabled = false;
            Button1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Admin addmin = new Admin(Convert.ToInt32(Session["Id"].ToString()));
            
            addmin.manageRecommnd(compl, TextBox3.Text);
            Response.Redirect("Complamntes.aspx");
        }
    }
}