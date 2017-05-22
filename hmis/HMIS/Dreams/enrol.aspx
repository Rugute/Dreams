<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Dreams.Master" CodeBehind="enrol.aspx.vb" Inherits="HMIS.enrol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="~/Styles/dreams.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          

        <script>
            // WRITE THE VALIDATION SCRIPT IN THE HEAD TAG.
            function isNumber(evt) {
                var iKeyCode = (evt.which) ? evt.which : evt.keyCode
                if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
                    return false;

                return true;
            }
</script>

        <style type="text/css">
        input[type=text], textarea
        {
            border: 1px solid #ccc;
        }
        input[type=text]:focus, textarea:focus
        {
            background-color: #FFBFFF;
            border: 1px solid #ccc;
        }
            </style>
    <link href="~/style/dreams.css" type="text/css" rel="stylesheet" />
<div style="height:600px; width:100%; margin-left:auto;margin-right:auto;align-content:center;align-items:center">
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <asp:TextBox ID="txtUniqueIdent" runat="server"></asp:TextBox>
    </asp:Panel>
     <table style="background-color:#00008B;background-image:url('img/dreams/backg.png');border-style:solid;border-color:brown;margin-left:auto;margin-right:auto;align-content:center;align-items:center;width:90% ">
                <tr>
            <td colspan="2" style="font-size:30px;  font-family:Calibri; text-align:center;border-style:solid; color:#F0FFF0; font-weight:bolder;  ">
                <asp:Label ID="lblHeading" runat="server"  Text="DREAMS Enrolment Form"></asp:Label>

            </td>
        </tr>
        <tr>
            <td colspan="2" style="border-style:solid;border-color:brown;color:whitesmoke; font-size:larger" >
                <asp:Label ID="lblHeader" runat="server"  CssClass="label_fac" Text=""></asp:Label>
                <asp:Label ID="lblResults" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:20%; vertical-align:top;text-align:left;color:#F0FFF0; font-weight:bolder; padding:10px">
                <asp:Button ID="btn_elig"  runat="server" CssClass="button_fac" Text="Eligibility" /><br />
                <asp:Button ID="btnDemo"  runat="server" CssClass="button_fac" Text="Demographic Information " /><br />
                <asp:Button ID="btnMod1IndHH"  runat="server" CssClass="button_fac" Text="1: Individual & Household Info" /><br />
                <asp:Button ID="btnMod2Edu"  runat="server" CssClass="button_fac" Text="2: Education & Employment" /><br />
                <asp:Button ID="BtnMod3HIV"  runat="server" CssClass="button_fac" Text="3: HIV Testing" /><br />
                <asp:Button ID="BtnMod4SexAct"  runat="server" CssClass="button_fac" Text="4: Sexual Activity " /><br />
                <asp:Button ID="BtnMod5RepHealth"  runat="server" CssClass="button_fac" Text="5: Reproductive Health" /><br />
                <asp:Button ID="BtnMod6Gender"  runat="server" CssClass="button_fac" Text="6: Gender Based Violence " /><br />
                <asp:Button ID="BtnMod7NonPresc"  runat="server" CssClass="button_fac" Text="7: Non-Prescription Drug Use" /><br />
                <asp:Button ID="BtnMod7Prog"  runat="server" CssClass="button_fac" Text="8: Part. in HIV Prevention Prog." /><br />
            </td>
            <td  style="width: 100%;color:#F0FFF0; font-weight:bolder;"> <div id="container"><asp:MultiView ID="MultiView1"  runat="server"  ActiveViewIndex="1">
                <asp:View ID="view_intro"   runat="server">
                  <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            Screening & Eligibility 
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                        <td colspan="9" style="width:100%; background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                <tr style="width:100%; background-color:orangered;">
                             <td style="width:100px;padding:5px;font-family:Calibri;"><asp:Label ID="Label4" runat="server" CssClass="label_fac" Text="Implementing Partner:"></asp:Label></td>
                            <td  style="width:100px"><asp:DropDownList ID="ddPartnerId" DataTextField="PartnerName" DataValueField="TransId" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" Width="80%" Height="40%" CssClass="textox" runat="server" AutoPostBack="true">
                                <asp:ListItem Text="" Value="" />
                                                     </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:IRDOHMIS %>" SelectCommand="Select TransId,PartnerName from Dreams_ImplementingPartners">

                                    </asp:SqlDataSource>
                                 <asp:RequiredFieldValidator ID="ReqddPartnerId" runat="server" ControlToValidate="ddPartnerId" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>
                            </td>
                            <td style="width:100px"><asp:Label ID="Label1" runat="server" CssClass="label_fac" Text="Ward:"></asp:Label></td>
                            <td style="width:100px"><asp:DropDownList ID="ddFacilityDistrict" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="Ward" DataValueField="WardId"  Width="80%" Height="40%" CssClass="textox" runat="server" AutoPostBack="true">
                                <asp:ListItem Text="" Value="" />  
                                                    </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:IRDOHMIS %>" SelectCommand="exec dbo.spUserWard @username">

                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="UserName" />
                </SelectParameters>
            </asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="ReqddFacilityDistrict" runat="server" ControlToValidate="ddFacilityDistrict" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>
                            </td>
                                </tr>
                            </table>
                        </td>

 
                      </tr>
                                                                                                      <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px">
                                        <div>
                                            Complete the table below to confirm that AGYW can be enrolled in DREAMS. 
                                        </div>
                                    </td>
                                </tr>
                            <tr style="width:100%; background-color:orangered; padding:10px">
                             <td style="width:100px;padding:5px;font-family:Calibri;"><asp:Label ID="Label2" runat="server" CssClass="label_fac" Text="First Name:"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="textox" autocomplete="off" ></asp:TextBox>
                               <asp:RequiredFieldValidator ID="ReqtxtFirstName" runat="server" ControlToValidate="txtFirstName" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>
                                </td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label3" runat="server" CssClass="label_fac" Text="Middle Name:"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtMiddleName" runat="server" CssClass="textox" autocomplete="off" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="ReqtxtMiddleName" runat="server" ControlToValidate="txtMiddleName" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>


                                </td>
                             <td style="width:100px"><asp:Label ID="Label5" runat="server" CssClass="label_fac" Text="Last Name:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="textox" autocomplete="off" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="ReqtxtLastName" runat="server" ControlToValidate="txtLastName" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>


                                </td>


                                </tr>

                       <tr style="width:100%; background-color:orangered; padding:10px">
                             <td style="width:100px;padding:5px""><asp:Label ID="Label8" runat="server" CssClass="label_fac" Text="DoB (DD/MM/YYYY):"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtDoB" ClientIDMode="Static"  Width="110px" maxlength="11"   runat="server"  autocomplete="off" ></asp:TextBox>

             <asp:RegularExpressionValidator ID="RegularExprtxtDoB" runat="server" ControlToValidate="txtDoB" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$" ErrorMessage="Invalid date format."  CssClass="ErrorLabel" SetFocusOnError="true"  ForeColor="white" Display="Dynamic"/> 
                                </td>
                            <td style="width:100px"><asp:Label ID="Label9" runat="server" CssClass="label_fac" Text="Age:"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtAge" runat="server"  MaxLength="3" onkeypress="javascript:return isNumber (event)"  ClientIDMode="Static" autocomplete="off" BackColor="LightCyan" Width="60px" CssClass="textox"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="ReqtxtAge" runat="server" ControlToValidate="txtAge" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                               
                                 </td>
                             <td style="width:100px"><asp:Label ID="Label10" runat="server" CssClass="label_fac" Text="Dreams UniqueID:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtClientID" runat="server" Width="150px"  CssClass="textox" Enabled="true"  autocomplete="off" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqtxtClientID" runat="server" ControlToValidate="txtClientID" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                                </td>


                                </tr>

                                                      <tr>
                                                                        <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px">
                                        <div>
                                            Question 
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                            
                                                        <td colspan="9" style="width:100%; background-color:orangered; padding:5px">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                <tr style="width:100%; background-color:orangered;">
                             <td colspan="2" style="width:100px;"><asp:Label ID="Label6" runat="server" CssClass="label_fac" Text="Is girl aged 10-24 years old?:"></asp:Label></td>
                            <td  colspan="1"  style="width:100px"><asp:DropDownList ID="ddQ1a_Aged10to24Yrs" Width="50px" Height="40%" CssClass="textox" runat="server">
                                 <asp:ListItem Text="" Value="" />  
                                <asp:ListItem Text="Yes" Value="1"  />
                                    <asp:ListItem Text="No" Value="2"/>
                                                                  </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="ReqddQ1a_Aged10to24Yrs" runat="server" ControlToValidate="ddQ1a_Aged10to24Yrs" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                            </td>
                            <td  colspan="4" style="width:120px"><asp:Label ID="Label7" runat="server" CssClass="label_fac" Text="If Yes, what was used for verification?:"></asp:Label></td>
                            <td colspan="2" style="width:100px"><asp:DropDownList ID="ddQ1b_Aged10to24Yrs_VerificationDoc" onchange="VerificDoc()" Width="150px" Height="40%" CssClass="textox" runat="server">
                                        <asp:ListItem Text="" Value="" />  
                                        <asp:ListItem Text="Birth Certificate" Value="1"  />
                                        <asp:ListItem Text="National ID" Value="2"/>
                                        <asp:ListItem Text="National ID waiting card" Value="3"  />
                                        <asp:ListItem Text="Baptism Card" Value="4"/>
                                        <asp:ListItem Text="Passport" Value="5"  />
                                        <asp:ListItem Text="Other(Specify)" Value="6"/>

                                                                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="ReqddQ1b_Aged10to24Yrs_VerificationDoc" runat="server" ControlToValidate="ddQ1b_Aged10to24Yrs_VerificationDoc" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                            </td>
                            <td  colspan="1" style="width:100px"><asp:Label ID="Label11" runat="server" CssClass="label_fac" Text="Other (Specify):"></asp:Label></td>
                            <td colspan="3" >
                                <asp:TextBox ID="txtQ1c_Aged10to24Yrs_Other" runat="server" Width="200px" CssClass="textox" Enabled="false"></asp:TextBox>
                                    </td>

                                </tr>

                                                                <tr style="width:100%;background-color:orangered; ">
                             <td colspan="7" ><asp:Label ID="Label12" runat="server" CssClass="label_fac" Text="Is she currently residing in a ward you are implementing DREAMS?:"></asp:Label></td>
                            <td  colspan="2"  style="width:100px"><asp:DropDownList ID="ddQ2a_ResidingInWard" Width="50px" Height="40%" CssClass="textoxdd" runat="server">
                                                                 <asp:ListItem Text="" Value="" />  
                                                                <asp:ListItem Text="Yes" Value="1"  />
                                                                <asp:ListItem Text="No" Value="2"/>
                                                                  </asp:DropDownList>
                                      <asp:RequiredFieldValidator ID="ReqddQ2a_ResidingInWard" runat="server" ControlToValidate="ddQ2a_ResidingInWard" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                            </td>
                            <td  colspan="2" style="width:100px"><asp:Label ID="Label13" runat="server" CssClass="label_fac" Text="If Yes, which Ward:"></asp:Label></td>
                            <td colspan="3" style="width:100px"><asp:DropDownList ID="ddQ2b_ResidingInWardName" DataSourceID="SqlDataSource3" DataTextField="WardName" DataValueField="WardId" AppendDataBoundItems="true" Width="80%" Height="40%" CssClass="textox" runat="server">
                                 <asp:ListItem Text="" Value="" /> 
                                                                </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="ReqddQ2b_ResidingInWardName" runat="server" ControlToValidate="ddQ2b_ResidingInWardName" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>
                      
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConnectionString="<%$ ConnectionStrings:IRDOHMIS %>" SelectCommand="Select * from Dreams_Wards">

                                    </asp:SqlDataSource>
                            </td>

                                </tr>

                                                                                                <tr style="width:100%;background-color:orangered; ">
                             <td colspan="11" style="width:100px;"><asp:Label ID="Label14" runat="server" CssClass="label_fac" Text="For girls 10-17 years old, has parent/guardian provided consent for the girl to be enrolled in DREAMS?:"></asp:Label></td>
                            <td  colspan="1"  style="width:100px"><asp:DropDownList ID="ddQ3_Aged10to17_Consent" Width="50px" Height="40%" CssClass="textoxdd" runat="server">
                                                <asp:ListItem Text="" Value="" />  
                                                <asp:ListItem Text="Yes" Value="1"  />
                                                <asp:ListItem Text="No" Value="2"/>
                                                                  </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="ReqddQ3_Aged10to17_Consent" runat="server" ControlToValidate="ddQ3_Aged10to17_Consent" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                            </td>
