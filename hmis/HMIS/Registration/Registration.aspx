<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HMIS.Master" CodeBehind="Registration.aspx.vb" Inherits="HMIS.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="~/Styles/VMMC.css" rel="stylesheet" type="text/css" />
    <%--    <script src="../Scripts/hmis.js" type="text/javascript" > </script>
    <script src="../Scripts/jquery-2.2.3.js"></script>
    <script src="../Scripts/jquery-ui-1.11.4.js"></script>
    <script src="../Scripts/jquery-ui-1.11.4.min.js"></script>--%>
<%--     <script type="text/javascript" src="Scripts/hmis.js" > </script>
    <link href="Styles/datepicker.css" rel="stylesheet" />
    <link href="Styles/normalize.css" rel="stylesheet" />--%>
  <%-- <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>--%>

    

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">


    

   

    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
         <asp:Label ID="lblResults" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblClientUniqCode" runat="server" Text=""></asp:Label>
        <asp:TextBox ID="txtDistricCode" runat="server"></asp:TextBox>
        <asp:Label ID="lblClientIDPad" runat="server" Text=""></asp:Label>
        
    </asp:Panel>
    <div id="wrapper"  style="border:1px solid red; width:90%; background-color:navajowhite; overflow:hidden">
            <div id="header" style="border-bottom:1px solid magenta;text-align:center">
            <span title="Header" style="color:Black; margin-left:5px;font-size:18px; font-weight:bolder; background-image:url('img/backgroundsmallest.png'); font-family:Verdana;">FIRST VISIT FORM</span>
        </div>

                <div style=" margin-top:5px;vertical-align:central;height:100%">
            <span title="FacilityDistrict" class="spanlabelsnormal" >Facility District:</span><input id="txtFacilityDistrict" runat="server" autocomplete="off" class="textarea" maxlength="50" name="ctlContentPlaceHolder_txtFacilityDistrict" onblur="validateEmpty(this); pad('<%=txtClientNo.ClientID%>', 10);" style="width:200px" tabindex="4" type="text" /><span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
  
            <span title="Date" class="spanlabelsnormal">Person District:</span><asp:DropDownList ID="ddPersonDistrict"  CssClass="ddFacilityName"    runat="server" AutoPostBack="True" TabIndex="1"></asp:DropDownList>      
                       <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Date" class="spanlabelsnormal">Date:</span>
                    <asp:TextBox ID="txtRegDate" runat="server"  maxlength="11" placeholder="dd/mm/yyyy" clientidmode="Static" class="textarea"    autocomplete="off" style="width:150px; margin-right:2px" TabIndex="2" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtRegDate" runat="server" ControlToValidate="txtRegDate" ForeColor="red" CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator id="cmpDate" Text="Date must be greater than now" ControlToValidate="txtRegDate" Type="Date" Operator="LessThanEqual" CssClass="ErrorLabel" Display="Dynamic" ForeColor="red" Runat="server" /> 
                   <%-- <asp:TextBox name="txtRegDate1" type="text"  id="txtRegDate1" maxlength="11" placeholder="dd/mm/yyyy" clientidmode="Static"  runat="server" class="textarea"  autocomplete="off" style="width:150px; margin-right:2px" /> --%> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_txtRegDate" runat="server" ControlToValidate="txtRegDate" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$" ErrorMessage="Invalid date format." CssClass="ErrorLabel" ForeColor="red" Display="Dynamic"/> 
                        <script type="text/javascript">
                            $("#<%=txtRegDate.ClientID%>").datepicker({
                                showOnFocus: false,
                                dateFormat: "dd/mm/yy",
                                showOn: "button",
                                buttonImage: "../img/cal_icon.gif",
                                buttonImageOnly: true,
                                inline: true,
                                showOtherMonths: true,
                                dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                            });
        </script>
                    <span class="smallerlabel">(DD/MM/YYYY)</span>
