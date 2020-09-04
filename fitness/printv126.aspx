<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="printv126.aspx.vb" Inherits="fitness.printv126" %>

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
        <div class="container" style="padding:20px;">
            <div class="col-sm-12">
                <center><h4><b>HEALTH-HISTORY QUESTIONNAIRE</b></h4></center>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-8">
                    Name : <asp:TextBox ID="txtName" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    Date : <asp:TextBox ID="txtDate" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-8">
                    Age : <asp:TextBox ID="txtAge" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    Sex : <asp:TextBox ID="txtSex" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-8">
                    Physician’s Name : <asp:TextBox ID="txtphyName" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    Physician’s Phone : <asp:TextBox ID="txtphyNo" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-6">
                    <p>Person to contact in case of emergency:</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-8">
                    Name : <asp:TextBox ID="txtEmName" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                     Phone : <asp:TextBox ID="txtEmContact" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <p>Are you taking any medications, supplements, or drugs? If so, please list medication, dose, and reason.</p> <br />
                    <asp:TextBox ID ="txtmed" runat="server" CssClass="form-control" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                </div>
                
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <p>Does your physician know you are participating in this exercise program?</p>
                    <asp:TextBox ID="txtparticipting" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <p>Describe any physical activity you do somewhat regularly.</p>
                    <asp:TextBox ID="txtphysicalAct" runat="server" CssClass="form-control" Enabled="false" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <p>Do you now have, or have you had in the past:</p>
                <div class="col-sm-12">
                     <asp:GridView ID="GridParq" CssClass="table table-bordered" AutoGenerateColumns="false" runat="server">
                        <Columns>

                            <asp:BoundField DataField="sequence" HeaderText="Sr. No" />
                            <asp:BoundField DataField="question" HeaderText="Questions" />
                            <asp:TemplateField HeaderText="Yes">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                    
                                    <asp:Label ID="lblv126id" runat="server" Text='<%#Eval("v126id") %>' Visible="false"></asp:Label>
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
                            
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
