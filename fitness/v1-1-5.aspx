<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="v1-1-5.aspx.vb" Inherits="fitness.v1_1_5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="">
            <div class="col-sm-10">
                <h4>V1-1-5-PAR-QandYou</h4>
                <asp:Label ID="lblMessage" runat="server" CssClass="badge badge-danger"></asp:Label>
            </div>
            <div class="col-sm-2">
             <%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">form</button>--%>

                <asp:Button ID="btnNew" runat="server" CssClass="btn btn-primary" Text="Form" OnClick="btnNew_Click"  />
            </div>
        </div>
        <hr />
        <div class="row" style="padding-left:50px;">
            <div class="col-sm-12">
                <asp:GridView ID="GridV115" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-sm" style="width:100%;" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Sr.No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="parentname" HeaderText="Parent Name" />
                    <asp:BoundField DataField="witnessname" HeaderText="Witness Name" />
                    <asp:BoundField DataField="createdon" HeaderText="Submited On" />
                    <asp:TemplateField HeaderText="Print">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkPrint" ToolTip="click to print"  CommandArgument='<%#Eval("id") %>' runat="server" OnClick="lnkPrint_Click"  > <i class="fa fa-print"></i> </asp:LinkButton> ||
                            
                           <asp:LinkButton ID="lnkEdit" CommandArgument='<%#Eval("id") %>' runat="server" OnClick="lnkEdit_Click" ToolTip="Click to edit" ><i class="fa fa-edit"></i></asp:LinkButton> ||

                            <a href="#" class="del" style="color:red" data-val='<%#Eval("id") %>' title="click to delete" ><i class="fa fa-trash"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            </div>

            

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
        <h5 class="modal-title" id="exampleModalLongTitle">V1-1-5-PAR-QandYou</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

        <div class="modal-body">
            <div class="row">
                <div class="col-sm-3">
                    <asp:Label ID="lblparent" runat="server" Text="Parent Name"></asp:Label> <br />
                    <asp:TextBox ID="txtParent" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>

                 <div class="col-sm-3">
                    <asp:Label ID="lblWitness" runat="server" Text="Witness Name"></asp:Label> <br />
                    <asp:TextBox ID="txtWitness" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
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
            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-warning" Text="UPDATE" OnClick="btnUpdate_Click"  />
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="SAVE" OnClick="btnSubmit_Click"  />
        
      </div>
      
    </div>
  </div>
</div>
    <asp:HiddenField ID="HiddenTrId" runat="server" />

    <script type="text/javascript">
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
        

        $('#GridV115 .del').on("click", function () {
           
            var button = $(this);
           
            bootbox.confirm({
                message: "Are you really want to delete?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    console.log('This was logged in the callback: ' + result);

                    if (result) {
                        DeleteData(button.attr('data-val'));
                    }
                }
            });

        });





        function DeleteData(id) {
            $.ajax({
                type: "POST",
                url: "v1-1-5.aspx/DeleteV115",
                data: '{id : "' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    window.setTimeout(function () { window.location.href = "v1-1-5.aspx" }, 500)
                    //alert(res);

                    


                }
            });
        };






        function showModal() {
            $('.bd-example-modal-lg').modal();
        };
    </script>


</asp:Content>
