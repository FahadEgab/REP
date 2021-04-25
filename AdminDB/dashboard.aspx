<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDB/admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="REP.AdminDB.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>لوحة البيانات</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid" dir="rtl">
    <!--1-->
    <div class="row">

      <div class="col-md-12">
        <div class="div_Form card">
          <div class="div_Form_head">
            <h3>إحصائيات</h3>
          </div>
          <div class="div_Form_body">
            <div class="ticket"><i class="bx bx-user">
            </i>
          <h3>المستخدمين</h3>
          <h3>
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

          </h3>
          </div>
            <div class="ticket"><i class="bx bx-pencil">
              
            </i>
            <h3>الخبراء</h3>
              <h3>
                  <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
              </h3>
            </div>
            <div class="ticket"><i class="bx bx-world">

            </i>
            <h3>الاستشارات</h3>
            <h3>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </h3>
          </div>
            
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="div_Form card">
          <div class="div_Form_head">
            <h3>طلبات التسجيل عبر الاتصال</h3>
          </div>
            <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="رقم المستخدم" SortExpression="Id" InsertVisible="False" ReadOnly="True" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Fname" HeaderText="الاسم" SortExpression="Fname" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Phone" HeaderText="الجوال" SortExpression="Phone" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Fname], [Phone] FROM [Userr] WHERE ([Password] IS NULL)">
            </asp:SqlDataSource>
        </div>
      </div>

      <div class="col-md-8">
        <div class="div_Form card">
          <div class="div_Form_head">
            <h3>الشكاوى والاقتراحات</h3>
          </div>
            <asp:GridView ID="GridView2" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Send_Id" HeaderText="رقم المرسل" SortExpression="Send_Id" >
                    <HeaderStyle CssClass="thead-light" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="العنوان" SortExpression="Title" >
                    <HeaderStyle CssClass="thead-light" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Title], [Send_Id] FROM [SuggestionsAndComplaints] ORDER BY [Date]"></asp:SqlDataSource>

        </div>
      </div>
     
      
      <div class="col-md-4">
        <div class="div_Form card">
          <div class="div_Form_head">
            <h3>إحصائيات</h3>
          </div>
          <div class="div_Form_body">
            <h5>
                <asp:Label ID="Label4" Style="float:left" runat="server" Text="Label"></asp:Label> عدد المستخدمين</h5>
            <h5>
                <asp:Label ID="Label5" Style="float:left" runat="server" Text="Label"></asp:Label>عدد الخبراء</h5>
            <h5>
                <asp:Label ID="Label6" Style="float:left" runat="server" Text="Label"></asp:Label>عدد الاستشارات</h5>
            <h5>
                <asp:Label ID="Label7" Style="float:left" runat="server" Text="Label"></asp:Label>عدد الزيارات</h5>
            <h5>
                <asp:Label ID="Label8" Style="float:left" runat="server" Text="Label"></asp:Label>عدد التسجيلات الجديدة</h5>
          </div>
        </div>
      </div>





    </div>
  </div>
    <script>

        document.getElementById("dash").classList.add("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.remove("active");
        document.getElementById("comp").classList.remove("active");
        document.getElementById("cate").classList.remove("active");
        document.getElementById("stat").classList.remove("active");
        document.getElementById("sige").classList.remove("active");

    </script>
</asp:Content>
