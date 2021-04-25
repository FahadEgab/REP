<%@ Page Title="" Language="C#" MasterPageFile="~/Sign/Site1.Master" AutoEventWireup="true" CodeBehind="signUser1.aspx.cs" Inherits="REP.Sign.signUser1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 8rem; height: 77vh;" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-8" style="padding: 4%;">
                <h1 style="text-align: center;">المعلومات الاساسية</h1>

                <h5>الاسم الاول:
                <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator1" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                </h5>
                <asp:TextBox ID="TextBox1"  runat="server" CssClass="form-control" placeholder="الاسم الاول "></asp:TextBox>
                
                <h5>الاسم الاخير:
                <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator2" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>

                </h5>

                <asp:TextBox ID="TextBox2"  runat="server" CssClass="form-control" placeholder="الاسم الاخير "></asp:TextBox>
               
                <h5>المدينة:

                </h5>

                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="مدينتك الحالية "></asp:TextBox>
                
                <h5>تاريخ الميلاد:
                <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator4" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>

                </h5>

                <asp:TextBox ID="TextBox4" runat="server" Style="direction: rtl" CssClass="form-control" TextMode="Date">    </asp:TextBox>
               
                <h5>الجنس:</h5>

                <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                    <asp:ListItem>الجنس</asp:ListItem>
                    <asp:ListItem Value="M">ذكر</asp:ListItem>
                    <asp:ListItem Value="F">أنثى</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" CssClass="btn btn-primary" Style="float: left; margin-top: 1rem;" runat="server" Text="التالي" OnClick="Button1_Click" />
            </div>

            <div class="col-md-2"></div>






        </div>

    </div>
</asp:Content>
