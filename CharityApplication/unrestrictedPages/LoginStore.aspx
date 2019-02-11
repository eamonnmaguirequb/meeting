<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="LoginStore.aspx.cs" Inherits="CharityApplication.LoginStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <br />
        <div class="col-lg-6">
                <br />
                <div class="well">
                    <form class="form-horizontal" runat="server">
                        <fieldset>
                            <legend>Log In</legend>
                            <div class="form-group">
                                <label for="inputEmail" class="col-lg-2 control-label">Email:</label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>                                  
              
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="inputPassword" class="col-lg-2 control-label">Password:</label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>                                    
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    
                                  <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
                                     <asp:Label ID="loginlbl" runat="server" Visible="true"></asp:Label>
                                    <br />

                                         <asp:Button ID="lginsubmit" runat="server" Text="Submit" OnClick="lginsubmit_Click" />                               
                                </div>
                            </div>
                        </fieldset>
                        </form>
                    </div>
               </div>
</asp:Content>
