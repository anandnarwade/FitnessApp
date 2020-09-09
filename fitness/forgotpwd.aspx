<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="forgotpwd.aspx.vb" Inherits="fitness.forgotpwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     
    <link href="Content/bootstrap.css" rel="stylesheet" />
<%--    <link href="Content/bootstrap-lumen.css" rel="stylesheet" />--%>
    <%--  <link href="Content/signin.css" rel="stylesheet" />--%>
   
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootbox.js"></script>

</head>
<body style="font-family: Verdana; font-size: 12px; background-color:#e8e8e8;">
    <form id="form1" runat="server">
    <nav class="navbar navbar-expand-md navbar-light bg-dark">
            <div class="container-fluid" style="background-image:url('banner/slider4.jpg')">
                 <a class="navbar-brand" href="#">Fitness App</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%--<a class="nav-link" href="#"></a>--%>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="White" Font-Size="14px" Text=""></asp:Label>
                    </li>
                   
                  
                </ul>

                <div class="form-inline my-2 my-lg-0">
                   
                    
                </div>
            </div>
            </div>
           
        </nav>

        <div class="container" style="padding-top:50px;">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header bg-warning"><h4>Forgot Password</h4></div>
                        <div class="card-body">

                            <% If (CreatePwd = False) Then %>

                            <div class="row">
                                <div class="col-sm-12">


                                    <div class="form-group">
                                    <div><b>Email</b></div>
                                    <div>
                                        <asp:TextBox ID="txtPEmail" ValidationGroup="access" TextMode="Email" placeholder="Enter your email" Font-Size="12px" runat="server" CssClass="form-control"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="access" ControlToValidate="txtPEmail" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>--%>
                                        <asp:CustomValidator ID="CustomValidator1" ValidationGroup="access" SetFocusOnError="true" ValidateEmptyText="true" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"  ControlToValidate="txtPEmail" runat="server" ErrorMessage="Email not found!"></asp:CustomValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div><b>Mobile</b></div>
                                    <div>
                                        <asp:TextBox ID="txtUMobile" ValidationGroup="access" ClientIDMode="Static" MaxLength="10"  placeholder="Enter your Mobile" Font-Size="12px" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtUMobile" SetFocusOnError="true" ForeColor="Red" ValidationGroup="access" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate"   runat="server" ErrorMessage=""></asp:CustomValidator>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div>OTP</div>
                                        <div>
                                            <asp:TextBox ID="txtOTP" ValidationGroup="access" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <span></span><br />
                                        <asp:Button ID="txtSentOTP" ValidationGroup="access" runat="server" CssClass="btn btn-sm btn-primary" Text="Sent OTP" OnClick="txtSentOTP_Click"  ></asp:Button> <br />
                                        <asp:Label ID="lblOtpMsg" runat="server" ForeColor="Red"></asp:Label>
                                    </div>
                                </div>

                                <br />

                                <div class="row">
                                    <div class="col-sm-6">
                                        <asp:Button ID="btnFilled" runat="server" ValidationGroup="access" CssClass="btn btn-info btn-block" Text="Submit" OnClick="btnFilled_Click"  />
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false"  class="btn btn-danger btn-block" OnClick="btnCancel_Click"  Text="Cancel" ></asp:Button>
                                    </div>
                                    
                                </div>

                                </div>
                                
                            </div>



                            <%else%>

                            <div class="row">
                                <div class="col-sm-12">
                                     <div class="form-group">
                                            <div><b>Enter Password</b></div>
                                            <div>
                                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password" ValidationGroup="NewPwd" ></asp:TextBox>
                                                <asp:CustomValidator ID="CustomPassword" SetFocusOnError="true" ControlToValidate="txtNewPassword" ValidateEmptyText="true" ValidationGroup="NewPwd" ForeColor="Red" runat="server" ErrorMessage="" OnServerValidate="CustomPassword_ServerValidate" ></asp:CustomValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div><b>Confirm Password</b></div>
                                            <div>
                                                 <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="form-control form-control-sm" TextMode="Password" ValidationGroup="NewPwd" ></asp:TextBox>
                                                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtConfirmPwd" ControlToCompare="txtNewPassword" SetFocusOnError="true" ForeColor="Red" runat="server" ValidationGroup="NewPwd" ErrorMessage="Password not match!"></asp:CompareValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <asp:Button ID="btnSubmitPwd" CssClass="btn btn-info btn-block" ValidationGroup="NewPwd"  runat="server" Text="Submit" OnClick="btnSubmitPwd_Click"  />
                                            </div>
                                           
                                        </div>
                                </div>
                            </div>


                                <%End If %>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:HiddenField ID="hiddenOTP" runat="server" />
       
       <div class="text-center" id="msg" runat="server" visible="false">
           <span style="font-size:14px">Your password has been changed. Go to <a href="login.aspx">Login Page</a></span>
       </div>


        <!--Below is modal-->

       

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <span>Password Updated Successfully!</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    </form>

    <script type="text/javascript">
        $("#txtUMobile").keydown(function (event) {
            // Allow only backspace and delete

            if (event.shiftKey == true) {
                event.preventDefault();
            }

            if ((event.keyCode >= 48 && event.keyCode <= 57) ||
                (event.keyCode >= 96 && event.keyCode <= 105) ||
                event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 ||
                event.keyCode == 39 || event.keyCode == 46 || event.keyCode == 190) {

            } else {
                event.preventDefault();
            }
        });

        function success() {
            // bootbox.alert("Password Updated Successfully!");

            $('#exampleModalCenter').modal();
        }

        $("#test").on("click", function () {
            success();
        })
       
    </script>
</body>
</html>