<br />
        </div><hr/>

        <div>
            <span title="txtClientNo" class="spanlabelsnormal">A1: Client Number:</span>
            <input name="ctlContentPlaceHolder_ClientRegNumber" type="text"  id="txtClientNo" maxlength="10" onkeypress="javascript:return isNumber (event)" onblur="concat('<%=txtClientNo.ClientID%>','<%=lblIRDOINT.ClientID%>','<%=txtRegDate.ClientID%>');"  runat="server" class="textarea"  clientidmode="Static" autocomplete="off" style="width:100px" tabindex="3"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtClientNo" runat="server" ControlToValidate="txtClientNo" ForeColor="red" CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="IRDOReference" class="spanlabelsnormal">IRDO Reference:</span><span style="width:50px">&nbsp;&nbsp;&nbsp;</span><asp:Label ID="lblIRDOReference" clientidmode="Static" runat="server" Text=""></asp:Label>
            <asp:HiddenField ID = "hfIRDOReference" ClientIDMode="Static" runat = "server" />
            <input name="ctlContentPlaceHolder_IRDOReference" type="text"   runat="server"  id="txtIRDOReference" class="textarea"   clientidmode="Static" autocomplete="off" style="width:200px; visibility:hidden" />
                      <asp:Label ID="lblDistricCode" CssClass="hiddenlabel" runat="server" Text=""  style="visibility:hidden" ></asp:Label>
                    <asp:Label ID="lblIRDOINT" runat="server" ClientIDMode="Static" Text="" style="visibility:hidden"></asp:Label>
<br />
        </div><hr/>

        <div>
            <span title="Surname" class="spanlabelsnormal">B1: Surname:</span>
            <input name="ctlContentPlaceHolder_ClientRegNumber" type="text"  onblur="validateEmpty(this); pad('<%=txtClientNo.ClientID%>', 10);" id="txtSurname"  runat="server"  class="textarea"  autocomplete="off" maxlength="50" style="width:200px" tabindex="4" />
            <asp:RequiredFieldValidator ID="RequiredtxtAuditDate" runat="server" ControlToValidate="txtSurname" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Othernames" class="spanlabelsnormal">Other names:</span><span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <input name="ctlContentPlaceHolder_Othernames" maxlength="100" type="text"  runat="server"   id="txtOthernames" class="textarea"  autocomplete="off" style="width:200px" tabindex="5" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtOthernames" runat="server" ControlToValidate="txtOthernames" CssClass="ErrorLabel"  ForeColor="red"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Date" class="spanlabelsnormal">B2:DoB:</span>
            <input name="ctlContentPlaceHolder_txtDOB"  runat="server"  clientidmode="Static" type="text"  id="txtDOB" placeholder="dd/mm/yyyy" maxlength="11" class="textarea" onblur="findage('<%=txtDOB.ClientID%>');"  autocomplete="off" style="width:150px; margin-right:2px" tabindex="6" /> 
            <asp:CompareValidator id="CompaDOB" Text="Date must be greater than now" ControlToValidate="txtDOB" Type="Date"  CssClass="ErrorLabel"  Operator="LessThanEqual" Display="Dynamic" ForeColor="red" Runat="server" /> 
            <asp:CompareValidator id="ComptxtDOB" Text="Registration date must be less than Date of Birth"  CssClass="ErrorLabel"  ControlToValidate="txtDOB" ForeColor="red" ControlToCompare="txtRegDate"
                Type="Date" Display="Dynamic" Operator="LessThan" Runat="server" />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDOB" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$" ErrorMessage="Invalid date format."  CssClass="ErrorLabel"  ForeColor="red" Display="Dynamic"/> 
            <%--<img src='../img/cal_icon.gif' id="datepickerImage" />--%>
              <span class="smallerlabel">DD/MM/YYYY </span>
    <script type="text/javascript">
        $("#<%=txtDOB.ClientID%>").datepicker({
                showOnFocus: false,
                dateFormat: "dd/mm/yy",
                showOn: "button",
                buttonImage: "../img/cal_icon.gif",
                buttonImageOnly: true,
                inline: true,
                showOtherMonths: true,
                dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
          });
        </script>