<%--                            <td  colspan="3" style="width:100px"><asp:Label ID="Label15" runat="server" CssClass="label_fac" Text="If Yes, documented consent?:"></asp:Label></td>
                            <td colspan="2" style="width:100px"><asp:DropDownList ID="DropDownList2" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>--%>
<td></td>
                                </tr>

                                
                                                                <tr style="width:100%;background-color:orangered; ">
                             <td colspan="7" ><asp:Label ID="Label15" runat="server" CssClass="label_fac" Text="Has she agreed to be enrolled in DREAMS?:"></asp:Label></td>
                            <td  colspan="2"  style="width:100px"><asp:DropDownList ID="ddQ4_AgreedToEnrol" Width="50px" Height="40%" CssClass="textoxdd" runat="server">
                                <asp:ListItem Text="" Value="" />  
                                <asp:ListItem Text="Yes" Value="1"  />
                                <asp:ListItem Text="No" Value="2"/>
                                                                  </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ReqddQ4_AgreedToEnrol" runat="server" ControlToValidate="ddQ4_AgreedToEnrol" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                            </td>
                            <td  colspan="2" style="width:100px"><asp:Label ID="Label16" runat="server" CssClass="label_fac" Text="Comment:"></asp:Label></td>
                            <td colspan="3" style="width:100px">
                                <asp:TextBox ID="txtQ4_AgreedToEnrol_Comments" runat="server" CssClass="textox"  autocomplete="off" Width="200px" Enabled="true"></asp:TextBox>
                                                                    </td>

                                </tr>

                                                                        <tr style="width:100%;background-color:orangered; ">
                             <td colspan="7" ><asp:Label ID="Label17" runat="server" CssClass="label_fac" Text="Enrolment Status:"></asp:Label></td>
                            <td  colspan="3"  style="width:100px"><asp:DropDownList ID="ddQ5_Status" Width="180px" Height="40%" CssClass="textoxdd" runat="server">
                            <asp:ListItem Text="" Value="" />  
                            <asp:ListItem Text="Enrol" Value="1"  />
                            <asp:ListItem Text="Do Not Enrol" Value="2"/>
                                                                  </asp:DropDownList>
          <asp:RequiredFieldValidator ID="ReqddQ5_Status" runat="server" ControlToValidate="ddQ5_Status" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" Validationgroup="Add1"></asp:RequiredFieldValidator>

                            </td>
                            <%--<td  colspan="2" style="width:100px"><asp:Label ID="Label18" runat="server" CssClass="label_fac" Text="Comment:"></asp:Label></td>
                            <td colspan="3" style="width:100px">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="200px"></asp:TextBox>
                                                                    </td>--%>
<td></td><td></td><td></td>
                                </tr>
                                                <tr>
                  <td colspan="3" ><asp:Button ID="cmdNext_s1" CssClass="NavButton" runat="server" Text="Next" ValidationGroup="Add1" /></td>
              </tr>
                            </table>
                        </td>
                            </tr>


                  </table>

                </asp:View>
      <asp:View ID="View1" runat="server">
           <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                      <tr style="width:100%; background-color:orangered;">
                        <td colspan="9" style="width:100%; background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                      <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            Demographic Information 
                                        </div>
                                    </td>
                                </tr>
                                <tr style="width:100%; background-color:orangered;">
                             <td style="width:100px;padding:5px"><asp:Label ID="Label18" runat="server" CssClass="label_fac" Text="Full Name:"></asp:Label></td>
                            <td  style="width:250px"> <asp:TextBox ID="txtFullName" Width="250px" runat="server" CssClass="textox"  Enabled="false" autocomplete="off" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqtxtFullName" runat="server" ControlToValidate="txtFullName" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>
                            <td style="width:100px"><asp:Label ID="Label19" runat="server" CssClass="label_fac" Text="DreamsID:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtDreamsUniqueID" runat="server" Width="100px" CssClass="textox" Enabled="false" autocomplete="off" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqtxtDreamsUniqueID" runat="server" ControlToValidate="txtDreamsUniqueID" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>

 
                      </tr>
