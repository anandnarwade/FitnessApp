<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="SpocMasterfrm.aspx.vb" Inherits="fitness.SpocMasterfrm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
       <div class="row" style="padding-left:30px;">
            <div class="col-sm-12">
                <h4><b>SPOC Master</b></h4><br />
                <asp:Label ID="lblMessage" runat="server" Font-Size="16px"></asp:Label>
            </div>
        </div>
         <hr style="border:2px solid #343a40;" />  
        <div class="row" style="padding-left:10px;">
             <div class="col-sm-2">
                <b>Company</b> <span style="color:red">*</span><br />
                <asp:DropDownList ID="ddmCompany" ValidationGroup="spoc" runat="server" CssClass="form-control form-control-sm" DataSourceID="ddmCompanyDataSource" DataTextField="CompanyName" DataValueField="id"></asp:DropDownList>
                 <asp:SqlDataSource ID="ddmCompanyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="Select '' AS [Id], '' as [CompanyName] UNION SELECT Convert(nvarchar(10), id) as [id], [CompanyName] FROM [CompanyMaster] ORDER BY [CompanyName]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="spoc" ControlToValidate="ddmCompany" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Company is required"></asp:RequiredFieldValidator>
            </div>
             <div class="col-sm-2">
                <b>SPOC Name</b> <span style="color:red">*</span><br />
                <asp:TextBox ID="txtspocName" ValidationGroup="company" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="spoc" ControlToValidate="txtspocName" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
            </div>
             <div class="col-sm-2">
                <b>Designation</b> <span style="color:red">*</span><br />
                <asp:TextBox ID="txtDesig" ValidationGroup="spoc" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="spoc" ControlToValidate="txtDesig" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Designation is required"></asp:RequiredFieldValidator>
            </div>

            <div class="col-sm-2">
                <b>Email</b> <span style="color:red">*</span><br />
                <asp:TextBox ID="txtEmail" TextMode="Email" ValidationGroup="spoc" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="spoc" ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
            </div>
             <div class="col-sm-2">
                <b>Mobile</b> <span style="color:red">*</span><br />
                <asp:TextBox ID="txtContactNo" ClientIDMode="Static" MaxLength="10" ValidationGroup="spoc" runat="server" CssClass="form-control form-control-sm" Font-Size="12px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="spoc" ControlToValidate="txtContactNo" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Designation is required"></asp:RequiredFieldValidator>
            </div>
             <div class="col-sm-2">
                <b>Category</b> <span style="color:red">*</span><br />
                <asp:DropDownList ID="ddmCategory" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                    <asp:ListItem Value="Special" Text="Special"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="spoc" ControlToValidate="ddmCategory" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Designation is required"></asp:RequiredFieldValidator>
            </div>
            <div class="col-sm-1">
                &nbsp;<br />
                <asp:Button ID="btnSave" runat="server" Text="SAVE" ValidationGroup="spoc" CssClass="btn btn-warning" OnClick="btnSave_Click"  />
            </div>
            <div class="col-sm-1">
                 &nbsp;<br />
                <a href="SpocMasterfrm.aspx" class="btn btn-danger">CANCEL</a>
            </div>
        </div>
        <hr />
        <div class="row" style="padding-left:20px;">
            <div class="col-sm-12">
                <asp:GridView ID="GridSpoc" Font-Size="12px" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" >
                    <Columns>
                        <asp:BoundField DataField="spocname" HeaderText="SPOC Name" />
                        <asp:BoundField DataField="designation" HeaderText="Designation" />
                        <asp:BoundField DataField="spocemail" HeaderText="Email" />
                        <asp:BoundField DataField="spoccontactno" HeaderText="Mobile" />
                        <asp:BoundField DataField="category" HeaderText="Category" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" CommandArgument='<%#Eval("Id") %>' OnClick="lnkEdit_Click"  runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div> <asp:HiddenField ID="hiddenId" runat="server" />
    <script type="text/javascript">
        $("#txtContactNo").keydown(function (event) {
            // Allow only backspace and delete
            if (event.keyCode == 46 || event.keyCode == 8) {
                // let it happen, don't do anything
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.keyCode < 48 || event.keyCode > 57) {
                    event.preventDefault();
                }
            }
        });

         function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
    </script>
</asp:Content>