<br />
        </div><hr/>
 <div>
            <span title="Surname" class="spanlabelsnormal">B2.a.Age (years):</span>
            <input name="ctlContentPlaceHolder_ClientAge" type="text"  id="txtAge"  runat="server"  class="textarea"  clientidmode="Static"  autocomplete="off" maxlength="3" style="width:50px" tabindex="7" />
     <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtAge" runat="server" ControlToValidate="txtAge" ForeColor="red"  CssClass="ErrorLabel"   ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Othernames" class="spanlabelsnormal">B3: Sex:</span><span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <asp:DropDownList ID="ddgender" CssClass="ddFacilityName"   runat="server" TabIndex="8"></asp:DropDownList>
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorddgender" runat="server" ControlToValidate="ddgender" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>
<br />
        </div><hr/>
<div style="background-color:black; margin-bottom:5px"><span title="Subheader1" class="spanlabelsTitles" >Contact Information</span></div>
       <br />
        
<div style="visibility:hidden"><hr/></div>
<br />
 <div style=" margin-top:5px;vertical-align:central;height:100%">
            <span title="B6: Location" class="spanlabelsnormal" >B6: Location</span><asp:DropDownList ID="ddLocation" CssClass="ddFacilityName"   runat="server" AutoPostBack="True" TabIndex="9"></asp:DropDownList> 
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorddLocation" runat="server" ControlToValidate="ddLocation" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            
            <span title="B5: Division:" class="spanlabelsnormal">B5: Division:</span><asp:DropDownList ID="ddDivision" CssClass="ddFacilityName"   runat="server" AutoPostBack="True" TabIndex="10"></asp:DropDownList> 
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorddDivision" runat="server" ControlToValidate="ddDivision" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>     
                       <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Date" class="spanlabelsnormal">B4: District:</span><input name="ctlContentPlaceHolder_ddDistrict" type="text"   runat="server"  id="ddDistrict" maxlength="11" class="textarea"  autocomplete="off" style="width:150px;" tabindex="11" />  
      <asp:RequiredFieldValidator ID="RequiredFieldValidatorddDistrict" runat="server" ControlToValidate="ddDistrict" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>  
<br />
        </div><hr/>
 <div style=" margin-top:5px;vertical-align:central;height:100%">
            <span title="B7: Nearest Health Facility:" class="spanlabelsnormal" >B7: Nearest Health Facility:</span><asp:DropDownList ID="ddNearestHF" CssClass="ddFacilityName"   runat="server" AutoPostBack="True" TabIndex="12"></asp:DropDownList> 
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorddNearestHF" runat="server" ControlToValidate="ddNearestHF" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>  
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            
            <span title="B8: Phone No:" class="spanlabelsnormal">B8: Phone No:</span><input name="ctlContentPlaceHolder_PhoneNo" type="text"  id="txtPhoneNo"  runat="server" maxlength="11" class="textarea"  autocomplete="off" style="width:150px;" tabindex="13" />      
                       <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Date" class="spanlabelsnormal">ID.No.:</span><input name="ctlContentPlaceHolder_txtIDNo" type="text"  id="txtIDNo" maxlength="11"  runat="server"  class="textarea"  autocomplete="off" style="width:150px;" tabindex="14" />   
<br />
        </div><hr/>

 <div style=" margin-top:5px;vertical-align:central;height:100%">
            <span title="ddEducatLevel" class="spanlabelsnormal" >B9: Education Level:</span><asp:DropDownList ID="ddEducatLevel" CssClass="ddFacilityName"   runat="server" TabIndex="15"></asp:DropDownList> 
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorddEducatLevel" runat="server" ControlToValidate="ddEducatLevel" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>  
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            
            <span title="ddReligion" class="spanlabelsnormal">B10: Religion:</span><asp:DropDownList ID="ddReligion" onchange="RelOthers()" CssClass="ddFacilityName" runat="server" TabIndex="16"  ></asp:DropDownList>      
                       <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Date" class="spanlabelsnormal">B10. Other:</span><input name="ctlContentPlaceHolder_txtRelOther" type="text" runat="server" id="txtRelOther"   clientidmode="Static"  maxlength="11" class="textarea" disabled="disabled"  autocomplete="off" style="width:150px;" tabindex="17" />  