<%--                                                                                                      <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px">
                                        <div>
                                            Complete the table below to confirm that AGYW can be enrolled in DREAMS. 
                                        </div>
                                    </td>
                                </tr>--%>
                            <tr style="width:100%; background-color:orangered; padding:10px">
                             <td colspan="3" style="width:100px;padding:5px""><asp:Label ID="Label20" runat="server" CssClass="label_fac" Text="DoB Verification Doc. No. (Client)"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtQ1_DoBVerification" runat="server" Width="180px" CssClass="textox" autocomplete="off" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqtxtQ1_DoBVerification" runat="server" ControlToValidate="txtQ1_DoBVerification" ForeColor="white" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>
                    
                          <td colspan="1" style="width:100px;padding:5px""><asp:Label ID="Label130" runat="server" CssClass="label_fac" Text="DoB"></asp:Label></td>
                                <td><asp:TextBox ID="txtDoBDemo" runat="server" Width="100px" CssClass="textox" Enabled="false" autocomplete="off" ></asp:TextBox></td><td></td>


                                </tr>

                       <tr style="width:100%; background-color:orangered; padding:10px">
                             <td style="width:100px;padding:5px""><asp:Label ID="Label23" runat="server" CssClass="label_fac" Text="Date of Enrolment (dd/mm/yyyy):"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtQ2_DateOfEnrol" runat="server" CssClass="textox" autocomplete="off" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqtxtQ2_DateOfEnrol" runat="server" 
                                    ControlToValidate="txtQ2_DateOfEnrol" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>
                            <td style="width:100px"><asp:Label ID="Label24" runat="server" CssClass="label_fac" Text="Age at enrolment:"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtQ3_AgeAtEnrol" runat="server" Width="60px" CssClass="textox"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ3_AgeAtEnrol" runat="server" 
                                    ControlToValidate="txtQ3_AgeAtEnrol" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>
                             <td style="width:100px"><asp:Label ID="Label25" runat="server" CssClass="label_fac" Text="Marital Status (Client):"></asp:Label></td>
                            <td style="width:100px">
                                <asp:DropDownList ID="ddQ4_MaritalStatus" runat="server" CssClass="textox" Height="40%" Width="80%">
                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ4_MaritalStatus" runat="server" 
                                    ControlToValidate="ddQ4_MaritalStatus" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>


                                </tr>

               <tr style="width:100%; background-color:orangered; padding:10px">
                             <td style="width:100px;padding:5px""><asp:Label ID="Label21" runat="server" CssClass="label_fac" Text="Phone number (Client):"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                <asp:TextBox ID="txtQ5_PhoneNumber" runat="server" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ5_PhoneNumber" runat="server" 
                                    ControlToValidate="txtQ5_PhoneNumber" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>
                            <td  colspan="2" style="width:100px"><asp:Label ID="Label22" runat="server" CssClass="label_fac" Text="DSS ID Number (If applicable):"></asp:Label></td>
                            <td colspan="3" style="width:100px">
                                <asp:TextBox ID="txtQ6_DSSIDNumber" runat="server" Width="150px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                </td>
                      <%--       <td style="width:100px"><asp:Label ID="Label35" runat="server" CssClass="label_fac" Text="Marital Status (Client):"></asp:Label></td>
                            <td style="width:100px">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textox" Height="40%" Width="80%">
                                </asp:DropDownList>
                                </td>--%>


                                </tr>

               <tr style="width:100%; background-color:orangered; padding:10px">
                             <td style="width:100px;padding:5px""><asp:Label ID="Label35" runat="server" CssClass="label_fac" Text="Ward:"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                                                <asp:DropDownList ID="ddQ7c_WardID" runat="server" CssClass="textox" Height="40%" Width="80%">
                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ7c_WardID" runat="server" 
                                    ControlToValidate="ddQ7c_WardID" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>
                            <td   style="width:100px"><asp:Label ID="Label36" runat="server" CssClass="label_fac" Text="County of residence:"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:TextBox ID="txtQ7a_CountyOfResidence" runat="server" Width="150px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ7a_CountyOfResidence" runat="server" 
                                    ControlToValidate="txtQ7a_CountyOfResidence" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>
                             <td style="width:100px"><asp:Label ID="lblSubCounty" runat="server" CssClass="label_fac" Text="Sub-County:"></asp:Label></td>
                            <td style="width:100px">
                           <asp:TextBox ID="txtQ7b_SubCounty" runat="server" Width="150px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ7b_SubCounty" runat="server" 
                                    ControlToValidate="txtQ7b_SubCounty" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>

                   <td></td>
                                </tr>


                <tr style="width:100%; background-color:orangered; padding:10px">
                             <td style="width:100px;padding:5px""><asp:Label ID="Label37" runat="server" CssClass="label_fac" Text="Ward Name:"></asp:Label></td>
                            <td colspan="2" style="width:100px">
                                                                <asp:TextBox ID="txtQ7d_WardName" runat="server" CssClass="textox" Width="150px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ7d_WardName" runat="server" 
                                    ControlToValidate="txtQ7d_WardName" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                
                                </td>
                            <td   style="width:100px"><asp:Label ID="Label38" runat="server" CssClass="label_fac" Text="Informal Settlement:"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:TextBox ID="txtQ7e_InformalSettlement" runat="server" Width="150px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                </td>
                             <td style="width:100px"><asp:Label ID="Label39" runat="server" CssClass="label_fac" Text="Village:"></asp:Label></td>
                            <td style="width:100px">
                           <asp:TextBox ID="txtQ7f_Village" runat="server" Width="150px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ7f_Village" runat="server" 
                                    ControlToValidate="txtQ7f_Village" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                </td>

                   <td></td>
                                </tr>


               
                <tr style="width:100%; background-color:orangered; padding:10px">
                             <td colspan="2" style="width:100px;padding:5px""><asp:Label ID="Label40" runat="server" CssClass="label_fac" Text="Land mark near residence:"></asp:Label></td>
                            <td colspan="5" style="width:100px"> <div style="float:left">   <asp:TextBox ID="txtQ7fg_LandMark"
                                                                                Height="80px"
               Width="600px"
            Font-Size="15px"
            Font-Names="Calibri;"
       TextMode="Multiline"
       Columns="25"
       Rows="5"
       Wrap="true"
       runat="server"></asp:TextBox></div> 
                                
                                </td>
                            <%--<td   style="width:100px"><asp:Label ID="Label41" runat="server" CssClass="label_fac" Text="Informal Settlement:"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:TextBox ID="TextBox4" runat="server" Width="150px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                </td>
                             <td style="width:100px"><asp:Label ID="Label42" runat="server" CssClass="label_fac" Text="Village:"></asp:Label></td>
                            <td style="width:100px">
                           <asp:TextBox ID="TextBox5" runat="server" Width="150px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                </td>--%>

                   <td></td>
                                </tr>


                                                      <tr>
                                                                        <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px">
                                        <div>
                                            Primary care giver/Guardian 
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                            
                                                        <td colspan="9" style="width:100%; background-color:orangered; padding:5px">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                <tr style="width:100%; background-color:orangered;">
                             <td colspan="2" style="width:100px;"><asp:Label ID="Label26" runat="server" CssClass="label_fac" Text="Full Name:"></asp:Label></td>
                            <td  colspan="1"  style="width:100px">
                                <asp:TextBox ID="txtQ9a_PrimaryCareGiverName" runat="server" CssClass="textox" Width="200px"  Enabled="false"></asp:TextBox>
<%--                                                                <asp:RequiredFieldValidator ID="ReqtxtQ9a_PrimaryCareGiverName" runat="server" 
                                    ControlToValidate="txtQ9a_PrimaryCareGiverName" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>--%>
                                    </td>
                            <td  colspan="4" style="width:100px"><asp:Label ID="Label27" runat="server" CssClass="label_fac" Text="Relationship:"></asp:Label></td>
                            <td colspan="2" style="width:100px"><asp:DropDownList ID="ddQ9b_PrimaryCareGiverRelationship" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ9b_PrimaryCareGiverRelationship" runat="server" 
                                    ControlToValidate="ddQ9b_PrimaryCareGiverRelationship" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                            <td  colspan="1" style="width:100px"><asp:Label ID="Label28" runat="server" CssClass="label_fac" Text="Phone number:"></asp:Label></td>
                            <td colspan="3" >
                                <asp:TextBox ID="txtQ9c_PrimaryCareGiverPhoneNumber" runat="server" Width="200px" CssClass="textox"  autocomplete="off" ></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ9c_PrimaryCareGiverPhoneNumber" runat="server" 
                                    ControlToValidate="txtQ9c_PrimaryCareGiverPhoneNumber" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>

                                                                <tr style="width:100%;background-color:orangered; ">
                             <td colspan="1" ><asp:Label ID="Label29" runat="server" CssClass="label_fac" Text="National ID:"></asp:Label></td>
                            <td  colspan="5"  style="width:100px">
                                <asp:TextBox ID="txtQ9d_PrimaryCareGiverNationalId" runat="server" CssClass="textox" Width="200px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ9d_PrimaryCareGiverNationalId" runat="server" 
                                    ControlToValidate="txtQ9d_PrimaryCareGiverNationalId" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                    </td>
                       <%--     <td  colspan="2" style="width:100px"><asp:Label ID="Label30" runat="server" CssClass="label_fac" Text="If Yes, which Ward:"></asp:Label></td>
                            <td colspan="3" style="width:100px"><asp:DropDownList ID="DropDownList6" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>--%>
