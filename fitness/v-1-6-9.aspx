<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="v-1-6-9.aspx.vb" Inherits="fitness.v_1_6_9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="">
            <div class="col-sm-10">
                <h4>ASSESSMENT RESULTS form</h4>
                <asp:Label ID="lblMessage" runat="server" CssClass="badge badge-danger"></asp:Label>
            </div>
            <div class="col-sm-2">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">form</button>
            </div>
        </div>
        <hr style="border:2px solid #343a40;" />  
        <div class="row" style="padding-left:20px;">
            <div class="col-sm-12">
                <asp:GridView ID="GridV169" ClientIDMode="Static" runat="server" CssClass="table table-bordered table-striped table-sm" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="createdon" HeaderText="Submited Date" />
                        
                          <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkPrint" CommandArgument='<%#Eval("Id") %>' OnClick="lnkPrint_Click"  runat="server"><i class="fa fa-print"></i></asp:LinkButton> ||
                                 <asp:LinkButton ID="lnkEdit" CommandArgument='<%#Eval("Id") %>' OnClick="lnkEdit_Click"   runat="server"><i class="fa fa-edit"></i></asp:LinkButton> ||
                                <a href="#" class="del" style="color:red" data-val='<%#Eval("id") %>' title="click to delete" ><i class="fa fa-trash"></i></a>
                            
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:HiddenField ID="hiddenID" runat="server" />
            </div>
        </div>
    </div>



    
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">ASSESSMENT RESULTS form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

        <div class="modal-body">
            <div class="row">
                <div class="col-sm-10">
                    <h6><b>Essential Cardiovascular Assessment Results</b></h6>
                </div>
                 <div class="col-sm-2">
                   
                </div>
            </div>
            <br />
    <div class="row">
        <div class="col-sm-6" style="border-right:1px solid #ced4da; ">
            <div class="row">
                 <div class="col-sm-6">
                     &nbsp;<br />
                <b>HEART RATE</b>
            </div>
            <div class="col-sm-6">
                <div>Date</div>
                <div>
                    <asp:TextBox ID="txtHRDate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                </div>
            </div>
            </div>

            <br />
              <div class="row">

        <div class="col-sm-6">
            <div>Resting Heart Rate</div>
            <div>
                <asp:TextBox ID="txtRestHr" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>
        <div class="col-sm-6">
            <div>Exercise Heart Rate</div>
            <div>
                <asp:TextBox ID="txtExeHR" runat="server" Font-Size="12px" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>



    </div>
           
        </div>
      
        <div class="col-sm-6">
            <div class="row">
                 <div class="col-sm-6">
                     &nbsp;<br />
                    <b>BLOOD PRESSURE</b>
                </div>
                <div class="col-sm-6">
                     <div>Date</div>
                    <div>
                        <asp:TextBox ID="txtBpDate" autocomplete="off" Font-Size="12px" runat="server" CssClass="form-control form-control-sm date"></asp:TextBox>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                 <div class="col-sm-6">
                    <div>Resting BP</div>
                    <div>
                        <asp:TextBox ID="txtRestingBP" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                </div>
            </div>
             
        </div>
    </div>

            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <h6><b>Body-composition Assessment Results</b> </h6>
                </div>

            </div>
            <br />
            <div class="row">
                
                 <div class="col-sm-6">
                     <div class="row">
                         <div class="col-sm-12">
                             &nbsp;<br />
                              <b>Height, Weight, and Body Mass Index</b>
                         </div>
                     </div>
                     <br />
                     <div class="row">
                         <div class="col-sm-6">
                             <div>Weight (lb)</div>
                             <div>
                                 <asp:TextBox ID="txtWeightIB" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                          <div class="col-sm-6">
                             <div>Height (in)</div>
                             <div>
                                 <asp:TextBox ID="txtHeightIN" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                     </div>
                    
                     

                      <div class="row">
                         <div class="col-sm-6">
                             <div>Weight (kg)</div>
                             <div>
                                 <asp:TextBox ID="txtWeightkg" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                          <div class="col-sm-6">
                             <div>Height (m)</div>
                             <div>
                                 <asp:TextBox ID="txtHeightm" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                     </div>
                    
                 </div>
               
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-6">
                            <div>Date</div>
                            <div>
                                <asp:TextBox ID="txtBCADate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-12">
                            &nbsp;<br />
                            &nbsp;<br />
                            
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-sm-6 text-right">
                            &nbsp;<br />
                            <button id="btnBMI" type="button" class="btn btn-light">Calculate BMI</button>
                        </div>
                        <div class="col-sm-6">
                            <b>BMI</b> <br />
                            <asp:TextBox ID="txtBMI" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                   
                    
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-6" style="border-right:1px solid #ced4da;">
                    <div class="row">
                        <div class="col-sm-8">
                             
                    <h6><b>Skinfold Measurements</b></h6>
                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                 <div class="col-sm-12">
                            <div>Date</div>
                            <div>
                                <asp:TextBox ID="txtSKMDate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                            </div>
                        </div>
                            </div>
                            
                        </div>
                    </div>
                    <hr />

                    <div class="row">
                        <div class="col-sm-6">
                            <b>MEN</b>
                        </div>
                        <div class="col-sm-6">
                            <b>WOMEN</b>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                             <div>Chest</div>
                             <div>
                                 <asp:TextBox ID="txtMenCest" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                         <div class="col-sm-6">
                             <div>Triceps</div>
                             <div>
                                 <asp:TextBox ID="txtWomenTriceps" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                             <div>Abdomen</div>
                             <div>
                                 <asp:TextBox ID="txtMenAbdomen" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                        <div class="col-sm-6">
                             <div>Suprailium</div>
                             <div>
                                 <asp:TextBox ID="txtWomenSuprailium" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="col-sm-6">
                             <div>Thigh</div>
                             <div>
                                 <asp:TextBox ID="txtMenThigh" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                        <div class="col-sm-6">
                             <div>Thigh</div>
                             <div>
                                 <asp:TextBox ID="txtWomenThigh" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-6">
                             <div>Total</div>
                             <div>
                                 <asp:TextBox ID="txtMenTotal" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                        <div class="col-sm-6">
                             <div>Total</div>
                             <div>
                                 <asp:TextBox ID="txtWomenTotal" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                             <div>% Body-fat estimation</div>
                             <div>
                                 <asp:TextBox ID="txtfatBodyEstimation" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                   
                </div>


                <div class="col-sm-6" style="padding-left:30px; padding-right:30px;">
                    <div class="row">
                        <div class="col-sm-12">

                       
                        <div class="row">
                            <div class="col-sm-8">

                                <h6><b>Girth Measurements</b></h6>
                            </div>
                            <div class="col-sm-4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div>Date</div>
                                        <div>
                                            <asp:TextBox ID="txtGMDate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>Abdomen</div>
                             <div>
                                 <asp:TextBox ID="txtAbdomen" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                            </div>
                        </div>
                      
                        <div class="row">
                             <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>HIP</div>
                             <div>
                                 <asp:TextBox ID="txtHip" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>Waist</div>
                             <div>
                                 <asp:TextBox ID="txtWaist" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                            </div>
                        </div>


                        <div class="row">
                             <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>Waist-to-Hip Ratio</div>
                             <div>
                                 <asp:TextBox ID="txtRaioWH" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                            </div>
                        </div>
                       </div>
                    </div>
                </div>
            </div>

            
      </div>
        <div class="modal-footer">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-2 text-right">
                    <asp:Button ID="btnSubmitFrm" runat="server" CssClass="btn btn-primary btn-block" Text="Submit" OnClick="btnSubmitFrm_Click"  />
                </div>
                </div>
                
            </div>

        
      </div>
      
    </div>
  </div>
