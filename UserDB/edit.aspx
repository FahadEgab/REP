<%@ Page Title="" Language="C#" MasterPageFile="~/UserDB/Profile.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="REP.UserDB.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>تعديل المعلومات الشخصية</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>المعلومات الاساسية</h3>
                    </div>

                    <h5>الاسم الاول
                        :   
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>الاسم الاخير
                        :
                       <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>المدينة
                        :
                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>تاريخ الميلاد
                        :
                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </h5>

                    <h5>الجنس
                        :
                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>

                    </h5>

                    <h5>رقم الجوال
                        :
                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>البريد الالكتروني
                        :
                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                    </h5>

                    <h5>اسم المستخدم
                        :
                        <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>رقم المستخدم
                        :
                        <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </h5>

                    <h5>العمر
                        :
                        <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </h5>
                    <h5>كلمة المرور
                        :
                        <asp:TextBox ID="TextBox11" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </h5>
                    <h5>إعادة كلمة المرور
                        :
                        <asp:TextBox ID="TextBox12" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </h5>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="تعديل" OnClick="Button1_Click" />


                </div>
            </div>
            <div class="col-md-2"></div>

            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>حذف حسابي</h3>
                    </div>
                    <h5>
                       <asp:CheckBox ID="CheckBox1" runat="server" />
                        إنني مقر على حذف حسابي نهائيا
                    </h5>
                    <asp:Button CssClass="btn btn-danger" ID="Button2" runat="server" Text="حذف نهائي" OnClick="Button2_Click" />
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <script>

        document.getElementById("dash").classList.remove("active");
        document.getElementById("users").classList.add("active");
        document.getElementById("msgs").classList.remove("active");
        document.getElementById("comp").classList.remove("active");


    </script>
</asp:Content>
