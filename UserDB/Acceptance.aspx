<%@ Page Title="" Language="C#" MasterPageFile="~/UserDB/Profile.Master" AutoEventWireup="true" CodeBehind="Acceptance.aspx.cs" Inherits="REP.UserDB.Acceptance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .container {
    margin-top:6rem;
}
.footer {
    position:relative;
    bottom:0;
}
/* The switch - the box around the slider */
.switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 34px;
  }
  
  /* Hide default HTML checkbox */
  .switch input {
    opacity: 0;
    width: 0;
    height: 0;
    
  }
  
  /* The slider */
  .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #ccc;
    -webkit-transition: .4s;
    transition: .4s;
  }
  
  .slider:before {
    position: absolute;
    content: "";
    height: 26px;
    width: 26px;
    left: 4px;
    bottom: 4px;
    background-color: white;
    -webkit-transition: .4s;
    transition: .4s;
  }
  
  input:checked + .slider {
    background-color: #2196F3;
  }
  
  input:focus + .slider {
    box-shadow: 0 0 1px #2196F3;
  }
  
  input:checked + .slider:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(26px);
  }
  
  /* Rounded sliders */
  .slider.round {
    border-radius: 34px;
  }
  
  .slider.round:before {
    border-radius: 50%;
  }



  .btn.btn-primary {
    background-color: #2196F3;
    border-color: #2196F3;
    outline: none;}
    .btn.btn-primary:hover {
      background-color: darken(#2196F3, 10%);
      border-color: darken(#2196F3, 10%);
    }
    .btn.btn-primary:active,  .btn.btn-primary:focus {
      background-color: lighten(#2196F3, 5%);
      border-color: lighten(#2196F3, 5%);
    }



    /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="div_Form card">
                    <div class="div_Form_head">
                        <h3>دفع استشارة او رفضها</h3>
                    </div>
                    <h5 class="field-label-13">عنوان الإستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="text-field-13 w-input" ID="TextBox1" runat="server"></asp:TextBox>

                 
                    <h5 class="field-label-13">نوع الاستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="text-field-13 w-input" ID="TextBox3" runat="server"></asp:TextBox>

                    <h5 class="field-label-13">نص الاستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="text-field-13 w-input" ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>

                   
                    <h5>
                    <asp:Label ID="Label1" runat="server" Text="سرعة الإستشارة: طبيعية"></asp:Label>
                   </h5>

                    
                    <h5 class="field-label-13">سعر الاستشارة:</h5>
                    <asp:TextBox Enabled="false" CssClass="text-field-13 w-input" ID="TextBox5" runat="server"></asp:TextBox>

                    <h5 class="field-label-13">أدفع باستخدام STCPAY في حال القبول</h5>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>

                    <asp:Button CssClass="browse btn btn-danger px-4" Style="font-size: x-large; margin-top: 10px; float: left;" ID="Button1" runat="server" Text="رفض" OnClick="Button1_Click"  />

                    <asp:Button CssClass="browse btn btn-success px-4" Style="font-size: x-large; margin-top: 10px; float: right;" ID="Button2" runat="server" Text="قبول" OnClick="Button2_Click"  />


                </div>
            </div>
        </div>
    </div>
</asp:Content>
