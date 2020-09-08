<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="print137.aspx.vb" Inherits="fitness.print137" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

  
     <link href="Content/bootswatch-united.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <div class="">
  <div class="">
    <div class="card">
         <div class="card-header">
        <h5  >Exercise History and Attitude Questionnaire</h5>
      
      </div>

        <div class="card-body">
            <div class="row">
               <div class="col-sm-8">
                   <b>Name</b> : <asp:Label ID="lblName" runat="server"></asp:Label>
               </div>
                <div class="col-sm-4">
                    <b>Date</b> : <asp:Label ID="lblDate" runat="server"></asp:Label>
                </div> 


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
      
            </div>
            </div>
           
        </div>
        
      </div>
      
    </div>
  </div>
</div>
    
    </div>
    </form>
</body>
</html>
