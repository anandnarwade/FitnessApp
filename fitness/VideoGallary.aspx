<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="VideoGallary.aspx.vb" Inherits="fitness.VideoGallary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="">
            <div class="col-sm-10">
                <h4>Video Gallary</h4>
            </div>
        </div>
        <hr />
        <div class="row">
           
                <div class="col-sm-2">
                    <div>Category</div>
                    <div>
                        <asp:DropDownList ID="ddmCate" ValidationGroup="frm" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="BODY COMBAT">BODY COMBAT</asp:ListItem>
                            <asp:ListItem Value="YOGA">YOGA</asp:ListItem>
                            <asp:ListItem Value="ZUMBA">ZUMBA </asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator1" ValidationGroup="frm" ControlToValidate="ddmCate" runat="server" ErrorMessage="Category is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div>
                        Video URL
                    </div>
                    <div>
                        <asp:TextBox ID="txtVideoURL" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator2" ValidationGroup="frm" ControlToValidate="txtVideoURL" runat="server" ErrorMessage="Youtube URL is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-sm-2">
                    &nbsp;<br />
                    <asp:CheckBox ID="chkActive" runat="server" /> <asp:Label ID="lblChek" AssociatedControlID="chkActive" runat="server" Text="Is Active?"></asp:Label>
                </div>

             <div class="col-sm-1">
                    &nbsp;<br />
                    <asp:Button ID="btnSave" ValidationGroup="frm" runat="server" Text="Save" CssClass="btn btn-sm btn-info" OnClick="btnSave_Click"  />
                </div>
            <div class="col-sm-1">
                &nbsp;<br />
                <a href="VideoGallary.aspx" class="btn btn-danger btn-sm">Cancel</a>
            </div>
           
        </div>
        <hr />
        <div class="row">
            <asp:HiddenField ID="hiddenId" runat="server" />
            <div class="col-sm-12">
                <asp:GridView ID="GridVideo" runat="server" CssClass="table table-bordered table-condensed table-striped table-sm">
                    <Columns>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument= '<%#Eval("id") %>' OnClick="lnkEdit_Click"  ><i class="fa fa-edit"></i></asp:LinkButton> ||
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument= '<%#Eval("id") %>' ForeColor="Red" ><i class="fa fa-trash"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
