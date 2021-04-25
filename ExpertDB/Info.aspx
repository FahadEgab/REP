<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertDB/Expert.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="REP.ExpertDB.Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>المعلومات الاساسية</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-3">

                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>اموال خاصة للمنصة</h3>
                    </div>
                    <img src="../images/code.jpeg" height="200" width="200"/>
                    المبالغ المترتبة عليكم هيا:
                    <asp:Label ID="Label11" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:Button ID="Button1" CssClass="btn btn-success" Style="float: left; margin-top: 1rem;" runat="server" Text="تأكيد الدفع" OnClick="Button1_Click" />
                </div>

            </div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>المعلومات الاساسية</h3>
                    </div>

                    <h5>الاسم الاول
                        :
                       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>الاسم الاخير
                        :
                       <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>المدينة
                        :
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>تاريخ الميلاد
                        :
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>الجنس
                        :
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>رقم الجوال
                        :
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>البريد الالكتروني
                        :
                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>اسم المستخدم
                        :
                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>رقم المستخدم
                        :
                        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                    </h5>

                    <h5>العمر
                        :
                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                    </h5>




                </div>
            </div>
        </div>
    </div>
    <script>

        document.getElementById("dash").classList.add("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.remove("active");
        document.getElementById("comp").classList.remove("active");


    </script>
</asp:Content>
