<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDB/admin.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="REP.AdminDB.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>المستخدمين</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-12">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>المستخدمين</h3>
                    </div>
                    <asp:GridView ID="GridView1"  CssClass="table table-responsive table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField CancelText="إلغاء" DeleteText="حذف" EditText="تعديل" ShowEditButton="True" UpdateText="تحديث" />
                            <asp:BoundField DataField="user_name" HeaderText="اسم المستخدم" SortExpression="user_name" />
                            <asp:BoundField DataField="Fname" HeaderText="الاسم الاول" SortExpression="Fname" />
                            <asp:BoundField DataField="Lname" HeaderText="الاسم الاخير" SortExpression="Lname" />
                            <asp:BoundField DataField="Password" HeaderText="كلمة المرور" SortExpression="Password" />
                            <asp:BoundField DataField="Email" HeaderText="البريد" SortExpression="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="الجوال" SortExpression="Phone" />
                            <asp:BoundField DataField="Age" HeaderText="العمر" SortExpression="Age" />
                            <asp:BoundField DataField="Birth_date" HeaderText="الميلاد" SortExpression="Birth_date" />
                            <asp:BoundField DataField="Role" HeaderText="الرتبة" SortExpression="Role" />
                            <asp:BoundField DataField="City" HeaderText="المدينة" SortExpression="City" />
                            <asp:BoundField DataField="Gender" HeaderText="الجنس" SortExpression="Gender" />
                            <asp:CheckBoxField DataField="Activate" HeaderText="التفعيل" SortExpression="Activate" />
                            <asp:ImageField DataAlternateTextField="Img" DataImageUrlField="Img" HeaderText="الصورة">
                            </asp:ImageField>
                            <asp:BoundField DataField="reg_Date" HeaderText="تاريخ التسجيل" SortExpression="reg_Date" />
                        </Columns>
                    </asp:GridView>                     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" DeleteCommand="DELETE FROM [Userr] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Userr] ([user_name], [Fname], [Lname], [Password], [Email], [Phone], [Age], [Birth_date], [Role], [City], [Gender], [Activate], [Img], [reg_Date]) VALUES (@user_name, @Fname, @Lname, @Password, @Email, @Phone, @Age, @Birth_date, @Role, @City, @Gender, @Activate, @Img, @reg_Date)" SelectCommand="SELECT * FROM [Userr] WHERE ([Password] IS NOT NULL)" UpdateCommand="UPDATE [Userr] SET [user_name] = @user_name, [Fname] = @Fname, [Lname] = @Lname, [Password] = @Password, [Email] = @Email, [Phone] = @Phone, [Age] = @Age, [Birth_date] = @Birth_date, [Role] = @Role, [City] = @City, [Gender] = @Gender, [Activate] = @Activate, [Img] = @Img, [reg_Date] = @reg_Date WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="user_name" Type="String" />
                            <asp:Parameter Name="Fname" Type="String" />
                            <asp:Parameter Name="Lname" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="Int32" />
                            <asp:Parameter Name="Age" Type="Int32" />
                            <asp:Parameter Name="Birth_date" Type="DateTime" />
                            <asp:Parameter Name="Role" Type="Int32" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="Activate" Type="Boolean" />
                            <asp:Parameter Name="Img" Type="String" />
                            <asp:Parameter Name="reg_Date" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="user_name" Type="String" />
                            <asp:Parameter Name="Fname" Type="String" />
                            <asp:Parameter Name="Lname" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="Int32" />
                            <asp:Parameter Name="Age" Type="Int32" />
                            <asp:Parameter Name="Birth_date" Type="DateTime" />
                            <asp:Parameter Name="Role" Type="Int32" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="Activate" Type="Boolean" />
                            <asp:Parameter Name="Img" Type="String" />
                            <asp:Parameter Name="reg_Date" Type="DateTime" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
             <div class="col-md-2"></div>
            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>حذف حساب خبير</h3>
                    </div>
                    <h5>
                       إختيار الخبير:
                    </h5>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id] FROM [Userr] WHERE ([Role] = @Role)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Role" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button CssClass="btn btn-danger" ID="Button8" runat="server" Text="حذف نهائي" OnClick="Button8_Click" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>حذف حساب مستخدم</h3>
                    </div>
                    <h5>
                       إختيار المستخدم:
                    </h5>
                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Id" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id] FROM [Userr] WHERE ([Role] = @Role)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="Role" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button CssClass="btn btn-danger" ID="Button1" runat="server" Text="حذف نهائي" OnClick="Button1_Click" />
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
        document.getElementById("cate").classList.remove("active");
        document.getElementById("stat").classList.remove("active");
        document.getElementById("sige").classList.remove("active");

    </script>

   
</asp:Content>
