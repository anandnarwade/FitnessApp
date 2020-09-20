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
                                &nbsp;Start Date<br />
                                <asp:TextBox ID="txtStartDAte" ValidationGroup="Member" autocomplete="off" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm from_date"></asp:TextBox>
                                <asp:RequiredFieldValidator  ID="CustomValidator2" ControlToValidate="txtStartDAte" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Member" runat="server" ErrorMessage="Start date is required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">
                                &nbsp;End Date<br />
                                <asp:TextBox ID="txtendDate" autocomplete="off" ValidationGroup="Member" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm to_date"></asp:TextBox>
                                <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtendDate" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Member" runat="server" ErrorMessage="" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            </div>

            <div class="col-sm-3">
               <b>Company</b> <span style="color:red">*</span><br />
                <asp:DropDownList ID="ddmCompany" AutoPostBack="true" OnSelectedIndexChanged="ddmCompany_SelectedIndexChanged"  ValidationGroup="Member" runat="server" CssClass="form-control form-control-sm" DataSourceID="ddmCompanyDataSource" DataTextField="CompanyName" DataValueField="id"></asp:DropDownList>
                 <asp:SqlDataSource ID="ddmCompanyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="Select '' AS [Id], '' as [CompanyName] UNION SELECT Convert(nvarchar(10), id) as [id], [CompanyName] FROM [CompanyMaster] ORDER BY [CompanyName]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Member" ControlToValidate="ddmCompany" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Company is required"></asp:RequiredFieldValidator>

            </div>

            <div class="col-sm-1">
                P count<br />
                <asp:TextBox ID="txtPraCount" Enabled="false" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                <asp:HiddenField ID="hiddenCountId" runat="server" />
            </div>
              <div class="col-sm-1">
                A count<br />
                <asp:TextBox ID="txtACount" Enabled="false" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                Upload Excel&nbsp;<br />
                <asp:FileUpload ID="FileUpload1" AllowMultiple="false" accept=".xlsx"  runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Member" ControlToValidate="FileUpload1" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Please select file"></asp:RequiredFieldValidator>
            </div>
           
            
            <div class="col-sm-2">
                &nbsp;<br />
                <asp:Button ID="btnUpload" ValidationGroup="Member" CssClass="btn btn-warning btn-sm" runat="server" Text="Upload Excel" OnClick="btnUpload_Click"  />
                
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
                       <%--  <asp:TemplateField HeaderText="CompanyCode">
                            <ItemTemplate>
                                <asp:Label ID="lblCompanyCode" runat="server" Text='<%#Eval("CompanyCode") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="BranchCode">
                            <ItemTemplate>
                                <asp:Label ID="lblBranchCode" runat="server" Text='<%#Eval("BranchCode") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
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

         $('#txtStartDAte').datepicker({
             dateFormat: 'yy-mm-dd'
         });

         $('#txtendDate').datepicker({
             dateFormat: 'yy-mm-dd'
         })


         //   $(".date").datepicker({ dateFormat: 'yy-mm-dd' });





         //$(function () {
         //    var dateFormat = "mm/dd/yy",
         //      from = $("#txtStartDAte")
         //        .datepicker({
         //            defaultDate: "+1w",
         //            changeMonth: true,
         //            numberOfMonths: 2
         //        })
         //        .on("change", function () {
         //            to.datepicker("option", "minDate", getDate(this));
         //        }),
         //      to = $("#txtendDate").datepicker({
         //          defaultDate: "+1w",
         //          changeMonth: true,
         //          numberOfMonths: 2
         //      })
         //      .on("change", function () {
         //          from.datepicker("option", "maxDate", getDate(this));
         //      });

         //    function getDate(element) {
         //        var date;
         //        try {
         //            date = $.datepicker.parseDate(dateFormat, element.value);
         //        } catch (error) {
         //            date = null;
         //        }

         //        return date;
         //    }
         //});
    </script>
</asp:Content>
