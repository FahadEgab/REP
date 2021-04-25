using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace REP.Classes
{
    public class Admin : User
    {
        private SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
        public Admin()
        {

        }
        public Admin(int id)
        {
            this.id = id;
        }
        //This method below to active or unactive the user
        public void activate(int id, bool activiate)
        {
            
            String sql;
            if (activiate == true)
            {
                sql = "UPDATE  Userr set  " +
                "Activate = '" + 1 + "' " +
                "where Id=" + id;
                SqlCommand sqlcom = new SqlCommand(sql, s);
                s.Open();
                sqlcom.ExecuteNonQuery();
                s.Close();
            }
            else
            {

                sql = "UPDATE  Userr set  " +
                "Activate = '" + 0 + "' " +
                "where Id=" + id;
                SqlCommand sqlcom = new SqlCommand(sql, s);
                s.Open();
                sqlcom.ExecuteNonQuery();
                s.Close();
            }


        }
        //This method for sihnup for expert by call
        public bool signUpUsers(int id,String userName, String password, 
            String fName, string lName, String email,
            String city, String img,DateTime bd,char g)
        {

            SqlConnection s = new SqlConnection();
            String sql = "UPDATE  Userr set  " +
                "userName = '" + userName + "'," +
                "password = '" + password + "'," +
                "fName = '" + fName + "'," +
                " lName='" + lName + "'," +
                " email =" + email + "'," +
                " city =" + city + "'," +
                " img ='" + img + "' ," +
                "birth_date='" +bd+ "',"+
                "Gender='" + g + "'," +
                "role= 1 ," +
                "where Id=" + id;

            SqlCommand sqlcoom = new SqlCommand(sql, s);
            try
            {
                s.Open();
                sqlcoom.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;

            }
            finally
            {
                s.Close();
            }
        }
        //This method for sign up expert well
        public void signUpExpert(int id,string work, string[] com, int exp, string[] skill, string bi, string QR)
        {
            s.Open();
            //Expert Table
            String sql = "insert into Expert(Id,QRExpert,Bio,Experince,Work_field) " +
                "VALUES(" + id +
                ",'" + QR +
                "'," + exp +
                ",'" + bi +
                "','" + work + "');";
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            //Other tables with other methadology
            
            foreach (string comp in com)
            {
                string sqlcomp = "insert into Expert_companies(Expert_id,Company) Values (" +
                    id + ",'" + comp + "')";
                sqlcoom = new SqlCommand(sqlcomp, s);
                sqlcoom.ExecuteNonQuery();
            }
            
            foreach (string skil in skill)
            {
                string sqlcomp = "insert into Expert_skills(Expert_id,Skill) Values (" +
                    id + ",'" + skil + "')";
                sqlcoom = new SqlCommand(sqlcomp, s);
                sqlcoom.ExecuteNonQuery();
            }
            
            s.Close();


        }
        //This method for assign expert in subcategory
        public void setExpertSubcategory(int id,int subcategoryId)
        {

            String sql = "insert into Belong(Subcategory_id,Expert_Id) " +
                "VALUES(" + subcategoryId +
                "," + id + ");";
            s.Open();
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            s.Close();
        }
        //This method to manage the recommand
        public void manageRecommnd(int RecomndID, String answer)
        {
            SuggestionsComplaints sc = new SuggestionsComplaints(RecomndID, this.id);
            sc.finish(answer);
        }
        //Send Massegas 
        public void sendMeassage(string email,string title, string body)
        {
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            var mail = new MailMessage();
            mail.From = new MailAddress("Fto2520@gmail.com");
            mail.To.Add(email); // receiver email address or [string]Session["email"] 

            mail.Subject = "منصة الخبراء المتقاعدين ردا على:"+title;
            mail.IsBodyHtml = true;
            mail.Body = body;// [string]Session["name"]
            SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential("Fto2520@gmail.com", "Password");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            
        }
        //Get Numbers 
        public string[] getNumbers()
        {
            string[] ss = new string[7];
            s.Open();

            String sql = "select count(Id) from Userr";
            SqlCommand command = new SqlCommand(sql, s);
            ss[0] = command.ExecuteScalar().ToString();

            sql = "select count(Id) from Expert";
            command = new SqlCommand(sql, s);
            ss[1] = command.ExecuteScalar().ToString();

            sql = "select count(Id) from Consulting";
            command = new SqlCommand(sql, s);
            ss[2] = command.ExecuteScalar().ToString();

            sql = "select count(Id) from Userr";
            command = new SqlCommand(sql, s);
            ss[3] = command.ExecuteScalar().ToString();

            sql = "select count(Id) from Expert";
            command = new SqlCommand(sql, s);
            ss[4] = command.ExecuteScalar().ToString();

            sql = "select count(Id) from Consulting";
            command = new SqlCommand(sql, s);
            ss[5] = command.ExecuteScalar().ToString();

            sql = "select count(Id) from Userr where reg_Date > GETDATE()-7 or reg_Date = GETDATE()";
            command = new SqlCommand(sql, s);
            ss[6] = command.ExecuteScalar().ToString();
            s.Close();

            return ss;
        }
        //Get Money 
        public string[] getNumberss()
        {
            string[] ss = new string[3];
            s.Open();

            String sql = "select count(Id) from Expert";
            SqlCommand command = new SqlCommand(sql, s);
            ss[0] = command.ExecuteScalar().ToString();

            sql = "select count(Id) from Consulting";
            command = new SqlCommand(sql, s);
            ss[1] = command.ExecuteScalar().ToString();

            sql = "Select sum(Price)*0.05 from STCPAY where payed = 1";
            command = new SqlCommand(sql, s);
            ss[2] = command.ExecuteScalar().ToString();

            s.Close();

            return ss;
        }
        //Turn off expert 
        public void stopExpert(int id)
        {
            s.Open();
            SqlCommand sqlcoom;
            
                string sqlcomp = "delete from Rate where To_Id ="+id+"";
                sqlcoom = new SqlCommand(sqlcomp, s);
                sqlcoom.ExecuteNonQuery();
            
            s.Close();
        }
        //Turn on expert 
        public void startExpert(int id)
        {
            s.Open();
            SqlCommand sqlcoom;

            string sqlcomp = "Insert into Rate(Amount,To_Id) values(5," + id + ")";
            sqlcoom = new SqlCommand(sqlcomp, s);
            sqlcoom.ExecuteNonQuery();
            sqlcomp = "update STCPAY set Payed = 1 where EXISTS (select Expert.Id , STCPAY.Id "+
                      " from Expert , STCPAY , consulting "+
                      " where Expert.Id = "+id+" and Expert.Id = consulting.Expert_Id and consulting.Id = STCPAY.Consulting_Id )";
            sqlcoom = new SqlCommand(sqlcomp, s);
            sqlcoom.ExecuteNonQuery();

            s.Close();
        }
        //noticitaion
        public string[] getNotifyy()
        {

            s.Open();
            string[] ss = new string[2];
            String sql = "select count(Id) from Messagess where answer is null ";
            SqlCommand command = new SqlCommand(sql, s);
            ss[0] = command.ExecuteScalar().ToString();


             sql = "select count(Id) from SuggestionsAndComplaints where answer is null ";
             command = new SqlCommand(sql, s);
            ss[1] = command.ExecuteScalar().ToString();

            s.Close();

            return ss;
        }

    }
}