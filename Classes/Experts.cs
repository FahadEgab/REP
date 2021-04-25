using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace REP.Classes
{
    public class Experts : User
    {

        private string workFiled;
        private string[] company;
        private int experience;
        private string[] skills;
        private string[] certificates;
        private string bio;
        private string QRCode;
        private SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());

        public void signUpExpert(string work, string[] com, int exp, string[] skill, string[] cert, string bi, string QR)
        {

            //Select query for return ID of user to add it into expert
            s.Open();
            string sq = "select Id from Userr where Phone=" + phone + "";
            SqlCommand sqlcoom = new SqlCommand(sq, s);
            id = Convert.ToInt32(sqlcoom.ExecuteScalar().ToString());
            //Expert Table
            this.workFiled = work;
            this.bio = bi;
            this.experience = exp;
            this.QRCode = QR;
            String sql = "insert into Expert(Id,QRExpert,Bio,Experince,Work_field) " +
                "VALUES(" + id +
                ",'" + QRCode +
                "'," + experience +
                ",'" + bio +
                "','" + workFiled + "');";
            sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            //Other tables with other methadology

            this.company = com;
            if (company != null)
            {
                foreach (string comp in company)
                {
                    string sqlcomp = "insert into Expert_companies(Expert_id,Company) Values (" +
                        id + ",'" + comp + "')";
                    sqlcoom = new SqlCommand(sqlcomp, s);
                    sqlcoom.ExecuteNonQuery();
                }
            }


            this.skills = skill;
            if (skills != null)
            {
                foreach (string skil in skills)
                {
                    string sqlcomp = "insert into Expert_skills(Expert_id,Skill) Values (" +
                        id + ",'" + skil + "')";
                    sqlcoom = new SqlCommand(sqlcomp, s);
                    sqlcoom.ExecuteNonQuery();
                }
            }
            this.certificates = cert;
            if (certificates != null)
            {
                foreach (string certfi in certificates)
                {
                    string sqlcomp = "insert into Expert_Certificates(Expert_id,Certificate) Values (" +
                        id + ",'" + certfi + "')";
                    sqlcoom = new SqlCommand(sqlcomp, s);
                    sqlcoom.ExecuteNonQuery();
                }
            }

            s.Close();


        }
        //This method to accept the consulting or reject  
        public void acceptIgnore(int id, bool state)
        {
            String sql;
            if (state == true)
            {
                sql = "UPDATE  consulting set  " +
                           "State = 'مقبولة بانتضار الدفع' " +
                           "where Id=" + id;
            }
            else
            {
                sql = "UPDATE  consulting set  " +
                            "State = 'مرفوضة من قبل الخبير' ," +
                            "end_Date = GETDATE() " +
                            "where Id=" + id;
            }

            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }
        //This method to pricing the consulting 
        public void pricing(int id, double price)
        {

            String sql = "insert into STCPAY(Invoice_state,consulting_Id,Payed,Price) Values(" +
                                      "'غير مدفوعة'," + id + ",0," + price + ")";
            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            sqlcom.ExecuteNonQuery();
            s.Close();
        }
        //This method for get all experts belong the subcategory
        public string getExperts(int subcategory_id)
        {
            string content = "";
            string sql = "select  sum(r.Amount)/count(r.Amount) as rated,e.work_field,e.Id,u.Fname,u.Lname,u.Img " +
                          "from Userr u,Expert e, Rate r where e.Id = u.Id and e.Id = r.To_Id  AND e.Id In (select Expert_id from Belong where Subcategory_id = " + subcategory_id + ")" +
                          " group by e.Id,e.Work_field,u.Fname,u.Lname,u.Img" +
                          " order by rated DESC";


            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            SqlDataReader sqlread = sqlcom.ExecuteReader();

            while (sqlread.Read())
            {
                content += "<div class=\"col-md-4\"><div class=\"card\">" +
                             "<img class=\"card-img-top\" height=\"198\" style\"width:100%\" src=\"" + sqlread["Img"].ToString() + "\" alt=\"لاتوجد صورة للخبير\" />" +
                             "<h1 class=\"paragraph-2\">" + sqlread["Fname"].ToString() + " " + sqlread["Lname"].ToString() + "</h1>" +
                             "<p class=\"card-text\">" + sqlread["work_field"].ToString() + "</p>" +
                             "<p class=\"card-text\"> " + sqlread["rated"].ToString() + "" +
                             "<img src=\"images/star.png\" width=\"20\" height=\"20\" alt=\"\"></p>" +
                             "<a href = \"\" id=\"" + sqlread["Id"].ToString() + "\" onclick=\"CallCsharpcode(this.id)\" class=\"btn btn-outline-info form-control\">عرض الملف الشخصي</a>" +
                             "</div>" +
                             "</div>";
            }
            s.Close();

            return content;
        }
        //This method to get specifc expert that user choose it Mantance X 
        public string[] getExpert(int Expert_id)
        {
            string[] ss = new string[6];
            string sq1 = "select * from userr,Expert where Expert.Id = userr.Id and Expert.Id =" + Expert_id;
            SqlCommand sqlcom = new SqlCommand(sq1, s);
            s.Open();
            SqlDataReader sqlread = sqlcom.ExecuteReader();
            sqlread.Read();
            ss[0] = sqlread["Fname"].ToString() + " " + sqlread["Lname"].ToString();
            ss[1] = sqlread["Fname"].ToString() + " " + sqlread["Lname"].ToString();
            ss[2] = sqlread["Bio"].ToString();
            ss[3] = sqlread["Experince"].ToString();
            ss[4] = sqlread["Img"].ToString();
            s.Close();
            return ss;
        }
        //This method for assign expert in subcategory
        public void setExpertSubcategory(int subcategoryId)
        {

            String sql = "insert into Belong(Subcategory_id,Expert_Id) " +
                "VALUES(" + subcategoryId +
                "," + id + ");";
            s.Open();
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            s.Close();
        }

        public string getExpertsSearch(string ser)
        {
            string content = "";
            string sql = "select  sum(r.Amount)/count(r.Amount) as rated,e.work_field,e.Id,u.Fname,u.Lname,u.Img " +
                          "from Userr u,Expert e, Rate r where e.Id = u.Id and e.Id = r.To_Id  And u.Fname Like '%" + ser + "%'" +
                          " group by e.Id,e.Work_field,u.Fname,u.Lname,u.Img" +
                          " order by rated DESC";

            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            SqlDataReader sqlread = sqlcom.ExecuteReader();

            while (sqlread.Read())
            {
                content += "<div class=\"col-md-4\"><div class=\"card\">" +
                           "<img class=\"card-img-top\" height=\"198\" style\"width:100%\" src=\"" + sqlread["Img"].ToString() + "\" alt=\"لاتوجد صورة للخبير\" />" +
                           "<h1 class=\"paragraph-2\">" + sqlread["Fname"].ToString() + " " + sqlread["Lname"].ToString() + "</h1>" +
                           "<p class=\"card-text\">" + sqlread["work_field"].ToString() + "</p>" +
                           "<p class=\"card-text\"> " + sqlread["rated"].ToString() + "" +
                           "<img src=\"images/star.png\" width=\"20\" height=\"20\" alt=\"\"></p>" +
                           "<a href = \"\" id=\"" + sqlread["Id"].ToString() + "\" onclick=\"CallCsharpcod(this.id)\" class=\"btn btn-outline-info form-control\">عرض الملف الشخصي</a>" +
                           "</div>" +
                           "</div>";
            }
            s.Close();

            return content;
        }
        public string getBest()
        {
            string content = "";
            string sql = "select  sum(r.Amount)/count(r.Amount) as rated,e.work_field,e.Id,u.Fname,u.Lname,u.Img " +
                          "from Userr u,Expert e, Rate r where e.Id = u.Id and e.Id = r.To_Id" +
                          " group by e.Id,e.Work_field,u.Fname,u.Lname,u.Img" +
                          " order by rated DESC";

            SqlCommand sqlcom = new SqlCommand(sql, s);
            s.Open();
            SqlDataReader sqlread = sqlcom.ExecuteReader();
            int lop = 0;
            while (sqlread.Read() && lop < 3)
            {
                content += "<div class=\"col-md-4\"><div class=\"card\">" +
                           "<img class=\"card-img-top\" height=\"198\" style\"width:100%\" src=\"" + sqlread["Img"].ToString() + "\" alt=\"لاتوجد صورة للخبير\" />" +
                           "<h1 class=\"paragraph-2\">" + sqlread["Fname"].ToString() + sqlread["Lname"].ToString() + "</h1>" +
                           "<p class=\"card-text\">" + sqlread["work_field"].ToString() + "</p>" +
                           "<p class=\"card-text\">  " + sqlread["rated"].ToString() +
                           "<img src=\"images/star.png\" width=\"20\" height=\"20\" alt=\"\"> </p>" +
                           "<a href = \"\" id=\"" + sqlread["Id"].ToString() + "\" onclick=\"CallCsharpcod(this.id)\" class=\"btn btn-outline-info form-control\">عرض الملف الشخصي</a>" +
                           "</div>" +
                           "</div>";
                lop++;
            }
            s.Close();

            return content;
        }
        //This method for change photo 
        public void changePhoto(int id, string img)
        {
            String sql = "update userr set " +
                "Img ='" + img +
                "' where Id = " + id + "";
            s.Open();
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            s.Close();
        }
        //This method for change photo 
        public void changeQR(int id, string QR)
        {

            String sql = "update Expert set " +
                " QRExpert ='" + QR +
                "' where Id = " + id + "";
            s.Open();
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            s.Close();
        }
        //This method for change photo 
        public void changeCategory(int id, int subcat)
        {
            this.id = id;
            String sql = "delete from  Belong " +
                "where Expert_Id = " + id + "";
            s.Open();
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            s.Close();
            setExpertSubcategory(subcat);

        }
        //delete certificate
        public void deleteCertificate(string cert)
        {

            String sql = "delete from  Expert_Certificates " +
                "where Certificate = '" + cert + "'";
            s.Open();
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            s.Close();
        }
        //aa certificate
        public void addCertificate(int id, string cert)
        {

            String sql = "insert into  Expert_Certificates(Expert_Id,Certificate) " +
                "values(" + id + ",'" + cert + "')";
            s.Open();
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            sqlcoom.ExecuteNonQuery();
            s.Close();
        }
        //add companies
        public void addCompanies(int id, string[] companies)
        {
            s.Open();
            SqlCommand sqlcoom;
            foreach (string comp in companies)
            {
                string sqlcomp = "insert into Expert_companies(Expert_id,Company) Values (" +
                    id + ",'" + comp + "')";
                sqlcoom = new SqlCommand(sqlcomp, s);
                sqlcoom.ExecuteNonQuery();
            }
            s.Close();
        }
        //add skills
        public void addSkills(int id, string[] skills)
        {
            s.Open();
            SqlCommand sqlcoom;
            foreach (string skil in skills)
            {
                string sqlcomp = "insert into Expert_skills(Expert_id,Skill) Values (" +
                    id + ",'" + skil + "')";
                sqlcoom = new SqlCommand(sqlcomp, s);
                sqlcoom.ExecuteNonQuery();
            }
            s.Close();
        }
        //start expert 
        public void startExpert()
        {
            s.Open();
            SqlCommand sqlcoom;

            string sqlcomp = "Insert into Rate(Amount,To_Id) values(5," + id + ")";
            sqlcoom = new SqlCommand(sqlcomp, s);
            sqlcoom.ExecuteNonQuery();


            s.Close();
        }
        //Notification 

        public string getNotifyy(int id)
        {

            s.Open();

            String sql = "select count(Id) from consulting WHERE Expert_Id=" + id + "And State = 'تم القبول والدفع' ";
            SqlCommand command = new SqlCommand(sql, s);
            string ss = command.ExecuteScalar().ToString();



            s.Close();

            return ss;
        }
    }
}