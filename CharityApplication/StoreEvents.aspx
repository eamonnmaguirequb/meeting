<%@ Page Title="" Language="C#" MasterPageFile="~/Private.Master" AutoEventWireup="true" CodeBehind="StoreEvents.aspx.cs" Inherits="CharityApplication.StoreEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form-horizontal" runat="server">
        <div class="container">
            <br />
            <br />
            <h1>Creation of a store event</h1>
            <b>Complete the below form to create a new Event for the Charity.</b>
            <br />
            <br />
            <br />
            <%-- Form that allows a Scrum Master Add a User Story --%>
            <div class="form-group">
               <asp:Label ID="EventManager" runat="server" class="col-lg-2 control-label"><b>Event Management:</b></asp:Label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtEventManager" runat="server" ></asp:TextBox> 
                    <br />
                </div>
            </div>
            <div class="form-group">
                <label for="StartDate" class="col-lg-2 control-label">Event Start Date:</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtStartDate" type="date" runat="server" TextMode="Date"></asp:TextBox>
                    <br />
                </div>
            </div>
            <div class="form-group">
                <label for="EndDate" class="col-lg-2 control-label">Event End Date:</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtEndDate" type="date" runat="server" TextMode="Date"></asp:TextBox>
                    <br />
                </div>
            </div>
             <div class="form-group">
               <asp:Label ID="EventDescription" runat="server" class="col-lg-2 control-label"><b>Sprint Description:</b></asp:Label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Height="86px" Width="428px"></asp:TextBox>
                    <br />
                    <br />
                </div>
            </div>
            <div class="form-group">
               <asp:Label ID="EventLocation" runat="server" class="col-lg-2 control-label"><b>Event Location:</b></asp:Label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtEventLocation"  runat="server" ></asp:TextBox>
                    <br />
                    <br />
                </div>
            </div>
            <div class="form-group">
               <asp:Label ID="EventImage" runat="server" class="col-lg-2 control-label"><b>Event Location:</b></asp:Label>
                <div class="col-lg-10">
                    <<asp:FileUpload ID="eventImgUpload" runat="server" />
                    <br />
                    <br />
                </div>
            </div>
              <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
          
                    <asp:Button class="btn btn-success" ID="Button_CreateSprint" runat="server" Text="Create Sprint" OnClick="Button_CreateSprint_Click" />
                    <asp:Button ID="Button1" CausesValidation="false" runat="server" OnClick="Return_Button_Click" CssClass="btn btn-danger" Text="Cancel" Width />
                    <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
                    <asp:Literal ID="ltConfirm" runat="server"></asp:Literal>
                    <asp:Button class="btn btn-primary" ID="btnConfirm" runat="server" Text="Confirm" Visible="false" OnClick="btnConfirm_Click" />
                    <asp:Button class="btn btn-primary" ID="btnNo" runat="server" Text="Try Again" Visible="false" OnClick="btnNo_Click" />
                </div>
            </div>

        </div>
    </form>
</asp:Content>
