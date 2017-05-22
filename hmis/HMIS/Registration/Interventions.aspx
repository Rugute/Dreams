<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HMIS.Master" CodeBehind="Interventions.aspx.vb" Inherits="HMIS.Interventions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
         <asp:Panel ID="Panel1" runat="server" Visible="false">
        <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
         <asp:Label ID="lblResults" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblClientUniqCode" runat="server" Text=""></asp:Label>
        <asp:TextBox ID="txtClientUniqCode" runat="server"></asp:TextBox>
        <asp:Label ID="lblTransId" runat="server" Text=""></asp:Label>
    </asp:Panel>
        <div id="wrapper"  style="border:1px solid red; width:90%; margin:0; background-image:url('img/backgroundsmallest.png'); overflow:hidden">
            <div id="header" style="border-bottom:1px solid magenta;text-align:center">
            <span title="Header" style="color:Black; margin-left:5px;font-size:15px; color:white; font-weight:bolder; background-image:url('img/backgroundsmallest.png'); font-family:Verdana;">Add intervention</span>
        </div>
                    <hr/>
        <div style="background-color:black; margin-bottom:5px"><span title="Subheader1" class="spanlabelsTitles" >B12: Recruiting and other interventions this client has visited at IRDO</span></div>
        <div style="clear:both; margin-top:5px">
        <div style="clear:both; margin-top:5px">
                    <div>
            <span title="txtRegVisitDate" class="spanlabelsnormal">Visit Date:</span>
            <input name="ctlContentPlaceHolder_RegVisitDate" type="text"  id="txtRegVisitDate"   runat="server" class="textarea" style="margin-top:5px; width:100px"  />
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="ddRegInterventionId" class="spanlabelsnormal">Intervention:</span><span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <asp:DropDownList ID="ddErgInterventionId" CssClass="ddFacilityName"  style="margin-top:5px;"   runat="server" AutoPostBack="True"></asp:DropDownList> 
            <asp:Button ID="cmdAddIntv" runat="server" Text="Add" />
<br />
        </div><hr/>
            <br />
            <asp:Label ID="lblFullClientName" class="spanlabelsnormal" runat="server" Text=""></asp:Label>
        </div>
             <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false" DataKeyNames="TransId"
 EmptyDataText="No records has been added."  Font-Bold="True" HeaderStyle-ForeColor="purple" HeaderStyle-BackColor="#FDF1E3" BackColor="LightYellow">
<Columns>
        <asp:TemplateField HeaderText = "SN" ItemStyle-Width="30" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Universal No." ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblClientUniqCode" runat="server" Text='<%# Eval("ClientUniqCode")%>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtClientUniqCode" runat="server" BackColor="LightCyan"  Text='<%# Eval("ClientUniqCode")%>'></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredtxtClientUniqCode" runat="server" ControlToValidate="txtClientUniqCode" ForeColor="red"  ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Visit Date" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblVisitDate" runat="server" Text='<%# Eval("VisitDate", "{0:dd/MM/yyyy}")%>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtVisitDate" runat="server" BackColor="LightCyan"  Text='<%# Eval("VisitDate", "{0:dd-MM-yyyy}")%>'></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredtxtVisitDate" runat="server" ControlToValidate="txtVisitDate" ForeColor="red"  ErrorMessage="Required field cannot be left blank." Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Intervention" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblInterventionId" runat="server" Text='<%# Eval("ClientUniqIntvCode")%>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
           <%-- <asp:TextBox ID="txtClientUniqCode" runat="server" BackColor="LightCyan"  Text='<%# Eval("ClientUniqCode")%>'></asp:TextBox>--%>
            <asp:DropDownList ID="ddInterventionId"  BackColor="LightCyan" Text='<%# Eval("ClientUniqIntvCode")%>' runat="server"></asp:DropDownList>
            
            <asp:RequiredFieldValidator ID="RequiredddInterventionId" runat="server" ControlToValidate="ddInterventionId" ForeColor="red"  ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        </EditItemTemplate>
    </asp:TemplateField>
    
    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150"/>
    
</Columns>
</asp:GridView>
        </div>
            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
