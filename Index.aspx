<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="REP.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>منصة الخبراء المتقاعدين</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="jumbotron jumbotron-fluid" style="text-align: right;">
        <div class="container" dir="rtl" style="margin-top: 6rem;">
            <h1>منصة الخبراء المتقاعدين</h1>
            <p class="hiden">منصة تربط الخبراء المتقاعدين بالعملاء من اجل تقديم

                استشارات لتطوير عمل الشركات والافراد والمؤسسات

                التي تطمح لنيل أفضل الخدمات</p>
        </div>
    </div>



    <div class="container" dir="rtl">
        <div class="row">

     
            <div class="col-md-12" style="text-align: center;">
                <h1 class="headingss" id="best" style="padding-top: 7rem;">أفضل الخبراء</h1>
                <hr />
            </div>

            <asp:Literal ID="Literal1" runat="server"></asp:Literal>

            <div class="col-md-12" style="text-align: center;">
                <h1 class="headingss" id="about" style="padding-top: 7rem;">من نحن</h1>
                <p>منصة الخبراء المتقاعدين مشروع طلاب قسم نظم المعلومات الحاسوبية في جامعة طيبة. احد اهم اهدافنا هو حل مشكلة اندثار الخبرات بعد التقاعد,لذلك قدمنا جميع الخيارات المتاحة لنشر هذه الخبرة عن طريق تقديم استشارات. وايضاً, حل مشكلة الفراغ والمشاكل المالية بعد التقاعد. منصة الخبراء المتقاعدين حلقة تصل بين الخبراء و المستفيدين من افراد وشركات.</p>
                <hr />
            </div>
            <div class="container">
                <div class="row">
                  
                      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="our-team">
                      <div class="picture">
                        <img class="img-fluid" src="images/M1.jpg" height="130" width="130">
                      </div>
                      <div class="team-content">
                        <h3 class="name">فهد المطيري</h3>
                        
                      </div>
                      <ul class="social">
                        <li><a href="#"  aria-hidden="true">0558080988</a></li>
                              </ul>
                    </div>
                  </div>

                  <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="our-team">
                      <div class="picture">
                        <img class="img-fluid" src="images/M2.jpg">
                      </div>
                      <div class="team-content">
                        <h3 class="name">ماجد دميص</h3>
                        
                      </div>
                      <ul class="social">
                        <li><a href="#"  aria-hidden="true">0580028150</a></li>
                              </ul>
                    </div>
                  </div>

                  <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="our-team">
                      <div class="picture">
                        <img class="img-fluid" src="images/M3.jpg">
                      </div>
                      <div class="team-content">
                        <h3 class="name">عبدالرحمن العتيبي</h3>
                        
                      </div>
                      <ul class="social">
                        <li><a href="#"  aria-hidden="true">0500511459</a></li>
                              </ul>
                    </div>
                  </div>

                  <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="our-team">
                      <div class="picture">
                        <img class="img-fluid" src="images/M4.jpg">
                      </div>
                      <div class="team-content">
                        <h3 class="name">عمر الشريف</h3>
                        
                      </div>
                      <ul class="social">
                        <li><a href="#"  aria-hidden="true">0543742048</a></li>
                              </ul>
                    </div>
                  </div>
                </div>
              </div>
             

            <div class="col-md-12" style="text-align: center;">
                <h1 class="headingss" id="contact" >تواصل معنا</h1>
                <hr />
            </div>

        </div>
     
    </div>
    <div class="container contact" dir="rtl">
        <div class="row ">
            <div class="col-md-3">
                <div class="contact-info">
                    <img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image" />
                    <h2>لنبقى على تواصل</h2>
                    <h4>يسعدنا أن نستمع لما لديك</h4>
                </div>
            </div>
            <div class="col-md-9">
                <div class="contact-form">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lname">الاسم:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="أكتب اسمك هنا" runat="server"></asp:TextBox>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">البريد الالكتروني:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="أكتب البريد الالكتروني الخاص بك" runat="server" TextMode="Email"></asp:TextBox>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">العنوان:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"  placeholder="أكتب العنوان هنا"></asp:TextBox> 
                            
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <label class="control-label col-sm-2" for="comment">الموضوع:</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="إرسال" OnClick="Button1_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
      <script>
        $(".jumbotron").css({ height: $(window).height() + "px" });

        $(window).on("resize", function () {
            $(".jumbotron").css({ height: $(window).height() + "px" });
        });


      </script>
    <script>

        function CallCsharpcod(id) {
            try {
                $.ajax({
                    type: "post",
                    url: "Index.aspx/SetSess",
                    data: "{'id':" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                });
            } catch (err) {

            }
        }

    </script>

</asp:Content>
