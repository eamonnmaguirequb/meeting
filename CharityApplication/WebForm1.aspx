<%@ Page Title="" Language="C#" MasterPageFile="~/privateLanding.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CharityApplication.WebForm1" %>
<%@ Import Namespace="DayPilot.Web.Mvc.Enums" %>
<%@ Import Namespace="DayPilot.Web.Mvc.Events.Month" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" 
        Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="500px" OnDayRender="Calendar1_DayRender" Width="500px" 
        OnSelectionChanged="Calendar1_SelectionChanged" CellPadding="1">
        <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
        <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
        <WeekendDayStyle BackColor="#CCCCFF" />
    </asp:Calendar>
</div>
<div>

    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" BackColor="#EAEAEA" BorderColor="White" BorderStyle="Solid" Height="200px" Width="300px" 
                Direction="LeftToRight" Font-Names="Calibri" BackImageUrl="~/Image/index2.jpg">
                <div style="height:120px; width:300px;">
                    <table>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Date"></asp:Label></td>
                            <td><asp:Label ID="lbl_date" runat="server" Text="16-06-2014"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label3" runat="server" Text="Time"></asp:Label></td>
                            <td><asp:Label ID="lbl_time" runat="server" Text="07:00 PM"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label5" runat="server" Text="Day"></asp:Label></td>
                            <td><asp:Label ID="lbl_day" runat="server" Text="Monday"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lbl_msg" runat="server" Text="Staff Meeting"></asp:Label></td>
                        </tr>
                    </table>
                </div>
                <div style="height:40px; width:300px">
                    <asp:Image ID="Image_imgages" runat="server" Height="50px" Width="50px" Visible="false" />
                </div>
                <br />
                <asp:Button ID="btn_close" runat="server" Text="Close" />
                <asp:HiddenField runat="server" ID="HiddenField1" />
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="HiddenField1"
                    CancelControlID="btn_close" DropShadow="True">
                </ajaxToolkit:ModalPopupExtender>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Calendar1" EventName="SelectionChanged" />
        </Triggers>
    </asp:UpdatePanel>
</div>
</asp:Content>
