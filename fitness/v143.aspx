<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="v143.aspx.vb" Inherits="fitness.v143" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div  style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="">
            <div class="col-sm-10">
                <h4>READINESS TO CHANGE QUESTIONNAIRE</h4>
                <asp:Label ID="lblMessage" runat="server" CssClass="badge badge-danger"></asp:Label>
            </div>
            <div class="col-sm-2">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">form</button>
            </div>
        </div>
        <hr />
        <div class="row" style="padding-left:50px;">
            <div class="col-sm-12">
                <asp:GridView ID="GrdV143" ClientIDMode="Static" AutoGenerateColumns="false" CssClass="table table-bordered table-sm" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                 
                    <asp:BoundField DataField="createdon" HeaderText="Submited On" />
                    <asp:TemplateField HeaderText="Print">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkPrint" ToolTip="click to print"  CommandArgument='<%#Eval("id") %>' runat="server" OnClick="lnkPrint_Click"   > <i class="fa fa-print"></i> </asp:LinkButton> ||
                            <asp:LinkButton ID="lnkEdit" ToolTip="Click to edit"  CommandArgument='<%#Eval("id") %>' runat="server" OnClick="lnkEdit_Click"  ><i class="fa fa-edit"></i> </asp:LinkButton> ||
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
        <h5 class="modal-title" id="exampleModalLongTitle">READINESS TO CHANGE QUESTIONNAIRE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

        <div class="modal-body">
           
         
              <asp:GridView ID="GridV143" CssClass="table table-bordered" AutoGenerateColumns="false" runat="server">
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
                                    <asp:Label ID="lblNo" runat="server" AssociatedControlID="RdoNo"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="question" HeaderText="Questions" />
                        </Columns>
                    </asp:GridView>
      </div>
        <div class="modal-footer">
        <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="SAVE" OnClick="btnSubmit_Click"    />
        
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



        function showModal() {
            $('.bd-example-modal-lg').modal();
        };


        $('#GrdV143 .del').on('click', function () {
            var id = $(this).attr('data-val');
            DeleteData(id);
        });


        function DeleteData(id) {
            $.ajax({
                type: "POST",
                url: "v143.aspx/DeleteV137",
                data: '{id : "' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    window.setTimeout(function () { window.location.reload() }, 500)
                    //alert(res);




                }
            });
        };

    </script>

</asp:Content>
