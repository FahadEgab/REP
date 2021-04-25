<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="REP.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>البحث</title>

    <script
        src="https://code.jquery.com/jquery-1.11.3.min.js"
        integrity="sha256-7LkWEzqTdpEfELxcZZlS6wAx5Ff13zZ83lYO2/ujj7g="
        crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" dir="rtl" style="margin-top: 7rem">
        <div class="row">
            <div class="col-md-12">
                <h1 style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </h1>
                <hr>
            </div>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>
    </div>

    <div class="container" dir="rtl">
        <div class="row">
            <div class="col-md-12">
                <h1 style="text-align: center">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </h1>
                <hr>
            </div>

            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
        </div>
    </div>

    <script>

        function CallCsharpcode(id) {
            try {
                $.ajax({
                    type: "post",
                    url: "Search.aspx/SetSession",
                    data: "{'id':" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                });
            } catch (err) {

            }
        }

    </script>
    <script>

        function CallCsharpcod(id) {
            try {
                $.ajax({
                    type: "post",
                    url: "Search.aspx/SetSess",
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
