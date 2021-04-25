<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDB/admin.Master" AutoEventWireup="true" CodeBehind="signUpExpert.aspx.cs" Inherits="REP.AdminDB.signUpExpert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>لوحة البيانات</title>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
             <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>تسجيل متقاعد</h3>
                    </div>
                    <%-- Take Expert ID --%>
                    <label>اختر الخبير:</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id] FROM [Userr] WHERE ([Password] IS NULL)"></asp:SqlDataSource>
                    <%-- First Stage --%>
                     <label for="name" class="field-label-13">الاسم الاول:</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="الاسم الاول "></asp:TextBox>


                            <label for="email">الاسم الاخير:</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="الاسم الاخير "></asp:TextBox>


                            <label for="email">المدينة:</label>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="مدينتك الحالية "></asp:TextBox>

                            <label for="email">تاريخ الميلاد:</label>
                            <asp:TextBox ID="TextBox4" runat="server" Style="direction: rtl" CssClass="form-control" TextMode="Date">    </asp:TextBox>

                            <label for="email">الجنس: </label>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                <asp:ListItem>الجنس</asp:ListItem>
                                <asp:ListItem Value="M">ذكر</asp:ListItem>
                                <asp:ListItem Value="F">أنثى</asp:ListItem>
                            </asp:DropDownList>

                     
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="الرجاء إدخال بريد إلكتروني صالح" ControlToValidate="TextBox6" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <label for="email">البريد الالكتروني:
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                            </label>
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="ادخل بريدك الإلكتروني" TextMode="Email"></asp:TextBox>


                            <label for="email">اسم المستخدم:
                                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text=""></asp:Label>
                            </label>
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="إسم المستخدم خاص لايمكن رؤيته من قبل الاخرين"></asp:TextBox>

                           
                      <label for="name" class="field-label-13">عدد سنوات الخبرة:</label>
                            <asp:TextBox ID="TextBox10" runat="server" placeholder="ادخل عدد سنوات الخبرة" CssClass="form-control" TextMode="Number"></asp:TextBox>


                            <label for="email">الشركة المتقاعد منها:</label>
                            <asp:TextBox ID="TextBox11" runat="server" placeholder="اخر شركة عملت بها" CssClass="form-control"></asp:TextBox>


                            <label for="email">نبذة تعريفية:</label>
                            <asp:TextBox ID="TextBox12" runat="server" placeholder="نبذة تعريفية عنك تظهر لطالبي الإستشارة" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                            <label for="email">الخبرات: </label>
                            <asp:TextBox ID="TextBox13" runat="server" placeholder="بين كل خبرة و خبرة ضع \ هكذا تصميم المواقع \ برمجة عالية المستوى" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                            <label for="email">الشركات السابقة:</label>
                            <asp:TextBox ID="TextBox14" runat="server" placeholder="بين كل شركة و شركة ضع \ هكذا شركة وادي طيبة \ شركة الاتصالات السعودية" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

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
                     <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="لاتتطابق كلمات المرور" ControlToCompare="TextBox8" ControlToValidate="TextBox9" ForeColor="#FF3300"></asp:CompareValidator>
                            <label for="email">كلمة المرور:</label>

                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" placeholder="ادخل كلمة المرور" TextMode="Password"></asp:TextBox>

                            <label for="email">إعادة كلمة المرور:</label>

                            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="أعد إدخال كلمة المرور" TextMode="Password"></asp:TextBox>
                           
                         
                              <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Style="width:30%; margin-right:70%; margin-top:10px" Text="تأكيد" OnClick="Button1_Click" />


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
        document.getElementById("stat").classList.remove("active");
        document.getElementById("sige").classList.add("active");

    </script>

</asp:Content>
