using REP.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.ExpertDB
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection s = new SqlConnection("Data Source=.\\;Initial Catalog=REP;Integrated Security=True");
            s.Open();
            String sql = "select Title , Description, Answer from SuggestionsAndComplaints where Id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text) + ";";
            SqlCommand command = new SqlCommand(sql, s);
            SqlDataReader sqlread = command.ExecuteReader();
            sqlread.Read();
            TextBox1.Text = sqlread[0].ToString();
            TextBox2.Text = sqlread[1].ToString();
            TextBox3.Text = sqlread[2].ToString();
            sqlread.Close();
            s.Close();
           
        }
    }
}