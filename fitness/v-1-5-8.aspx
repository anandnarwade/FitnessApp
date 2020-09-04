﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="v-1-5-8.aspx.vb" Inherits="fitness.v_1_5_8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div  style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="">
            <div class="col-sm-10">
                <h4>Sample Medical Release Form</h4>
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
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("medications") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="effects" HeaderText="Effects" />
                    <asp:BoundField DataField="recommandations" HeaderText="Recommandations" />
                    
                    <asp:BoundField DataField="createdon" HeaderText="Submited On" />
                    <asp:TemplateField HeaderText="Print">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkPrint" ToolTip="click to print"  CommandArgument='<%#Eval("id") %>' runat="server" OnClick="lnkPrint_Click" > <i class="fa fa-print"></i> </asp:LinkButton>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Sample Medical
Release Form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

        <div class="modal-body">
            <div class="row">
                <div class="col-sm-3">
                    <asp:Label ID="lblTypeOfMed" runat="server" Text="Type of medication(s)"></asp:Label> <br />
                    <asp:TextBox ID="txtTypeOfMedi"  runat="server" CssClass="form-control form-control-sm"></asp:TextBox>

                </div>

                 <div class="col-sm-3">
                    <asp:Label ID="lblEffects" runat="server" Text="Effect(s)"></asp:Label> <br />
                    <asp:TextBox ID="txtEffets" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>

                <div class="col-sm-6">
                    <asp:Label ID="lblRec" runat="server" Text="recommendations"></asp:Label>
                    <asp:TextBox ID="txtRecommand" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
                </div>




            </div>
            <br />

            
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