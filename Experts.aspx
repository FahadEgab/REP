<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Experts.aspx.cs" Inherits="REP.Experts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>الخبراء</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script
  src="https://code.jquery.com/jquery-1.11.3.min.js"
  integrity="sha256-7LkWEzqTdpEfELxcZZlS6wAx5Ff13zZ83lYO2/ujj7g="
  crossorigin="anonymous"></script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    


    <div class="container" style="margin-top: 8rem;" dir="rtl">
        <div class="row">


            <div class="col-md-12" style="text-align: center;">
                <h1 class="headingss" id="best">
                    
                    الخبراء في تخصص 

                </h1>
                <hr />
            </div>

            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
      

        </div>
     
    </div>




    <script>
        
            function CallCsharpcode(id) {
                try {
                    $.ajax({
                        type: "post",
                        url: "Experts.aspx/SetSession",
                        data: "{'id':" + id + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        
                    });
                } catch (err) {
                   
                }
            }
        
    </script>
    <script>
        document.getElementById("bes").style.display = "none";
        document.getElementById("abou").style.display = "none";
        document.getElementById("contac").style.display = "none";
    </script>
</asp:Content>
