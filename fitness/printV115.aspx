<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="printV115.aspx.vb" Inherits="fitness.printV115" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Print V115
    </title>

    <link href="Content/bootswatch-united.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.js"></script>

</head>
<body>
    <form id="form1" runat="server">
         <div class="row" style="padding-top: 20px;">
   
        <div class="col-sm-12">
            <div class="card">

                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <p>
                                Physical Activity Readiness
                                <br />
                                Questionnaire- PAR-Q<br />
                                (revised 2002)

                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h2>
                                <center><strong>Par-q and you</strong></center>
                            </h2>
                            <center><small>(A Questionnaire for People Aged 15 to 69)</small></center>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <h5 class="card-title"></h5>
                    <p class="card-text">Regular physical activity is fun and healthy, and increasingly more people are starting to become more active every day. Being more active is very safe for most people. However, some people should check with their doctor before they start becoming much more physically active. If you are planning to become much more physically active than you are now, start by answering the seven questions in the box below. If you are between the ages of 15 and 69, the PAR-Q will tell you if you should check with your doctor before you start. If you are over 69 years of age, and you are not used to being very active, check with your doctor. Common sense is your best guide when you answer these questions. Please read the questions carefully and answer each one honestly: check YES or NO.</p>
                </div>
         
                <div class="col-sm-12" style="padding: 10px;">
                    <asp:GridView ID="GridParq" CssClass="table table-bordered" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Yes">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                    
                                    <asp:Label ID="lblv115Id" runat="server" Text='<%#Eval("v115Id") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblAns" runat="server" Text='<%#Eval("answer") %>' Visible="false" ></asp:Label>
                                    <asp:RadioButton ID="RdoYes" Enabled="false" GroupName="Ans" runat="server" />
                                    <asp:Label ID="lblYes" runat="server" AssociatedControlID="RdoYes"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="No">
                                <ItemTemplate>
                                    <asp:RadioButton ID="RdoNo" Enabled="false" GroupName="Ans" runat="server" />
                                    <asp:Label ID="lblNo" runat="server" AssociatedControlID="RdoYes"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="question" HeaderText="Questions" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-2">
                            <h3>
                                <b>If
                                    <br />
                                    You
                            <br />
                                    Answered</b>
                            </h3>
                        </div>

                        <div class="col-sm-10">
                        <div class="card" >
                            <div class="card-header bg-dark">
                                <b style="color:white;">YES to one or more questions</b>
                            </div>
                            <div class="card-header">
                                Talk with your doctor by phone or in person BEFORE you start becoming much more physically active or BEFORE you have a fitness appraisal. Tell your doctor about the PAR-Q and which questions your answered YES.
                                <ul>
                                    <li>
                                        You may be able to do any acitity you want -- as long as you start slowly and build up gradually. Or, you may need to restrict your activities to those which are safe for you. Talk with your doctor about the kinds of activities you wish to participate in and follow his/her advice.
                                    </li>
                                    <li>
                                        Find out which community programs are safe and helpful for you.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-header bg-dark">
                                    <b style="color:white;">NO to all questions </b>
                                </div>
                                <div class="card-body" style="text-align:justify;">
                                    <p>
                                        If you answered NO honestly to all PAR-Q questions, you can be reasonably sure that you can: • start becoming much more physically active begin slowly and build up gradually. This is the safest and easiest way to go. • take part in a fitness appraisal — this is an excellent way to determine your basic fitness so that you can plan the best way for you to live actively It is also highly recommended that you have your blood pressure evaluated. If your reading is over 144/94, talk with your doctor before you start becoming much more physically active. 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <b>DELAY BECOMING MUCH MORE ACTIVE</b> <br />
                                    <ul>
                                        <li>
                                             It you are not feeling well because of a temporary illness such as a cold or a fever — wait until you fed better;
                                        </li>
                                        <li>
                                            If you are or may be pregnant — talk to your doctor before you start becoming more active.
                                        </li>
                                    </ul>
                                </div>
                            </div> <br />
                            <div class="card">
                                <div class="card-body">
                                    <b>PLEASE NOTE:</b> If your health changes so that you then answer YES to any of the above questions, tell your fitness or health professional. Ask whether you should change your physical activity plan. 
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <p style="text-align:justify">
                            Informed Use of the PAR-Q: The Canadian Society for Exercise Physiology, Health Canada, and their agents assume no liability for persons who undertake physical actin ty, and if in doubt after completing this questionnaire, consult your doctor prior to physical activity. 

                        </p>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card">
                            <div class="card-body">
                                <h5><b>No changes premitted. You are encouraged to photocopy the PAR-Q but only if you use the entire form.</b></h5>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <p style="text-align:justify;">
                            NOTE: If the PAR•Q is being given to a person before he or she participates in a physical activity program or a fitness appraisal this section may be used for legal or administrative purposes. 
                        </p>
                        <b><center>"I have read, understood and completed this questionnaire. Any questions I had were answered to my full satisfaction? </center></b>
                    </div>
                    <div class="row">
                       <table class="table table-bordered">
                           <tr>
                               <td>
                                   Name : <asp:Label ID="lblName" runat="server" Font-Bold="true"></asp:Label>
                               </td>
                               <td>

                               </td>
                           </tr>
                           <tr>
                               <td>
                                   <br />
                                   <br />
                                   SIGNATURE : 
                               </td>
                               <td>
                                   DATE : <asp:Label ID="lblDate" runat="server" Font-Bold="true"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                              <td>
                                  <br />
                                  <br />
                                  SIGNATURE OF PARENTS:
                              </td>
                               <td>
                                   WITNESS 
                               </td>
                              
                           </tr>
                       </table>
                    </div>
                   
                    
                </div>


            </div>
        </div>
    </div>

    </form>
</body>
</html>
