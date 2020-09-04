<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="Par-q-and-you.aspx.vb" Inherits="fitness.Par_q_and_you" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                   
                    
                </div>


            </div>
        </div>
    </div>

    
</asp:Content>