<td></td><td></td><td></td><td></td><td></td><td></td>
                                </tr>


                                                <tr>
                  <td colspan="3" ><asp:Button ID="cmdPrev_dem" runat="server" CssClass="NavButton" Text="Previous" /><span style="width:5px"></span><asp:Button ID="cmdNext_dem"  CssClass="NavButton" runat="server" Text="Next" /></td>
              </tr>
                            </table>
                        </td>
                            </tr>


                  </table>
      </asp:View>
      <asp:View ID="View2" runat="server">
          <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 1: Individual and Household Information
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">

                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">101</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label30" runat="server" CssClass="label_fac" Text="Who is the head of your household?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ101_HHHead" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ101_HHHead" runat="server" 
                                    ControlToValidate="ddQ101_HHHead" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">101</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label31" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ101_HHHead_Other" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>


                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">102</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label32" runat="server" CssClass="label_fac" Text="How old is the head of the Household?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ102_HHHeadAge" runat="server" CssClass="textox" Width="60px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqtxtQ102_HHHeadAge" runat="server" 
                                    ControlToValidate="txtQ102_HHHeadAge" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label33" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px">
                                
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">103</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label34" runat="server" CssClass="label_fac" Text="Is your father Alive?"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ103_FatherAlive" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ103_FatherAlive" runat="server" 
                                    ControlToValidate="ddQ103_FatherAlive" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">104</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label41" runat="server" CssClass="label_fac" Text="Is your mother Alive?"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ104_MOtherAlive" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ104_MOtherAlive" runat="server" 
                                    ControlToValidate="ddQ104_MOtherAlive" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>


                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">105</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label42" runat="server" CssClass="label_fac" Text="Is any of your parent/guardian chronically ill (including HIV)?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ105_GuardParentChronicallyIll" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ105_GuardParentChronicallyIll" runat="server" 
                                    ControlToValidate="ddQ105_GuardParentChronicallyIll" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label43" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                &nbsp;</td>
                                </tr>

                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">106</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label44" runat="server" CssClass="label_fac" Text="What is the main material on the floor of your house?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ106_MaterialFloor" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ106_MaterialFloor" runat="server" 
                                    ControlToValidate="ddQ106_MaterialFloor" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">106</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label45" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ106_MaterialFloor_Other" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>


                                 
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">107</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label46" runat="server" CssClass="label_fac" Text="What is the main material on the roof of your house?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ107_MaterialRoof" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ107_MaterialRoof" runat="server" 
                                    ControlToValidate="ddQ107_MaterialRoof" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">107</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label47" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtQ107_MaterialRoof_Other" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>

                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">108</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label48" runat="server" CssClass="label_fac" Text="What is the main material on the walls of your house?"></asp:Label></td>
                            <td  style="width:150px;font-family:Calibri;"><asp:DropDownList ID="ddQ108_MaterialWall" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="ReqddQ108_MaterialWall" runat="server" 
                                    ControlToValidate="ddQ108_MaterialWall" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">108</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label49" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtQ108_MaterialWall_Other" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>


                                 
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">109</div></td>
                             <td style="width:310px;padding:5px;font-family:Calibri;"><asp:Label ID="Label50" runat="server" CssClass="label_fac" Text="What is the main source of drinking water for members of your household?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="dd109_SourceDrinkingWater" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="Reqdd109_SourceDrinkingWater" runat="server" 
                                    ControlToValidate="dd109_SourceDrinkingWater" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">109</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label51" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtQ109_SourceDrinkingWater_Other" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>

                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">110</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label52" runat="server" CssClass="label_fac" Text="In the past 4 weeks, was there any day that you went without food in your household for a full day because of lack of resources? (If NO,  Skip to 112):"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ110_WithoutFood" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="ReqddQ110_WithoutFood" runat="server" 
                                    ControlToValidate="ddQ110_WithoutFood" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">111</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label53" runat="server" CssClass="label_fac" Text="For how many days did this happen in the last 4 weeks?"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ111_WithoutFoodFrequency" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="ReqddQ111_WithoutFoodFrequency" runat="server" 
                                    ControlToValidate="ddQ111_WithoutFoodFrequency" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                
                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">112</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label54" runat="server" CssClass="label_fac" Text="Do you have any form of disability?
(If NO, skip to 114)"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ112_Disability" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="ReqddQ112_Disability" runat="server" 
                                    ControlToValidate="ddQ112_Disability" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label55" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                &nbsp;</td>
                                </tr>

                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">113</div></td>
                             <td colspan="3" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label56" runat="server" CssClass="label_fac" Text="If Yes to #112, state disability type"></asp:Label></td>
                                                                    <td  style="width:100px;font-family:Calibri;"></td>
                            <td  style="width:100px;font-family:Calibri;">
                                
                                                                    </td>
                
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Hearing"><span>Hearing impairment:</span><input type="checkbox" id="chkQ113_DisabilityType_Hearing" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Speech"><span>Speech impairment</span><input type="checkbox" runat="server" id="chkQ113_DisabilityType_Speech" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Visual"><span>Visual impairment</span><input type="checkbox" runat="server" id="ChkQ113_DisabilityType_Visual" /> </label></div></td>

                                                        </tr>

    <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Mental"><span>Mental impairment</span><input type="checkbox" runat="server" id="ChkQ113_DisabilityType_Mental" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Physica"><span>Physical impairment</span><input type="checkbox" runat="server" id="ChkQ113_DisabilityType_Physica" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="ChkQ113_DisabilityType_Other" /><asp:TextBox ID="txtQ113_DisabilityType_OtherSpecify" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox> </label></div></td>
        <%--          <td style="width:100px">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>--%>
                                                        </tr>
                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">114</div></td>
                             <td colspan="1" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label57" runat="server" CssClass="label_fac" Text="Currently, how many people live in your house?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">&nbsp;&nbsp;<asp:TextBox ID="txtQ114_HHPeopleNumber" runat="server" CssClass="textox" Width="60px"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="ReqtxtQ114_HHPeopleNumber" runat="server" 
                                    ControlToValidate="txtQ114_HHPeopleNumber" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                                <td colspan="3" style="width:100px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Hearing"><span>114a. No. of females:</span>&nbsp;&nbsp;<asp:TextBox ID="txtQ114a_HHPeopleNumberFemales" runat="server" CssClass="textox" Width="60px"></asp:TextBox> </label></div></td>
    <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Speech"><span>114b. No. of males:</span>&nbsp;&nbsp;<asp:TextBox ID="txtQ114b_HHPeopleNumberMales" runat="server" CssClass="textox" Width="60px"></asp:TextBox> </label></div></td>
    <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Visual"><span>114c. No. of adults:</span>&nbsp;&nbsp;<asp:TextBox ID="txtQ114c_HHPeopleNumberAdults" runat="server" CssClass="textox" Width="60px"></asp:TextBox> </label></div></td>
   <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q113_DisabilityType_Visual"><span>114d. No. of children: </span>&nbsp;&nbsp;<asp:TextBox ID="txtQ114d_HHPeopleNumberChildren" runat="server" CssClass="textox" Width="60px"></asp:TextBox> </label></div></td>
                                                        </tr>


    
                                                    </table>
                                                </td>
                                    </tr>
                            </table>
                        </td>

                          


 
                      </tr>
                                                                              <tr style="width:100%; background-color:orangered;">
                                    <td style="width:5px;padding:0px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">115</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label58" runat="server" CssClass="label_fac" Text="Have you ever been enrolled in a cash transfer program? 
(If NO or Don’t know skip to Module 2)"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ115_CashTransferEverEnrolled" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                   <asp:RequiredFieldValidator ID="ReqddQ115_CashTransferEverEnrolled" runat="server" 
                                    ControlToValidate="ddQ115_CashTransferEverEnrolled" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label59" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                &nbsp;</td>
                                </tr>
 
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">116</div></td>
                             <td style="width:310px;padding:5px;font-family:Calibri;"><asp:Label ID="Label60" runat="server" CssClass="label_fac" Text="Are you currently enrolled in any cash transfer programs? 
(e.g., OVC, disability, GoK or any other)
(If No or Don’t Know skip to Module 2)
"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ116_CashTransferCurrentlyEnrolled" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>

                            </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">117</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label61" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtQ117_CashTransferProgramEnrolled" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button1" runat="server" Text="Next" /></td>
              </tr>
                  </table>
      </asp:View>
      <asp:View ID="View3" runat="server"> 
          <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 2:  Education & Employment
                                        </div>
                                    </td>
                                </tr>
