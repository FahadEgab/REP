using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Classes.Admin u = new Classes.Admin();
            string[] ss = u.getNumbers();

            Label1.Text = ss[0];
            
            Label2.Text = ss[1];

            Label3.Text = ss[2];

            Label4.Text = ss[3];

            Label5.Text = ss[4];

            Label6.Text = ss[5];

            Label7.Text = Application["NoOfVisitors"].ToString();
        
            Label8.Text = ss[6];
            


        }
    }
}