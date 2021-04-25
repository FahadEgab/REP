<%@ Page Title="" Language="C#" MasterPageFile="~/Sign/Site1.Master" AutoEventWireup="true" CodeBehind="speical.aspx.cs" Inherits="REP.Sign.speical" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container" style="margin-top: 8rem; height:77vh;" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-8" style="padding: 4%;">
              <h1 style="text-align: center;">التسجيل عبر الاتصال للخبير</h1>  
              
              
              <h5>الاسم:
                     <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator1" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

              </h5>
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
             
              <h5>رقم الجوال:
                    <asp:RegularExpressionValidator ForeColor="#FF3300" ValidationExpression="\d{10}" ID="RegularExpressionValidator1" runat="server" ErrorMessage="أدخل رقم الهاتف بهذه الطريقة 0500000000" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>

              </h5>
                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
              
              <h5 style="text-align:center;color:forestgreen" >
                  <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
              </h5>
                <asp:Button ID="Button1" CssClass="btn btn-success"  Style="float: left; margin-top: 1rem;" runat="server" Text="إرسال" OnClick="Button1_Click" />
              
            </div>

            <div class="col-md-2"></div>






        </div>

    </div>
</asp:Content>
