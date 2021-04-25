<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDB/admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="REP.AdminDB.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>التخصصات</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <%-- ADD Category --%>
             <div class="col-md-4">
                <div class="div_Form card divv" style="height:320px">
                    <div class="div_Form_head">
                        <h3>إظافة تخصص عام</h3>
                    </div>
                    
                    <%-- Part of Name --%>
                      <label for="name" class="field-label-13"> اسم التخصص:</label>
                      <asp:TextBox ID="TextBox1" runat="server" CssClass="text-field-13 w-input" placeholder="إسم التخصص"></asp:TextBox>



                    <%-- Part of Icon --%>
                     <label for="name" class="field-label-13"> أيقونة التخصص:</label>

                            <div class="input-group " dir="rtl">


                                <asp:FileUpload accept=".png,.jpg,.jpeg" ID="FileUpload1" runat="server" onchange="fileInfo()" Style="display: none" />

                                <asp:TextBox ID="TextBox24" CssClass="form-control form-control-lg" Style="width: 70%; float: right;"
                                    placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                                <asp:LinkButton CssClass="browse btn btn-primary" ID="LinkButton1" Style="float: right; width: 30%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                            </div>
                            <script>
                                function fileInfo() {
                                    var str = document.getElementById('<%=FileUpload1.ClientID%>').value;
                                    var res = str.substring(12);
                                    document.getElementById('<%=TextBox24.ClientID%>').value = res;
                                    event.defaultPrevented();
                                }
                            </script>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Style="width:30%; margin-right:70%; margin-top:10px" Text="إظافة" OnClick="Button1_Click" />
                </div>
            </div>
            <%-- EDIT Category  --%>
             <div class="col-md-4">
                <div class="div_Form card" style="height:320px">
                    <div class="div_Form_head">
                        <h3>تعديل تخصص عام</h3>
                    </div>
                    <%-- Part of Select --%>
                     <label for="name" class="field-label-13"> اختر التخصص:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="text-field-13 w-input" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Category]"></asp:SqlDataSource>
                    <%-- Part of Name --%>
                      <label for="name" class="field-label-13"> اسم التخصص:</label>
                      <asp:TextBox ID="TextBox2" runat="server" CssClass="text-field-13 w-input" placeholder="إسم التخصص"></asp:TextBox>



                    <%-- Part of Icon --%>
                     <label for="name" class="field-label-13"> أيقونة التخصص:</label>

                            <div class="input-group " dir="rtl">


                                <asp:FileUpload accept=".png,.jpg,.jpeg" ID="FileUpload2" runat="server" onchange="fileInfoo()" Style="display: none" />

                                <asp:TextBox ID="TextBox3" CssClass="form-control form-control-lg" Style="width: 70%; float: right;"
                                    placeholder="إرفع ملفك" runat="server" Enabled="False"></asp:TextBox>

                                <asp:LinkButton CssClass="browse btn btn-primary" ID="LinkButton2" Style="float: right; width: 30%; background-color: #32b8d5;" runat="server">إستعراض</asp:LinkButton>
                            </div>
                            <script>
                                function fileInfoo() {
                                    var str = document.getElementById('<%=FileUpload2.ClientID%>').value;
                                    var res = str.substring(12);
                                    document.getElementById('<%=TextBox3.ClientID%>').value = res;
                                    event.defaultPrevented();
                                }
                            </script>
                                      
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Style="width:30%; margin-right:70%; margin-top:10px" Text="تعديل" OnClick="Button2_Click" />


                </div>
            </div>
            <%-- DELETE Category  --%>
             <div class="col-md-4">
                <div class="div_Form card" style="height:320px">
                    <div class="div_Form_head">
                        <h3>حذف تخصص عام</h3>
                    </div>
                    <label for="name" class="field-label-13"> اختر التخصص:</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="text-field-13 w-input" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Category]"></asp:SqlDataSource>
                     
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-danger" Style="width:30%; margin-right:70%; margin-top:10px" Text="حذف" OnClick="Button3_Click" />


                </div>
            </div>


            <%-- ADD Subcategory --%>
             <div class="col-md-4">
                <div class="div_Form card" style="height:320px">
                    <div class="div_Form_head">
                        <h3>إظافة تخصص خاص</h3>
                    </div>
                    <%-- Part of category --%>
                    <label for="name" class="field-label-13"> اختر التخصص العام:</label>
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Category]"></asp:SqlDataSource>
                    <%-- Part of subcategory --%>
                      <label for="name" class="field-label-13"> اسم التخصص الخاص:</label>
                      <asp:TextBox ID="TextBox4" runat="server" CssClass="text-field-13 w-input" placeholder="إسم التخصص"></asp:TextBox>



                            
                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-success" Style="width:30%; margin-right:70%; margin-top:10px" Text="إظافة" OnClick="Button4_Click" />
                </div>
            </div>
            <%-- EDIT Subcategory --%>
             <div class="col-md-4">
                <div class="div_Form card" style="height:320px">
                    <div class="div_Form_head">
                        <h3>تعديل تخصص خاص</h3>
                    </div>
                    <%-- Part of Select --%>
                     <label for="name" class="field-label-13"> اختر التخصص العام:</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="text-field-13 w-input" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Category]"></asp:SqlDataSource>
                     <%-- Part of Select --%>
                     <label for="name" class="field-label-13"> اختر التخصص الخاص:</label>
                    <asp:DropDownList ID="DropDownList6" runat="server" CssClass="text-field-13 w-input" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Subcategory] WHERE ([Category_id] = @Category_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList3" Name="Category_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Category]"></asp:SqlDataSource>
                    <%-- Part of Name --%>
                      <label for="name" class="field-label-13"> اسم التخصص الخاص:</label>
                      <asp:TextBox ID="TextBox6" runat="server" CssClass="text-field-13 w-input" placeholder="إسم التخصص"></asp:TextBox>



                   
                                      
                    <asp:Button ID="Button5" runat="server" CssClass="btn btn-primary" Style="width:30%; margin-right:70%; margin-top:10px" Text="تعديل" OnClick="Button5_Click" />


                </div>
            </div>
            <%-- DELETE Subcategory --%>
             <div class="col-md-4" >
                <div class="div_Form card" style="height:320px">
                    <div class="div_Form_head">
                        <h3>حذف تخصص خاص</h3>
                    </div>
                    <label for="name" class="field-label-13"> اختر التخصص العام:</label>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="text-field-13 w-input" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Category]"></asp:SqlDataSource>
                     
                    <label for="name" class="field-label-13"> اختر التخصص الخاص:</label>
                    <asp:DropDownList ID="DropDownList7" runat="server" CssClass="text-field-13 w-input" DataSourceID="SqlDataSource9" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Subcategory] WHERE ([Category_id] = @Category_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList4" Name="Category_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:REPConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Category]"></asp:SqlDataSource>
                     
                    <asp:Button ID="Button6" runat="server" CssClass="btn btn-danger" Style="width:30%; margin-right:70%; margin-top:10px" Text="حذف" OnClick="Button6_Click" />


                </div>
            </div>

           

        </div>
    </div>
    <script>

        document.getElementById("dash").classList.remove("active");
        document.getElementById("users").classList.remove("active");
        document.getElementById("msgs").classList.remove("active");
        document.getElementById("comp").classList.remove("active");
        document.getElementById("cate").classList.add("active");
        document.getElementById("stat").classList.remove("active");
        document.getElementById("sige").classList.remove("active");

    </script>

</asp:Content>