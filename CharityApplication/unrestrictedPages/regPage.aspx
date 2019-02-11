<%@ Page Title="" Language="C#" MasterPageFile="~/UserLogin.Master" AutoEventWireup="true" CodeBehind="regPage.aspx.cs" Inherits="CharityApplication.unrestrictedPages.regPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form class="user" runat="server">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                      <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                      <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control form-control-user" Text="first name..."></asp:TextBox>
                  </div>
                  <div class="col-sm-6">
                      <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                     <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control form-control-user" Text="last name..."></asp:TextBox>
                  </div>
                </div>
                  <div class="form-group">

                      <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control form-control-user" Text="post code..."></asp:TextBox>
                  </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                  <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control form-control-user" Text="email address..."></asp:TextBox>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                      <asp:Label ID="Label4" runat="server" Text="Pass"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server"  CssClass="form-control form-control-user" Text="password..."></asp:TextBox> 
                  </div>
                  <div class="col-sm-6">
                      <asp:Label ID="Label5" runat="server" Text="Pass"></asp:Label>
                    <asp:TextBox ID="txtPassword2" runat="server" CssClass="form-control form-control-user" Text="confirm password..."></asp:TextBox> 
                  </div>
                </div>
                   <div class="form-group ">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="txtSkillSet" runat="server" TextMode="MultiLine" Height="100" Width="450" CssClass="form-control form-control-user"></asp:TextBox>
                   </div>
                </div>
                  
                 <asp:Button ID="btnSubmit" class="btn btn-primary btn-user btn-block" runat="server" Text="Submit" OnClick="btnSubmit_Click" />  
                
                  
                
                <hr>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                   Charity? Register your store here now
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="#">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="loginPage.aspx">Already have an account? Login!</a>

                 <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


</asp:Content>
