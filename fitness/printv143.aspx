<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="printv143.aspx.vb" Inherits="fitness.printv143" %>

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
        <div class="container">
            <div class="row">
                <h4><center><b style="text-transform:uppercase;">Readiness to change questionnaire</b></center></h4>
            </div>
            <div class="row" style="padding:20px;">
                     <asp:GridView ID="GridPrintV143" CssClass="table table-bordered" AutoGenerateColumns="false" runat="server">
                        <Columns>

                            <asp:BoundField DataField="sequence" HeaderText="Sr. No" />
                            <asp:BoundField DataField="question" HeaderText="Questions" />
                            <asp:TemplateField HeaderText="Yes">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                    
                                    <asp:Label ID="lblv126id" runat="server" Text='<%#Eval("v143id") %>' Visible="false"></asp:Label>
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
    </form>
</body>
</html>
