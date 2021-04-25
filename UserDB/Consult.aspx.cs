using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.UserDB
{
    public partial class Consult : System.Web.UI.Page
    {
        public static int consultID = 0;
        public static int expertID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultID = Convert.ToInt32(GridView5.SelectedRow.Cells[1].Text);
            expertID = Convert.ToInt32(GridView5.SelectedRow.Cells[2].Text);
            Response.Redirect("Acceptance.aspx");
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultID = Convert.ToInt32(GridView3.SelectedRow.Cells[1].Text);
            expertID = Convert.ToInt32(GridView3.SelectedRow.Cells[2].Text);
            Response.Redirect("ShowEnd.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultID = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
            expertID = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text);
            Response.Redirect("Consulttt.aspx");
        }
    }
}