<%--                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">--%>

                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">201</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label62" runat="server" CssClass="label_fac" Text="Do you currently go to school? (If No—Skip to 205)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ201_GoToSchool" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="ddQ115_CashTransferEverEnrolled" ForeColor="white" SetFocusOnError="true" 
                                    ErrorMessage="Required" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label63" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                
                                    </td>
                                </tr>


                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">202</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label64" runat="server" CssClass="label_fac" Text="What is the name of the school?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ202_SchoolName" runat="server" CssClass="textox" Width="150px"></asp:TextBox>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;">202</td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label65" runat="server" CssClass="label_fac" Text="Specify (Formal/Informal)"></asp:Label></td>
                            <td style="width:100px">
                                                                <asp:DropDownList ID="ddQ202a_GoToSchool_Formal" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                    
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">203</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label66" runat="server" CssClass="label_fac" Text="What level of school are you currently in?"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ203a_SchoolLevel" runat="server" CssClass="textox" Height="40%" Width="120px">
                                </asp:DropDownList>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">203</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label67" runat="server" CssClass="label_fac" Text="Class/Form/Specify"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ203b_SchoolLevelClassForm" runat="server" CssClass="textox" Width="50px" Enabled="false"></asp:TextBox>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="120px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                  
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">204</div></td>
                             <td colspan="5" style="width:300px;padding:5px;font-family:Calibri;"><asp:Label ID="Label82" runat="server" CssClass="label_fac" Text="Other than from your parent(s) /guardian(s), are you also getting support towards your current education from another source?  (Tick all that apply) (Skip to 210)"></asp:Label></td>
                                                                    
                           
                
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q204_EducationSupport_Government"><span>Government Bursary:</span><input type="checkbox" id="ChkQ204_EducationSupport_Government" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q204_EducationSupport_NGO"><span>NGO</span><input type="checkbox" runat="server" id="ChkQ204_EducationSupport_NGO" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q204_EducationSupport_FaithBased"><span>Faith-based institutions</span><input type="checkbox" runat="server" id="ChkQ204_EducationSupport_FaithBased" /> </label></div></td>

                                                        </tr>

    <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q204_EducationSupport_Relatives"><span>Relatives</span><input type="checkbox" runat="server" id="ChkQ204_EducationSupport_Relatives" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q204_EducationSupport_None"><span>None</span><input type="checkbox" runat="server" id="ChkQ204_EducationSupport_None" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q204_EducationSupport_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="ChkQ204_EducationSupport_Other" /><asp:TextBox ID="txtQ204_EducationSupport_OtherSpecify" runat="server" CssClass="textox" Width="250px" enabled="false"></asp:TextBox> </label></div></td>
        <%--          <td style="width:100px">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>--%>
                                                        </tr>
                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">205</div></td>
                             <td style="width:310px;padding:5px;font-family:Calibri;"><asp:Label ID="Label68" runat="server" CssClass="label_fac" Text="What is the main reason why you are not going to school? (If completed High school, skip to 208)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ205_SchoolGoingReason" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">205</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label69" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtQ205_SchoolGoingReason_Other" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>



                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">206</div></td>
                             <td colspan="1" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label83" runat="server" CssClass="label_fac" Text="When was the last time you went to school?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;"><asp:DropDownList ID="ddQ206_LastTimeSchool" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                    
                                    </td>
                                <td colspan="3" style="width:100px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>


                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">207</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label70" runat="server" CssClass="label_fac" Text="In what class/ form did you stop schooling?"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ207_StopSchool" runat="server" CssClass="textox" Height="40%" Width="120px">
                                </asp:DropDownList>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">207</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label71" runat="server" CssClass="label_fac" Text="Class/Form"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ207_StopSchoolClassForm" runat="server" CssClass="textox" Width="50px" Enabled="false"></asp:TextBox>
                                                                    </td>
                                </tr>
                  

                                
                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">208</div></td>
                             <td style="width:310px;padding:5px;font-family:Calibri;"><asp:Label ID="Label72" runat="server" CssClass="label_fac" Text="Given a chance, what would you wish to do with your life? Do not read options. Tick/record the main wish"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ208_WishToDoWithLife" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">208</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label73" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtQ208_WishToDoWithLife_Other" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>



                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">209</div></td>
                             <td style="width:310px;padding:5px;font-family:Calibri;"><asp:Label ID="Label74" runat="server" CssClass="label_fac" Text="What is your current main source of income? "></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ209_MainSourceIncome" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">209</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label75" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px">
                                <asp:TextBox ID="txtQ209_MainSourceIncome_Other" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">210</div></td>
                             <td colspan="1" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label76" runat="server" CssClass="label_fac" Text="Do you have any savings? (If NO skip to Module 3)"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;"><asp:DropDownList ID="ddQ210_AnySavings" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                    
                                    </td>
                                <td colspan="3" style="width:100px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">211</div></td>
                             <td colspan="5" style="width:300px;padding:5px;font-family:Calibri;"><asp:Label ID="Label77" runat="server" CssClass="label_fac" Text="Where do you keep your savings?"></asp:Label></td>
                                                                    
                           
                
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q211_KeepSavings_AtHome"><span>At home</span><input type="checkbox" id="ChkQ211_KeepSavings_AtHome" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q211_KeepSavings_TableBanking"><span>Table banking</span><input type="checkbox" runat="server" id="ChkQ211_KeepSavings_TableBanking" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q211_KeepSavingsInTheBank"><span>In the bank</span><input type="checkbox" runat="server" id="ChkQ211_KeepSavingsInTheBank" /> </label></div></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                        </tr>

    <tr style="width:100%; background-color:orangered;">

    <td colspan="4" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q204_EducationSupport_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="Checkbox6" /><asp:TextBox ID="TextBox2" runat="server" CssClass="textox" Width="250px" enabled="false"></asp:TextBox> </label></div></td>
        <%--          <td style="width:100px">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>--%>
                                                        </tr>
                                                    </table>
                                                </td>
                                    </tr>

                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button2" runat="server" Text="Next" /></td>
              </tr>
                  </table>
      </asp:View>
      <asp:View ID="View4" runat="server"> 
           <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 3:  HIV Testing
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">

                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">301</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label78" runat="server" CssClass="label_fac" Text="Have you ever been tested for HIV?(If NO, skip to 307)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ301_EverTestedBefore" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label79" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                              
                                    </td>
                                </tr>


                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">302</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label80" runat="server" CssClass="label_fac" Text="When/how long ago was your last HIV test?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                                                <asp:DropDownList ID="ddQ302_WhenLastHIVTest" runat="server" CssClass="textox" Height="40%" Width="120px">
                                </asp:DropDownList>
                                                                    
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label81" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px">
                                
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">303</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label84" runat="server" CssClass="label_fac" Text="If you don’t mind telling me, what were the results of your last HIV test? (If Negative, Don’t Know or Declined to disclose, skip to Module 4)"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ303_ResultLastHIVTest" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">304</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label85" runat="server" CssClass="label_fac" Text="If HIV positive, are you currently going to clinic/facility to seek HIV care?(If No, skip to 306)"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ304_IfPositive" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                    </td>
                                </tr>


                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">305</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label86" runat="server" CssClass="label_fac" Text="At which facility are you currently seeking HIV care? (Skip to module 4)"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ305a_SeekCareFacilityCode" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">305</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label87" runat="server" CssClass="label_fac" Text="Specify"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                                                <asp:TextBox ID="txtQ305c_SeekCareFacilityName_Other" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>

                            
                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">306</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label88" runat="server" CssClass="label_fac" Text="What is the main reason why you are not going to a clinic to seek HIV care?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ306_NotSeekCareReason" Width="120px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">306</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label89" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ306_NotSeekCareReason_Other" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">307</div></td>
                             <td colspan="3" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label100" runat="server" CssClass="label_fac" Text="Why have you never been tested for HIV (Do not read the options, tick all mentioned)"></asp:Label></td>
                                                                    <td  style="width:100px;font-family:Calibri;"></td>
                            <td  style="width:100px;font-family:Calibri;">
                                
                                                                    </td>
                
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_NoKnowledge"><span>I have no knowledge about HIV test:</span><input type="checkbox" id="ChkQ307_WhyNeverTestedBefore_NoKnowledge" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_DontKnowWhere"><span>I don’t know where to get one</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_DontKnowWhere" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_CantAfford"><span>I can’t afford it</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_CantAfford" /> </label></div></td>
     <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_Transport"><span>Transport to site is too much</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_Transport" /> </label></div></td>

                                                        </tr>


                                                                                                                <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_FacilityFar"><span>Testing facility is too far away</span><input type="checkbox" id="ChkQ307_WhyNeverTestedBefore_FacilityFar" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_IMAfraidOthers"><span>I am afraid others will know...</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_IMAfraidOthers" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_LowRisk"><span>I don’t need to test/ Low risk</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_LowRisk" /> </label></div></td>
     <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_AfraidToKnow"><span>I am afraid to know if I have HIV</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_AfraidToKnow" /> </label></div></td>

                                                        </tr>


    <tr style="width:100%; background-color:orangered;">

    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_Busy"><span>I’m too busy to go</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_Busy" /> </label></div></td>
    <td colspan="3" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q307_WhyNeverTestedBefore_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="ChkQ307_WhyNeverTestedBefore_Other" /><asp:TextBox ID="txtQ307_WhyNeverTestedBefore_OtherSpecify" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox> </label></div></td>
        <%--          <td style="width:100px">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>--%>
                                                        </tr>
                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">308</div></td>
                             <td colspan="1" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label101" runat="server" CssClass="label_fac" Text="Do you know of a place(s) where people can get tested for HIV?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">                                <asp:DropDownList ID="ddQ308_KnowPlaceHIVTest" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                    </td>
                                <td colspan="3" style="width:100px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    &nbsp;</td>
                                    </tr>
                            </table>
                        </td>

                          


 
                      </tr>
                                                                            
                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button4" runat="server" Text="Next" /></td>
              </tr>
                  </table>
      </asp:View>
      <asp:View ID="View5" runat="server"> 

           <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 4:  Sexual Activity 
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">

                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">401</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label90" runat="server" CssClass="label_fac" Text="Have you ever had sex? (If NO skip to Question 506)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ401_EverHadSex" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label91" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                              
                                    </td>
                                </tr>


                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">402</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label92" runat="server" CssClass="label_fac" Text="How old were you when you had sex for the first time?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
          <asp:TextBox ID="txtQ402_AgeFirstSex_Years" runat="server" CssClass="textox" Width="60px"></asp:TextBox>
                                    
                                                                    
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label93" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px">
                                
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">403</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label94" runat="server" CssClass="label_fac" Text="How many sexual partners have you had in the last 12 months?"></asp:Label></td>
                            <td  style="width:100px">
