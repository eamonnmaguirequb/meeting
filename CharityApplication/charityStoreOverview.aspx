<%@ Page Title="" Language="C#" MasterPageFile="~/privateStoreLanding.Master" AutoEventWireup="true" CodeBehind="charityStoreOverview.aspx.cs" Inherits="CharityApplication.charityStoreOverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <%-- Here We need to write some js code for load google chart with database data --%>
            <script src="Scripts/jquery-3.3.1.js"></script>
            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
 
            <script>
                var chartData; // globar variable for hold chart data
                google.load("visualization", "1", { packages: ["corechart","context"] });
 
                // Here We will fill chartData
 
                $(document).ready(function () {
           
                    $.ajax({
                        url: "GoogleChart.aspx/GetChartData",
                        data: "",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; chartset=utf-8",
                        success: function (data) {
                            chartData = data.d;
                        },
                        error: function () {
                            alert("Error loading data! Please try again.");
                        }
                    }).done(function () {
                        // after complete loading data
                        google.setOnLoadCallback(drawChart);
                        drawChart();
                    });
                });
 
 
                function drawChart() {
                    var data = google.visualization.arrayToDataTable(chartData);
 
                    var options = {
                        title: "Company Revenue",
                        pointSize: 5
                    };
 
                    var pieChart = new google.visualization.PieChart(document.getElementById('chart_div'));
                    pieChart.draw(data, options);
 
                }
 
            </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div id="content-wrapper">

        <div class="container-fluid">

            <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Welcome Back <asp:Literal ID="userLoggedIn" runat="server">Unknown</asp:Literal><asp:Literal ID="userLocation" runat="server">Unknown</asp:Literal></h1>
          </div>
              <!-- Charity Information-->

       <main role="main" class="container">
      <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded box-shadow">
     

            <asp:GridView ID="GridViewImage" runat="server" AutoGenerateColumns="False" DataSourceID="sqlImage"  GridLines="None">
                <Columns>
                    <asp:ImageField DataImageUrlField="charityImage" SortExpression="userEmail" />
                </Columns>
            </asp:GridView>
            
            
            <asp:SqlDataSource ID="sqlImage" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT [charityImage] FROM [Charity] WHERE [Charity].[charityOrganiser] = @charityStore">
                <SelectParameters>
                    <asp:Parameter Name="charityStore" />
                </SelectParameters>
                </asp:SqlDataSource>

                <br />
                </div>
                 <div class="lh-100">

<div id="chart" style="width: 900px; height: 500px;">
</div>
                     <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" OnLoad="Chart1_Load">
                         <Series>
                             <asp:Series Name="Series1" XValueMember="ProductCategory" YValueMembers="RevenueAmount"></asp:Series>
                         </Series>
                         <ChartAreas>
                             <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                         </ChartAreas>
                     </asp:Chart>

                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM [GoogleChartData]"></asp:SqlDataSource>

          <h6 class="mb-0 text-white lh-100">Bootstrap</h6>
          <small>Since 2011</small>
        </div>
           </main>
      </div>

         </div>
    
</asp:Content>
