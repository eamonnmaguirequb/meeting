<%@ Page Title="" Language="C#" MasterPageFile="~/privateLanding.Master" AutoEventWireup="true" CodeBehind="charityStoreCreation.aspx.cs" Inherits="CharityApplication.charityPages.charityStoreCreation" %>
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
                <h1 class="h4 text-gray-900 mb-4">Create Your Store!</h1>
              </div>
                  <div class="form-group row">
                       <div class="col-sm-6 mb-3 mb-sm-0">
                      <asp:TextBox ID="txtStoreEmail" CssClass="form-control form-control-user" runat="server" Width="280"></asp:TextBox>
                  </div>
                  <div class="col-sm-6">
                      <asp:TextBox ID="txtstoreLocation" CssClass="form-control form-control-user" runat="server" ></asp:TextBox>
                  </div>
                </div>
 
                <asp:Button class="btn btn-success" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                
                 <hr>
                    <a href="charityUserCreation.aspx" class="btn btn-user btn-block">
                       Store Already Created? Register your user here now
                 </a>
              <hr>
              <div class="text-center">
                <a class="small" href="#">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="loginPage.aspx">Already have an account? Login!</a>

                 <asp:Literal ID="Literal1" runat="server"></asp:Literal>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

</div>
    
                

                
                 

</asp:Content>