<asp:TextBox ID="txtQ403_SexualPartnersNo" runat="server" CssClass="textox" Width="60px"></asp:TextBox>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">404</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label95" runat="server" CssClass="label_fac" Text="Do you have a current sexual partner?"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ404_CurrentEverHadSex" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                    </td>
                                </tr>


                                       <tr style="width:100%; background-color:orangered;">
                                    <td colspan="6" style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">
                                        Sexual Partner Matrix: <br />
                                        INTERVIEWER SAY: Now I would like to ask you some questions about your recent or your 3 most recent partners whom you have had sexual intercourse with in the last 12 months.
                                    </td></tr>                             
                                

                                    <tr style="width:100%; background-color:orangered;">
                                    
                                                <td colspan="6">

                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
    <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Question/Instruction</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Last Sexual Partner</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Second to last Partner</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Third to last Partner</td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">405</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Is this person same age, younger or older than you?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ405a_SexualPartnersLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ405b_SexualPartnersSecondLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ405c_SexualPartnersThirdLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">406</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Is this partner circumcised?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ406a_CircumcisedSexualPartnersLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ406b_CircumcisedSexualPartnersSecondLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ406c_CircumcisedSexualPartnersThirdLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">407</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Do you know this partner’s HIV status? </td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ407a_HIVStatusSexualPartnersLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ407b_HIVStatusSexualPartnersSecondLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ407c_HIVStatusSexualPartnersThirdLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">408</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">How often did/do you use a condom with this partner?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ408a_CondomSexualPartnersLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ408b_CondomSexualPartnersSecondLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ408c_CondomSexualPartnersThirdLast" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    </tr>

                                                                                                                <tr style="width:100%; background-color:orangered;">


                                                                                                                    <%--          <td style="width:100px">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>--%>


                                                        </tr>


                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">409</div></td>
                             <td colspan="1" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label103" runat="server" CssClass="label_fac" Text="In the last 12 months have you received money, gifts or favours in exchange for sex?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">                                <asp:DropDownList ID="ddQ409_RecivedGift" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList>
                                                                    </td>
                                <td colspan="3" style="width:100px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    &nbsp;</td>
                                    </tr>
                            </table>
                        </td>

                          


 
                      </tr>
                                                                            
                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button5" runat="server" Text="Next" /></td>
              </tr>
                  </table>
      </asp:View>
      <asp:View ID="View6" runat="server"> 
           <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 5:  Reproductive Health
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">

                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">501</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label96" runat="server" CssClass="label_fac" Text="Do you have biological children? (If NO, Skip to 503)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ501_BiologicalChildren" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label97" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                              
                                    </td>
                                </tr>


                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">502</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label98" runat="server" CssClass="label_fac" Text="How many biological children do you have?"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                                                <asp:TextBox ID="txtQ502_BiologicalChildren_Specify" runat="server" CssClass="textox" Width="60px"></asp:TextBox>
                                                                    
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label99" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px">
                                
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">503</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label102" runat="server" CssClass="label_fac" Text="Are you currently pregnant? (If NO or Don’t Know skip to 506)"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ503_CurrentlyPregnant" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">504</div></td>
                            <td style="width:160px;font-family:Calibri;"><asp:Label ID="Label104" runat="server" CssClass="label_fac" Text=" Are you attending ANC Clinic for this pregnancy? (If NO, skip to 506)"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:DropDownList ID="ddQ504_AttendingANC" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                    </td>
                                </tr>


                                
                                
                            
                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">505</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label107" runat="server" CssClass="label_fac" Text="Which clinic/facility are you currently seeking ANC services?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ505_AttendingANCClinicCode" Width="80px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">505</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label108" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ505_AttendingANCClinicName" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>


                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">506</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label105" runat="server" CssClass="label_fac" Text="Are you aware of any family planning methods? (If NO, skip to Module 6)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ506_AwareFamilyPlanMethods" Width="80px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label106" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                              
                                    </td>
                                </tr>

                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">507</div></td>
                             <td colspan="3" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label109" runat="server" CssClass="label_fac" Text="Which family planning methods do you know of? (Do NOT read responses; tick all mentioned)"></asp:Label></td>
                                                                    <td  style="width:100px;font-family:Calibri;"></td>
                            <td  style="width:100px;font-family:Calibri;">
                                
                                                                    </td>
                
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q507_FamilyPlanMethodsYouKnow_Pills"><span>Pills</span><input type="checkbox" id="ChkQ507_FamilyPlanMethodsYouKnow_Pills" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q507_FamilyPlanMethodsYouKnow_Injectable"><span>Injectable</span><input type="checkbox" runat="server" id="ChkQ507_FamilyPlanMethodsYouKnow_Injectable" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q507_FamilyPlanMethodsYouKnow_Implants"><span>Implants</span><input type="checkbox" runat="server" id="chkQ507_FamilyPlanMethodsYouKnow_Implants" /> </label></div></td>
     <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q507_FamilyPlanMethodsYouKnow_IUCD"><span>IUCD (Coil)</span><input type="checkbox" runat="server" id="ChkQ507_FamilyPlanMethodsYouKnow_IUCD" /> </label></div></td>
     <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                            <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                            <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                        </tr>


                                                                                                                <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q507_FamilyPlanMethodsYouKnow_Condom"><span>Condom</span><input type="checkbox" id="ChkQ507_FamilyPlanMethodsYouKnow_Condom" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q507_FamilyPlanMethodsYouKnow_Permanent"><span>Permanent (Tubal Ligation)</span><input type="checkbox" runat="server" id="ChkQ507_FamilyPlanMethodsYouKnow_Permanent" /> </label></div></td>
<td colspan="5" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q507_FamilyPlanMethodsYouKnow_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="ChkQ507_FamilyPlanMethodsYouKnow_Other" /><asp:TextBox ID="txtQ507_FamilyPlanMethodsYouKnow_OtherSpecify" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox> </label></div></td>

                                                        </tr>

                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">508</div></td>
                             <td colspan="1" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label110" runat="server" CssClass="label_fac" Text="Are you currently using any modern family planning method? (If NO, Skip to 510)"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">                                <asp:DropDownList ID="ddQ508_FamilyPlanMethodsModern" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                    </td>
                                <td colspan="3" style="width:10px;padding:5px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>

                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">509</div></td>
                             <td colspan="3" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label111" runat="server" CssClass="label_fac" Text="Which family planning method are you currently using? (Do NOT read responses, tick method the client mentions)"></asp:Label></td>
                                                                    <td  style="width:100px;font-family:Calibri;"></td>
                            <td  style="width:100px;font-family:Calibri;">
                                
                                                                    </td>
                
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:80px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q509_FamilyPlanMethodsModernCurrent_Pills"><span>Pills</span><input type="checkbox" id="ChkQ509_FamilyPlanMethodsModernCurrent_Pills" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q509_FamilyPlanMethodsModernCurrent_Injectable"><span>Injectable</span><input type="checkbox" runat="server" id="ChkQ509_FamilyPlanMethodsModernCurrent_Injectable" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q509_FamilyPlanMethodsModernCurrent_Implants"><span>Implants</span><input type="checkbox" runat="server" id="ChkQ509_FamilyPlanMethodsModernCurrent_Implants" /> </label></div></td>
     <td colspan="1" style="width:80px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q509_FamilyPlanMethodsModernCurrent_IUCD"><span>IUCD (Coil)</span><input type="checkbox" runat="server" id="ChkQ509_FamilyPlanMethodsModernCurrent_IUCD" /> </label></div></td>
     <td colspan="3" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                      
                                                        </tr>


                                                                                                                <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q509_FamilyPlanMethodsModernCurrent_Condom"><span>Condom</span><input type="checkbox" id="ChkQ509_FamilyPlanMethodsModernCurrent_Condom" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q509_FamilyPlanMethodsModernCurrent_Permanent"><span>Permanent (Tubal Ligation)</span><input type="checkbox" runat="server" id="ChkQ509_FamilyPlanMethodsModernCurrent_Permanent" /> </label></div></td>
