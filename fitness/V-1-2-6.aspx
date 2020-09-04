<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="V-1-2-6.aspx.vb" Inherits="fitness.V_1_2_6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div  style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="">
            <div class="col-sm-10">
                <h4>HEALTH-HISTORY QUESTIONNAIRE</h4>
                <asp:Label ID="lblMessage" runat="server" CssClass="badge badge-danger"></asp:Label>
            </div>
            <div class="col-sm-2">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">form</button>
            </div>
        </div>
        <hr />
        <div class="row" style="padding-left:50px;">

            <asp:GridView ID="GridV115" AutoGenerateColumns="false" CssClass="table table-bordered table-sm" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="physicianName" HeaderText="Physician Name" />
                    <asp:BoundField DataField="physicianPhone" HeaderText="Physician Phone" />
                    <asp:BoundField DataField="emergencyContactPersonName" HeaderText="Emergency Contact" />
                    <asp:BoundField DataField="emergencyContactPersonPhone" HeaderText="Emergency Contact mob." />
                    <asp:BoundField DataField="createdon" HeaderText="Submited On" />
                    <asp:TemplateField HeaderText="Print">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkPrint" ToolTip="click to print"  CommandArgument='<%#Eval("id") %>' runat="server" OnClick="lnkPrint_Click"  > <i class="fa fa-print"></i> </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>

    <!--Model code-->
    <!-- Button trigger modal -->


    <!--large-->
    
    <!-- Large modal -->


<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">HEALTH-HISTORY
QUESTIONNAIRE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

        <div class="modal-body">
            <div class="row">
                <div class="col-sm-3">
                    <asp:Label ID="lblphysicianName" runat="server" Text="physician Name"></asp:Label> <br />
                    <asp:TextBox ID="txtphysicianName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>

                </div>

                 <div class="col-sm-3">
                    <asp:Label ID="lblphysicianPhone" runat="server" Text="Physician Phone"></asp:Label> <br />
                    <asp:TextBox ID="txtphysicianPhone" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>

                  <div class="col-sm-3">
                    <asp:Label ID="lblemergencyContactPersonName" runat="server" Text="Contact Person"></asp:Label> <br />
                    <asp:TextBox ID="txtemergencyContactPersonName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                  <div class="col-sm-3">
                    <asp:Label ID="lblemergencyContactPersonPhone" runat="server" Text="Mobile"></asp:Label> <br />
                    <asp:TextBox ID="txtemergencyContactPersonPhone" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>



            </div>
            <div class="row" style="padding-top:10px;">
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <asp:Label ID="lblMedicineDrugsAndReason" runat="server" Text="Are you taking any medications, supplements, or drugs? If so, please list medication, dose, and reason"></asp:Label> <br />
                        </td>
                        <td>
                            <asp:TextBox ID="txtMedicineDrugsAndReason" TextMode="MultiLine" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPhysicianKnowParticipation" runat="server" Text="Does your physician know you are participating in this exercise program?"></asp:Label> <br />
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhysicianKnowParticipation" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                <asp:Label ID="lblPhysicalActivity" runat="server" Text="Describe any physical activity you do somewhat regularly."></asp:Label> <br />
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhysicalActivity" TextMode="MultiLine" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </td>
                    </tr>
                </table>
         
            </div>
            <br />

              <asp:GridView ID="GridParq" CssClass="table table-bordered" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Yes">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                    <asp:RadioButton ID="RdoYes" GroupName="Ans" runat="server" />
                                    <asp:Label ID="lblYes" runat="server" AssociatedControlID="RdoYes"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="No">
                                <ItemTemplate>
                                    <asp:RadioButton ID="RdoNo" GroupName="Ans" runat="server" />
                                    <asp:Label ID="lblNo" runat="server" AssociatedControlID="RdoYes"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="question" HeaderText="Questions" />
                        </Columns>
                    </asp:GridView>
      </div>
        <div class="modal-footer">
        <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="SAVE" OnClick="btnSubmit_Click"   />
        
      </div>
      
    </div>
  </div>
</div>


    <script type="text/javascript">
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
    </script>


</asp:Content>