<br />
        </div><hr/>

 <div style=" margin-top:5px;vertical-align:central;height:100%">
            <span title="ddMaritalStatus" class="spanlabelsnormal" >B11: Marital Status:</span><asp:DropDownList ID="ddMaritalStatus" CssClass="ddFacilityName"   runat="server" TabIndex="18"></asp:DropDownList> 
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorddMaritalStatus" runat="server" ControlToValidate="ddMaritalStatus" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator> 
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            
            <span title="Recruiting Intervention:" class="spanlabelsnormal">Recruiting Intervention:</span><asp:DropDownList ID="ddRecruitingIntv" CssClass="ddFacilityName"   runat="server" TabIndex="19"></asp:DropDownList>   
      <asp:RequiredFieldValidator ID="RequiredFieldValidatorddRecruitingIntv" runat="server" ControlToValidate="ddRecruitingIntv" ForeColor="red"  CssClass="ErrorLabel"  ErrorMessage="Required." Display="Dynamic"></asp:RequiredFieldValidator>    
                       
<br />
        </div><hr/>

        <div>
            <span title="Date" class="spanlabelsnormal"">B13: Person Issuing Card:</span><input name="ctlContentPlaceHolder_txtCardIssuer" type="text"  id="txtCardIssuer"  runat="server"  class="textarea"  autocomplete="off" style="width:300px;" tabindex="20" />   
<br />
        </div>
        <br /><hr />
        <asp:Button ID="cmdSave" runat="server"  CssClass="ButtonProperty" Width="100px"  Text="Save Record" /><span style="width:100px">&nbsp;&nbsp;&nbsp;</span>
            </div>
    <div style="border:groove;border-width:2px; float:left; clear:both">
   
    </div>
            <script>
                // WRITE THE VALIDATION SCRIPT IN THE HEAD TAG.
                function isNumber(evt) {
                    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
                    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
                        return false;

                    return true;
                }
</script>
 <%--  <script>
       function ConCat() {
           var x = document.getElementById('<%=txtClientNo.ClientID%>').value;
            var y = document.getElementById('<%=lblIRDOINT.ClientID%>').innerHTML;
            var d = document.getElementById('<%=txtRegDate.ClientID%>').value;
            var yy = d.substring(10, 8);
            var label = document.getElementById("<%=lblIRDOReference.ClientID%>");
           
           if (x.value !=  "0000000000"){
            //document.getElementById('<%=lblIRDOReference.ClientID%>').innerHTML = "IRDO" + '/' + y + '/' + x + '/' + yy;
          document.getElementById('<%=txtIRDOReference.ClientID%>').value = "IRDO" + '/' + y + '/' + x + '/' + yy;
          // document.getElementById("<%=hfIRDOReference.ClientID%>").value = "IRDO" + '/' + y + '/' + x + '/' + yy;
            //document.getElementById("txtIRDOReference").value = "xxxx";
           //document.getElementById("txtIRDOReference").value = y;
           document.getElementById("<%=hfIRDOReference.ClientID%>").value = x.value;
           var xx = x;
           //return x + y;
           label.innerHTML = "IRDO" + '/' + y + '/' + xx + '/' + yy;
           }
           else {
               label.innerHTML = "";
               return false;
           }

        }
</script>--%>

    <script type="text/javascript">
        //window.onload = RelOthers;
        function RelOthers() {
            var selectbox = document.getElementById("<%=ddReligion.ClientID%>");
            var selectedOption = selectbox.options[selectbox.selectedIndex];
            var selectedIndex = selectbox.selectedIndex;
            var selectedOption = selectbox.options[selectedIndex];
                    
                   

            if (selectedOption.text == "OTHER") {
                document.getElementById("<%=txtRelOther.ClientID%>").disabled = false;
                document.getElementById("<%=txtRelOther.ClientID%>").focus()
            }
                //document.forms[0].elements("txtRelOther").disabled = false;
            else {
                document.getElementById("<%=txtRelOther.ClientID%>").disabled = true;
                document.getElementById('<%= txtRelOther.ClientID%>').value = ""
                document.getElementById("<%=ddMaritalStatus.ClientID%>").focus()
            }
               // document.forms[0].elements("txtRelOther").disabled = true;
     
        }
</script> 
    <script>


    </script>






</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
