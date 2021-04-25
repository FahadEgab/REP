using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.ExpertDB
{
    public partial class consult : System.Web.UI.Page
    {
        public static int consultID =0;
        public static int userID =0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ConsultID
            consultID = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
            //UserID
            userID = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text);
            Response.Redirect("Acceptance.aspx");
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ConsultID
            consultID = Convert.ToInt32(GridView3.SelectedRow.Cells[1].Text);
            //UserID
            userID = Convert.ToInt32(GridView3.SelectedRow.Cells[2].Text);
            Response.Redirect("Answer.aspx");
        }

        protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ConsultID
            consultID = Convert.ToInt32(GridView5.SelectedRow.Cells[1].Text);
            //UserID
            userID = Convert.ToInt32(GridView5.SelectedRow.Cells[2].Text);
            Response.Redirect("ShowEnd.aspx");
        }
    }
}