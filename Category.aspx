<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="REP.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>التخصصات</title>
   <script
  src="https://code.jquery.com/jquery-1.1.3.js"
  integrity="sha256-8AUx9JnHMcaYXUpGDM7S/uOL2okdSCDOlZ2ufXiDSBI="
  crossorigin="anonymous"></script>
    <script
  src="https://code.jquery.com/jquery-migrate-1.2.1.js"
  integrity="sha256-WFZLwje2g/SCw6gt7wWfJ7K+QRCdI316I4AHS1tPIr4="
  crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container" style="margin-top: 8rem;" dir="rtl">
        <div class="row">


            <div class="col-md-12" style="text-align: center;">
                <h1 class="headingss" id="best">التخصصات</h1>
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
                        url: "category.aspx/SetSession",
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
