<%@ Page Title="" Language="C#" MasterPageFile="~/privateUserLanding.Master" AutoEventWireup="true" CodeBehind="charityUserView.aspx.cs" Inherits="CharityApplication.charityUserView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
              <form id="form1" runat="server">
              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Charities</h6>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="charityId" DataSourceID="charityView" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="charityId" HeaderText="charityId" InsertVisible="False" ReadOnly="True" SortExpression="charityId" />
                        <asp:BoundField DataField="charityOrganiser" HeaderText="charityOrganiser" SortExpression="charityOrganiser" />
                        <asp:BoundField DataField="charityMessage" HeaderText="charityMessage" SortExpression="charityMessage" />
                        <asp:BoundField DataField="charityName" HeaderText="charityName" SortExpression="charityName" />
                        <asp:BoundField DataField="charityLocation" HeaderText="charityLocation" SortExpression="charityLocation" />
                        <asp:BoundField DataField="charityImage" HeaderText="charityImage" SortExpression="charityImage" />
                    </Columns>
                  </asp:GridView>

                  <asp:SqlDataSource ID="charityView" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [Charity]"></asp:SqlDataSource>

              </div>
              </form>
</asp:Content>
