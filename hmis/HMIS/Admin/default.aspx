<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HMIS.Master" CodeBehind="default.aspx.vb" Inherits="HMIS._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div id="page" style="background-image:url('img/BackgroundSmall.png')">
    <%--<link href="../Styles/VMMC.css" rel="stylesheet" />--%>
        <div class="centerBlock" ><div id="login" style="text-align:center;  clear:both" >
       <div style=" padding:10px; margin-left:-550px; margin-right:auto"><asp:Label ID="lblFacilityError" ForeColor="Red" Font-Size="12px" runat="server" Text=""></asp:Label></div>
 <asp:Login ID = "Login1" runat = "server"   CssClass="LoginControl" InstructionText="Please enter your username and password for login." UserNameLabelText="Username" TitleText="" loginbuttontext="Login" Font-Bold="True"  
     DisplayRememberMe="False" OnAuthenticate= "ValidateUser" CheckBoxStyle-BorderColor="Transparent" Width="400px"  Height="103px" >
<CheckBoxStyle BorderColor="Transparent"></CheckBoxStyle>

     <LayoutTemplate>
         &nbsp;
         
         <table border="0"  style="border-collapse:collapse; border-color:transparent; color:white; font-family:Verdana; font-size:14px; padding:1px; width:100% ">
                                        <tr>
                                            <td>
                                                <table border="0" style="width:100%;">
                                                    <tr>
                                                        <td colspan="3" style="color:white" class="spanlabelsnormal" >
                                                            Log In</td>
                                                    </tr>
                                                    <tr style="width:100%">
                                                        <td colspan="2"  style="width:100px" >
                                                            <asp:Label ID="UserNameLabel"  runat="server" AssociatedControlID="UserName">User 
                                                            Name:</asp:Label>
                                                        </td>
                                                        <td style="padding:3px" >

                                                            <asp:TextBox ID="UserName" CssClass="textarea"  runat="server" AutoPostBack="True" OnTextChanged="UserName_TextChanged"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                                ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr style="width:100%">
                                                        <td colspan="2" style="width:100px">
                                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                        </td>
                                                        <td style="width:100%; padding:3px">
                                                            <asp:TextBox ID="Password" runat="server"  CssClass="textarea" TextMode="Password" ></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                                                ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                       <tr style="width:100%">
                                                        <td  colspan="2" style="width:100px">
                                                            <asp:Label ID="Label1" runat="server"   AssociatedControlID="Password">Select Facility:</asp:Label>
                                                        </td>
                                                        <td  style="width:100%; padding:3px">
                                              <asp:DropDownList ID="ddFaciltiy" runat="server"  Width="250px" AutoPostBack="true"  CssClass="ddFacilityName" OnSelectedIndexChanged="ddFaciltiy_SelectedIndexChanged">
                                                                <asp:ListItem Text="-- select Facility --" Value="">
                                                                </asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="border-bottom-color:transparent;border-left-color:transparent" >
                                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." Visible="false" />
                                                        </td>
                                                       <td  style="border-bottom-color:transparent;border-left-color:transparent">
                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td  style="color:Red; border-left-color:transparent;border-right-color:transparent; border-bottom-color:transparent; width:100% ">
                                                            <asp:Button ID="LoginButton" runat="server"  CssClass="ButtonProperty" CommandName="Login" Text="Log In" 
                                                                ValidationGroup="Login1" />
                                                        </td>
                                                     
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                    </table>
     </LayoutTemplate>
<LoginButtonStyle CssClass="login-button"></LoginButtonStyle>
     <TextBoxStyle Width="150px" />
        </asp:Login></div>
<asp:Label ID="lblusername" runat="server" Text=""></asp:Label>
</div>
    
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <asp:Panel ID="pnlTemp" runat="server">
        <asp:Label ID="lblFacilityDistrict" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblFacilityCode" runat="server" Text=""></asp:Label>
    </asp:Panel>
</asp:Content>