<td colspan="5" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q509_FamilyPlanMethodsModernCurrent_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="ChkQ509_FamilyPlanMethodsModernCurrent_Other" /><asp:TextBox ID="txtQ509_FamilyPlanMethodsModernCurrent_OtherSpecify" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox> </label></div></td>

                                                        </tr>




                                                    </table>
                                                </td>
                                    </tr>

                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">510</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label112" runat="server" CssClass="label_fac" Text="What’s the main reason for not using any family planning method?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ510_FamilyPlanMethodsNotUsing" Width="80px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">510</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label113" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ510_FamilyPlanMethodsNotUsing_Other" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                    
                                </tr>

                                    <tr style="width:100%; background-color:orangered;">

                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    &nbsp;</td>
                                    </tr>
                            </table>
                        </td>

                          


 
                      </tr>
                                                                            
                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button6" runat="server" Text="Next" /></td>
              </tr>
                  </table>
      </asp:View>
      <asp:View ID="View7" runat="server"> 
          
           <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 6:  Gender Based Violence 
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">


                                       <tr style="width:100%; background-color:orangered;">
                                    <td colspan="6" style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">
                                       Has the following happened to you with any man (e.g. boyfriend/spouse/family member/ neighbour etc.?) Ever and if YES, has it happened in the Past 3 months 
                                    </td></tr>                             
                                

                                    <tr style="width:100%; background-color:orangered;">
                                    
                                                <td colspan="6">

                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
    <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">EVER </td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">In Last 3 Months</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">601</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">He said or did something to humiliate you in front of others?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ601a_Humiliate_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ601b_Humiliate_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">602</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Threatened to hurt or harm you or someone you care about?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ602a_Threatened_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ602b_Threatened_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">603</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Insulted or made you feel bad about yourself?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ603a_Insulated_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ603b_Insulated_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

     <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">604</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Threatened to take away your economic livelihood?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ604a_ThreatenedEcon_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ604b_ThreatenedEcon_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

                                                             <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">605</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Push you, shake you, slap/punch/beat you, hit you with something, try to choke you or throw something at you that could hurt you? </td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ605a_PushHurt_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ605b_PushHurt_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

                                                             <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">606</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Physically forced you to have sexual intercourse with him when you did not want to?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ606a_ForcedSex_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ606b_ForcedSex_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

                                                             <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">607</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Physically forced you to perform any other sexual acts you did not want to?</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ607a_ForcedOtherSex_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ607b_ForcedOtherSex_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

                                                             <tr style="width:100%; background-color:orangered;">
    <td style="width:5px;padding:5px;font-family:Calibri;font-family:Calibri;">608</td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">Force you with threats or in any other way to perform sexual acts you did not want to? </td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ608a_ForcedOtherWaySex_ever" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><asp:DropDownList ID="ddQ608b_ForcedOtherWaySex_Last3Months" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList></td>
    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;">&nbsp;</td>
    </tr>

                                                                                                                <tr style="width:100%; background-color:orangered;">


                                                                                                                    <%--          <td style="width:100px">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>--%>


                                                        </tr>


                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">609</div></td>
                             <td colspan="1" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label120" runat="server" CssClass="label_fac" Text="If client experienced any of 601-608 in last 3 months, ask:  Did you seek help after experiencing the different things we have discussed? (If NO, Skip to 611)"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">                                <asp:DropDownList ID="ddQ609_SeekHelp" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList>
                                                                    </td>
                                <td colspan="3" style="width:100px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">610</div></td>
                             <td colspan="3" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label114" runat="server" CssClass="label_fac" Text="From whom/where did you seek help? (Tick all that apply) (After this question skip to Module 7)"></asp:Label></td>
                                                                    <td  style="width:100px;font-family:Calibri;"></td>
                            <td  style="width:100px;font-family:Calibri;">
                                
                                                                    </td>
                
                                </tr>
                                
                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:150px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_MyFamily"><span>My Family</span><input type="checkbox" id="ChkQ610_SeekHelpWhere_MyFamily" runat="server" /> </label></div></td>
    <td colspan="1" style="width:280px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_Husband"><span>Husband/Partner/Boyfriend’s family</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_Husband" /> </label></div></td>
    <td colspan="1" style="width:180px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_Friend"><span>Friend</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_Friend" /> </label></div></td>
     <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_Neighbour"><span>Neighbour</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_Neighbour" /> </label></div></td>
     <td colspan="2" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                      
                                                        </tr>

                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:80px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_ReligiousLeader"><span>Religious leader</span><input type="checkbox" id="ChkQ610_SeekHelpWhere_ReligiousLeader" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_Doctor"><span>Doctor/Medical personnel</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_Doctor" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_Chief"><span>Chief or Village elder</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_Chief" /> </label></div></td>
     <td colspan="1" style="width:80px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_Police"><span>Police</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_Police" /> </label></div></td>
     <td colspan="3" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                      
                                                        </tr>
    <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_JusticeSystem"><span>Justice system</span><input type="checkbox" id="ChkQ610_SeekHelpWhere_JusticeSystem" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_NGOCBO"><span>NGO/CBO</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_NGOCBO" /> </label></div></td>
<td colspan="5" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q610_SeekHelpWhere_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="ChkQ610_SeekHelpWhere_Other" /><asp:TextBox ID="txtQ610_SeekHelpWhere_OtherSpecify" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox> </label></div></td>

                                                        </tr>




                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">611</div></td>
                             <td colspan="1" style="width:500px;padding:5px;font-family:Calibri;"><asp:Label ID="Label115" runat="server" CssClass="label_fac" Text="Do you know where to seek help if you experience the different things that we discussed? (If NO, skip to Module 7)"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">                                <asp:DropDownList ID="ddQ611_SeekHelpKnowWhere" runat="server" CssClass="textox" Height="40%" Width="80px"></asp:DropDownList>
                                                                    </td>
                                <td colspan="3" style="width:100px;font-family:Calibri;"></td>
                               
                                                                    
                    
                                </tr>

                                
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">612</div></td>
                             <td colspan="3" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label116" runat="server" CssClass="label_fac" Text="Where would you seek help if you experienced the different things that we discussed?  (Do not read responses, tick all that AGYW mentions) "></asp:Label></td>
                                                                    <td  style="width:100px;font-family:Calibri;"></td>
                            <td  style="width:100px;font-family:Calibri;">
                                
                                                                    </td>
                
                                </tr>
                                
                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:150px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_MyFamily"><span>My Family</span><input type="checkbox" id="ChkQ612_SeekHelpSource_MyFamily" runat="server" /> </label></div></td>
    <td colspan="1" style="width:280px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_Husband"><span>Husband/Partner/Boyfriend’s family</span><input type="checkbox" runat="server" id="ChkQ612_SeekHelpSource_Husband" /> </label></div></td>
    <td colspan="1" style="width:180px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_Friend"><span>Friend</span><input type="checkbox" runat="server" id="ChkQ612_SeekHelpSource_Friend" /> </label></div></td>
    <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_Neighbour"><span>Neighbour</span><input type="checkbox" runat="server" id="ChkQ612_SeekHelpSource_Neighbour" /> </label></div></td>
    <td colspan="2" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                      
                                                        </tr>

                                                        <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:80px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_ReligiousLeader"><span>Religious leader</span><input type="checkbox" id="ChkQ612_SeekHelpSource_ReligiousLeader" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_Doctor"><span>Doctor/Medical personnel</span><input type="checkbox" runat="server" id="ChkQ612_SeekHelpSource_Doctor" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_Chief"><span>Chief or Village elder</span><input type="checkbox" runat="server" id="ChkQ612_SeekHelpSource_Chief" /> </label></div></td>
     <td colspan="1" style="width:80px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_Police"><span>Police</span><input type="checkbox" runat="server" id="ChkQ612_SeekHelpSource_Police" /> </label></div></td>
     <td colspan="3" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                      
                                                        </tr>
    <tr style="width:100%; background-color:orangered;">
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_JusticeSystem"><span>Justice system</span><input type="checkbox" id="ChkQ612_SeekHelpSource_JusticeSystem" runat="server" /> </label></div></td>
    <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_NGOCBO"><span>NGO/CBO</span><input type="checkbox" runat="server" id="ChkQ612_SeekHelpSource_NGOCBO" /> </label></div></td>
