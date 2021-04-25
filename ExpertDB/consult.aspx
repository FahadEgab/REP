<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertDB/Expert.Master" AutoEventWireup="true" CodeBehind="consult.aspx.cs" Inherits="REP.ExpertDB.consult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>
            <%-- Done --%>
            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات الجديدة</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="5" >
                        <Columns>
                            <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="User_Id" HeaderText="رقم المستخدم " SortExpression="User_Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [User_Id], [Title] FROM [consulting] WHERE (([Expert_Id] = @Expert_Id) AND ([State] = @State)) ORDER BY [Quick]">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="إستشارة جديدة" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <%-- Done --%>
            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات المدفوعة</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="User_Id" HeaderText="رقم المستخدم" SortExpression="User_Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [User_Id], [Title] FROM [consulting] WHERE (([Expert_Id] = @Expert_Id) AND ([State] = @State))">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="تم القبول والدفع" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
     
            </div>
        <div class="row">
            <div class="col-md-2"></div>
            <%-- Done --%>
            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات المسعرة</h3>
                    </div>
                    
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="User_Id" HeaderText="رقم المستخدم" SortExpression="User_Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [User_Id], [Title] FROM [consulting] WHERE (([Expert_Id] = @Expert_Id) AND ([State] = @State))">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="مقبولة بانتضار الدفع" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات المنتهية</h3>
                    </div>
                    <asp:GridView ID="GridView5" CssClass="table table-responsive table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource5" OnSelectedIndexChanged="GridView5_SelectedIndexChanged" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="User_Id" HeaderText="رقم المستخدم" SortExpression="User_Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                            <asp:BoundField DataField="end_Date" HeaderText="تاريخ الانتهاء" SortExpression="end_Date" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [User_Id], [Title], [end_Date] FROM [consulting] WHERE (([Expert_Id] = @Expert_Id) AND ([State] = @State))">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="إستشارة ناجحة" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        
        </div>
        
        <div class="row">
            <div class="col-md-2"></div>
            <%-- Done --%>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات المرفوضة</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                            <asp:BoundField DataField="Type" HeaderText="نوع الاستشارة" SortExpression="Type" />
                            <asp:BoundField DataField="State" HeaderText="الحالة" SortExpression="State" />
                            <asp:BoundField DataField="Start_Date" HeaderText="تاريخ البدء" SortExpression="Start_Date" />
                            <asp:BoundField DataField="end_Date" HeaderText="تاريخ الانتهاء" SortExpression="end_Date" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Title], [Type], [State], [Start_Date], [end_Date] FROM [consulting] WHERE (([Expert_Id] = @Expert_Id) AND ([end_Date] IS NOT NULL) AND ([State] NOT LIKE '%' + @State + '%'))">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="إستشارة ناجحة" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
     <script>

        document.getElementById("dash").classList.remove("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.add("active");
        document.getElementById("comp").classList.remove("active");


     </script>
</asp:Content>
