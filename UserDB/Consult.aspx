<%@ Page Title="" Language="C#" MasterPageFile="~/UserDB/Profile.Master" AutoEventWireup="true" CodeBehind="Consult.aspx.cs" Inherits="REP.UserDB.Consult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>الاستشارات</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات المنتهية</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="عرض" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Expert_Id" HeaderText="رقم الخبير" SortExpression="Expert_Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                            <asp:BoundField DataField="end_Date" HeaderText="تاريخ الانتهاء" SortExpression="end_Date" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Expert_Id], [Title], [end_Date] FROM [consulting] WHERE (([User_Id] = @User_Id) AND ([State] = @State))">
                        <SelectParameters>
                            <asp:SessionParameter Name="User_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="إستشارة ناجحة" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <%-- Done --%>
            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>استشارات بانتضار الدفع</h3>
                    </div>
                      <asp:GridView CssClass="table table-responsive table-striped" ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView5_SelectedIndexChanged" AllowPaging="True" PageSize="5">
                          <Columns>
                              <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                              <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                              <asp:BoundField DataField="Expert_Id" HeaderText="رقم الخبير" SortExpression="Expert_Id" />
                              <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                          </Columns>
                    </asp:GridView>
           

                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Expert_Id], [Title] FROM [consulting] WHERE (([User_Id] = @User_Id) AND ([State] = @State))">
                        <SelectParameters>
                            <asp:SessionParameter Name="User_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="مقبولة بانتضار الدفع" Name="State" Type="String" />
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
                        <h3>الاستشارات المرسلة</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1"  AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:CommandField SelectText="عرض" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Expert_Id" HeaderText="رقم الخبير" SortExpression="Expert_Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Expert_Id], [Title] FROM [consulting] WHERE (([State] = @State) AND ([User_Id] = @User_Id))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="إستشارة جديدة" Name="State" Type="String" />
                            <asp:SessionParameter Name="User_Id" SessionField="Id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-4">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات المدفوعة</h3>
                    </div>

                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Expert_Id" HeaderText="رقم الخبير" SortExpression="Expert_Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Expert_Id], [Title] FROM [consulting] WHERE (([User_Id] = @User_Id) AND ([State] = @State))">
                        <SelectParameters>
                            <asp:SessionParameter Name="User_Id" SessionField="Id" Type="Int32" />
                            <asp:Parameter DefaultValue="تم القبول والدفع" Name="State" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارات المرفوضة</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource5" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="رقم الاستشارة" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                            <asp:BoundField DataField="Type" HeaderText="نوع الاستشارة" SortExpression="Type" />
                            <asp:BoundField DataField="State" HeaderText="الحالة" SortExpression="State" />
                            <asp:BoundField DataField="Start_Date" HeaderText="تاريخ البدء" SortExpression="Start_Date" />
                            <asp:BoundField DataField="end_Date" HeaderText="تاريخ الانتهاء" SortExpression="end_Date" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Title], [Type], [State], [Start_Date], [end_Date] FROM [consulting] WHERE (([User_Id] = @User_Id) AND ([end_Date] IS NOT NULL) AND ([State] NOT LIKE '%' + @State + '%'))">
                        <SelectParameters>
                            <asp:SessionParameter Name="User_Id" SessionField="Id" Type="Int32" />
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
