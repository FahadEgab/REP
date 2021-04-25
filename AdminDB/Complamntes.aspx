<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDB/admin.Master" AutoEventWireup="true" CodeBehind="Complamntes.aspx.cs" Inherits="REP.AdminDB.Complamntes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>الشكاوى والاقتراحات</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
             <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الشكاوى والاقتراحات الجديدة</h3>
                    </div>
                    <asp:GridView ID="GridView1" CssClass="table table-responsive table-striped table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5">
                        <Columns>
                            <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Title" HeaderText="العنوان" SortExpression="Title" />
                            <asp:BoundField DataField="Date" HeaderText="تاريخ الارسال" SortExpression="Date" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Title], [Date] FROM [SuggestionsAndComplaints] WHERE ([State] = @State)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="مرسلة" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الشكاوى والاقتراحات المنتهية</h3>
                    </div>
                   <asp:GridView ID="GridView2" CssClass="table table-responsive table-striped table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" PageSize="5">
                       <Columns>
                           <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                           <asp:BoundField DataField="Id" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                           <asp:BoundField DataField="Title" HeaderText="العنوان" SortExpression="Title" />
                           <asp:BoundField DataField="Date" HeaderText="التاريخ" SortExpression="Date" />
                       </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Title], [Date] FROM [SuggestionsAndComplaints] WHERE ([State] = @State)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="تم الرد" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تفاصيل الشكوى أو الاقتراح</h3>
                    </div>
                    <h5>موضوع الشكوى أو الاقتراح</h5>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <h5>محتوى الشكوى أو الاقتراح</h5>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="10" Enabled="False"></asp:TextBox>
                </div>
            </div>

            <div class="col-md-6">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تفاصيل الرد</h3>
                    </div>
                    <h5>الرد</h5>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="10"></asp:TextBox>
                    
                    <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary" Text="إرسال" OnClick="Button1_Click" />

                </div>
            </div>
        </div>
    </div>
    <script>

        document.getElementById("dash").classList.remove("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.remove("active");
        document.getElementById("comp").classList.add("active");
        document.getElementById("cate").classList.remove("active");
        document.getElementById("stat").classList.remove("active");
        document.getElementById("sige").classList.remove("active");

    </script>

</asp:Content>