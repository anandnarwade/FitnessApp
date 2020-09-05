<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="fitness.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
<%--    <link href="Content/bootstrap-lumen.css" rel="stylesheet" />--%>
    <%--  <link href="Content/signin.css" rel="stylesheet" />--%>
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
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
                        <a class="nav-link" href="#"></a>
                    </li>
                   
                  
                </ul>

                <div class="form-inline my-2 my-lg-0">
                    <div class="form-group">
                        <asp:TextBox ID="txtUserId" ValidationGroup="login" runat="server" CssClass="form-control form-control-sm mr-sm-2" placeholder="User Id"  autofocus=""></asp:TextBox> 
                      
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" ValidationGroup="login" TextMode="Password" runat="server" CssClass="form-control form-control-sm mr-sm-2"  placeholder="Password"></asp:TextBox>
                        
                    </div>
                    
                    

                    
                    

                    <div class="form-group">
                        <asp:Button ID="btnSubmit" runat="server" ValidationGroup="login" Text="Sign in" CssClass="btn btn-sm btn-info" OnClick="btnSubmit_Click" />
                      <asp:RequiredFieldValidator ValidationGroup="login" ControlToValidate="txtUserId" SetFocusOnError="true" ID="RequiredFieldValidator1" CssClass="badge badge-danger" runat="server" ErrorMessage="userid is required"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ValidationGroup="login" ControlToValidate="txtPassword" SetFocusOnError="true" ID="RequiredFieldValidator2" runat="server" CssClass="badge badge-danger" ErrorMessage="password is required"></asp:RequiredFieldValidator>
                    </div>
                    
                </div>
            </div>
            </div>
           
        </nav>
        <div class="container-fluid mt-5" style="background-image:url('banner/slider4.jpg'); background-repeat: no-repeat;  background-size: 1500px 500px; min-height:500px; margin-left:40px;">
          
        
            <div style="text-align: right; padding-top:20px; margin-right:100px">
                  <% If (Not registerMode) Then %>
                <div class="row text-right">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6">
                        <h3> <b class="bg-warning">Have you received portal access Email</b> </h3>
                        <br />
                        <asp:Button ID="btnGenerat" runat="server" CssClass="btn btn-info" Text="Click Here" OnClick="btnGenerat_Click"  />
                    </div>
                    
                </div>

                 <% Else %>

                    <% If (emailMobileVerified) Then %>
                        <div class="row text-left" style="margin-top:50px;">
                            <div class="col-sm-8"></div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header bg-warning">
                                        <h5>Create Password</h5>
                                    </div>
                                    <div class="card-body">
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
                                            <div class="col-sm-6">
                                                <asp:Button ID="btnCancelPwd" runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger btn-block" OnClick="btnCancel_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                      <% Else %>
                        
                <div class="row text-left" style="margin-top:50px;">
                    <div class="col-sm-8"></div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header bg-warning">
                                <h5>Filled below form for access</h5>
                            </div>
                            <div class="card-body">
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
                                        <asp:Button ID="btnFilled" runat="server" ValidationGroup="access" CssClass="btn btn-info btn-block" Text="Submit" OnClick="btnFilled_Click"  />
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false"  class="btn btn-danger btn-block" OnClick="btnCancel_Click" Text="Cancel" ></asp:Button>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                      <% End If %>
                
                <% End If %>

            </div>
            <div class="text-right" style="margin-right:150px; display:none" >
                <asp:Button ID="btnRegister" CausesValidation="false" Visible="false" runat="server" CssClass="btn btn-primary btn-lg mr-2" Text="Register" OnClick="btnRegister_Click"  />
                <button type="button" class="btn btn-info btn-lg">Learn More</button>
            </div>
       
       
            <div class="container" style="display:none;">
                 <div style="text-align: center;">
                <h3>Register Here! </h3>
            </div>
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header bg-warning">
                                <h5>Registration Form</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <asp:Label ID="lblName" Font-Size="12px" AssociatedControlID="txtName" runat="server" Text="Name"></asp:Label> <span class="req">*</span>
                                        <asp:RequiredFieldValidator Font-Size="12px" ValidationGroup="registration" ControlToValidate="txtName" ForeColor="Red" SetFocusOnError="true" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtName" runat="server" Font-Size="12px" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter name"></asp:TextBox>
                                    </div>

                                    <div class="col-sm-3">
                                        <asp:Label ID="lblEmail" AssociatedControlID="txtEmail" Font-Size="12px" runat="server" Text="Email"></asp:Label> <span class="req">*</span>
                                        <asp:RequiredFieldValidator ValidationGroup="registration" Font-Size="12px" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="true" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" Font-Size="12px" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter email"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-2">
                                        <asp:Label ID="lblMobile" AssociatedControlID="txtMob" runat="server" Font-Size="12px" Text="Mobile"></asp:Label> <span class="req">*</span>
                    
                                        
                                        <asp:TextBox ID="txtMob" ClientIDMode="Static" onleave="return Validate()" runat="server" Font-Size="12px" MaxLength="10" ValidationGroup="registration" CssClass="form-control form-control-sm moblie-no" placeholder="Enter mobile no."></asp:TextBox>
                                    </div>

                                      <div class="col-sm-2">
                                        <asp:Label ID="lbldob" Font-Size="12px" AssociatedControlID="txtDob" runat="server" Text="DOB"></asp:Label> <span class="req">*</span>
                                        <asp:RequiredFieldValidator Font-Size="12px" ValidationGroup="registration" ControlToValidate="txtDob" ForeColor="Red" SetFocusOnError="true" ID="RequiredFieldValidator6" runat="server" ErrorMessage="DOB is required"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtDob" Font-Size="12px" autocomplete="off" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm date" placeholder="YYYY-MM-DD"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Label ID="Label2" Font-Size="12px" runat="server" Text="Gender"></asp:Label> <br /> <br />
                                       <div class="form-check form-check-inline">
                                           <asp:RadioButton ID="rdoMale" GroupName="Gender" runat="server" CssClass="form-check-input" />  <asp:Label ID="lblRdo" CssClass="form-check-label" Font-Size="12px" AssociatedControlID="rdoMale" runat="server" Text="Male"></asp:Label> 
  
                                        </div>
