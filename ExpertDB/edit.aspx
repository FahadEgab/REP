<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertDB/Expert.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="REP.ExpertDB.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>تعديل المعلومات الشخصية</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>المعلومات الاساسية</h3>
                    </div>

                    <h5>الاسم الاول
                        :   
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>الاسم الاخير
                        :
                       <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>المدينة
                        :
                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>تاريخ الميلاد
                        :
                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </h5>

                    <h5>الجنس
                        :
                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>

                    </h5>

                    <h5>رقم الجوال
                        :
                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>البريد الالكتروني
                        :
                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                    </h5>

                    <h5>اسم المستخدم
                        :
                        <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                    </h5>

                    <h5>رقم المستخدم
                        :
                        <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </h5>

                    <h5>العمر
                        :
                        <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </h5>
                    <h5>كلمة المرور
                        :
                        <asp:TextBox ID="TextBox11" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </h5>
                    <h5>إعادة كلمة المرور
                        :
                        <asp:TextBox ID="TextBox12" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </h5>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="تعديل" OnClick="Button1_Click" />


                </div>
            </div>
            <div class="col-md-2"></div>
             <%-- Category --%>
            <div class="col-md-2"></div>
            <div class="col-md-8">

                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>التخصص</h3>
                    </div>
                    <label for="email">أولا اختر القسم:</label>
                            <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="Id" ></asp:DropDownList>
                          
                            
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [name], [Id] FROM [Category]"></asp:SqlDataSource>
                          
                            
                            <label for="email">ثانيا اختر التخصص:</label>
                            <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                         
                              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Subcategory] WHERE ([Category_id] = @Category_id)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="DropDownList3" Name="Category_id" PropertyName="SelectedValue" Type="Int32" />
                                  </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="تعديل" OnClick="Button2_Click"  />
                </div>
            </div>
            <div class="col-md-2"></div>
            <%-- Certificates --%>

            <div class="col-md-2"></div>
            <div class="col-md-8">

                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الشهادات</h3>
                    </div>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <h5>عرض الشهادات</h5>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource5">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <a href='../<%# Eval("Certificate") %>' target="_blank"><%# Eval("Certificate") %></a>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificateTextBox" runat="server" Text='<%# Bind("Certificate") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="" >
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="CertificateTextBox" runat="server" Text='<%# Bind("Certificate") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <a href='../<%# Eval("Certificate") %>' target="_blank" ><%# Eval("Certificate") %></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" class="table table-responsive " runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">الرقم</th>
                                                <th runat="server">الشهادة</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificateLabel" runat="server" Text='<%# Eval("Certificate") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Certificate] FROM [Expert_Certificates] WHERE ([Expert_id] = @Expert_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_id" SessionField="Id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <h5>حذف الشهادات</h5>
                    <asp:GridView ID="GridView4" CssClass="table table-responsive table-striped" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource6" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" PageSize="5">
                        <Columns>
                            <asp:CommandField SelectText="حذف" ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Certificate" HeaderText="الشهادة" SortExpression="Certificate" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Certificate] FROM [Expert_Certificates] WHERE ([Expert_id] = @Expert_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_id" SessionField="Id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="input-group " dir="rtl">

                      <asp:FileUpload ID="FileUpload3" runat="server" accept=".pdf" onchange="fileInfoo()" Style="display: none" AllowMultiple="False" />

                    <asp:TextBox ID="TextBox25" CssClass="form-control form-control-lg" Style="width: 80%; float: right;"
                        placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                    <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton3" Style="float: right; width: 20%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                </div>
                <script>
                    function fileInfoo() {
                        var str = document.getElementById('<%=FileUpload3.ClientID%>').value;

                                    document.getElementById('<%=TextBox25.ClientID%>').value = "تم العمل بها";
                        event.defaultPrevented();
                    }
                </script>
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="إضافة" OnClick="Button3_Click"  />
                </div>
                </div>
            <div class="col-md-2"></div>
            <%-- photo --%>
            <div class="col-md-2"></div>
            <div class="col-md-8">

                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الصورة الشخصية</h3>
                    </div>
                     <label for="name" class="field-label-13">صورة شخصية:</label>

                            <div class="input-group " dir="rtl">


                                <asp:FileUpload accept=".png,.jpg,.jpeg" ID="FileUpload2" runat="server" onchange="fileInfo()" Style="display: none" />

                                <asp:TextBox ID="TextBox16" CssClass="form-control form-control-lg" Style="width: 80%; float: right;"
                                    placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                                <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton2" Style="float: right; width: 20%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                            </div>
                            <script>
                                function fileInfo() {
                                    var str = document.getElementById('<%=FileUpload2.ClientID%>').value;
                            var res = str.substring(12);
                            document.getElementById('<%=TextBox16.ClientID%>').value = res;
                                    event.defaultPrevented();
                                }
                            </script>
               <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Text="تعديل" OnClick="Button4_Click"  />

                </div>

                
            </div>
            <div class="col-md-2"></div>
            <%-- QR --%>
            <div class="col-md-2"></div>
            <div class="col-md-8">

                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الكود الخاص بك في STCPAY</h3>
                    </div>
                      <label for="email">الرمز الشريطي الخاص بك STCPAY:</label>

                            <div class="input-group " dir="rtl">


                                <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg" onchange="fileInf()" Style="display: none" />

                                <asp:TextBox ID="TextBox15" CssClass="form-control form-control-lg" Style="width: 80%; float: right;"
                                    placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                                <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton1" Style="float: right; width: 20%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                            </div>
                            <script>
                                function fileInf() {
                                    var str = document.getElementById('<%=FileUpload1.ClientID%>').value;
                                    var res = str.substring(12);
                            document.getElementById('<%=TextBox15.ClientID%>').value = res;
                                    event.defaultPrevented();
                                }
                            </script>
                    <asp:Button ID="Button5" runat="server" CssClass="btn btn-primary" Text="تعديل" OnClick="Button5_Click"  />
                </div>

            </div>

            <div class="col-md-2"></div>
            <%-- Skills and Companies --%>
            <div class="col-md-2"></div>
            <div class="col-md-4">

                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الخبرات</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField CancelText="إلغاء" DeleteText="حذف" EditText="تعديل" InsertText="إضافة" NewText="جديد" ShowDeleteButton="True" UpdateText="تحديث" />
                            <asp:BoundField DataField="Id" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Skill" HeaderText="الخبرة" SortExpression="Skill" />
                        </Columns>
                    </asp:GridView>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" DeleteCommand="DELETE FROM [Expert_skills] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Expert_skills] ([Skill]) VALUES (@Skill)" SelectCommand="SELECT [Id], [Skill] FROM [Expert_skills] WHERE ([Expert_id] = @Expert_id)" UpdateCommand="UPDATE [Expert_skills] SET [Skill] = @Skill WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Skill" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_id" SessionField="Id" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Skill" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <h5>الخبرات: </h5>

                <asp:TextBox ID="TextBox22" runat="server" placeholder="بين كل خبرة و خبرة ضع \ هكذا تصميم المواقع \ برمجة عالية المستوى" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

               <asp:Button ID="Button7" runat="server" CssClass="btn btn-primary" Text="إضافة" OnClick="Button7_Click"  />

                </div>

            </div>
            <div class="col-md-4">

                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الشركات</h3>
                    </div>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4">
                        <Columns>
                            <asp:CommandField CancelText="إلغاء" DeleteText="حذف" EditText="تعديل" InsertText="إظافة" NewText="جديد" SelectText="عرض" ShowDeleteButton="True" UpdateText="تحديث" />
                            <asp:BoundField DataField="Id" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Company" HeaderText="الشركة" SortExpression="Company" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" DeleteCommand="DELETE FROM [Expert_companies] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Expert_companies] ([Company]) VALUES (@Company)" SelectCommand="SELECT [Id], [Company] FROM [Expert_companies] WHERE ([Expert_id] = @Expert_id)" UpdateCommand="UPDATE [Expert_companies] SET [Company] = @Company WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Company" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_id" SessionField="Id" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Company" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <h5>الشركات السابقة:</h5>

                <asp:TextBox ID="TextBox23" runat="server" placeholder="بين كل شركة و شركة ضع \ هكذا شركة وادي طيبة \ شركة الاتصالات السعودية" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="Button6" runat="server" CssClass="btn btn-primary" Text="إضافة" OnClick="Button6_Click"   />

                </div>

            </div>
            <div class="col-md-2"></div>

            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>حذف حسابي</h3>
                    </div>
                    <h5>
                       <asp:CheckBox ID="CheckBox1" runat="server" />
                        إنني مقر على حذف حسابي نهائيا
                    </h5>
                    <asp:Button CssClass="btn btn-danger" ID="Button8" runat="server" Text="حذف نهائي" OnClick="Button8_Click" />
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


    </script>
</asp:Content>
