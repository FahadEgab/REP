using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;

namespace REP.Classes
{
    public class User
    {

        protected String userName;
        protected String fName;
        protected String lName;
        protected int id;
        protected int phone;
        protected String email;
        protected DateTime birthDate;
        protected String password;
        protected String city;
        protected char gender;
        protected double rate;
        protected String img;
        protected String regDate;
        protected int activiate;
        private SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
        public User()
        {

        }
        //The constructor Empty to use method in class
        public User(string name)
        {
            userName = name;
        }
        public User(int id)
        {
            this.id = id;
        }
        //The constructor for create the instance to expert who dose not know about sign up 
        public User(int phon, string name)
        {
            this.phone = phon;
            this.fName = name;

            String sql = "insert into Userr(phone,Fname,reg_Date) VALUES(" + phone + ",'" + fName + "', GETDATE())";
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
        //The method to sign up into platform
        public bool signUp(String userNam, String passwor, String emai,
            string fnam, string lnam, int phon, DateTime bd, string cit, char g, string im, int role)
        {
            this.userName = userNam;
            this.password = passwor;
            this.email = emai;
            this.fName = fnam;
            this.lName = lnam;
            this.phone = phon;
            this.birthDate = bd;
            this.city = cit;
            this.gender = g;
            this.img = im;
            this.activiate = 0;
            String sql = "insert into Userr(user_name,password,email,Fname,Lname,Phone,Age," +
                "Birth_date,Role,City,Gender,Activate,Img,reg_Date) " +
                "VALUES('" + userName +
                "','" + password +
                "','" + email +
                "','" + fName +
                "','" + lName +
                "'," + phone +
                "," + getAge() +
                ",'" + birthDate +
                "'," + role +
                ",'" + city +
                "','" + gender +
                "'," + activiate +
                ",'" + img +
                "', GETDATE())";
            SqlCommand sqlcoom = new SqlCommand(sql, s);

            s.Open();
            sqlcoom.ExecuteNonQuery();
            s.Close();

            return true;










        }
        //sign In method is the method for sign in user from the expert or any user Done
        public bool signIn(String userName, String password)
        {

            this.userName = userName;
            this.password = password;


            String sql = "select * from Userr where user_name='" + userName + "'";
            SqlCommand command = new SqlCommand(sql, s);




            try
            {
                s.Open();
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();

                String y = reader["password"].ToString();
                if (this.password == y)
                {
                    this.id = Convert.ToInt32(reader["Id"].ToString());
                    return true;

                }
                else
                {
                    return false;
                }

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
        //Edit profile method is the method for edit inormation of user from the expert or any user
        public bool editProfile(String fNam, string lNam, int phon, String cit, String emai)
        {
            this.fName = fNam;
            this.lName = lNam;
            this.phone = phon;
            this.city = cit;
            this.email = emai;

            String sql = "UPDATE  Userr set  " +
                "Fname = '" + fName + "'," +
                " Lname='" + lName + "'," +
                " Phone =" + phone + "," +
                " City ='" + city + "'," +
                " Email ='" + email + "' " +
                "where Id=" + id;
            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
            return true;
        }
        //Delete account method is the method for final delete the user from the expert or any user
        public bool deleteAccount(bool who, int id)
        {
            if (who == false)
            {
                String sql = "update consulting set User_Id = null where User_Id=" + id;
                String sqll = "delete from Rate where To_Id = " + id;
                String sqlll = "Update Rate set From_Id = null where from_Id = " + id;
                String sqllll = "Update SuggestionsAndComplaints set Send_Id = null where Send_Id = " + id;
                String sqlllll = "delete from Userr where Id = " + id;
                SqlCommand sqlcom = new SqlCommand(sql, s);

                try
                {

                    s.Open();

                    sqlcom.ExecuteNonQuery();

                    sqlcom = new SqlCommand(sqll, s);
                    sqlcom.ExecuteNonQuery();

                    sqlcom = new SqlCommand(sqlll, s);
                    sqlcom.ExecuteNonQuery();

                    sqlcom = new SqlCommand(sqllll, s);
                    sqlcom.ExecuteNonQuery();

                    sqlcom = new SqlCommand(sqlllll, s);
                    sqlcom.ExecuteNonQuery();

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
            else
            {
                String sql = "update consulting set Expert_Id = null where Expert_Id=" + id;
                String sql2 = "delete from Rate where To_Id = " + id;
                String sql3 = "Update Rate set From_Id = null where from_Id = " + id;
                String sql4 = "Update SuggestionsAndComplaints set Send_Id = null where Send_Id = " + id;
                String sql5 = "delete from Expert_companies where Expert_Id = " + id;
                String sql6 = "delete from Expert_Certificates where Expert_Id = " + id;
                String sql7 = "delete from Expert_skills where Expert_Id = " + id;
                String sql71 = "delete from belong where Expert_Id = " + id;
                String sql8 = "delete from Expert where Id = " + id;
                String sql9 = "delete from Userr where Id = " + id;
                SqlCommand sqlcom = new SqlCommand(sql, s);



                s.Open();

                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql2, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql3, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql4, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql5, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql6, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql7, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql71, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql8, s);
                sqlcom.ExecuteNonQuery();

                sqlcom = new SqlCommand(sql9, s);
                sqlcom.ExecuteNonQuery();
               s.Close();
                return true;

                

            }


        }
        //Get age is method to calculate the age form the birth date
        public int getAge()
        {

            int age;
            age = DateTime.Now.Year - birthDate.Year;
            if (DateTime.Now.DayOfYear < birthDate.DayOfYear)
                age -= 1;

            return age;

        }
        //Get information it is use for many time to display information of the user in profile or expert in Expert page etc...
        public String[] getInformation()
        {

            String[] ss = new string[13];


            s.Open();
            String sql = "select * from Userr where user_name='" + userName + "'";
            SqlCommand command = new SqlCommand(sql, s);

            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            ss[0] = reader[0].ToString();
            ss[1] = reader[1].ToString();
            ss[2] = reader[2].ToString();
            ss[3] = reader[3].ToString();
            ss[4] = reader[4].ToString();
            ss[5] = reader[5].ToString();
            ss[6] = reader[6].ToString();
            ss[7] = reader[7].ToString();
            ss[8] = reader[14].ToString();
            ss[9] = reader[8].ToString();
            ss[10] = reader[9].ToString();
            ss[11] = reader[10].ToString();
            ss[12] = reader[11].ToString();


            s.Close();
            return ss;
        }
        //to Intial recommnd
        public void recommnd(String title, String description)
        {
            SuggestionsComplaints sc = new SuggestionsComplaints(title, description, this.id);
            sc.write();
        }
        //This method for confirm the account
        public bool confirmAccount(int i)
        {
            this.id = i;
            String sql = "UPDATE  Userr set  " +
               "Activate = 1 " +
               "where Id=" + id;
            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
            return true;
        }
        //Change password 
        public bool changePass(string pass)
        {
            this.password = pass;

            String sql = "UPDATE  Userr set  " +
                "password = '" + pass + "' " +
                "where Id=" + id;
            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
            return true;

        }
        //Rate the users
        public void rateUser(double amount, string comment, int fromID, int toID)
        {

            String sql = "Insert into Rate(Amount,Comment,From_Id,To_Id) values(" +
                "" + amount + " , " +
                "'" + comment + "' ," +
                "" + fromID + "," + toID + ")";



            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }
        //Check email username and phone number
        public int checkregistr(string user, string emai, int numb)
        {
            String sqlu = "select count(Id) from Userr where user_name='" + user + "'";
            String sqle = "select count(Id) from Userr where email='" + emai + "'";
            String sqlp = "select count(Id) from Userr where phone='" + numb + "'";
            s.Open();
            SqlCommand command = new SqlCommand(sqlu, s);
            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            if (Convert.ToInt32(reader[0].ToString()) >= 1)
            {
                s.Close();
                return 1;
            }
            reader.Close();
            command = new SqlCommand(sqle, s);
            SqlDataReader reader2 = command.ExecuteReader();
            reader2.Read();
            if (Convert.ToInt32(reader2[0].ToString()) >= 1)
            {
                s.Close();
                return 2;
            }
            reader2.Close();
            command = new SqlCommand(sqlp, s);
            SqlDataReader reader3 = command.ExecuteReader();
            reader3.Read();
            if (Convert.ToInt32(reader3[0].ToString()) >= 1)
            {
                s.Close();
                return 3;
            }
            else
            {
                s.Close();
                return 0;
            }

        }
        //Notification 
        public string getNotify(int id)
        {

            s.Open();

            String sql = "select count(Id) from consulting WHERE User_Id=" + id + "And State = 'مقبولة بانتضار الدفع' ";
            SqlCommand command = new SqlCommand(sql, s);
            string ss = command.ExecuteScalar().ToString();



            s.Close();

            return ss;
        }
    }
}