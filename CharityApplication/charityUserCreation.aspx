<%@ Page Title="" Language="C#" MasterPageFile="~/privateLanding.Master" AutoEventWireup="true" CodeBehind="charityUserCreation.aspx.cs" Inherits="CharityApplication.charityPages.charityUserCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create Your Admin!</h1>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control form-control-user" Text="first name..."></asp:TextBox>
                                    </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control form-control-user" Text="last name..."></asp:TextBox>
                                    </div>
                                </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control form-control-user" Text="post code..."></asp:TextBox>
                                </div>
                            
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control form-control-user" Text="email address..."></asp:TextBox>
                        </div>
                    <div class="form-group row">
                         <div class="col-sm-6 mb-3 mb-sm-0">
                             <asp:TextBox ID="txtPassword" runat="server"  CssClass="form-control form-control-user" Text="password..."></asp:TextBox> 
                             </div>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtPassword2" runat="server" CssClass="form-control form-control-user" Text="confirm password..."></asp:TextBox> 
                            </div>
                        </div>
                    <asp:Button ID="btnSubmit" class="btn btn-primary btn-user btn-block" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    <hr>
                    <a href="charityStoreCreation.aspx" class="btn btn-user btn-block">
                        No Store Created? Register your store here now
                        </a>
                 </div>
                     
            <br />

                    <asp:Button ID="Return_Button" runat="server" OnClick="Return_Button1" class="btn btn-primary btn-user btn-block" Text="Back" Width="154px" />
                 <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
              </div>
          </div>
        </div>
        </div>
    </div>



</asp:Content>
