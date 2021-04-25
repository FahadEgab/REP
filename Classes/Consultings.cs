using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace REP.Classes
{
    public class Consultings
    {
        private string title;
        private int id;
        private string description;
        private string attachedFile;
        private string answerDescription;
        private string answerAttachedFile;
        private string state;
        private string type;
        private bool quick;
        private double rate;
        private SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
        public void write(int expert_Id, int user_Id, string titl, string descriptio, string attachedFil, bool qiuck, string ty)
        {
            this.title = titl;
            this.description = descriptio;
            this.attachedFile = attachedFil;
            this.quick = qiuck;
            this.type = ty;
            this.state = "إستشارة جديدة";

            int quickk = 0;
            if (quick)
            {
                quickk = 1;
            }
            String sql = "insert into consulting" +
                "(Title,Description,Quick,User_Id,Expert_Id,Type,state,Attached_files,Start_Date)" +
                " VALUES(' " + title + " ' , '"
                + description + " ' ," +
                 quickk + " , " +
                 user_Id + " , " +
                 expert_Id + ", '" +
                 type + " ', '" +
                 state + "', '" +
                attachedFile + "', GETDATE())";
            SqlCommand sqlcoom = new SqlCommand(sql, s);

            s.Open();
            sqlcoom.ExecuteNonQuery();



            s.Close();

        }
        public void edit(int i, string titl, string descriptio)
        {
            this.id = i;
            this.title = titl;
            this.description = descriptio;
            
            
            String sql = "UPDATE  consulting set  " +
                "Title = '" + title + "'," +
                " Description='" + description + "'," +
                " attached_files =" + attachedFile + "' " +
                "where Id=" + id;
            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }
        public void delete(int i)
        {
            this.id = i;
            String sql = "delete from consulting where Id=" + id;
            String sqll = "Select * from consulting where Id =  " + id;
            SqlCommand sqlcom = new SqlCommand(sql, s);
            SqlCommand sqllcom = new SqlCommand(sqll, s);
            try
            {

                s.Open();
                SqlDataReader d = sqllcom.ExecuteReader();
                sqlcom.ExecuteNonQuery();

            }
            catch
            {


            }
            finally
            {
                s.Close();
            }
        }
        public void reActive(int expert_Id, int user_Id, string titl, string descriptio, string attachedFil, bool qiuck, string ty)
        {
            this.title = titl;
            this.description = descriptio;
            this.attachedFile = attachedFil;
            this.quick = qiuck;
            this.type = ty;
            this.state = "إستشارة جديدة";

            String sql = "insert into consulting " +
                "(Title,Description,Attached_files,Quick,User_Id,Expert_Id,Type,state,Start_Date)" +
                " VALUES('" + title + "','"
                + description + "'," +
                 quick + ",'" +
                 user_Id + ",'" +
                 expert_Id + ",'" +
                 type + ",'" +
                 state + ",'" +
                attachedFile + "', GETDATE())";
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            try
            {
                s.Open();
                sqlcoom.ExecuteNonQuery();

            }
            catch
            {


            }
            finally
            {
                s.Close();
            }
        }
        //This method to show the consulting
        public String[] getConsulting(int i)
        {
            this.id = i;
            String[] ss = new string[15];


            s.Open();
            String sql = "select * from consulting where Id='" + id + "'";
            SqlCommand command = new SqlCommand(sql, s);

            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            ss[0] = reader[1].ToString();
            ss[1] = reader[2].ToString();
            ss[2] = reader[3].ToString();
            ss[3] = reader[4].ToString();
            ss[4] = reader[5].ToString();
            ss[5] = reader[6].ToString();
            ss[6] = reader[7].ToString();
            ss[7] = reader[8].ToString();
            ss[8] = reader[9].ToString();
            ss[9] = reader[10].ToString();
            ss[10] = reader[11].ToString();
            ss[11] = reader[12].ToString();
            ss[12] = reader[13].ToString();
            ss[13] = reader[14].ToString();
            ss[14] = reader[15].ToString();


            s.Close();
            return ss;
        }
        //This method to accept ot Ignore price from user
        public void acceptThePrice(int i, bool chk)
        {
            this.id = i;
           
            String sql;
            if (chk == true)
            { 
                this.state = "تم القبول والدفع";
                 sql = "UPDATE  consulting set  " +
                                           "State = '" + state + "' " +
                                           "where Id=" + id;
            }
            else
            {
                this.state = "تم الرفض من قبل المستخدم";
                sql = "UPDATE  consulting set  " +
                                           "State = '" + state + "'," +
                                           "end_Date = GETDATE() " +
                                           "where Id=" + id;
            }

            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }
        public void endConsulting(int i , string answer , string attached)
        {
            this.id = i;
            this.answerDescription = answer;
            this.answerAttachedFile = attached;
            String sql = "UPDATE  consulting set  " +
                           "Answer_descriptipn = '"+answerDescription+"' ," +
                           "Answer_attached_file = '"+answerAttachedFile+"' ," +
                           "end_Date = GETDATE() ," +
                           "State = 'إستشارة ناجحة' " +
                           "where Id=" + id;
            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }
        //Rate the consulting from expert and user
        public void rateTheConsulting(int i, string comment, double ra, bool who)
        {
            this.id = i;
            this.rate = ra;
            String sql;
            if (who == true)
            {
                sql = "UPDATE  consulting set  " +
                          "Comment = '" + comment + "'," +
                          "Rate_User = " + rate + " " +
                          " where Id=" + id;
            }
            else
            {
                sql = "UPDATE  consulting set  " +
                          "Rate_Expert = " + rate + " " +
                          " where Id=" + id;
            }



            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }
        //The money related with expert in our website
        public void STCPay()
        {
            //String sql = "UPDATE  User set  " +
            //   "fName = '" + fName + "'," +
            //   " lName='" + lName + "'," +
            //   " phone =" + phone + "'," +
            //   " city =" + city + "'," +
            //   " img ='" + img + "' ," +
            //   "where Id=" + id;
            //SqlCommand sqlcom = new SqlCommand(sql, s);
            //s.Open();
            //sqlcom.ExecuteNonQuery();
            //s.Close();
        }
        //Confirm payed from expert STCPAY
        public void confirm(int i)
        {
            this.id = i;
            
            String sql = "UPDATE  STCPAY set  " +
                           "Invoice_state = 'مدفوعة' " +
                           "where consulting_Id=" + id;
            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }

    }
}