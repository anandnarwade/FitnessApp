<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="V-1-3-7.aspx.vb" Inherits="fitness.V_1_3_7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .modal-lg {
    max-width: 1024px;
}
        .form-check-label {
    margin-bottom: 0;
    padding-top: 3px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="">
            <div class="col-sm-10">
                <h4>Exercise History and Attitude Questionnaire</h4>
                <asp:Label ID="lblMessage" runat="server" CssClass="badge badge-danger"></asp:Label>
            </div>
            <div class="col-sm-2">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">form</button>
            </div>
        </div>
      
        <hr style="border:2px solid #343a40;" />  
        <div class="row" style="">
            <div class="col-sm-12">
                <asp:GridView ID="GridV137" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                           <ItemTemplate>
                               <%# Container.DataItemIndex + 1 %>
                           </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="empEmail" HeaderText="Email" />  
                        <asp:BoundField DataField="CreatedOn" HeaderText="SubmitedOn" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkPrint" CommandArgument='<%#Eval("id") %>' OnClick="lnkPrint_Click"  runat="server">
                                    <i class="fa fa-print"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Exercise History and Attitude Questionnaire</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

        <div class="modal-body">
            <div class="row">
            
                <div class="col-sm-12">
                    <span>
                        <i>General Instructions: Please fill out this form as completely as possible. If you have any questions, DO NOT GUESS.</i>
                    </span>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-10">
                    <p>
                        <b>1. Please rate your exercise level on a scale of 1 to 5 (5 indicating very strenuous) for each age range through your present age:</b>
                    </p>
                </div>
                <div class="col-sm-2">
                    <asp:DropDownList ID="ddmExeRate" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="15–20">15–20</asp:ListItem>
                        <asp:ListItem Value="21–30">21–30</asp:ListItem>
                        <asp:ListItem Value="31–40">31–40</asp:ListItem>
                        <asp:ListItem Value="41–50">41–50</asp:ListItem>
                        <asp:ListItem Value="51+">51+</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
           
            <hr />
            <div class="row">
               
                        <div class="col-sm-7">
                            <p>
                                <b>2. Were you a high school and/or college athlete?
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-1">
                            <asp:DropDownList ID="ddmAthlete" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-4">
                             <asp:TextBox ID="txtAthelete" placeholder="If yes, please specify" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    

            </div>
            <hr />
            <div class="row">
                  <!--Q3-->
                    
                        <div class="col-sm-7">
                            <p>
                                <b>3. Do you have any negative feelings toward, or have you had any bad experience with, physical-activity programs?
                                </b>
                            </p>
                        </div>
                         <div class="col-sm-1">
                              <asp:DropDownList ID="ddmNegFeeling" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                         </div>
                         <div class="col-sm-4">
                              <asp:TextBox ID="txtNegFeelingY" placeholder="If yes, please specify" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine"></asp:TextBox>
                         </div>
                        
               
                    
                   

            </div>
            <hr />
            <div class="row">
               
                        <div class="col-sm-7">
                            <p>
                                <b>4. Do you have any negative feelings toward, or have you had any bad experience with, fitness testing and evaluation?
                                </b>
                            </p>
                        </div>
                         <div class="col-sm-1">
                               <asp:DropDownList ID="ddmNegFeelingE" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                         </div>
                         <div class="col-sm-4">
                               <asp:TextBox ID="txtNegfeelE" placeholder="If yes, please specify" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine"></asp:TextBox>
                         </div>
                        
                  
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <p>
                        <b>
                            5. Rate yourself on a scale of 1 to 5 (1 indicating the lowest value and 5 the highest).
                        </b>
                    </p>
                </div>
                <div class="col-sm-12">
                    <asp:GridView ID="GridQ5" runat="server" OnDataBound="GridQ5_DataBound"  CssClass="table table-bordered table-sm" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                    <asp:Label ID="lblQId" runat="server" Text='<%#Eval("id") %>' Visible="false" ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="question" HeaderText="Question" />
                            <asp:TemplateField HeaderText="1">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q5" ID="RdoOp1" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop1" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp1" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="2">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q5" ID="RdoOp2" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop2" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp2" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="3">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q5" ID="RdoOp3" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop3" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp3" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="4">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q5" ID="RdoOp4" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop4" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp4" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="5">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q5" ID="RdoOp5" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop5" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp5" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-8">
                            <p>
                                <b>
                                    6. Do you start exercise programs but then find yourself unable to stick with them?
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="ddmStExe" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                  <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>
                    </div>
                </div>
            </div>
            <hr />


            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-8">
                            <p>
                                <b>
                                    7. How much time are you willing to devote to an exercise program?
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-2">
                           <asp:TextBox ID="txtExeTime" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>

                         <div class="col-sm-2">
                            <asp:DropDownList ID="ddmExeUnit" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="minutes/day">minutes/day</asp:ListItem>
                                <asp:ListItem Value="days/week">days/week</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <hr />

            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>
                                <b>
                                    8. Are you currently involved in regular endurance (cardiovascular) exercise?
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-1">
                             <asp:DropDownList ID="ddmRegExe" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                 <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-1">
                            <asp:TextBox ID="txtRegExeTime" runat="server" CssClass="form-control form-control-sm" placeholder="00"></asp:TextBox>
                        </div>

                        <div class="col-sm-2">
                             <asp:DropDownList ID="ddmRegExeUnit" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="minutes/day">minutes/day</asp:ListItem>
                                <asp:ListItem Value="days/week">days/week</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                         <div class="col-sm-2">
                           <asp:TextBox ID="txtRegExeY" placeholder="If yes, please specify" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6">
                            <p>
                                <b>
                                   8.A. Rate your perception of the exertion of your exercise program
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="ddmPerExe" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="Light">Light</asp:ListItem>
                                <asp:ListItem Value="Fairly light"> Fairly light</asp:ListItem>
                                <asp:ListItem Value="Somewhat hard">Somewhat hard</asp:ListItem>
                                <asp:ListItem Value="Hard">Hard</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-6">
                    <b>
                          9. How long have you been exercising regularly?
                    </b>
                  
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtExeMonths" placeholder="months" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                 <div class="col-sm-2">
                    <asp:TextBox ID="txtExeYear" placeholder="Years" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>

            </div>

            <hr />

             <div class="row">
                <div class="col-sm-8">
                    <b>
                         10. What other exercise, sport, or recreational activities have you participated in?
                    </b>
                  
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPartiMonths" placeholder="Last 6 months" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                 <div class="col-sm-2">
                    <asp:TextBox ID="txtPartiYears" placeholder="Last 6 Years" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>

            </div>
            <hr />
             <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-8">
                            <p>
                                <b>
                                   11. Can you exercise during your work day?
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="ddmExeWorkDay" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                  <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>
                    </div>
                </div>
            </div>

            <hr />
             <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-8">
                            <p>
                                <b>
                                  12. Would an exercise program interfere with your job?
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="ddmExeWorkInteJob" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                  <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>
                    </div>
                </div>
            </div>
            <hr />
             <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-8">
                            <p>
                                <b>
                                 13. Would an exercise program benefit your job?
                                </b>
                            </p>
                        </div>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="ddmExeWorkJob" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem></asp:ListItem>
                                  <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>
                    </div>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-8">
                            <p>
                                <b>
                               14. What types of exercise interest you?
                                </b>
                            </p>
                        </div>
                       
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <asp:DataList ID="DLInterest" RepeatColumns="6"  RepeatDirection="Vertical" runat="server">
                                <ItemTemplate>
                                   <div class="form-check">
                                       <asp:Label ID="lblIntersetId" runat="server" Visible="false" Text='<%#Eval("id") %>' ></asp:Label>
                                       <asp:CheckBox ID="chkDlinterest" runat="server" CssClass=" form-check form-check-input" />
                                       <asp:Label ID="lbldlInterest" runat="server" AssociatedControlID="chkDlinterest" Text='<%#Eval("question") %>' CssClass="form-check form-check-label"></asp:Label>
                                   </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>

            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <p>
                        <b>
                            15. Rank your goals in undertaking exercise: What do you want exercise to do for you?
Use the following scale to rate each goal separately.
                        </b>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="GridQ15" runat="server" OnDataBound="GridQ15_DataBound"  AutoGenerateColumns="false" CssClass="table table-bordered">
                        <Columns>
                             <asp:TemplateField HeaderText="Sr.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                    <asp:Label ID="lblQId" runat="server" Text='<%#Eval("id") %>' Visible="false" ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="question" HeaderText="Question" />
                           
                            <asp:TemplateField HeaderText="1">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp1" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop1" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp1" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="2">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp2" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop2" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp2" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="3">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp3" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop3" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp3" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="4">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp4" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop4" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp4" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="5">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp5" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop5" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp5" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="6">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp6" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop6" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp6" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="7">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp7" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop7" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp7" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="8">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp8" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop8" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp8" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="9">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp9" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop9" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp9" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="10">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <asp:RadioButton GroupName="Q15" ID="RdoOp10" CssClass="form-check-input" runat="server" />

                                        <asp:Label ID="lblop10" runat="server" CssClass="form-check-label" AssociatedControlID="RdoOp10" Text=""></asp:Label>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                           
                        </Columns>
                    </asp:GridView>
                </div>


            </div>

            <br />
            <div class="row">
                <div class="col-sm-6">
                    <b>
                        16. By how much would you like to change your current weight?
                    </b>
                    
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPosi" runat="server" placeholder="(+ in lb)" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                 <div class="col-sm-2">
                    <asp:TextBox ID="txtNeg" runat="server" placeholder="(- in lb)" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>

      </div>
        <div class="modal-footer">
        <div class="col-sm-12">
            <div class="row">
                 <div class="col-sm-2">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-block" Text="Submit" OnClick="btnSubmit_Click"  />
            </div>
            </div>
           
        </div>
        
      </div>
      
    </div>
  </div>
</div>

    <asp:HiddenField ID="hiddenv137Id" runat="server" />
    <script type="text/javascript">
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
    </script>
</asp:Content>
