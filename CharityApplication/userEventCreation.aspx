<%@ Page Title="" Language="C#" MasterPageFile="~/privateStoreLanding.Master" AutoEventWireup="true" CodeBehind="userEventCreation.aspx.cs" Inherits="CharityApplication.userEventCreation" %>
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
                      <label for="inputFname" class="col-lg-3 control-label">Upload Profile Picture:</label>

                  </div>
                        <div class="col-sm-6">
                            <label for="inputEname" class="col-lg-3 control-label">Event Name:</label>
                      <asp:TextBox ID="eventName" CssClass="form-control form-control-user" runat="server" Width="280"></asp:TextBox>
                  </div>
                  <div class="col-sm-6">
                      <label for="inputsdate" class="col-lg-3 control-label">Start Date:</label>
                      <asp:TextBox ID="eventStartDate" CssClass="form-control form-control-user" runat="server" TextMode="Date" ></asp:TextBox>
                  </div>
                      <div class="col-sm-6">
                          <label for="inputedate" class="col-lg-3 control-label">End Date:</label>
                      <asp:TextBox ID="eventEndDate" CssClass="form-control form-control-user" runat="server" TextMode="Date"  ></asp:TextBox>
                  </div>
                      <div class="col-sm-6">
                           <label for="inputlocation" class="col-lg-3 control-label">Location:</label>
                      <asp:TextBox ID="eventLocation" runat="server" Height="100" Width="450"></asp:TextBox>
                    </div>
                       <div class="col-sm-6">
                           <label for="inputdesc" class="col-lg-3 control-label">Description:</label>
                      <asp:TextBox ID="eventDesc" runat="server" TextMode="MultiLine" Height="100" Width="450"></asp:TextBox>
                    </div>
                    
                      
                </div>

 
                
                    <asp:Button class="btn btn-success" ID="btnSubmit" runat="server" Text="Create Event" OnClick="btnSubmit_Click" />
                    <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
                    <asp:Literal ID="ltConfirm" runat="server"></asp:Literal>
                    <asp:Button class="btn btn-primary" ID="btnConfirm" runat="server" Text="Confirm" Visible="false" OnClick="btnConfirm_Click" />
                    <asp:Button class="btn btn-primary" ID="btnNo" runat="server" Text="Try Again" Visible="false" OnClick="btnNo_Click" />
                
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
