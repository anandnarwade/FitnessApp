<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="MembersFrm.aspx.vb" Inherits="fitness.MembersFrm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
          <div class="row" style="padding-left: 30px;">
                <div class="col-sm-8">
                    <h3><b>Member Master</b></h3>
                     <asp:Label ID="lblMessage" runat="server" Font-Size="16px"></asp:Label>
                </div>
              <div class="col-sm-1"></div>
                <div class="col-sm-3">
                    <a href="Files/MemberTemplate.xlsx" class="btn btn-sm btn-warning">Download excel template</a>
                </div>
            </div>
          <hr style="border:2px solid #343a40;" />  
        <div class="row" style="padding-left:20px;">
          
            <div class="col-sm-2">
                <b>Upload Excel : </b>
            </div>
            <div class="col-sm-2">
                <asp:FileUpload ID="FileUpload1" reqired="" runat="server" />
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnUpload" CssClass="btn btn-info btn-sm" runat="server" Text="Upload Excel" OnClick="btnUpload_Click"  />
            </div>
          
        </div>
        <hr />
        <div class="row" style="padding-left:20px;">
            <div class="col-sm-12">
                <asp:GridView ID="GridData" CssClass="table table-bordered table-active" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="SrNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSrNo" runat="server" Text='<%#Eval("SrNo") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="lblMobile" runat="server" Text='<%#Eval("Mobile") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="CompanyCode">
                            <ItemTemplate>
                                <asp:Label ID="lblCompanyCode" runat="server" Text='<%#Eval("CompanyCode") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="BranchCode">
                            <ItemTemplate>
                                <asp:Label ID="lblBranchCode" runat="server" Text='<%#Eval("BranchCode") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="IfOk">
                            <ItemTemplate>
                               <asp:CheckBox ID="chkOk" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <hr />
        <div class="row" style="padding-left:20px;">
            <div class="col-sm-8"></div>
             <% If (Uploaded) Then %>
            <div class="col-sm-1">
                <a href="MembersFrm.aspx" class="btn btn-danger">Cancel</a>
            </div>
            <div class="col-sm-3">
               
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-warning btn-block" Text="CONFIRM & SUBMIT" OnClick="btnSubmit_Click"   />
                   
                
            </div>
             <% End If %>
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