<div class="form-check form-check-inline">
  <asp:RadioButton ID="rdoFemale" GroupName="Gender" runat="server" CssClass="form-check-input" />  <asp:Label ID="Label1" CssClass="form-check-label" Font-Size="12px" AssociatedControlID="rdoFemale" runat="server" Text="Female"></asp:Label> 
  
</div>
                                        
                                    </div>
                                </div>
                                <div class="row" style="padding-top:10px;">
                                     <div class="col-sm-3">
                                        <asp:Label ID="lbllocation" Font-Size="12px" AssociatedControlID="txtlocation" runat="server" Text="Location"></asp:Label> <span class="req">*</span>
                                        <asp:RequiredFieldValidator Font-Size="12px" ValidationGroup="registration" ControlToValidate="txtlocation" ForeColor="Red" SetFocusOnError="true" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Location is required"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtlocation" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter Location"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3">
                                        <asp:Label ID="lblCity" Font-Size="12px" AssociatedControlID="txtCity" runat="server" Text="City"></asp:Label> <span class="req">*</span>
                                        <asp:RequiredFieldValidator Font-Size="12px" ValidationGroup="registration" ControlToValidate="txtCity" ForeColor="Red" SetFocusOnError="true" ID="RequiredFieldValidator8" runat="server" ErrorMessage="City is City"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtCity" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter City"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3">
                                        <asp:Label ID="lblState" Font-Size="12px" AssociatedControlID="txtState" runat="server" Text="State"></asp:Label> <span class="req">*</span>
                                        <asp:RequiredFieldValidator Font-Size="12px" ValidationGroup="registration" ControlToValidate="txtState" ForeColor="Red" SetFocusOnError="true" ID="RequiredFieldValidator9" runat="server" ErrorMessage="State is required"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtState" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter State"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3">
                                        <asp:Label ID="lblRef" Font-Size="12px" AssociatedControlID="txtReferene" runat="server" Text="Name"></asp:Label> 

                                        <asp:TextBox ID="txtReferene" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter referene"></asp:TextBox>
                                    </div>


                                </div>


                                <div class="row" style="padding-top:10px;">
                                     <div class="col-sm-3">
                                        <asp:Label ID="lblType" Font-Size="12px" AssociatedControlID="txtlocation" runat="server" Text="Type"></asp:Label> 
                                      
                                        <br />
                                        <asp:DropDownList Font-Size="12px" ClientIDMode="Static" ID="ddmType" runat="server" CssClass="form-control-sm form-control" OnSelectedIndexChanged="ddmType_SelectedIndexChanged" >
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Value="1">Service</asp:ListItem>
                                            <asp:ListItem Value="2">Business</asp:ListItem>
                                            <asp:ListItem Value="3">Corporate</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    

                                     <div class="col-sm-3 org">
                                        <asp:Label ID="lblOrgName" Font-Size="12px" AssociatedControlID="txtOrgName" runat="server" Text="Organization Name"></asp:Label>
                                        
                                        <br />
                                        <asp:TextBox ID="txtOrgName" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter Org. Name"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3 org">
                                        <asp:Label ID="lblDesignation" Font-Size="12px" AssociatedControlID="txtDesignaton" runat="server" Text="Designation"></asp:Label>
                                        
                                        <br />
                                        <asp:TextBox ID="txtDesignaton" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter Designation"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3 org">
                                        <asp:Label ID="lblDept" Font-Size="12px" AssociatedControlID="txtDept" runat="server" Text="Department"></asp:Label> 

                                        <asp:TextBox ID="txtDept" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter Department"></asp:TextBox>
                                    </div>

                                    <!--Business-->

                                      <div class="col-sm-3 buss">
                                        <asp:Label ID="lblBuss" Font-Size="12px" AssociatedControlID="txtbusiness" runat="server" Text="Business"></asp:Label>
                                        
                                        <br />
                                        <asp:TextBox ID="txtbusiness" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter Business"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3 buss">
                                        <asp:Label ID="lblBusinessname" Font-Size="12px" AssociatedControlID="txtBusinessname" runat="server" Text="Business Name"></asp:Label>
                                        
                                        <br />
                                        <asp:TextBox ID="txtBusinessname" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter Business name"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3 buss">
                                        <asp:Label ID="lbldailyrou" Font-Size="12px" AssociatedControlID="txtDailyRoutine" runat="server" Text="Daily Routine"></asp:Label> 

                                        <asp:TextBox ID="txtDailyRoutine" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter Daily routine"></asp:TextBox>
                                    </div>

                                    <!--spoc details-->
                                    <div class="col-sm-3 spoc">
                                        <asp:Label ID="lblSpoc" Font-Size="12px" AssociatedControlID="txtSpocName" runat="server" Text="SPOC Name"></asp:Label>
                                        
                                        <br />
                                        <asp:TextBox ID="txtSpocName" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter spoc name"></asp:TextBox>
                                    </div>

                                     <div class="col-sm-3 spoc">
                                        <asp:Label ID="lblspocContact" Font-Size="12px" AssociatedControlID="txtspocContact" runat="server" Text="SPOC contact"></asp:Label> 

                                        <asp:TextBox ID="txtspocContact" Font-Size="12px" runat="server" ValidationGroup="registration" CssClass="form-control form-control-sm" placeholder="Enter spoc contact" MaxLength="10"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                          
                        </div>
                    </div>

                    <div class="text-center mt-5">
                        <asp:Button ID="btnSubmitRegistration" ValidationGroup="registration" runat="server" CssClass="btn btn-info btn-lg mr-2" Text="Register" OnClick="btnSubmitRegistration_Click"  />
                        
                        <br />
                            <asp:RequiredFieldValidator ValidationGroup="registration" ControlToValidate="txtMob" Font-Size="12px" ForeColor="Red" SetFocusOnError="true" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mob is required"></asp:RequiredFieldValidator>                   
                       
                    </div>
                </div>
            </div>
        
        </div>
        
    </form>

    <script type="text/javascript">
        //$('.moblie-no').keypress(function (e) {
        //    var arr = [];
        //    var kk = e.which;

        //    for (i = 48; i < 58; i++)
        //        arr.push();

        //    if (!(arr.indexOf(kk) >= 0))
        //        e.preventDefault();
        //});

        $(".date").datepicker({ dateFormat: 'yy-mm-dd' });

        $('.org').hide();
        $('.buss').hide();
        $('.spoc').hide();

        $('#ddmType').on('change', function () {
            //alert(this.value);
            if (this.value == 1) {
                $('.org').show();
                $('.buss').hide();
                $('.spoc').hide();
            } else if (this.value == 2) {
                $('.org').hide();
                $('.buss').show();
                $('.spoc').hide();
            } else if (this.value == 3) {
                $('.spoc').show();
                $('.org').hide();
                $('.buss').hide();
            } else {
                $('.spoc').hide();
                $('.org').hide();
                $('.buss').hide();
            }
        });

        function Validate() {
            var mobile = document.getElementById("txtMob").value;
            var pattern = /^\d{10}$/;
            if (pattern.test(mobile)) {
                alert("Your mobile number : " + mobile);
                return true;
            }
            alert("It is not valid mobile number.input 10 digits number!");
            return false;
        }

        $("#txtUMobile").keydown(function (event) {
            // Allow only backspace and delete
            if (event.keyCode == 46 || event.keyCode == 8) {
                // let it happen, don't do anything
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.keyCode < 48 || event.keyCode > 57) {
                    event.preventDefault();
                }
            }
        });
    </script>
</body>
</html>
