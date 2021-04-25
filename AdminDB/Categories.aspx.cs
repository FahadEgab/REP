using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REP.AdminDB
{
    public partial class Categories : System.Web.UI.Page
    {
        public static string fileu ="";
        Classes.Category category = new Classes.Category();
        Classes.Subcategory subcategory = new Classes.Subcategory();
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton1.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");
            LinkButton2.Attributes.Add("onclick", "document.getElementById('" + FileUpload2.ClientID + "').click(); return false;");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            category.admin = Convert.ToInt32(Session["Id"].ToString());
            if (FileUpload1.HasFile)
            {
               
                FileUpload1.SaveAs(Server.MapPath("../Icons/") + FileUpload1.FileName);
                fileu = "Icons/" + FileUpload1.FileName;
            }
            category.addCategory(TextBox1.Text,fileu);
            Response.Redirect("Categories.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            category.admin = Convert.ToInt32(Session["Id"].ToString());
            if (FileUpload2.HasFile)
            {
                
                FileUpload1.SaveAs(Server.MapPath("../Icons/") + FileUpload2.FileName);
                fileu = "Icons/" + FileUpload2.FileName;
            }
            
            category.editCategory(Convert.ToInt32(DropDownList1.SelectedValue),TextBox2.Text,fileu);
            Response.Redirect("Categories.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            category.admin = Convert.ToInt32(Session["Id"].ToString());
            
            category.deleteCategory(Convert.ToInt32(DropDownList2.SelectedValue));
            Response.Redirect("Categories.aspx");

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            subcategory.category.admin =Convert.ToInt32(Session["Id"].ToString());
            subcategory.addSubCategory(Convert.ToInt32(DropDownList5.SelectedValue),TextBox4.Text);
            Response.Redirect("Categories.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            subcategory.category.admin = Convert.ToInt32(Session["Id"].ToString());
            subcategory.category.categoryId = Convert.ToInt32(DropDownList3.SelectedValue);
            subcategory.editSubCategory(Convert.ToInt32(DropDownList6.SelectedValue), TextBox6.Text);
            Response.Redirect("Categories.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            subcategory.category.admin = Convert.ToInt32(Session["Id"].ToString());
            subcategory.category.categoryId = Convert.ToInt32(DropDownList4.SelectedValue);
            subcategory.deleteSubCategory(Convert.ToInt32(DropDownList7.SelectedValue));
            Response.Redirect("Categories.aspx");
        }
    }
}