<td colspan="5" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q612_SeekHelpSource_Other"><span>Other (specify)</span><input type="checkbox" runat="server" id="ChkQ612_SekHelpSource_Other3" /><asp:TextBox ID="txtQ612_SeekHelpSource_OtherSpecify" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox> </label></div></td>

                                                        </tr>




                                                    </table>
                                                </td>
                                    </tr>



                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    &nbsp;</td>
                                    </tr>
                            </table>
                        </td>

                          


 
                      </tr>
                                                                            
                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button7" runat="server" Text="Next" /></td>
              </tr>
                  </table>
      </asp:View>
      <asp:View ID="View8" runat="server"> 
          <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 7:  Non-Prescription Drug Use
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">

                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">701</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label117" runat="server" CssClass="label_fac" Text="Have you used alcohol in the last 12 months? (If NO, skip to 703)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ701_AlcoholUse" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label118" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                              
                                    </td>
                                </tr>


                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">702</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label119" runat="server" CssClass="label_fac" Text="In the past 12 months, how often did you have a drink containing alcohol? (Probe further if need be)"></asp:Label></td>
                            <td  style="width:100px;font-family:Calibri;">
                                                                <asp:DropDownList ID="ddQ702_DrinkAlcoholPastYr" Width="80%" Height="40%" CssClass="textox" runat="server"></asp:DropDownList>
                                                                    
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label121" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px">
                                
                                    </td>
                                </tr>


                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">703</div></td>
                             <td style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label122" runat="server" CssClass="label_fac" Text="Have you used drugs of abuse or addiction in the last 12 months? (If NO, skip to 705)"></asp:Label></td>
                            <td  style="width:100px">
                                <asp:DropDownList ID="ddQ703_DrugUsePastYr" runat="server" CssClass="textox" Height="40%" Width="80px">
                                </asp:DropDownList>
                                                                    </td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;">&nbsp;</td>
                            <td style="width:160px;font-family:Calibri;">&nbsp;</td>
                            <td style="width:100px;font-family:Calibri;">
                                &nbsp;</td>
                                </tr>


                                
                                
                            
                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">704</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label124" runat="server" CssClass="label_fac" Text="Which type of drugs of abuse/addiction have you used in last 12 months? (Tick all that apply)"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ704_AddictionPastYr" Width="80px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">704</div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label125" runat="server" CssClass="label_fac" Text="Other(s) specify:"></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ704_AddictionPastYr_Other" runat="server" CssClass="textox" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>


                                
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">705</div></td>
                             <td style="width:230px;padding:5px;font-family:Calibri;"><asp:Label ID="Label126" runat="server" CssClass="label_fac" Text="In the last 12 months have you engaged in brewing or selling alcohol and/or drugs of abuse or addiction?"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ705_BrewingSellingPastYr" Width="80px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:100px;font-family:Calibri;"><asp:Label ID="Label127" runat="server" CssClass="label_fac" Text=""></asp:Label></td>
                            <td style="width:100px;font-family:Calibri;">
                              
                                    </td>
                                </tr>


                                    <tr style="width:100%; background-color:orangered;">

                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    &nbsp;</td>
                                    </tr>
                            </table>
                        </td>

                          


 
                      </tr>
                                                                            
                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button8" runat="server" Text="Next" /></td>
              </tr>
                  </table>
      </asp:View>
      <asp:View ID="View9" runat="server"> 
          
           <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">
                                                                                                                                        <tr>
                                    <td colspan="11" style="height:20px; background-color:#F5F5F5; color:black; padding:5px; font-size:24px">
                                        <div>
                                            MODULE 8:  Participation in HIV Prevention Programme
                                        </div>
                                    </td>
                                </tr>
                      <tr style="width:100%; background-color:orangered;">
                          
                        <td colspan="8" style="background-color:orangered;">
                            <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;">

                        
                                
                                                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%">801</div></td>
                             <td colspan="3" style="width:190px;padding:5px;font-family:Calibri;"><asp:Label ID="Label128" runat="server" CssClass="label_fac" Text="Have you ever participated or been trained in any of these programmes? (Tick all that apply)"></asp:Label></td>
                                                                    <td  style="width:100px;font-family:Calibri;"></td>
                            <td  style="width:100px;font-family:Calibri;">
                                
                                                                    </td>
                
                                </tr>
                                
                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    <table style="background-color:green;width:100%;color:#F0FFF0; font-weight:bolder;"> 
                                                        <tr style="width:100%; background-color:orangered;">
  <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_None"><span>None</span><input type="checkbox" runat="server" id="ChkQ801_Participate_None" /> </label></div></td>
    <td colspan="1" style="width:80px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_HCBF"><span>HealthChoices </span><input type="checkbox" id="ChkQ801_Participate_HCBF" runat="server" /> </label></div></td>
    <td colspan="2" style="width:200px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_MHMC"><span>My Health My Choice (MHMC or Healthy Choices2)</span><input type="checkbox" runat="server" id="ChkQ801_Participate_MHMC" /> </label></div></td>
    <td colspan="2" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_RespectK"><span>Respect-K</span><input type="checkbox" runat="server" id="ChkQ801_Participate_RespectK" /> </label></div></td>

     <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                      
                                                        </tr>

                                                        <tr style="width:100%; background-color:orangered;">
         <td colspan="1" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_Shuga"><span>SHUGA</span><input type="checkbox" runat="server" id="ChkQ801_Participate_Shuga" /> </label></div></td>
    <td colspan="1" style="width:150px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_SS_K"><span>Sister to Sister-K</span><input type="checkbox" id="ChkQ801_Participate_SS_K" runat="server" /> </label></div></td>
    <td colspan="2" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_MLRC"><span>Making Life’s Responsible Choices (MLRC)</span><input type="checkbox" runat="server" id="ChkQ801_Participate_MLRC" /> </label></div></td>
    <td colspan="2" style="width:100px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_FMP"><span>Families Matter Programme (FMP)</span><input type="checkbox" runat="server" id="ChkQ801_Participate_FMP" /> </label></div></td>

     <td colspan="1" style="width:10px;padding:5px;font-family:Calibri;"></td>
                                                      
                                                        </tr>
    <tr style="width:100%; background-color:orangered;">
<td colspan="7" style="width:10px;padding:5px;font-family:Calibri;"><div class="checkbox"> <label for="Q801_Participate_Other"><span>Other life skills programs (Specify)</span><input type="checkbox" runat="server" id="Checkbox12" /><asp:TextBox ID="txtQ801_Participate_OtherSpecify" runat="server" CssClass="textox" Width="250px" Enabled="false"></asp:TextBox> </label></div></td>

                                                        </tr>



                <tr style="width:100%; background-color:orangered; padding:10px">
                             <td colspan="2" style="width:100px;padding:5px;font-family:Calibri;"><asp:Label ID="Label123" runat="server" CssClass="label_fac" Text="Comments/Notes:"></asp:Label></td>
                            <td colspan="4" style="width:100px"> <div style="float:left">   <asp:TextBox ID="txtQ802_Comments"
                                                                                Height="80px"
               Width="600px"
            Font-Size="15px"
            Font-Names="Calibri;"
       TextMode="Multiline"
       Columns="25"
       Rows="10"
       Wrap="true"
       runat="server"></asp:TextBox></div> 
                                
                                </td>


                   <td></td>
                                </tr>

                                                    </table>
                                                </td>
                                    </tr>

                                
                                
                        
                                <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                             <td style="width:80px;padding:5px;font-family:Calibri;"><asp:Label ID="Label129" runat="server" CssClass="label_fac" Text="Enrolled by:"></asp:Label></td>
                            <td  style="width:150px"><asp:DropDownList ID="ddQ803_EnrolledByID" Width="250px" Height="40%" CssClass="textox" runat="server"></asp:DropDownList></td>
                                    <td style="width:10px;padding:5px;font-family:Calibri;"><div style=" margin-left:auto;margin-right:auto;width:100%"></div></td>
                            <td style="width:60px;font-family:Calibri;"><asp:Label ID="Label131" runat="server" CssClass="label_fac" Text="Date:"></asp:Label></td>
                            <td style="width:150px;font-family:Calibri;">
                                <asp:TextBox ID="txtQ803_EnrolledDate" runat="server" CssClass="textox" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>

                                


                                    <tr style="width:100%; background-color:orangered;">
                                    <td style="width:10px;padding:5px;font-family:Calibri;font-family:Calibri;"></td>
                                                <td colspan="5">
                                                    &nbsp;</td>
                                    </tr>
                            </table>
                        </td>

                          


 
                      </tr>
                                                                            
                                                     <tr>
                  <td colspan="3" ><asp:Button ID="Button9" runat="server" Width="60px" Text="Save" /></td>
              </tr>
                  </table>
      </asp:View>
    <asp:View ID="View10" runat="server"> ... </asp:View>
</asp:MultiView></div></td>
        </tr>
        </table>

    

</div>
    <script>
            function VerificDoc() {
            if (document.getElementById("<%=ddQ1b_Aged10to24Yrs_VerificationDoc.ClientID%>").value == "6") {
                document.getElementById("<%=txtQ1c_Aged10to24Yrs_Other.ClientID%>").disabled = false;
                }
            else {
                document.getElementById("<%=txtQ1c_Aged10to24Yrs_Other.ClientID%>").disabled = true;
                document.getElementById("<%= txtQ1c_Aged10to24Yrs_Other.ClientID%>").value = "";
            }
        }
    </script>
</asp:Content>