</div>
    <script type="text/javascript">
        $(".date").datepicker({ dateFormat: 'yy-mm-dd' });

        $('#txtWeightIB').on("keyup", function () {
            var ibVal = $('#txtWeightIB').val();
            var kgVal = (ibVal * 0.454);

            $('#txtWeightkg').val(kgVal);
        });

        $('#txtWeightkg').on("keyup", function () {
            var kgVal = $('#txtWeightkg').val();
            var ibVal = (kgVal * 2.205);
            $('#txtWeightIB').val(ibVal);


        });

        $('#txtHeightIN').on("keyup", function () {
            var inVal = $('#txtHeightIN').val();
            var mVal = (inVal * 0.0254);

            $('#txtHeightm').val(mVal);

        });

        $('#txtHeightm').on("keyup", function () {
            var mVal = $('#txtHeightm').val();
            var inVal = (mVal * 39.37);

            $('#txtHeightIN').val(inVal);
        });

        //Calculate BMI

        $('#btnBMI').on("click", function () {

            var ibVal = $('#txtWeightIB').val();
            var kgVal = $('#txtWeightkg').val();

            var inVal = $('#txtHeightIN').val();
            var mVal = $('#txtHeightm').val();

            if (kgVal > 0 && mVal > 0) {
                var valBmi1 = (kgVal / (mVal * mVal));

                $('#txtBMI').val(valBmi1.toFixed(2));

            } else if (ibVal > 0 && inVal > 0) {
                var valBmi2 = ((ibVal / (inVal * inVal)) * 703)
                $('#txtBMI').val(valBmi2.toFixed(2));
            } else {
                $('#txtBMI').val(0);
            };

        });

        $('#txtWeightIB').on("keydown", function () {
            decm();
        });

        $('#txtWeightkg').on('keydown', function () {
            decm();
        });

        $('#txtHeightIN').on('keydown', function () {
            decm();
        });

        $('#txtHeightm').on('keydown', function () {
            decm();
        });

        $('.dec').on('keydown', function () {
            decm();
        });

        function decm() {
           


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
                //if a decimal has been added, disable the "."-button

        }

         function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
         };


        function showModal() {
            $('.bd-example-modal-lg').modal();
        }



        $('#GridV169 .del').on('click', function () {
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
                url: "V-1-6-9.aspx/DeleteV137",
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
