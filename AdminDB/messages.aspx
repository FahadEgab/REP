<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDB/admin.Master" AutoEventWireup="true" CodeBehind="messages.aspx.cs" Inherits="REP.AdminDB.messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>الرسائل</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الرسائل الجديدة</h3>
                    </div>
                    <asp:GridView ID="GridView1" CssClass="table table-responsive table-striped table-hover" Style="width:100%" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5">
                        <Columns>
                            <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الرسالة" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="email_sender" HeaderText="البريد الالكتروني" SortExpression="email_sender" />
                            <asp:BoundField DataField="title" HeaderText="عنوان الرسالة" SortExpression="title" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" DeleteCommand="DELETE FROM [Messagess] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Messagess] ([email_sender], [title]) VALUES (@email_sender, @title)" SelectCommand="SELECT [Id], [email_sender], [title] FROM [Messagess] WHERE ([answer] IS NULL)" UpdateCommand="UPDATE [Messagess] SET [email_sender] = @email_sender, [title] = @title WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="email_sender" Type="String" />
                            <asp:Parameter Name="title" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="email_sender" Type="String" />
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الرسائل المنتهية</h3>
                    </div>
                    <asp:GridView ID="GridView2" CssClass="table table-responsive table-striped table-hover" Style="width:100%" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" PageSize="5">
                        <Columns>
                            <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الرسالة" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="title" HeaderText="عنوان الرسالة" SortExpression="title" />
                            <asp:BoundField DataField="Admin_Id" HeaderText="رقم المدير المستجيب" SortExpression="Admin_Id" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" DeleteCommand="DELETE FROM [Messagess] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Messagess] ([title], [Admin_Id]) VALUES (@title, @Admin_Id)" SelectCommand="SELECT [Id], [title], [Admin_Id] FROM [Messagess] WHERE ([answer] IS NOT NULL)" UpdateCommand="UPDATE [Messagess] SET [title] = @title, [Admin_Id] = @Admin_Id WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="Admin_Id" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="Admin_Id" Type="Int32" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تفاصيل الرسالة</h3>
                    </div>
                    <h5>موضوع الرسالة</h5>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <h5>محتوى الرسالة</h5>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="10" Enabled="False"></asp:TextBox>
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تفاصيل الرد</h3>
                    </div>
                    <h5>الرد</h5>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="عليك تعبئة نص الرد" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="10"></asp:TextBox>
                    
                    <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary" Text="إرسال" OnClick="Button1_Click" />

                </div>
            </div>

        </div>
    </div>
    <script>

        document.getElementById("dash").classList.remove("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.add("active");
        document.getElementById("comp").classList.remove("active");
        document.getElementById("cate").classList.remove("active");
        document.getElementById("stat").classList.remove("active");
        document.getElementById("sige").classList.remove("active");

    </script>

</asp:Content>
