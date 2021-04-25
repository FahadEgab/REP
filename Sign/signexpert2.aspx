<%@ Page Title="" Language="C#" MasterPageFile="~/Sign/Site1.Master" AutoEventWireup="true" CodeBehind="signexpert2.aspx.cs" Inherits="REP.Sign.signexpert2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-top: 8rem; height: 77vh;" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-8" style="padding: 4%;">
                <h1 style="text-align: center;">معلومات الاتصال</h1>

                <h5>رقم الجوال:
                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text=""></asp:Label>
                <asp:RegularExpressionValidator ForeColor="#FF3300" ValidationExpression="\d{10}" ID="RegularExpressionValidator1" runat="server" ErrorMessage="أدخل رقم الهاتف بهذه الطريقة 0500000000" ControlToValidate="TextBox5"></asp:RegularExpressionValidator>


                </h5>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="ادخل رقم الجوال" TextMode="Phone" AutoPostBack="False"></asp:TextBox>


                <h5>البريد الالكتروني:
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="الرجاء إدخال بريد إلكتروني صالح" ControlToValidate="TextBox6" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                </h5>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="ادخل بريدك الإلكتروني" TextMode="Email"></asp:TextBox>

                <h5>اسم المستخدم:
                    <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red"></asp:Label>
                             <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator1" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>

                </h5>

                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="إسم المستخدم خاص لايمكن رؤيته من قبل الاخرين"></asp:TextBox>


                <h5>كلمة المرور:
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="لاتتطابق كلمات المرور" ControlToCompare="TextBox8" ControlToValidate="TextBox9" ForeColor="#FF3300"></asp:CompareValidator>

                </h5>
                          
                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" placeholder="ادخل كلمة المرور" TextMode="Password"></asp:TextBox>

                <h5>اكتب كلمة المرور مرة اخرى:</h5>

                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="أعد إدخال كلمة المرور" TextMode="Password"></asp:TextBox>

                <asp:Button CssClass="btn btn-primary" Style="float: left; margin-top: 1rem;" ID="Button1" runat="server" Text="التالي" OnClick="Button1_Click"  />
               
            </div>

            <div class="col-md-2"></div>






        </div>

    </div>
</asp:Content>
