<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="CompanyMasterFrm.aspx.vb" Inherits="fitness.CompanyMasterFrm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="padding-left:30px;">
            <div class="col-sm-12">
                <h4><b>Company Master</b></h4><br />
                <asp:Label ID="lblMessage" runat="server" Font-Size="16px"></asp:Label>
            </div>
        </div>
         <hr style="border:2px solid #343a40;" />  
        <div class="row" style="padding-left:10px;">
            <div class="col-sm-2">
                <b>Company Code</b> <span style="color:red">*</span><br />
                <asp:TextBox ID="txtCompanyCode" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="company" ControlToValidate="txtCompanyCode" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Code is required"></asp:RequiredFieldValidator>
            </div>
            <div class="col-sm-3">
                <b>Company Name</b><span style="color:red">*</span><br />
                <asp:TextBox ID="txtCmpName" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="company" ControlToValidate="txtCmpName" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Company Name is required"></asp:RequiredFieldValidator>
            </div>
             <div class="col-sm-2">
                <b>Branch Code</b><br />
                <asp:TextBox ID="txtBranchCode" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                 
            </div>
             <div class="col-sm-2">
                <b>Branch Name</b><br />
                <asp:TextBox ID="txtBranchName" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <b>Short Code</b><br />
                <asp:TextBox ID="txtShortCode" runat="server" ValidationGroup="company" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-3">
                <b>Address</b><br />
                <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" ValidationGroup="company" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-2">
                <b>City</b><br />
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control form-control-sm" ValidationGroup="company" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-2">
                <b>State</b><br />
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control form-control-sm" ValidationGroup="company" Font-Size="12px"></asp:TextBox>
            </div>
             <div class="col-sm-1">
                <b></b><br />
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-warning" Text="SAVE" ValidationGroup="company" OnClick="btnSave_Click"  />
            </div>
            <div class="col-sm-1">
                <b></b><br />
                <a href="CompanyMasterFrm.aspx" class="btn btn-danger">CANCEL</a>
            </div>
            
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-12">
                <asp:GridView ID="GridCompany" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="CompanyCode" HeaderText="Company Code" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                        <asp:BoundField DataField="BranchCode" HeaderText="Branch Code" />
                        <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                        <asp:BoundField DataField="ShortCode" HeaderText="Short Code" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" ToolTip="Click to Edit" CommandArgument='<%#Eval("Id") %>' OnClick="btnEdit_Click"  runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hiddenId" runat="server" />
      <script type="text/javascript">
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
    </script>
</asp:Content>
