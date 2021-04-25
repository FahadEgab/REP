using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace REP.Classes
{
    public class SuggestionsComplaints
    {
        private String title;
        private int id;
        private String description;
        private String answer;
        private int[] userAdmin = new int[2];
        private SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());

        public SuggestionsComplaints()
        {

        }
        //This constructor for intial the value of suggtion for user
        public SuggestionsComplaints(String title,String description,int sendID )
        {
            this.title = title;
            this.description = description;
            userAdmin[0] = sendID;
        }
        //This constructor for initial the value of suggtion for admin
        public SuggestionsComplaints(int id,int ReciveID)
        {
            this.id = id;
            userAdmin[1]=ReciveID;
        }
        // This method to create the suggestions and complaints 
        public bool write()
        {
            
            String sql = "insert into SuggestionsAndComplaints (title,date,state,description,Send_Id)" +
                " VALUES('" + title + "',GETDATE(),'مرسلة',' " + description + "',"+ userAdmin[0] + ")";
            
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            
            
                s.Open();
                sqlcoom.ExecuteNonQuery();
                s.Close();
                return true;
          
               

            
            
        }
        // This method to fade back the suggestions and complaints 
        public bool finish(String answer)
        {
            this.answer = answer;
          
            String sql = "UPDATE  SuggestionsAndComplaints set  Answer = '" + answer + "'," +
                "Recive_ID = " + userAdmin[1]+
                ", State='تم الرد' where Id=" + id; 
            
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
        //Show it 
        public string[] show(int i)
        {
            this.id = i;
            String[] ss = new string[3];


            s.Open();
            String sql = "select Title, Description, Answer from SuggestionsAndComplaints where Id=" + id + "";
            SqlCommand command = new SqlCommand(sql, s);

            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            ss[0] = reader[0].ToString();
            ss[1] = reader[1].ToString();
            ss[2] = reader[2].ToString();
            


            s.Close();
            return ss;
        }
    }
    }
