<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Consulting.aspx.cs" Inherits="REP.Consulting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/consult.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" dir="rtl" style="text-align: right; margin-top:9rem;">
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8" style="margin-bottom:100px">
                <h1 class="heading-5" style="text-align: center">نموذج طلب إستشارة</h1>
                <h5>عنوان الإستشارة:</h5>
                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>

                <h5>نوع الإستشارة:</h5>
                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>


                <h5>نص الإستشارة:</h5>
                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>

                
                <asp:Label ID="Label1" runat="server" Text="سرعة الإستشارة: طبيعية"></asp:Label>
                <!-- Rounded switch -->
                <br />
                <label class="switch">
                    <asp:CheckBox ID="chkOnOff" runat="server"  Checked="false" AutoPostBack="True" OnCheckedChanged="chkOnOff_CheckedChanged" />
                    <span class="slider round"></span>
                </label>
                <br />
                <label class="field-label-13">إرفاق ملف:</label>

                <div class="input-group " dir="rtl">


                    <asp:FileUpload accept=".pdf" ID="FileUpload1" runat="server" onchange="fileInfo()" Style="display: none" />

                    <asp:TextBox ID="TextBox3" CssClass="form-control form-control-lg" Style="width: 80%; float: right;"
                        placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                    <asp:LinkButton CssClass="browse btn btn-primary px-4" ID="LinkButton1" Style="float: right; width: 20%; " runat="server">إستعراض</asp:LinkButton>
                </div>
                <script>
                    function fileInfo() {
                        var str = document.getElementById('<%=FileUpload1.ClientID%>').value;
                                    var res = str.substring(12);
                                    document.getElementById('<%=TextBox3.ClientID%>').value = res;
                        event.defaultPrevented();
                    }
                </script>


                <asp:Button CssClass="browse btn btn-primary px-4" Style="font-size: x-large; margin-top: 10px; float: left;" ID="Button1" runat="server" Text="إرسال" OnClick="Button1_Click" />
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
 


    <script>
        document.getElementById("bes").style.display = "none";
        document.getElementById("abou").style.display = "none";
        document.getElementById("contac").style.display = "none";
    </script>

</asp:Content>
