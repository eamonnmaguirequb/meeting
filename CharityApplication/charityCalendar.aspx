<%@ Page Title="" Language="C#" MasterPageFile="~/privateLanding.Master" AutoEventWireup="true" CodeBehind="charityCalendar.aspx.cs" Inherits="CharityApplication.charityCalendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
    <asp:Panel ID="Panel1" runat="server"></asp:Panel>


    <div style="height:509px; width: 100%;">
            <%= this.Scheduler.Render()%>
        </div>	

     <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
