using REP.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    public partial class messages : System.Web.UI.Page
    {
        public static string email = "";
        public static int idOfMass = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox3.Enabled = false;
            Button1.Enabled = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection s = new SqlConnection("Data Source=.\\;Initial Catalog=REP;Integrated Security=True");
            s.Open();
            String sql = "select msg , title, email_sender from Messagess where Id="+Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text)+";";
            SqlCommand command = new SqlCommand(sql, s);
            SqlDataReader sqlread = command.ExecuteReader();
            sqlread.Read();
            TextBox2.Text = sqlread[0].ToString();
            TextBox1.Text = sqlread[1].ToString();
            email = sqlread[2].ToString();
            sqlread.Close();
            s.Close();
         
            Button1.Enabled = true;
            TextBox3.Enabled = true;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
            s.Open();
            String sql = "select msg , title , answer from Messagess where Id=" + Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text) + ";";
            SqlCommand command = new SqlCommand(sql, s);
            SqlDataReader sqlread = command.ExecuteReader();
            sqlread.Read();
            TextBox2.Text = sqlread[0].ToString();
            TextBox1.Text = sqlread[1].ToString();
            TextBox3.Text = sqlread[2].ToString();
            sqlread.Close();
            s.Close();
            idOfMass = Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text);
            TextBox3.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection s = new SqlConnection("Data Source=.\\;Initial Catalog=REP;Integrated Security=True");
            s.Open();
            String sql = "Update Messagess set " +
                "answer = '"+TextBox3.Text +"',"+
                "Admin_Id = "+Convert.ToInt32(Session["Id"].ToString())+""+
                "where Id=" + Convert.ToInt32(Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text)) + ";";
            SqlCommand command = new SqlCommand(sql, s);
            command.ExecuteNonQuery();
           
            s.Close();
            Admin adminSent = new Admin();
            adminSent.sendMeassage(email,TextBox1.Text,TextBox3.Text);
            // Still I wnat send it to email
            Button1.Enabled = false;
            TextBox3.Enabled = false;
        }
    }
}