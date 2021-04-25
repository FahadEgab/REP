using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace REP.Classes
{
    public class Category
    {

        public int categoryId;
        private String categoryName;
        private String categoryIcon;
        public int admin;//Problem
        SqlConnection s = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());

        //This method to return the catgory component in the platform
        public String getCategory(int categoryId)
        {
            this.categoryId = categoryId;
            String[] s = new string[3];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["REPConnectionString"].ToString());
            conn.Open();
            String sql = "select * from Category where ID='" + this.categoryId + "'";
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader reader = command.ExecuteReader();
            reader.Read();

            s[1] = reader[1].ToString();
            s[2] = reader[2].ToString();
            conn.Close();



            return "<div class=\"col-md-4\" style=\"margin-bottom:4rem\">" +
                "<div class=\"list-group\"> <p class=\"list-group-item active\">" + s[1] +
                "<img src=\"" + s[2] + "\" width=\"35\" height=\"35\" style=\"float: left; \"></p>";
        }
        //This method to add new category
        public bool addCategory(string catName, string caticon)
        {
            this.categoryName = catName;
            this.categoryIcon = caticon;

            String sql = "insert into Category (Name,Icon) VALUES('" +
                categoryName + "','"
                + categoryIcon + "')";
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            try
            {
                s.Open();
                sqlcoom.ExecuteNonQuery();
                sql = "Select Id from category where Name=" + categoryName + " ";
                sqlcoom = new SqlCommand(sql, s);
                SqlDataReader readd = sqlcoom.ExecuteReader();
                readd.Read();
                this.categoryId = Convert.ToInt32(readd["Id"].ToString());
                readd.Close();
                
                this.history("إظافة الفئة : " + categoryName);
                
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
        //This method to edit the exsist category
        public bool editCategory(int i, string catName, string caticon)
        {
            this.categoryId = i;
            this.categoryName = catName;
            this.categoryIcon = caticon;
            String sql = "UPDATE  Category set  Name =' "
                + categoryName + "' , Icon ='" + categoryIcon +
                "' where ID=" + categoryId;
            SqlCommand sqlcoom = new SqlCommand(sql, s);
            try
            {
                s.Open();
                sqlcoom.ExecuteNonQuery();
                history("تعديل الفئة : " + categoryName);
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
        //This method to delete the category
        public bool deleteCategory(int i)
        {
            this.categoryId = i;
            String sql = "Delete from  Category where ID=" + categoryId;
            String sqll = "Delete from  subcategory where category_id=" + categoryId;
            String sqlll = "Delete from  Belong where Subcategory_id In (select Id from subcategory where category_id=" + categoryId + ")";
            String sqllll = "Delete from  HistoryMange where Category_ID=" + categoryId;
            //String sqlllll = "select Icon  from Category where Id=" + categoryId;
            //SqlCommand sqlcooooom = new SqlCommand(sqlllll, s); ;
            SqlCommand sqlcoooom = new SqlCommand(sqllll, s); ;
            SqlCommand sqlcooom = new SqlCommand(sqlll, s);
            SqlCommand sqlcoom = new SqlCommand(sqll, s);
            SqlCommand sqlcom = new SqlCommand(sql, s);
            
                s.Open();
                //SqlDataReader readi = sqlcooooom.ExecuteReader();
                //readi.Read();
                //FileInfo n = new FileInfo(path);
                //n.Delete();
                //readi.Close();
                sqlcoooom.ExecuteNonQuery();
                sqlcooom.ExecuteNonQuery();
                sqlcoom.ExecuteNonQuery();
                sqlcom.ExecuteNonQuery();
                
                s.Close();
            
                return true;
            
                
        }
        //The method below for create history of category
        public bool history(String change)
        {
            String sql = "insert into HistoryMange (Category_ID,Manager_ID,Change_Date,Change_detail) VALUES(" + categoryId + "," + admin + ",GETDATE(),'" + change + "')";
            SqlCommand sqlcoom = new SqlCommand(sql, s);
           
                
                sqlcoom.ExecuteNonQuery();
            
                return true;
            
            
                
           
        }




    }
}