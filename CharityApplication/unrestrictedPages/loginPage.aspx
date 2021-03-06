﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserLogin.Master" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="CharityApplication.loginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="user" runat="server">
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control form-control-user"></asp:TextBox> 
                    </div>
                    <div class="form-group">
                         <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  CssClass="form-control form-control-user"></asp:TextBox>   
                   
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    <asp:Button ID="lginsubmit" runat="server" Text="Login"  class="btn btn-primary btn-user btn-block" OnClick="lginsubmit_Click1" />
                      
                    
                    <hr>
                    <a href="loginPageCharity.aspx" class="btn btn-user btn-block">
                      <i class="fab  fa-fw"></i> Charity? Log In Here
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="#">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="regPage.aspx">Create an Account!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
</asp:Content>
