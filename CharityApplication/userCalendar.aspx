<%@ Page Title="" Language="C#" MasterPageFile="~/privateUserLanding.Master" AutoEventWireup="true" CodeBehind="userCalendar.aspx.cs" Inherits="CharityApplication.userCalendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height:509px; width: 100%;">
            <%= this.Scheduler.Render()%>
        </div>	

     <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <style>
        #scheduler_here table {
            border: none;
            border-collapse: collapse;
        }
        #scheduler_here table td {
            padding: 0;
            border: none;
        }
        #scheduler_here table th {
            padding: none;           
        }
     </style>

    <form runat="server">
    <div class="page">
        <div class="header">
            <div class="title">
                <h1>
                    dhtmlxScheduler .Net
                </h1>
            </div>
        </div>

        <div class="clear">
        </div>
    </div>

    </form>
</asp:Content>
