<%@ Page Title="" Language="C#" MasterPageFile="~/privateLanding.Master" AutoEventWireup="true" CodeBehind="charityOverview.aspx.cs" Inherits="CharityApplication.charityPages.charityOverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Welcome Back <asp:Literal ID="userLoggedIn" runat="server">Unknown</asp:Literal></h1>
          </div>
            
            <div>
                 <asp:GridView ID="GridViewImage" runat="server" AutoGenerateColumns="False" DataSourceID="sqlImage"  GridLines="None" Width="">
                <Columns>
                    <asp:ImageField DataImageUrlField="charityHeader" SortExpression="userEmail" />
                </Columns>
            </asp:GridView>
            
            
            <asp:SqlDataSource ID="sqlImage" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT [charityHeader] FROM [CharityOrganisation] WHERE CharityOrganisation.[charityContact] = @charityAdmin">
                <SelectParameters>
                    <asp:Parameter Name="charityAdmin" />
                </SelectParameters>
                </asp:SqlDataSource>
            </div>

          <div class="row">

            <div class="col-lg-6">


              <!-- Basic Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">New Store Opening? Create their very own Charity Management below!</h6>
                </div>
                <a class="btn btn-primary" href="charityStoreCreation.aspx">Create</a>
              </div>

            </div>

            <div class="col-lg-6">

              <!-- Dropdown Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">New Store Opening? Create their very own Charity Management below!</h6>
                </div>
                <a class="btn btn-primary" href="charityStoreCreation.aspx">Create</a>
              </div>



            </div>

          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>

</asp:Content>
