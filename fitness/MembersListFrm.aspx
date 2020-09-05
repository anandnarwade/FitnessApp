<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="MembersListFrm.aspx.vb" Inherits="fitness.MembersListFrm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid #cecece; background-color:white; border-radius:5px; padding:10px; margin-top:10px;">
        <div class="row" style="padding-left:20px;">
            <div class="col-sm-9">
                 <h3>Members List</h3>
            </div>
            <div class="col-sm-3">
                <asp:Button ID="btnGenerate" runat="server" Text="Generate and Send Link" CssClass="btn btn-warning" />
            </div>
           
        </div>
        
         <hr style="border:2px solid #343a40;" />  

        <div class="row" style="padding-left:20px;">
            <asp:GridView ID="GridMembersList" runat="server" CssClass="table table-bordered table-sm">
                
            </asp:GridView>
        </div>
    </div>
</asp:Content>
