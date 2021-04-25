using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace REP.Classes
{
    public class Subcategory
    {

        private int subCategoryId;
        private String subCategoryName;
        public Category category = new Category();
        SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());



        //This method to return the subcatgory component in the platform
        public String getSubCategory()
        {
            String contnet = "";
            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
            connn.Open();
            String sqll = "select Id from Category ";
            SqlCommand commmand = new SqlCommand(sqll, connn);
            SqlDataReader readerr = commmand.ExecuteReader();

            while (readerr.Read())
            {
                int categoryId = Convert.ToInt32(readerr["ID"].ToString());
                this.category.categoryId = categoryId;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
                conn.Open();
                String sql = "select * from Subcategory where category_id='" + category.categoryId + "' And Id In (select subcategory_id from Belong) ";
                SqlCommand command = new SqlCommand(sql, conn);
                SqlDataReader reader = command.ExecuteReader();

                String subcategories = "";
                while (reader.Read())
                {
                    int count = reader.FieldCount;
                    subcategories += "<a href=\"\" class=\"list-group-item\" id=\""+reader["Id"].ToString()+"\" onclick=\"CallCsharpcode(this.id)\" >" + reader[count - 2].ToString() + "</a>";

                }
                if (subcategories == "")
                {

                }
                else
                {
                    contnet += category.getCategory(category.categoryId) + subcategories + "</div></div>";
                }

                reader.Close();
                conn.Close();
            }
            readerr.Close();
            connn.Close();



            return contnet;
        }
        //This method to add new subcategory
        public bool addSubCategory(int id, string name)
        {
            this.subCategoryName = name;
            this.category.categoryId = id;
            String sql = "insert into Subcategory(Name, Category_id) values('"+subCategoryName+"',"+category.categoryId+")";
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            
                s.Open();
                sqlcoom.ExecuteNonQuery();
                history("إظافة الفئةالفرعية : " + subCategoryName);
                s.Close();
            
                return true;
           
           
        }
        //This method to edit the exsist subcategory
        public bool editSubCategory(int id,String name)
        {
            this.subCategoryName = name;
            this.subCategoryId = id;
            String sql = "UPDATE  Subcategory set  Name ='" + subCategoryName + "'" +
                " where Id=" + subCategoryId;
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            try
            {
                s.Open();
                sqlcoom.ExecuteNonQuery();
                history("تعديل الفئةالفرعية : " + subCategoryName);
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
        //This method to delete the subcategory
        public bool deleteSubCategory(int id)
        {
            this.subCategoryId = id;
            String sqll = "select Name from  Subcategory where ID=" + subCategoryId;
            String sql = "Delete from  Subcategory where ID=" + subCategoryId;
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            SqlCommand sqlcooom = new SqlCommand(sqll, s);
            
                s.Open();
                SqlDataReader rad = sqlcooom.ExecuteReader();
                rad.Read();
            string abc = rad["Name"].ToString();
            
                rad.Close();
            history("حذف الفئةالفرعية : " + abc);
            sqlcoom.ExecuteNonQuery();
            s.Close();
                return true;
            
                
            
        }
        public String getCategorySearch( string ser)
        {

            String contnet = "";
            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
            connn.Open();
            String sqll = "select Id from Category ";
            SqlCommand commmand = new SqlCommand(sqll, connn);
            SqlDataReader readerr = commmand.ExecuteReader();

            while (readerr.Read())
            {
                int categoryId = Convert.ToInt32(readerr["ID"].ToString());
                this.category.categoryId = categoryId;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
                conn.Open();
                String sql = "select * from Subcategory where category_id='" + category.categoryId + "' And Name LIKE '%"+ser+"%'  And Id In (select subcategory_id from Belong) ";
                SqlCommand command = new SqlCommand(sql, conn);
                SqlDataReader reader = command.ExecuteReader();

                String subcategories = "";
                while (reader.Read())
                {
                    int count = reader.FieldCount;
                    subcategories += "<a href=\"\" class=\"list-group-item\" id=\"" + reader["Id"].ToString() + "\" onclick=\"CallCsharpcode(this.id)\" >" + reader[count - 2].ToString() + "</a>";

                }
                if (subcategories == "")
                {

                }
                else
                {
                    contnet += category.getCategory(category.categoryId) + subcategories + "</div> <div class=\"col-md-1\"></div>";
                }

                reader.Close();
                conn.Close();
            }
            readerr.Close();
            connn.Close();



            return contnet;

        }
        public bool history(String change)
        {
            String sql = "insert into HistoryMange (Category_ID,Manager_ID,Change_Date,Change_detail) VALUES(" + category.categoryId + "," + category.admin + ",GETDATE(),'" + change + "')";
            SqlCommand sqlcoom = new SqlCommand(sql, s);


            sqlcoom.ExecuteNonQuery();

            return true;




        }
    }
}