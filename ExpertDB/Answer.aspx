<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertDB/Expert.Master" AutoEventWireup="true" CodeBehind="Answer.aspx.cs" Inherits="REP.ExpertDB.Answer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>الرد على الاستشارة</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>الاستشارة الجديدة</h3>
                    </div>
                    <h5 class="field-label-13">عنوان الإستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>

                    <h5 class="field-label-13">اسم طالب الاستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>

                    <h5 class="field-label-13">نوع الاستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>

                    <h5 class="field-label-13">نص الاستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="form-control" ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>

                    <h5 class="field-label-13">الملفات المرفقة:</h5>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                   
                    <h5>
                    <asp:Label ID="Label1" runat="server" Text="سرعة الإستشارة: طبيعية"></asp:Label>
                   </h5>

                    <h5 class="field-label-13">نص الرد:</h5>
                    <asp:TextBox  CssClass="form-control" ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>

                    <h5 class="field-label-13">إرفاق ملف:</h5>
                   <div class="input-group " dir="rtl">


                    <asp:FileUpload accept=".pdf" ID="FileUpload1" runat="server" onchange="fileInfo()" Style="display: none" />

                    <asp:TextBox ID="TextBox6" CssClass="form-control form-control-lg" Style="width: 60%; float: right;"
                        placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                    <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton1" Style="float: right; width: 40%; " runat="server">إستعراض</asp:LinkButton>
                </div>
                <script>
                    function fileInfo() {
                        var str = document.getElementById('<%=FileUpload1.ClientID%>').value;
                                    var res = str.substring(12);
                                    document.getElementById('<%=TextBox6.ClientID%>').value = res;
                        event.defaultPrevented();
                    }
                </script>

                     <h5 class="field-label-13">تقييم الاستشارة:</h5>
                   <div class="input-group ">
                    <asp:TextBox ID="TextBox7" CssClass="form-control" Style="width:90%" runat="server" TextMode="Number"></asp:TextBox>
                    <img src="../images/star.png" style="height: 30px;" />
                  </div>

                    <h5 class="field-label-13">تقييم المستخدم:</h5>
                   <div class="input-group ">
                    <asp:TextBox ID="TextBox8" CssClass="form-control" Style="width:90%" runat="server" TextMode="Number"></asp:TextBox>
                    <img src="../images/star.png" style="height: 30px;" />
                  </div>

                    <h5 class="field-label-13">التعليق على المستخدم:</h5>
                    <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server"></asp:TextBox>

                    <asp:Button CssClass="browse btn btn-success px-4" Style="font-size: x-large; margin-top: 10px; float: right;" ID="Button2" runat="server" Text="إرسال" OnClick="Button2_Click"  />


                </div>
            </div>
        </div>
    </div>
</asp:Content>
