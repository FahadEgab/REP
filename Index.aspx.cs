using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP
{
    public partial class Index : System.Web.UI.Page
    {
        public static string id_expert = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            Classes.Experts expert = new Classes.Experts();
            
            Literal1.Text = expert.getBest();;
            if (!IsPostBack && id_expert!="0")
            {
                Response.Redirect("ExpertProfile.aspx?expert="+id_expert+"");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
            s.Open();
            String sql = "Insert into messagess(name_sender,msg,email_sender,title) Values('" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "')";
            SqlCommand command = new SqlCommand(sql, s);
            command.ExecuteNonQuery();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            s.Close();
        }
        [WebMethod]
        public static void SetSess(string id)
        {
            id_expert = id;
        }
    }
}