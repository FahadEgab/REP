<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="REP.Site.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>تسجيل الدخول</title>
     <link rel="stylesheet" href="css/style.css">
    <!-- Bootstrap CSS -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link href="images/iconLogo.png" rel="shortcut icon" type="image/x-icon">
    
    
</head>
<body class="body" style="background-image: url(images/Wall.png);background-size: cover;">
    <form id="form1" runat="server">
       

          <nav class="navbar navbar-expand-md fixed-top  navbar-light bg-light navbar" dir="rtl">
                <a class="navbar-brand brandi" href="Index.aspx">
                    <img src="images/logo.png" alt="" height="70" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav" style="text-align: center;">
                        <li class="nav-item">
                            <a class="nav-link" href="Category.aspx">التخصصات</a>
                        </li>
                      


                    </ul>


                   


                    <div class="mr-auto my-lg-0" style="text-align: center;" id="fis">
                     
                       <asp:Button CssClass="btn btn-primary my-2 my-sm-0" Style="margin-right: 10px;" ID="Button3" runat="server" Text="تسجيل الدخول" OnClick="Button3_Click"  />
                        <asp:Button CssClass="btn btn-success my-2 my-sm-0" Style="margin-right: 10px;" ID="Button4" runat="server" Text="تسجيل جديد" OnClick="Button4_Click"  />
                  
                        </div>



                </div>


            </nav>

    <div class="container" style="margin-top: 8rem; height:77vh;" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-8" style="padding: 4%;">
              <h1 style="text-align: center;">تسجيل الدخول</h1>  
              
              
              <h5>اسم المستخدم:</h5>  
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
              
              <h5>كلمة المرور:</h5>

                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
              
              <a href="forget.aspx" style="text-align: center;"><h5>هل نسيت كلمة المرور؟</h5></a>
                <asp:Label Style="text-align: center;" ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
               <asp:Button ID="Button1" Style="float: left; margin-top: 1rem;" runat="server" Text="دخول" CssClass="btn btn-success" OnClick="Button1_Click1"  />
                   
              
            </div>

            <div class="col-md-2"></div>






        </div>

    </div>

          <footer class="text-center bg-light">
        <!-- Grid container -->
        <div class="container p-4"></div>
        <!-- Grid container -->

        <!-- Copyright -->
        <div class="text-center p-3">
            © 2021 Copyright:
            GP6 طلاب مشروع التخرج
        </div>
        <!-- Copyright -->
    </footer>
                  
                
             <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous"></script>         
                    
                 
        </form>

</body>
</html>
