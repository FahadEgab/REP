using REP.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.UserDB
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = new User(Session["Name"].ToString());
            string[] ss= u.getInformation();

            Label1.Text = ss[2];
            Label2.Text = ss[3];
            Label3.Text = ss[10];
            Label4.Text = ss[8];
            if (ss[11]=="M")
            {
                Label5.Text = "ذكر";
            }
            else
            {
                Label5.Text = "انثى";
            }
            
            Label6.Text = ss[6];
            Label7.Text = ss[5];
            Label8.Text = ss[1];
            Label9.Text = ss[0];
            Label10.Text = ss[7];
        }
    }
}