<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HMIS.Master" CodeBehind="search.aspx.vb" Inherits="HMIS.search" EnableEventValidation = "false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
   
    <asp:Panel ID="Panel1" runat="server" Visible="false">
    <asp:Label ID="lblFacilityName" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblClientUniqCode" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblTransId" runat="server" Text=""></asp:Label>
    <asp:TextBox ID="txtClientUniqCode" runat="server"></asp:TextBox>
    <asp:Label ID="lblFullClientName"  runat="server" Text=""></asp:Label>
    <asp:TextBox ID="txtFullClientName" runat="server"></asp:TextBox>
    </asp:Panel>

    <div id="wrapper" style="padding:2px">
        Search:
<asp:TextBox ID="txtSearch" runat="server" />
<asp:Button ID="Button1" Text="Search" runat="server" OnClick="Search" />
<hr />
<asp:GridView ID="gvCustomers" runat="server" Width="70%" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged" AlternatingRowStyle-CssClass="even" CssClass="gridview"  
    EnableViewState="true"
    Caption="Select to view client details" autogenerateselectbutton="false" DataKeyNames="TransId" AutoGenerateColumns="false" 
    AllowPaging="true" OnRowDataBound="OnRowDataBound"
     OnPageIndexChanging="OnPageIndexChanging">
<Columns>
    <asp:BoundField ItemStyle-Width="150px" DataField="TransId" HeaderText="TransId"  HeaderStyle-CssClass = "hideGridColumn" ItemStyle-CssClass="hideGridColumn" />
    <asp:BoundField HeaderStyle-Width="100px" DataField="ClientUniqCode" HeaderText="Universal No"
        ItemStyle-CssClass="ContactName" />
    <asp:BoundField HeaderStyle-Width="150px" DataField="FullClientName" HeaderText="Client Name" />
    <asp:BoundField HeaderStyle-Width="150px" DataField="PhoneNo" HeaderText="Phone No" />
    <asp:BoundField HeaderStyle-Width="50px" DataField="Ageyrs" HeaderText="Age" />
    <asp:BoundField HeaderStyle-Width="50px" DataField="NationalId" HeaderText="ID. No." />
    <asp:BoundField HeaderStyle-Width="60px" DataField="RecrutingInterventionName" HeaderText="Recuit. Intv" />
</Columns>
</asp:GridView>
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
