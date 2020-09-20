<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="CompanyMasterFrm.aspx.vb" Inherits="fitness.CompanyMasterFrm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="padding-left:30px;">
            <div class="col-sm-12">
                <h4><b>Company Master</b></h4><br />
                <asp:Label ID="lblMessage" runat="server" Font-Size="16px"></asp:Label>
            </div>
        </div>
         <hr style="border:2px solid #343a40;" />  
        <div class="row" style="padding-left:10px;">
            <div class="col-sm-2">
                <b>Company Code</b> <span style="color:red">*</span><br />
                <asp:TextBox ID="txtCompanyCode" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="company" ControlToValidate="txtCompanyCode" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Code is required"></asp:RequiredFieldValidator>
            </div>
            <div class="col-sm-3">
                <b>Company Name</b><span style="color:red">*</span><br />
                <asp:TextBox ID="txtCmpName" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="company" ControlToValidate="txtCmpName" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Company Name is required"></asp:RequiredFieldValidator>
            </div>
             <div class="col-sm-2">
                <b>Branch Code</b><br />
                <asp:TextBox ID="txtBranchCode" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                 
            </div>
             <div class="col-sm-2">
                <b>Branch Name</b><br />
                <asp:TextBox ID="txtBranchName" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <b>Short Code</b><br />
                <asp:TextBox ID="txtShortCode" runat="server" ValidationGroup="company" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-3">
                <b>Address</b><br />
                <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" ValidationGroup="company" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-2">
                <b>City</b><br />
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control form-control-sm" ValidationGroup="company" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-2">
                <b>State</b><br />
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control form-control-sm" ValidationGroup="company" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-1">
                <b></b><br />
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-warning" Text="SAVE" ValidationGroup="company" OnClick="btnSave_Click"  />
            </div>
            <div class="col-sm-1">
                <b></b><br />
                <a href="CompanyMasterFrm.aspx" class="btn btn-danger">CANCEL</a>
            </div>
            
        </div>
        <hr />


        <div class="row">
            <div class="col-sm-12">

                <% If (ShowSpoc) Then %>

                <div class="card">
                    <div class="card-header">
                        <h6>
                            <a style="cursor: pointer; color: dimgray;" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1"><i class="fa fa-user-plus"></i>&nbsp;SPOC Details</a>
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div style="padding-left: 30px;" class="row collapse multi-collapse" id="multiCollapseExample1">
                                <div class="col-sm-3">
                                    <b>SPOC Name</b> <span style="color: red">*</span><br />
                                    <asp:TextBox ID="txtspocName" ClientIDMode="Static" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="spoc" ControlToValidate="txtspocName" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                                </div>
                               

                                <div class="col-sm-3">
                                    <b>Email</b> <span style="color: red">*</span><br />
                                    <asp:TextBox ID="txtEmail" TextMode="Email" ValidationGroup="spoc" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="spoc" ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-sm-3">
                                    <b>Mobile</b> <span style="color: red">*</span><br />
                                    <asp:TextBox ID="txtContactNo" ClientIDMode="Static" MaxLength="10" ValidationGroup="spoc" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="spoc" ControlToValidate="txtContactNo" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Designation is required"></asp:RequiredFieldValidator>
                                </div>
                                
                                <div class="col-sm-3">
                                    &nbsp;<br />
                                    <asp:Button ID="btnAddSpoc" runat="server" Text="SAVE" ValidationGroup="spoc" CssClass="btn btn-warning btn-sm" OnClick="btnAddSpoc_Click" />
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <asp:GridView ID="GridSpoc" runat="server" CssClass="table table-bordered table-striped table-sm" AutoGenerateColumns="false">

                                    <Columns>
                                        <asp:BoundField DataField="spocname" HeaderText="SPOC Name" />
                                        
                                        <asp:BoundField DataField="spocemail" HeaderText="Email" />
                                        <asp:BoundField DataField="spoccontactno" HeaderText="Mobile" />
                                        
                                        
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEditSpoc" CommandArgument='<%#Eval("Id") %>' OnClick="lnkEditSpoc_Click"  runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>


                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

                <% End If %>


                
            </div>

            <hr />
            <div class="col-sm-12">
                <% If (showMember = False) Then %>

                <div class="card">
                    <div class="card-header">
                        <h6>
                             <a style="cursor:pointer; color:dimgray;" data-toggle="collapse" href="#AddMembers" role="button" aria-expanded="false" aria-controls="multiCollapseExample1"><i class="fa fa-users"></i>Add Members</a>
                        </h6>
                    </div>
                    <div class="card-body">
                        <div style="padding-left: 10px;" class="row collapse multi-collapse" id="AddMembers">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <div>Member Name</div>
                                    <div>
                                        <asp:TextBox ID="txtMemberName" runat="server" ValidationGroup="AddMember" CssClass="form-control form-control-sm"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtMemberName" ForeColor="Red" SetFocusOnError="true" ValidationGroup="AddMember" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Member name is required"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                             <div class="col-sm-3">
                                <div class="form-group">
                                    <div>Email</div>
                                    <div>
                                        <asp:TextBox ID="txtMemberEmail" TextMode="Email" runat="server" ValidationGroup="AddMember" CssClass="form-control form-control-sm"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtMemberEmail" ForeColor="Red" SetFocusOnError="true" ValidationGroup="AddMember" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Email id is required"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                             <div class="col-sm-3">
                                <div class="form-group">
                                    <div>Mobile</div>
                                    <div>
                                        <asp:TextBox ID="txtMemberMobile" MaxLength="10" runat="server" ValidationGroup="AddMember" CssClass="form-control form-control-sm"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtMemberMobile" ForeColor="Red" SetFocusOnError="true" ValidationGroup="AddMember" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Mob no is required"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <div>&nbsp;</div>
                                    <div>
                                        <asp:Button ID="btnAddMember" runat="server" Text="SAVE" ValidationGroup="AddMember" CssClass="btn btn-sm btn-warning" OnClick="btnAddMember_Click"  />
                                    </div>
                                </div>
                            </div>

                            <hr />

                            <div class="col-sm-12">
                                  <asp:GridView ID="GridMember" runat="server" CssClass="table table-bordered table-striped table-sm" AutoGenerateColumns="false">

                                    <Columns>
                                        <asp:BoundField DataField="spocname" HeaderText="SPOC Name" />
                                        
                                        <asp:BoundField DataField="spocemail" HeaderText="Email" />
                                        <asp:BoundField DataField="spoccontactno" HeaderText="Mobile" /> 
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkMemberEdit" CommandArgument='<%#Eval("Id") %>' OnClick="lnkMemberEdit_Click"   runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>


                                </asp:GridView>
                            </div>

                        </div>
                    </div>
                </div>

                   <% End If %>
            </div>

            <div class="col-sm-12">

                <% If (ProCount) Then %>
                <div class="card">
                    <div class="card-header">

                        <h6>
                            <a style="cursor:pointer; color:dimgray;" data-toggle="collapse" href="#membersCount" role="button" aria-expanded="false" aria-controls="multiCollapseExample1"><i class="fa fa-times"></i>Counts</a>
                            
                    </h6> 
                        
                    </div>
                    <div class="card-body">


                        <div style="padding-left: 10px;" class="row collapse multi-collapse" id="membersCount">
                            <div class="col-sm-2">
                                <b>Prappose Cnt</b><span style="color:red">*</span>
                                <br />
                                <asp:TextBox ID="txtPrapCnt" ValidationGroup="Count" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm numbers"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="Count" ControlToValidate="txtPrapCnt" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Prapose Count is required."></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-2">
                                <b>Approved Cnt</b>
                                <br />
                                <asp:TextBox ID="txtAppCnt" runat="server" ClientIDMode="Static" ValidationGroup="Count" CssClass="form-control form-control-sm numbers"></asp:TextBox>
                                <asp:CustomValidator ValidationGroup="Count" ControlToValidate="txtAppCnt" OnServerValidate="CustomValidator3_ServerValidate"  SetFocusOnError="true" ValidateEmptyText="true" ForeColor="Red" ID="CustomValidator3" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
                            </div>

                            <div class="col-sm-2">
                                &nbsp;Start Date<br />
                                <asp:TextBox ID="txtStartDAte" ValidationGroup="Count" autocomplete="off" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm from_date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="CustomValidator2" ControlToValidate="txtStartDAte" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Count" runat="server" ErrorMessage="Start date is required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">
                                &nbsp;End Date<br />
                                <asp:TextBox ID="txtendDate" autocomplete="off" ValidationGroup="Count" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm to_date"></asp:TextBox>
                                <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtendDate" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Count" runat="server" ErrorMessage="" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            </div>

                            <div class="col-sm-2">
                                &nbsp;<br />
                                <asp:Button ID="btnSaveCount" ValidationGroup="Count" runat="server" Text="SAVE" CssClass="btn btn-sm btn-warning" OnClick="btnSaveCount_Click"  />
                            </div>

                            <div class="col-sm-2">
                                
                            </div>
                            <hr />

                            <div class="col-sm-12">
                                <asp:GridView ID="GridCount" CssClass="table table-bordered table-striped table-sm" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr No">
                                            <ItemTemplate>
                                                <%# Container.DisplayIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PraposeCount" HeaderText="Praposed Count" />
                                        <asp:BoundField DataField="ApprovedCount" HeaderText="Approved Count" />
                                        <asp:BoundField DataField="startdate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" />
                                        <asp:BoundField DataField="enddate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" />

                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkCountEdit" ToolTip="Click To Edit" OnClick="lnkCountEdit_Click"  runat="server" CommandArgument='<%#Eval("Id") %>' >
                                                    <i class="fa fa-edit"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

                <% End If %>
                
            </div>
            
        </div>

        <hr />
      

        <div class="row">
            <div class="col-sm-12">
                <asp:GridView ID="GridCompany" runat="server" CssClass="table table-bordered table-striped table-sm" AutoGenerateColumns="false">
                    <Columns>
                                                                                                <asp:BoundField DataField="CompanyCode" HeaderText="Company Code" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                        <asp:BoundField DataField="BranchCode" HeaderText="Branch Code" />
                        <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                        <asp:BoundField DataField="ShortCode" HeaderText="Short Code" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" ToolTip="Click to Edit" CommandArgument='<%#Eval("Id") %>' OnClick="btnEdit_Click"  runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hiddenId" runat="server" />
    <asp:HiddenField ID="hiddenCompanyIdForSpoc" runat="server" />
    <asp:HiddenField ID="hiddenMemberId" runat="server" />
    
    <asp:HiddenField ID="hiddenSpocId" runat="server" />
    <asp:HiddenField ID="hiddenCountId" runat="server" />
   <%-- <button id="showCol" type="button">Show</button>
    <button id="hideSpc" onclick="hideSpoc();" type="button">Show</button>--%>
      <script type="text/javascript">
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };


          $('#txtAppCnt').on("keyup", function () {
              //onlyNumber()
              var appcnt = $(this).val();
              
              //alert(appcnt);
          });

          $('#showCol').on("click", function () {

              onlyNumber();
          });

          function showSpoc() {

              $('#multiCollapseExample1').collapse('show');
              $('#txtspocName').focus();
          };

          function hideSpoc() {
              $('#multiCollapseExample1').collapse('hide');
          };

          function ShowPrCount() {
              $('#membersCount').collapse('show');
              $('#txtPrapCnt').focus();
          };

          function showMember() {
              $('#AddMembers').collapse('show');
          }

          function spocToggle() {
              $('#multiCollapseExample1').collapse('toggle');
          }


          $("#txtPrapCnt").keydown(function (event) {
              onlyNumber();
          });

          $("#txtAppCnt").keydown(function (event) {
              onlyNumber();
          });


          $('#txtStartDAte').datepicker({
              dateFormat: 'yy-mm-dd'
          });

          $('#txtendDate').datepicker({
              dateFormat: 'yy-mm-dd'
          })


          function onlyNumber(){
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

              if ($(this).val().indexOf('.') !== -1 && event.keyCode == 190)
                  event.preventDefault();
          }
    </script>
</asp:Content>
