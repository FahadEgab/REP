<%@ Page Title="" Language="C#" MasterPageFile="~/Sign/Site1.Master" AutoEventWireup="true" CodeBehind="signexpert3.aspx.cs" Inherits="REP.Sign.signexpert3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="container" style="margin-top: 8rem;" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-8" style="padding: 4%; margin-bottom: 6rem;">
                <h1 style="text-align: center;">معلومات الخبير</h1>
                

                <h5>صورة شخصية:</h5>

                <div class="input-group " dir="rtl">


                    <asp:FileUpload accept=".png,.jpg,.jpeg" ID="FileUpload1" runat="server" onchange="fileInfo()" Style="display: none" />

                    <asp:TextBox ID="TextBox24" CssClass="form-control form-control-lg" Style="width: 80%; float: right;"
                        placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                    <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton1" Style="float: right; width: 20%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                </div>
                <script>
                    function fileInfo() {
                        var str = document.getElementById('<%=FileUpload1.ClientID%>').value;
                                    var res = str.substring(12);
                                    document.getElementById('<%=TextBox24.ClientID%>').value = res;
                        event.defaultPrevented();
                    }
                </script>

                <h5>عدد سنوات الخبرة:
                       <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator1" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox19"></asp:RequiredFieldValidator>

                </h5>

                <asp:TextBox ID="TextBox19" runat="server" placeholder="ادخل عدد سنوات الخبرة" CssClass="form-control" TextMode="Number"></asp:TextBox>


                <h5>الشركة المتقاعد منها:
                           <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator2" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox20"></asp:RequiredFieldValidator>

                </h5>

                <asp:TextBox ID="TextBox20" runat="server" placeholder="اخر شركة عملت بها" CssClass="form-control"></asp:TextBox>


                <h5>نبذة تعريفية:
                           <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator3" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox21"></asp:RequiredFieldValidator>

                </h5>

                <asp:TextBox ID="TextBox21" runat="server" placeholder="نبذة تعريفية عنك تظهر لطالبي الإستشارة" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                <h5>الخبرات: </h5>

                <asp:TextBox ID="TextBox22" runat="server" placeholder="بين كل خبرة و خبرة ضع \ هكذا تصميم المواقع \ برمجة عالية المستوى" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                <h5>الشركات السابقة:</h5>

                <asp:TextBox ID="TextBox23" runat="server" placeholder="بين كل شركة و شركة ضع \ هكذا شركة وادي طيبة \ شركة الاتصالات السعودية" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>


                <h5>الشهادات:</h5>

                <div class="input-group " dir="rtl">


                    <asp:FileUpload ID="FileUpload2" runat="server" accept=".pdf" onchange="fileInfoo()" Style="display: none" AllowMultiple="True" />

                    <asp:TextBox ID="TextBox25" CssClass="form-control form-control-lg" Style="width: 80%; float: right;"
                        placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                    <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton2" Style="float: right; width: 20%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                </div>
                <script>
                    function fileInfoo() {
                        var str = document.getElementById('<%=FileUpload2.ClientID%>').value;

                                    document.getElementById('<%=TextBox25.ClientID%>').value = "تم العمل بها";
                        event.defaultPrevented();
                    }
                </script>

                <h5>الرمز الشريطي الخاص بك STCPAY:
                       <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator4" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="TextBox26"></asp:RequiredFieldValidator>

                </h5>

                <div class="input-group " dir="rtl">


                    <asp:FileUpload ID="FileUpload3" runat="server" accept=".png,.jpg,.jpeg" onchange="fileInf()" Style="display: none" />

                    <asp:TextBox ID="TextBox26" CssClass="form-control form-control-lg" Style="width: 80%; float: right;"
                        placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                    <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton3" Style="float: right; width: 20%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                </div>
                <script>
                    function fileInf() {
                        var str = document.getElementById('<%=FileUpload3.ClientID%>').value;

                                    document.getElementById('<%=TextBox26.ClientID%>').value = str;
                        event.defaultPrevented();
                    }
                </script>


                <h5>أولا اختر القسم:

                </h5>
                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>


                <h5>ثانيا اختر التخصص:
                           <asp:RequiredFieldValidator ForeColor="#FF3300" ID="RequiredFieldValidator5" runat="server" ErrorMessage="هذا الحقل مطلوب*" BorderStyle="None" ControlToValidate="DropDownList4"></asp:RequiredFieldValidator>

                </h5>
                <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT * FROM [Subcategory] WHERE ([Category_id] = @Category_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="Category_id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server"  CssClass="btn btn-success" Style="float: left; margin-top: 1rem;" Text="تأكيد" OnClick="Button1_Click"  />
            </div>

            <div class="col-md-2"></div>






        </div>

    </div>




















</asp:Content>
