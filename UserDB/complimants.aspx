<%@ Page Title="" Language="C#" MasterPageFile="~/UserDB/Profile.Master" AutoEventWireup="true" CodeBehind="complimants.aspx.cs" Inherits="REP.UserDB.complimants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>الشكاوى والاقتراحات</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid" dir="rtl">
        <div class="row">
             <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>إرسال شكوى أو إقتراح جديد</h3>
                    </div>
                     <h5>موضوع الشكوى أو الاقتراح</h5>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ></asp:TextBox>
                    <h5>محتوى الشكوى أو الاقتراح</h5>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="10" ></asp:TextBox>
                    
                    <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary" Text="إرسال" OnClick="Button1_Click"  />

                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الشكاوى او الاقتراحات </h3>
                    </div>
                    <asp:GridView ID="GridView1" CssClass="table table-responsive table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:CommandField CancelText="إلغاء" DeleteText="حذف" EditText="تعديل" SelectText="عرض" ShowDeleteButton="True" ShowSelectButton="True" UpdateText="تحديث" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الرسالة" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Title" HeaderText="العنوان" SortExpression="Title" />
                            <asp:BoundField DataField="State" HeaderText="الحالة" SortExpression="State" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Title], [State] FROM [SuggestionsAndComplaints] WHERE ([Send_Id] = @Send_Id)" DeleteCommand="DELETE FROM [SuggestionsAndComplaints] WHERE [Id] = @Id" InsertCommand="INSERT INTO [SuggestionsAndComplaints] ([Id], [Title], [State]) VALUES (@Id, @Title, @State)" UpdateCommand="UPDATE [SuggestionsAndComplaints] SET [Title] = @Title, [State] = @State WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="Send_Id" SessionField="Id" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
           
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تفاصيل الشكوى أو الاقتراح</h3>
                    </div>
                    <h5>موضوع الشكوى أو الاقتراح</h5>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <h5>محتوى الشكوى أو الاقتراح</h5>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="10" Enabled="False"></asp:TextBox>
                    <h5>محتوى الرد</h5>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="10" Enabled="False"></asp:TextBox>
             
                    </div>
            </div>

           
        </div>
    </div>


  
    
    
    
    
    
    
    
    
    
    
    <script>

        document.getElementById("dash").classList.remove("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.remove("active");
        document.getElementById("comp").classList.add("active");


    </script>
</asp:Content>
