<%@ Page Title="" Language="C#" MasterPageFile="~/UserDB/Profile.Master" AutoEventWireup="true" CodeBehind="ShowEnd.aspx.cs" Inherits="REP.UserDB.ShowEnd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>عرض الاستشارة</title>
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

                    <h5 class="field-label-13">اسم مقدم الاستشارة:</h5>
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
                    <asp:TextBox  CssClass="form-control" ID="TextBox5" runat="server" TextMode="MultiLine" Enabled="False"></asp:TextBox>

                    <h5 class="field-label-13">الملف المرفق من قبل الخبير:</h5>
                   <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                

                     <h5 class="field-label-13">تقييم الاستشارة من قبل الخبير:</h5>
                   <div class="input-group ">
                    <asp:TextBox Enabled="false" ID="TextBox7" CssClass="form-control" Style="width:90%" runat="server" TextMode="Number"></asp:TextBox>
                       <img src="../images/star.png" style="height: 30px;" />

                       
                  </div>

                      

                    <h5 class="field-label-13">تقييم الاستشارة من قبل المستخدم:</h5>
                   <div class="input-group ">
                    <asp:TextBox ID="TextBox6" CssClass="form-control" Style="width:90%" runat="server" TextMode="Number"></asp:TextBox>
                    <img src="../images/star.png" style="height: 30px;" />
                  </div>

                    <h5 class="field-label-13">تعليق على الاستشارة من قبل المستخدم:</h5>
                   
                    <asp:TextBox ID="TextBox8" CssClass="form-control"  runat="server" TextMode="SingleLine"></asp:TextBox>
                    
                      <h5 class="field-label-13"><asp:Label ID="Label2" runat="server" Text="تقييم الخبير:"></asp:Label></h5>
                   <div class="input-group ">
                    <asp:TextBox ID="TextBox11" CssClass="form-control" Style="width:90%" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                  </div>
                    
                    <h5 class="field-label-13"><asp:Label ID="Label3" runat="server" Text="التعليق على الخبير:"></asp:Label></h5>
                    <asp:TextBox ID="TextBox12" CssClass="form-control" runat="server"></asp:TextBox>

                  

                    <asp:Button CssClass="browse btn btn-success px-4" Style="font-size: x-large; margin-top: 10px; float: right;" ID="Button2" runat="server" Text="إرسال" OnClick="Button2_Click"  />


                </div>
            </div>
        </div>
    </div>
</asp:Content>
