<%@ Page Title="" Language="C#" MasterPageFile="~/TheMaster.Master" AutoEventWireup="true" CodeBehind="ExpertProfile.aspx.cs" Inherits="REP.ExpertProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>الملف الشخصي الخاص بالخبير</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/profile.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container containerr" dir="rtl" style="margin-top: 7rem; text-align: right; margin-bottom: 3rem">
        <div class="row">
            <div class="col-md-4" id="dv1">
                <div class="card" style="width: 300px">


                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <div class="card-body" style="text-align: center">

                        <h4 style="text-align: center">
                            <asp:Label ID="Label1" Style="text-align: center" runat="server" Text="Label"></asp:Label></h4>
                        <a href="Consulting.aspx" class="btn btn-outline-primary">قدم إستشارتك</a>

                    </div>
                    <ul class="ulll" style="background-color: #f1f1f1;">
                        <li class="liii">
                            <a href="#" onclick="con()" id="nv1" class="nav__link active">الملف التعريفي
                            </a>
                        </li>

                        <li class="liii">
                            <a href="#" onclick="conn()" id="nv2" class="nav__link">الشهادات والخبرات والشركات
                            </a>
                        </li>

                        <li class="liii">
                            <a href="#" onclick="connn()" id="nv3" class="nav__link">الاستشارات السابقة
                            </a>
                        </li>

                    </ul>




                </div>
            </div>

            <div class="col-sm-8" id="dv2">

                <div id="con1">
                    <h4>اسم الخبير :</h4>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>

                    <h4>نبذة تعريفية </h4>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>



                    <h4>سنين الخبرة : </h4>
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </div>

                <div id="con2" style="display: block;">
                    <h4>الشهادات  :</h4>
                    <asp:DataList CssClass="table-responsive" ID="DataList1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
                        <FooterStyle CssClass="table-responsive" BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle CssClass="table-responsive" BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <iframe src="<%# Eval("Certificate") %>" style="width: 700px; height: 400px;"></iframe>


                            <br />
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Certificate] FROM [Expert_Certificates] WHERE ([Expert_id] = @Expert_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_id" SessionField="ExpertChoseId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>





                    <h4>الخبرات:</h4>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <ItemTemplate>


                                        <div class="btn-primary" style="float: right; border-radius: 10%; padding: 5px; background: #007bff;margin-left: 5px;    margin-top: 2px; color: white; display: inline; /* overflow: hidden; *//* clear: both; *//* position: relative; */white-space: nowrap;">
                                            <%# Eval("Skill") %>
                                        </div>


                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Skill] FROM [Expert_skills] WHERE ([Expert_id] = @Expert_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Expert_id" SessionField="ExpertChoseId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
                        </div>
                    </div>
                    <h4>الشركات السابقة : </h4>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:DataList ID="DataList3" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                       <div class="btn-primary" style="float: right; border-radius: 10%; padding: 5px; background: #007bff;margin-left: 5px;    margin-top: 2px; color: white; display: inline; /* overflow: hidden; *//* clear: both; *//* position: relative; */white-space: nowrap;">
                                        
                                          <%# Eval("Company") %>
                                       </div>
                                    </ItemTemplate>
                                </asp:DataList>                                    

                                

                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Company] FROM [Expert_companies] WHERE ([Expert_id] = @Expert_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Expert_id" SessionField="ExpertChoseId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                

                            </div>
                        </div>
                    </div>



                </div>

                <div id="con3" style="display: none;">
                    <h4>الاستشارات المقدمة:</h4>
                    <asp:GridView CssClass="table table-responsive table-striped" ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="عنوان الاستشارة" SortExpression="Title" />
                            <asp:BoundField DataField="Rate_User" HeaderText="تقييم طالب الاستشارة" SortExpression="Rate_User" />
                            <asp:BoundField DataField="Rate_Expert" HeaderText="تقييم الخبير" SortExpression="Rate_Expert" />
                        </Columns>
                    </asp:GridView>



                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Title], [Rate_User], [Rate_Expert] FROM [consulting] WHERE ([Expert_Id] = @Expert_Id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Expert_Id" SessionField="ExpertChoseId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>



                </div>


            </div>

        </div>
        <script>
            function con() {
                document.getElementById("nv1").classList.add("active");
                document.getElementById("nv2").classList.remove("active");
                document.getElementById("nv3").classList.remove("active");
                document.getElementById("con1").style.display = "block";
                document.getElementById("con2").style.display = "none";
                document.getElementById("con3").style.display = "none";
            }
            function conn() {
                document.getElementById("nv1").classList.remove("active");
                document.getElementById("nv2").classList.add("active");
                document.getElementById("nv3").classList.remove("active");
                document.getElementById("con1").style.display = "none";
                document.getElementById("con2").style.display = "block";
                document.getElementById("con3").style.display = "none";
            }
            function connn() {
                document.getElementById("nv1").classList.remove("active");
                document.getElementById("nv2").classList.remove("active");
                document.getElementById("nv3").classList.add("active");
                document.getElementById("con1").style.display = "none";
                document.getElementById("con2").style.display = "none";
                document.getElementById("con3").style.display = "block";
            }
        </script>
        <script>
            document.getElementById("bes").style.display = "none";
            document.getElementById("abou").style.display = "none";
            document.getElementById("contac").style.display = "none";
        </script>
        <script src="js/Dashboard.js"></script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </div>
</asp:Content>
