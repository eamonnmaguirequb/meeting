<%@ Page Title="" Language="C#" MasterPageFile="~/privateLanding.Master" AutoEventWireup="true" CodeBehind="CharityStoreActive.aspx.cs" Inherits="CharityApplication.CharityStoreActive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h3 class="h3 mb-0 text-gray-800">View your active stores below!</h3>
          </div>

          <div class="container">

              <asp:GridView ID="GridViewCharity" runat="server" AutoGenerateColumns="false" DataSourceID="SqlCharityStore" GridLines="None" CssClass="table table-responsive table-hover" AllowPaging="true" PageSize="5" OnRowCommand="GridViewCharity_RowCommand">
                             <Columns>
                                 <asp:BoundField DataField="charityId"  SortExpression="charityId"  ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" Visible="false" />
                                 <asp:ImageField DataImageUrlField="charityImage" SortExpression="userEmail" />
                                 <asp:BoundField DataField="charityOrganiser"  SortExpression="charityOrganiser" />
                                 <asp:BoundField DataField="charityName" SortExpression="charityName" />
                                 <asp:BoundField DataField="charityLocation"  SortExpression="charityLocation" />
                                 <asp:ButtonField CommandName="Select" Text="VIEW" />
                             </Columns>
                </asp:GridView>
                   
                <asp:SqlDataSource ID="SqlCharityStore" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT [charityId],[charityOrganiser], [charityName], [charityLocation], [charityImage] FROM [Charity] JOIN [CharityOrganisation] ON [CharityOrganisation].[charityOrganisation] = [Charity].[charityName] WHERE CharityOrganisation.[charityContact] = @charityStore ">
                    <SelectParameters>
                    <asp:Parameter Name="charityStore" />
                </SelectParameters>
                </asp:SqlDataSource>
          </div>

</asp:Content>
