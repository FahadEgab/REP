<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDB/admin.Master" AutoEventWireup="true" CodeBehind="statices.aspx.cs" Inherits="REP.AdminDB.statices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>لوحة البيانات</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>إحصائيات</h3>
                    </div>

                    <div class="ticket">
                        <i class="bx bx-user"></i>
                        <h3>الخبراء</h3>
                        <h3>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </h3>
                    </div>

                    <div class="ticket">
                        <i class="bx bx-world"></i>
                        <h3>الاستشارات</h3>
                        <h3>
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </h3>
                    </div>

                    <div class="ticket">
                        <i class="bx bx-pencil"></i>
                        <h3>الاموال المدفوعة</h3>
                        <h3>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </h3>
                    </div>

                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>المبالغ الغير مدفوعة</h3>
                    </div>
                    <asp:GridView ID="GridView1" CssClass="table table-responsive table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="رقم الخبير" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Fname" HeaderText="اسم الخبير" SortExpression="Fname" />
                            <asp:BoundField DataField="price" HeaderText="المبالغ المترتبة عليه" ReadOnly="True" SortExpression="price" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="select Expert.Id , Userr.Fname , sum(STCPAY.Price)*0.05 as price
from Expert , Userr , STCPAY ,consulting 
where Expert.Id = Userr.Id and Expert.Id = consulting.Expert_Id and consulting.Id = STCPAY.Consulting_Id and STCPAY.Payed =0
Group by Expert.Id , Userr.Fname ,STCPAY.Id
Order by STCPAY.Id"></asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تعطيل حساب خبير</h3>
                    </div>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="select Expert.Id 
from Expert , Userr , STCPAY ,consulting 
where Expert.Id = Userr.Id and Expert.Id = consulting.Expert_Id and consulting.Id = STCPAY.Consulting_Id and STCPAY.Payed =0
Order by STCPAY.Id"></asp:SqlDataSource>
                    <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="تعطيل" OnClick="Button1_Click" />
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تأكيد وصول الاموال</h3>
                    </div>
                  <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Id" DataValueField="Id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="select Expert.Id 
from Expert , Userr , STCPAY ,consulting 
where Expert.Id = Userr.Id and Expert.Id = consulting.Expert_Id and consulting.Id = STCPAY.Consulting_Id and STCPAY.Payed =0
Order by STCPAY.Id"></asp:SqlDataSource>
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="تفعيل" OnClick="Button2_Click" />
             
                </div>
                
            </div>

        </div>
    </div>
    <script>

        document.getElementById("dash").classList.remove("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.remove("active");
        document.getElementById("comp").classList.remove("active");
        document.getElementById("cate").classList.remove("active");
        document.getElementById("stat").classList.add("active");
        document.getElementById("sige").classList.remove("active");

    </script>

</asp:Content>
