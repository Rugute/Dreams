<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HMIS.Master" CodeBehind="vmmc.aspx.vb" Inherits="HMIS.vmmc1"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="~/Styles/VMMC.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="./Scripts/hmis.js"></script>
   <%-- <script type="text/javascript" src="/Scripts/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="./Scripts/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="./Scripts/jquery-ui-1.11.4.min.js"></script>--%>
  <style type="text/css">
    .panel{
        display:none;
    }
    </style>

    <script type = "text/javascript">
    window.onload = function () {
        var scrollY = parseInt('<%=Request.Form("scrollY")%>');             
        if (!isNaN(scrollY)) {
            window.scrollTo(0, scrollY);
        }
    };
    window.onscroll = function () {
        var scrollY = document.body.scrollTop;
        if (scrollY == 0) {
            if (window.pageYOffset) {
                scrollY = window.pageYOffset;
            }
            else {
                scrollY = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
            }
        }
        if (scrollY > 0) {
            var input = document.getElementById("scrollY");
            if (input == null) {
                input = document.createElement("input");
                input.setAttribute("type", "hidden");
                input.setAttribute("id", "scrollY");
                input.setAttribute("name", "scrollY");
                document.forms[0].appendChild(input);
            }
            input.value = scrollY;
        }
    };
</script>
</asp:Content>
<asp:Content ID="Content2"  onload="CompareSelectedValues('health','ddC2_Counseled','ddC3_Consent');" ContentPlaceHolderID="Main" runat="server">
  
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div id="Wrapper" onload="B1_HIVResult();" style="border:1px solid red; width:90%; margin:0; background-color:yellow; overflow:hidden">
        <div id="header" style="border-bottom:1px solid magenta;text-align:center">
            <span title="Header" style="color:Black; margin-left:5px;font-size:30px; font-weight:bolder; font-family:Verdana;">Voluntary Medical Male Circumcision Client Form</span>
        </div>
        <div style=" margin-top:5px;vertical-align:central">
            <div id="DivErrorMsg" style="font-size:12px; width:100%; padding:2px;"><asp:Label ID="lblErrorMsg" CssClass="error" ForeColor="red" runat="server" Text=""></asp:Label></div>
            <span title="Client Number" class="spanlabelsnormal" >Client Number:</span>
            <asp:TextBox ID="txtClientnumber" onblur="concatVMMCNo('<%=txtDistrictCode.ClientID%>','<%=txtClientnumber.ClientID%>','<%=txtVisitDate.ClientID%>'); "  onkeypress="javascript:return isNumber (event)" type="text" class="textarea" style="width:150px;"  clientidmode="Static" autocomplete="off" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtClientnumber" runat="server" ControlToValidate="txtClientnumber" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Date" class="spanlabelsnormal">Date:</span><asp:TextBox ID="txtVisitDate" runat="server"  maxlength="11" placeholder="dd/mm/yyyy" onblur="concatVMMCNo('<%=txtDistrictCode.ClientID%>','<%=txtClientnumber.ClientID%>','<%=txtVisitDate.ClientID%>');" clientidmode="Static" class="textarea"    autocomplete="off" style="width:150px; margin-right:2px" ></asp:TextBox>            <span class="smallerlabel">(DD/MM/YYYY)</span><span style="width:50px">&nbsp;&nbsp;&nbsp;</span><asp:Label ID="lblVMMCNo" runat="server" ClientIDMode="Static" Text=""></asp:Label>                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtVisitDate" runat="server" ControlToValidate="txtVisitDate" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator id="cmpDate" Text="Date must be greater than now" ControlToValidate="txtVisitDate" Type="Date" Operator="LessThanEqual" Display="Dynamic" ForeColor="red" Runat="server" /> 
                   <%-- <asp:TextBox name="txtRegDate1" type="text"  id="txtRegDate1" maxlength="11" placeholder="dd/mm/yyyy" clientidmode="Static"  runat="server" class="textarea"  autocomplete="off" style="width:150px; margin-right:2px" /> --%> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_txtVisitDate" runat="server" ControlToValidate="txtVisitDate" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$" ErrorMessage="Invalid date format." ForeColor="red" Display="Dynamic"/> 
                        <script type="text/javascript">
                            $("#<%=txtVisitDate.ClientID%>").datepicker({
                                showOnFocus: false,
                                dateFormat: "dd/mm/yy",
                                showOn: "button",
                                buttonImage: "../img/cal2.jpg",
                                buttonImageOnly: true,
                                inline: true,
                                showOtherMonths: true,
                                dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                            });
        </script>
                    
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span><asp:Label ID="lblIRDOReference" clientidmode="Static" runat="server" Text=""></asp:Label>                          <asp:Label ID="lblFacilityDistrict" runat="server" Text=""></asp:Label>
            <asp:TextBox ID="txtVMMCNo" ClientIDMode="Static"  CssClass="txtHidden"  runat="server"></asp:TextBox>
<asp:TextBox ID="txtDistrictCode" ClientIDMode="Static" CssClass="txtHidden" runat="server"></asp:TextBox>
            <asp:Panel ID="pnlTemp" runat="server" Visible="false">                        <asp:Label ID="lblFacilityCode" runat="server" Text=""></asp:Label>                
                <asp:Label ID="lblDistId" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblClientUniqCode" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblUniversalNumber" runat="server" Text=""></asp:Label>
                <input type="hidden" id="txtFacilityNameHid"  runat="server" name="txtFacilityNameHid"  />
                <input type="hidden" id="txtFacilitySubLocHid"  runat="server" name="txtFacilitySubLocHid"  />
                <input type="hidden" id="txtFacilityDistrictHid"  runat="server" name="txtFacilityDistrictHid"  />
                <input type="hidden" id="txtFacilityCountryHid"   runat="server" name="txtFacilityCountryHid"  />
<asp:Label ID="lblDistrictCode"  ClientIDMode="Static" runat="server" Text=""></asp:Label> 
            </asp:Panel>
                 <br />        </div><hr/>

        <div>
            <span title="FacilityRegNumber" class="spanlabelsnormal">Theatre Register Number: As per facility procedures:</span>
            <input name="ctlContentPlaceHolder_FacilityRegNumber" type="text"  runat="server" id="txtFacilityRegNumber" class="textarea" style="width:100px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtFacilityRegNumber" runat="server" ControlToValidate="txtFacilityRegNumber" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
<br />
        </div><hr/>	
        <div style="background-color:black;"><span title="Subheader1" class="spanlabelsTitles" >FACILITY/SITE DETAILS</span></div>
       <br />
         <div>
<div style="visibility:hidden"><hr/></div>
      <div style="margin-top:0px">  <span title="FacilityName" class="spanlabelsnormal">Facility/ Site Name:</span>
             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span> <input name="ctlContentPlaceHolder_FacName" type="text" disabled="disabled" runat="server"  id="txtFacilityName" class="textarea" style="width:200px; " />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtFacilityName" runat="server" ControlToValidate="txtFacilityName" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
          <span style="width:50px">&nbsp;&nbsp;&nbsp;</span><span title="DeliveryType" class="spanlabelsnormal">Service Delivery Type:</span>
             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span> <asp:DropDownList ID="ctlContentPlaceHolder_DeliveryType"  runat="server" CssClass="ddFacilityName">
                 <asp:ListItem Text="" Value=""></asp:ListItem>
                 <asp:ListItem Text="STATIC" Value="1"></asp:ListItem>
                 <asp:ListItem Text="OUTREACH" Value="2"></asp:ListItem>
                 <asp:ListItem Text="MOBILE" Value="3"></asp:ListItem>
            </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator_DeliveryType" runat="server" ControlToValidate="ctlContentPlaceHolder_DeliveryType" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
       </div> 
</div>
        <br />
    <div>
    <div style="visibility:hidden"><hr/></div>
        <div><span title="FacilityVillage" class="spanlabelsnormal">Village/Esate:</span><input name="ctlContentPlaceHolder_A4_FacClientVillage" onblur="IsString(this)" type="text"  id="txtFacilityVillage" runat="server" class="textarea" style="width:200px; " />
            <asp:RequiredFieldValidator ID="RequiredtxtFacilityVillage" runat="server" ControlToValidate="txtFacilityVillage" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="FacilitySublocation" class="spanlabelsnormal">Sub Location:</span><input name="ctlContentPlaceHolder_A4_FacSubLoc" disabled="disabled"  type="text" runat="server"  id="txtFacilitySubLoc" class="textarea" style="width:200px; " />
        </div>
    </div>
    <br />
    <div>
    <div style="visibility:hidden"><hr/></div>
        <div><span title="District" class="spanlabelsnormal">District:</span><input name="ctlContentPlaceHolder_A4_FacDistrict" type="text"  id="txtFacilityDistrict"  disabled="disabled" runat="server" class="textarea" style="width:200px; " />
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="County" class="spanlabelsnormal">County:</span><input id="txtFacilityCountry" runat="server"  disabled="disabled" class="textarea" name="ctlContentPlaceHolder_A4_FacCountry" style="width:200px; " type="text" /></div>
    </div>

    <br />
    <div>
    <hr/>
        <div id="ClientProfileHeader" style="background-color:black"><span title="ClientProfile" class="spanlabelsTitles">A: CLIENT'S PROFILE:</span>
        </div>
    </div>

               <br />
         <div>
     <div style="visibility:hidden; "><hr/></div>
      <div>  <span title="ClientName" class="spanlabelsnormal">A1: Client's Name:</span>
             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span> <asp:DropDownList ID="ddClientNumber" runat="server" CssClass="ddFacilityName" AutoPostBack="true"  ></asp:DropDownList>
           <span style="width:50px">&nbsp;&nbsp;&nbsp;</span> <input name="ctlContentPlaceHolder_txtA1_ClientName" type="text" runat="server"  id="txtA1_ClientName" disabled="disabled" class="textarea" style="width:250px;" /><span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="A2_ClientAge" class="spanlabelsnormal">Age:</span><input name="ctlContentPlaceHolder_txtA2_ClientAge" type="text" runat="server" id="txtA2_ClientAge" disabled="disabled"  class="textarea" style="width:20px;" /><span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="A3_ClientPhoneContact" class="spanlabelsnormal">A3: Telephone contact:</span><input name="ctlContentPlaceHolder_txtA3_ClientPhoneContact" runat="server" type="text"  id="txtA3_ClientPhoneContact"  disabled="disabled" class="textarea" style="width:150px;" /></div>
             <br />        </div><div style="visibility:hidden"><hr/></div>

        <div>
            <span title="A4_ClientVillage" class="spanlabelsnormal">A4: Residence: Village/Estate:</span>
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <input name="ctlContentPlaceHolder_A4_ClientVillage" type="text"  id="txtA4_ClientVillage" runat="server" class="textarea" style="width:200px; " />

             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span><span title="A4_ClientResidenceDistrict"  class="spanlabelsnormal">District:</span>
             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span> 
            <input name="ctlContentPlaceHolder_A4_ClientResidenceDistrict" type="text"  runat="server" id="txtA4_ClientResidenceDistrict" disabled="disabled"  class="textarea" style="width:200px; " /><br />        </div><div style="visibility:hidden"><hr/></div>

        <div>
            <span title="A4_ClientResidenceSubLoc" class="spanlabelsnormal">Sub Location:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
            <input name="ctlContentPlaceHolder_A4_ClientResidenceSubLoc" type="text"  runat="server" id="txtA4_ClientResidenceSubLoc"  disabled="disabled" class="textarea" style="width:200px; " /><span style="width:50px">&nbsp;&nbsp;&nbsp;</span><span title="A4_ClientResidenceCounty"  class="spanlabelsnormal">County:</span>
             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span> 
            <input name="ctlContentPlaceHolder_A4_ClientResidenceCounty" type="text"  id="txtA4_ClientResidenceCounty" runat="server" disabled="disabled"  class="textarea" style="width:200px; " /><br />
        </div>
        <div style="visibility:hidden"><hr/></div>

        <div>
            <span title="A5_InfoSource" class="spanlabelsnormal" style="margin-left:-15px">A5: Main source of information:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
            <asp:DropDownList ID="ddA5_InfoSource" runat="server" AutoPostBack="False" onchange="InfoOthers()" CssClass="ddFacilityName"></asp:DropDownList>

             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
             <span style="width:50px">&nbsp;&nbsp;&nbsp;</span><input name="ctlContentPlaceHolder_A5_InfoSourceOther" type="text" runat="server"  id="txtA5_InfoSourceOther" disabled="disabled" class="textarea" style="width:300px;" />

        </div>

    <br /><br />
    <div>
    <hr/>
        <div id="Div1" style="background-color:black"><span title="ClientProfile" class="spanlabelsTitles">B: MEDICAL HISTORY AND PHYSICAL EXAMINATION </span>
            <span title="ClientProfile" class="spanlabelsTitles" style="padding-left:21px; width:97.4%; font-size:10px; height: 10px;padding-bottom:5px">(NOTE: CHECK ONE BOX FOR EACH ITEM)</span>
        </div>
   <br />
         </div>
        <div style="visibility:hidden"><hr/></div>
      <div>  <span title="HIVStatus" class="spanlabelsQuestions">B1: Knowledge of HIV status:</span>
          <br />
      </div>
      
        <div style="visibility:hidden"><hr/></div>
      <div>  <span title="HIVStatus_Fac"  class="spanlabelsnormal" style="margin-left:25px;">(1) Result of HIV test at this facility:</span>
          <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <asp:DropDownList ID="ddB1_FacResult" onChange="B1_HIVResult()" runat="server" CssClass="ddYN_HIV">
                 <asp:ListItem Text="" Value=""></asp:ListItem>
                 <asp:ListItem Text="HIV+" Value="1"></asp:ListItem>
                 <asp:ListItem Text="HIV-" Value="2"></asp:ListItem>
                 <asp:ListItem Text="UNKNOWN" Value="3"></asp:ListItem>
            </asp:DropDownList>
         <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFacilityRegNumber" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>--%>
      <br />
      </div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="HIVStatus_Self" class="spanlabelsnormal" style="margin-left:25px;">(2) HIV Status by self report:</span>
          <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <asp:DropDownList ID="ddB1_SelfResult" runat="server"  CssClass="ddYN_HIV">
                 <asp:ListItem Text="" Value=""></asp:ListItem>
                 <asp:ListItem Text="HIV+" Value="1"></asp:ListItem>
                 <asp:ListItem Text="HIV-" Value="2"></asp:ListItem>
                 <asp:ListItem Text="UNKNOWN" Value="3"></asp:ListItem>
            </asp:DropDownList>
         <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFacilityRegNumber" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>--%>
      <br />
      </div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="HIVStatus_Partner" class="spanlabelsnormal" style="margin-left:25px;">(3) Partner test result at this facility today?</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB1_PartResult" runat="server" CssClass="ddYN_HIV">
                 <asp:ListItem Text="" Value=""></asp:ListItem>
                 <asp:ListItem Text="HIV+" Value="1"></asp:ListItem>
                 <asp:ListItem Text="HIV-" Value="2"></asp:ListItem>
                 <asp:ListItem Text="UNKNOWN" Value="3"></asp:ListItem>
      </asp:DropDownList>
      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFacilityRegNumber" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>--%>
          <br />
      </div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="HIVStatus_Couns" class="spanlabelsnormal" style="margin-left:25px;">(4) Counselor Name:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB1_CounsName" runat="server" CssClass="ddFacilityName"></asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFacilityRegNumber" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
       <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
          <span title="CounsDate" class="spanlabelsnormal" style="margin-left:5px;">Date:</span>
          <asp:TextBox ID="txtB1_CounsDate" runat="server"  maxlength="11" placeholder="dd/mm/yyyy"  clientidmode="Static" class="textarea"    autocomplete="off" style="width:150px; margin-right:2px" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtB1_CounsDate" runat="server" ControlToValidate="txtB1_CounsDate" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator id="CompCounsDate" Text="Date must be greater than now" ControlToValidate="txtB1_CounsDate" Type="Date" Operator="LessThanEqual" Display="Dynamic" ForeColor="red" Runat="server" /> 
                   <%-- <asp:TextBox name="txtRegDate1" type="text"  id="txtRegDate1" maxlength="11" placeholder="dd/mm/yyyy" clientidmode="Static"  runat="server" class="textarea"  autocomplete="off" style="width:150px; margin-right:2px" /> --%> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_txtB1_CounsDate" runat="server" ControlToValidate="txtB1_CounsDate" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$" ErrorMessage="Invalid date format." ForeColor="red" Display="Dynamic"/> 
                        <script type="text/javascript">
                            $("#<%=txtB1_CounsDate.ClientID%>").datepicker({
                                showOnFocus: false,
                                dateFormat: "dd/mm/yy",
                                showOn: "button",
                                buttonImage: "../img/cal2.jpg",
                                buttonImageOnly: true,
                                inline: true,
                                showOtherMonths: true,
                                dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                            });
        </script>
               
      <br />
      </div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B2ClientPresenting" class="spanlabelsQuestions">B2: Client's known history of (1) Bleeding disorder:</span>

      <span title="B2ClientHistoryOf" style="color:Black;float:left;margin-left:25px;font-size:14px"></span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB2_BleedDis" runat="server" CssClass="ddYN"><asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem></asp:DropDownList>
     <asp:RequiredFieldValidator ID="RequiredddB2_BleedDis" runat="server" ControlToValidate="ddB2_BleedDis" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator> 
  <br />
      </div>



       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B3ClientPresenting" class="spanlabelsQuestions">B3: Client presenting with:</span>
          <br />
      </div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B3_UrethDisch" class="spanlabelsnormal" style="margin-left:25px;">(1) Urethral discharge:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB3_UrethDisch" runat="server" CssClass="ddYN">
   <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredddB3_UrethDisch" runat="server" ControlToValidate="ddB3_UrethDisch" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
        <span title="B3_Gensore" class="spanlabelsnormal" style="margin-left:60px;">(2) Genital sore:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB3_Gensore" runat="server" CssClass="ddYN"><asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem></asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredddB3_Gensore" runat="server" ControlToValidate="ddB3_Gensore" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <span title="B3_PainUrine" class="spanlabelsnormal" style="margin-left:25px;">(3) Pain on urination:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB3_PainUrine" runat="server" CssClass="ddYN"><asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem></asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredddB3_PainUrine" runat="server" ControlToValidate="ddB3_PainUrine" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
      <br />
      </div>

        <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B3_ScrotSwell" class="spanlabelsnormal" style="margin-left:25px;">(4) Swelling of the scrotum:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB3_ScrotSwell" runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredddB3_ScrotSwell" runat="server" ControlToValidate="ddB3_ScrotSwell" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
        <span title="B3_RectractfSkin" class="spanlabelsnormal" style="margin-left:25px;">(5) Difficulty in retracting foreskin:</span>
     <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB3_RectractfSkin" runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredddB3_RectractfSkin" runat="server" ControlToValidate="ddB3_RectractfSkin" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
<br />
</div>
            <div style="visibility:hidden"><hr/></div>
 <div>
     <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <span title="B3_ReturnfSkin" class="spanlabelsnormal" style="margin-left:10px;">(6) Difficulty in returning foreskin to normal:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB3_ReturnfSkin" runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
     <asp:RequiredFieldValidator ID="RequiredddB3_ReturnfSkin" runat="server" ControlToValidate="ddB3_ReturnfSkin" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
     <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
     
      <span title="B3_Erection" class="spanlabelsnormal" style="margin-left:25px;">(7) Concerns about erection / sexual function:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB3_Erection" runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
     <asp:RequiredFieldValidator ID="RequiredddB3_Erection" runat="server" ControlToValidate="ddB3_Erection" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
     <br />
</div>
<div style="visibility:hidden"><hr/></div>
<div>
    <span title="B3_OtherSpecify" class="spanlabelsnormal" style="margin-left:25px;">(8) Other (Specify):</span><input name="ctlContentPlaceHolder_B3_OtherSpecify" type="text" runat="server"  id="txtB3_OtherSpecify" class="textarea" style="width:300px;" /> 
<br />
</div>
       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B3ClientUndergoing" class="spanlabelsQuestions">B4: Client undergoing treatment for</span>
          <br />
      </div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="Client" class="spanlabelsnormal" style="margin-left:30px;">(1) Anaemia:</span>

      <span title="B4_Anaemia" style="color:Black;float:left;margin-left:25px;font-size:16px"></span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB4_Anaemia" runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredddB4_Anaemia" runat="server" ControlToValidate="ddB4_Anaemia" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
      <span title="Spacer" style="color:Black;float:left;margin-left:50px;font-size:16px"></span>

      <span title="B4_Diabetes" class="spanlabelsnormal" style="margin-left:15px;">(2) Diabetes:</span>
      <span title="B4_Diabetes" style="color:Black;float:left;margin-left:25px;font-size:16px"></span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB4_Diabetes" runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredddB4_Diabetes" runat="server" ControlToValidate="ddB4_Diabetes" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
      <span title="Spacer" style="color:Black;float:left;margin-left:50px;font-size:16px"></span>

      <span title="B4_HIVAids" class="spanlabelsnormal" style="margin-left:15px;">(3) HIV/AIDS:</span>
      <span title="B4_HIVAids" style="color:Black;float:left;margin-left:25px;font-size:16px"></span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB4_HIVAids" runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredddB4_HIVAids" runat="server" ControlToValidate="ddB4_HIVAids" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
     <span title="Spacer" style="color:Black;float:left;margin-left:25px;font-size:16px"></span>
     <span title="B4_OtherSpecify" class="spanlabelsnormal" style="margin-left:25px;">(4) Other (Specify):</span><input name="ctlContentPlaceHolder_B4_OtherSpecify" type="text" runat="server"  id="txtB4_OtherSpecify" class="textarea" style="width:200px;" /> 
     <br />
      </div>
       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B5allergies" class="spanlabelsQuestions">B5: Any known allergies?</span>

      <span title="allergies" style="color:Black;float:left;margin-left:25px;font-size:16px"></span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB5_Allergy" onChange="enableTextbox()"  runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredddB5_Allergy" runat="server" ControlToValidate="ddB5_Allergy" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
          <span title="B5_OtherSpecify" class="spanlabelsQuestions">If Yes, specify:</span><input name="ctlContentPlaceHolder_B5_OtherSpecify" type="text"  id="txtB5_OtherSpecify"  disabled="disabled" runat="server" class="textarea" style="width:300px; margin-left:5px" /> 
        
          
          <br />
      </div>
       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B6_Surgical" class="spanlabelsQuestions">B6: Client ever had surgical operation?</span>

      <span title="B6_Surgical" style="color:Black;float:left;margin-left:25px;font-size:16px"></span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddB6_Surgical" runat="server" onchange="B6_SurgOp();" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
     <asp:RequiredFieldValidator ID="RequiredddB6_Surgical" runat="server" ControlToValidate="ddB6_Surgical" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator> 
          <span title="B6_OtherSpecify" class="spanlabelsQuestions">If Yes, any complications?</span><input name="ctlContentPlaceHolder_B6_OtherSpecify" type="text"  runat="server" disabled="disabled" id="txtB6_OtherSpecify" class="textarea" style="width:300px; margin-left:5px" /> 
        <br />
      </div>  
    <div style="visibility:hidden"><hr/></div>
    <div>
        <span title="B7:BP" class="spanlabelsQuestions">B7:BP:</span><input name="ctlContentPlaceHolder_B7_BP1" onkeypress="javascript:return isNumber (event)" type="text" runat="server"  id="txtB7_BP1" class="textarea" style="width:50px; margin-left:5px;" />
        <asp:RequiredFieldValidator ID="RequiredtxtB7_BP1" runat="server" ControlToValidate="txtB7_BP1" ForeColor="red"  ErrorMessage="*"  Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="Range_B7_BP1" runat="server" Type="Integer" MinimumValue="60" MaximumValue="200" ControlToValidate="txtB7_BP1" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 60 and 200" />
        <span style="font-weight:bolder" >-</span>
        <input name="ctlContentPlaceHolder_B7_BP2" type="text" onkeypress="javascript:return isNumber (event)" id="txtB7_BP2"  runat="server" class="textarea" style="width:50px; margin-left:-2px " />
        <asp:RequiredFieldValidator ID="RequiredtxtB7_BP2" runat="server" ControlToValidate="txtB7_BP2" ForeColor="red"  ErrorMessage="*"  Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator_txtB7_BP2_" runat="server" Type="Integer" MinimumValue="30" MaximumValue="100" ControlToValidate="txtB7_BP2" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 30 and 100" />
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Pulse" class="spanlabelsQuestions">Pulse:</span><input name="ctlContentPlaceHolder_B7_Pulse" type="text" onkeypress="javascript:return isNumber (event)" id="txtB7_Pulse" class="textarea"  runat="server" style="width:50px; margin-left:5px" />           <asp:RequiredFieldValidator ID="RequiredtxtB7_Pulse" runat="server" ControlToValidate="txtB7_Pulse" ForeColor="red"  ErrorMessage="*"  Display="Dynamic"></asp:RequiredFieldValidator>         <asp:RangeValidator ID="RangetxtB7_Pulse" runat="server" Type="Integer" MinimumValue="50" MaximumValue="110" ControlToValidate="txtB7_Pulse" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 50 and 110" />                         <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Weight" class="spanlabelsQuestions">Weight:</span><input name="ctlContentPlaceHolder_B7_Weight" runat="server" type="text"  id="txtB7_Weight" onkeypress="javascript:return isNumber (event)"  class="textarea"  style="width:50px; margin-left:5px" />         <asp:RequiredFieldValidator ID="RequiredtxtB7_Weight" runat="server" ControlToValidate="txtB7_Weight" ForeColor="red"  ErrorMessage="*"  Display="Dynamic"></asp:RequiredFieldValidator>          <asp:RangeValidator ID="Range_txtB7_Weight" runat="server" Type="Integer" MinimumValue="8" MaximumValue="130" ControlToValidate="txtB7_Weight" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 2.5 and 130" /> <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Pulse" class="spanlabelsQuestions">Temperature:</span><input name="ctlContentPlaceHolder_B7_Temperature" type="text"  id="txtB7_Temperature" onkeypress="javascript:return isNumber (event)"  runat="server" class="textarea"  style="width:50px; margin-left:5px" />        <asp:RequiredFieldValidator ID="RequiredtxtB7_Temperature" runat="server" ControlToValidate="txtB7_Temperature" ForeColor="red"  ErrorMessage="*"  Display="Dynamic"></asp:RequiredFieldValidator>         <asp:RangeValidator ID="RangetxtB7_Temperature" runat="server" Type="Double" MinimumValue="33" MaximumValue="45" ControlToValidate="txtB7_Temperature" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 33 and 45" />     
    </div>
    <br /><br />
    <div>
    <hr/>
        <div id="Eligibility" style="background-color:black"><span title="Eligibility" class="spanlabelsTitles">C: ELIGIBILITY FOR CIRCUMCISION</span>
        </div>
        <br />
    </div>
<div style="visibility:hidden"><hr/></div>
<div>  <span title="eligible" class="spanlabelsnormal" style="margin-left:25px;">C1.1 in good health:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddC1_Health" ClientIDMode="Static" onchange="CompareSelectedValues();MC_Procedure()"  runat="server" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredddC1_Health" runat="server" ControlToValidate="ddC1_Health" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
    <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
        <span title="C2_Counseled" class="spanlabelsnormal" style="margin-left:25px;">C1.2 Counseled?</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddC2_Counseled" runat="server"  onchange="CompareSelectedValues();MC_Procedure()"  ClientIDMode="Static" CssClass="ddYN">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredddC2_Counseled" runat="server" ControlToValidate="ddC2_Counseled" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
     <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <span title="C3_Consent" class="spanlabelsnormal" style="margin-left:25px;">C1.3  Consented/assented:</span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddC3_Consent" runat="server"  onchange="CompareSelectedValues();MC_Procedure()" ClientIDMode="Static" CssClass="ddYN" AutoPostBack="false">
          <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredddC3_Consent" runat="server" ControlToValidate="ddC3_Consent" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>
      <br />
      </div>
    <div style="visibility:hidden"><hr/></div>
<div>
    <span title="B3_OtherSpecify" class="spanlabelsnormal" style="margin-left:25px;">If No for any of the above, explain:</span><input name="ctlContentPlaceHolder_B3_C3_Explain"  type="text" runat="server" clientidmode="Static"  class="textarea" id="txtC3_Explain" style="width:500px; margin-left:5px" /> 
<br />
</div>
<div>
    <br />
    <span title="Note" class="spanlabelsnormal" style="font-family:Verdana; font-size:9px; margin-top:15px; margin-left:25px;">NOTE: PROCEED WITH CIRCUMCISION ONLY IF ALL ABOVE BOXES HAVE BEEN CHECKED "YES"</span>

</div>
    <br />
    <div>
    <hr/>
        <div id="Circumcision" style="background-color:black"><span title="Circumcision" class="spanlabelsTitles">D: CIRCUMCISION PROCEDURE</span>
        </div>
        <br />

    </div>
          <div id="divMC_Procedure"  style='width:100%;height:100%;position:relative;'>
        <asp:Panel ID="pnl_MCProcedure"  Height="100%"  ClientIDMode="Static" runat="server">

<div style=" margin-top:5px;vertical-align:central;">

        
         <span title="Circumcision Date" class="spanlabelsnormal" >D1: Date of circumcision:</span>
            <asp:TextBox ID="txtD1_MC_Date" runat="server"  maxlength="11" placeholder="dd/mm/yyyy"  clientidmode="Static" class="textarea"   autocomplete="off" style="width:150px; margin-right:2px" ></asp:TextBox>
<%--          <asp:RequiredFieldValidator ID="RequiredtxtD1_MC_Date" runat="server" ControlToValidate="txtD1_MC_Date" ForeColor="red"  ErrorMessage="Required."  Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    <asp:CompareValidator id="ComptxtD1_MC_Date" Text="Date must be less than now" ControlToValidate="txtD1_MC_Date" Type="Date" Operator="LessThanEqual" Display="Dynamic" ForeColor="red" Runat="server" /> 
                    <asp:CompareValidator id="CompatxtD1_MC_Date1" Text="Date must be greater than Visit" ControlToValidate="txtD1_MC_Date" ControlToCompare="txtVisitDate" Type="Date" Operator="LessThanEqual" Display="Dynamic" ForeColor="red" Runat="server" />
                   <%-- <asp:TextBox name="txtRegDate1" type="text"  id="txtRegDate1" maxlength="11" placeholder="dd/mm/yyyy" clientidmode="Static"  runat="server" class="textarea"  autocomplete="off" style="width:150px; margin-right:2px" /> --%> 
                    <asp:RegularExpressionValidator ID="RegulartxtD1_MC_Date" runat="server" ControlToValidate="txtD1_MC_Date" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$" ErrorMessage="Invalid date format." ForeColor="red" Display="Dynamic"/> 
                        <script type="text/javascript">
                            $("#<%=txtD1_MC_Date.ClientID%>").datepicker({
                                showOnFocus: false,
                                dateFormat: "dd/mm/yy",
                                showOn: "button",
                                buttonImage: "../img/cal2.jpg",
                                buttonImageOnly: true,
                                inline: true,
                                showOtherMonths: true,
                                dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                            });
        </script>

           <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="D2: Start Time [24 hour clock]:" class="spanlabelsnormal">D2: Start Time [24 hour clock]:</span>    <asp:TextBox ID="txD2_StartTime" MaxLength="2" width="25px" CssClass="textarea"  onblur="concatVMMCStartTime('<%=txD2_StartTime.ClientID%>','<%=txD2_StartTime2.ClientID%>');" ClientIDMode="Static"   runat="server" AutoPostBack="false"></asp:TextBox>            <asp:RangeValidator ID="RangetxD2_StartTimehh" runat="server" Type="Integer" MinimumValue="0" MaximumValue="23" ControlToValidate="txD2_StartTime" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 0 and 23" />         <span style="font-size:12px; width:0px">:</span>    <asp:TextBox ID="txD2_StartTime2" MaxLength="2" width="25px" CssClass="textarea" runat="server"  onblur="concatVMMCStartTime('<%=txD2_StartTime.ClientID%>','<%=txD2_StartTime2.ClientID%>');"  ClientIDMode="Static"  AutoPostBack="false"></asp:TextBox>        <asp:RangeValidator ID="RangetxD2_StartTime2MM" runat="server" Type="Integer" MinimumValue="0" MaximumValue="60" ControlToValidate="txD2_StartTime2" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 0 and 60" />
                          <%--<asp:RegularExpressionValidator id="RegulartxtD2_StartTime" runat="server" ForeColor="red" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtD2_StartTime" ValidationExpression="^((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))$|^([01]\d|2[0-3])(:[0-5]\d){1,2}$"></asp:RegularExpressionValidator>--%>                        <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="D3: End Time [24 hour clock]:" class="spanlabelsnormal">D3: End Time [24 hour clock]:</span>        <asp:TextBox ID="txD3_EndTime" MaxLength="2" width="25px" CssClass="textarea" runat="server"  onblur="concatVMMCEndTime('<%=txD3_EndTime.ClientID%>','<%=txD3_EndTime2.ClientID%>');" ClientIDMode="Static" AutoPostBack="false"></asp:TextBox>
    <asp:RangeValidator ID="RangetxD3_EndTime2HH" runat="server" Type="Integer" MinimumValue="0" MaximumValue="23" ControlToValidate="txD3_EndTime" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 0 and 23" />
        <span style="font-size:12px; width:0px">:</span>
    <asp:TextBox ID="txD3_EndTime2" MaxLength="2" width="25px" CssClass="textarea" runat="server"  onblur="concatVMMCEndTime('<%=txD3_EndTime.ClientID%>','<%=txD3_EndTime2.ClientID%>');HourDifference()"  ClientIDMode="Static" AutoPostBack="false"></asp:TextBox>
    <asp:RangeValidator ID="RangetxD3_EndTime2MM" runat="server" Type="Integer" MinimumValue="0" MaximumValue="60" ControlToValidate="txD3_EndTime2" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 0 and 60" />
    <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Duration in minutes" class="spanlabelsnormal">Duration in Minutes:</span>       <asp:Label ID="lblDuration" ClientIDMode="Static" runat="server" Text=""></asp:Label><asp:TextBox ID="txtDuration" ClientIDMode="Static"  CssClass="txtHidden" runat="server"></asp:TextBox>        <%--<asp:CompareValidator ID="CompareMCDuration" ControlToValidate = "txtD3_EndTime" ControlToCompare = "txtD2_StartTime" Type = "Date" Operator="GreaterThan" runat="server" Display="Dynamic" ForeColor="red"  ErrorMessage="Invalid time "></asp:CompareValidator>--%><asp:Label ID="lblD2_StartTime" ClientIDMode="Static" runat="server" CssClass="txtHidden" Text=""></asp:Label><asp:Label ID="lblD3_EndTime" ClientIDMode="Static" runat="server" CssClass="txtHidden"  Text=""></asp:Label>
    <asp:TextBox ID="txtD2_StartTime"  ClientIDMode="Static" CssClass="txtHidden" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtD3_EndTime"  ClientIDMode="Static" CssClass="txtHidden" runat="server"></asp:TextBox>

                   <br />        </div>
          
       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="B2ClientPresenting" style="margin-left:-0px;" class="spanlabelsQuestions">D4: List operative medication given (if any):</span>

      <span title="D4_OPMedCode" style="color:Black;float:left;margin-left:25px;font-size:14px"></span>
      <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
      <asp:DropDownList ID="ddD4_OPMedCode" runat="server" CssClass="ddFacilityName"></asp:DropDownList>
      
  <br />
      </div>

           <div style="visibility:hidden"><hr/></div>
      <div>  <span title="Anaesthesia"  style="margin-left:-0px;"  class="spanlabelsQuestions">D5: Anaesthesia used:</span>
          <br />
      </div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="Client" class="spanlabelsnormal" style="margin-left:30px;">D5.1: Type:</span>

      <span title="D5_Anaesthesia" style="color:Black;float:left;margin-left:5px;font-size:16px"></span>
      <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
      <asp:DropDownList ID="ddD5_Anaesthesia" runat="server" onchange="Anaesthesia();" AutoPostBack="false" CssClass="ddFacilityName">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="Lignocaine" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Other (Specify)" Value="2"></asp:ListItem>
      </asp:DropDownList>
      
      <span title="Spacer" style="color:Black;float:left;margin-left:5px;font-size:16px"></span>

      <span title="D5_Concentration" class="spanlabelsnormal" style="margin-left:15px;">D5.2: Concentration:</span>
      <span title="D5_Concentration" style="color:Black;float:left;margin-left:5px;font-size:16px"></span>
      <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
      <asp:DropDownList ID="ddD5_Concentration" runat="server" AutoPostBack="false" CssClass="ddYN">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="1%" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2%" Value="2"></asp:ListItem>
      </asp:DropDownList>

      <span title="Spacer" style="color:Black;float:left;margin-left:5px;font-size:16px"></span>

      <span title="D5_Volume" class="spanlabelsnormal" style="margin-left:15px;">D5.3: Volume (mls):</span>
      <span title="D5_Volume" style="color:Black;float:left;margin-left:25px;font-size:16px"></span>
      <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
      <input name="ctlContentPlaceHolder_D5_Volume" type="text"  id="txtD5_Volume" runat="server" maxlength="5" onkeypress="javascript:return isNumber (event)" class="textarea" style="width:45px;" /> 
            <div />        
          <br />
          
          <div style="visibility:hidden"><hr/></div>
          <div>
     <span title="Spacer" style="color:Black;float:left;margin-left:50px;font-size:16px"></span>
     <span title="D5_OtherSpecify" class="spanlabelsnormal" style="margin-left:78px;">Other (Specify):</span><input name="ctlContentPlaceHolder_D5_OtherSpecify" disabled="disabled" type="text"  id="txtD5_SpecifyOther" runat="server" class="textarea" style="width:400px; margin-left:5px" /> 
     <br />
      </div>

        <div style="visibility:hidden"><hr/></div>

        <div>
            <span title="A5_InfoSource" style="margin-left:-31px;" class="spanlabelsnormal">D6: Type of circumcision procedure:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
            <asp:DropDownList ID="ddD6_Procedure" runat="server" AutoPostBack="false" onchange="CircumType();" Width="100px" CssClass="ddFacilityName"></asp:DropDownList>

             <span style='font-family:Verdana;float:Left;visibility:hidden; width:0px'>0</span>
             <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span> <input name="ctlContentPlaceHolder_D6_SpecifyOther" disabled="disabled" runat="server" type="text"  id="txtD6_SpecifyOther" class="textarea" style="width:300px; margin-left:5px" />
<br />
        </div>
        <div style="visibility:hidden"><hr/></div>

        <div>

           

           <span title="D7_AEDuring" style="margin-left:-81px;" class="spanlabelsnormal">D7: Adverse Events during operations:</span>
             <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span> <asp:DropDownList ID="ddD7_AEDuring" runat="server" onchange="aeoccurred();" CssClass="ddYN" AutoPostBack="false"  >
                 <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
                                                                                                 </asp:DropDownList>

             <span style="font-family:Verdana;float:Left;visibility:hidden; width:50px">0</span><span title="D7_AEType" class="spanlabelsnormal">D8: Type of AE:</span>
             <span style="font-family:Verdana;float:Left;visibility:hidden; width:15px">0</span> <asp:DropDownList ID="ddD7_AEType"  runat="server" Enabled="false"  AutoPostBack="false" CssClass="ddFacilityName">

             </asp:DropDownList>
 <br />
            </div>
          <div style="visibility:hidden"><hr/></div>
          <div>
            
             <span style='font-family:Verdana;float:Left;visibility:hidden; width:0px'>0</span>
                         <span title="D9_AESeverity" style="margin-left:-15px;" class="spanlabelsnormal">D9: If Yes, how would you rate it? (refer to AE description form)</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
            <asp:DropDownList ID="ddD9_AESeverity" runat="server" AutoPostBack="false" Width="100px"  Enabled="false" CssClass="ddFacilityName">
                                 <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="MILD" Value="1"></asp:ListItem>
                                <asp:ListItem Text="MODERATE" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="SEVERE" Value="3"></asp:ListItem>
            </asp:DropDownList>
              <br />
        </div>
        <div style="visibility:hidden"><hr/></div>

        <div>
            <span title="D10_Surgname" class="spanlabelsnormal" style="margin-left:-95px">D10. Clinician Name:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
            <asp:DropDownList ID="ddD10_Surgname" runat="server" AutoPostBack="true" Width="200px" CssClass="ddFacilityName"></asp:DropDownList>

             <span style='font-family:Verdana;float:Left;visibility:hidden; width:50px'>0</span>
            <span title="D11: Cadre:" class="spanlabelsnormal">D11: Cadre:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
             <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span> <input name="ctlContentPlaceHolder_D11_SurgCadre" type="text"  id="txtD11_SurgCadre" runat="server"  disabled="disabled" class="textarea" style="width:30px;  margin-left:5px" />
<br />
        </div>
        <div style="visibility:hidden"><hr/></div>

        <div>
            <span title="D12_AssSurgname" style="margin-left:-94px;" class="spanlabelsnormal">D12: Name of Assistant:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
            <asp:DropDownList ID="ddD12_AssSurgname" runat="server" AutoPostBack="true" Width="200px" CssClass="ddFacilityName"></asp:DropDownList>

             <span style='font-family:Verdana;float:Left;visibility:hidden; width:50px'>0</span>
            <span title="D11: Cadre:" class="spanlabelsnormal">D13: Cadre:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
             <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span> <input name="ctlContentPlaceHolder_D13_CadreAssSurg" type="text"  id="txtD13_CadreAssSurg" disabled="disabled" runat="server" class="textarea" style="width:30px;  margin-left:5px" />
        <br />
       </div>
    <br /><br />
    <div>
    <hr/>
        <div id="ImmediatePO" style="background-color:black"><span title="IMMEDIATE" class="spanlabelsTitles">E: IMMEDIATE POST OP (approximately 30 minutes after the procedure)</span>
        </div>
        <br />
    </div>
<div style="visibility:hidden"><hr/></div>


        <div>
        <span title="B7:BP" style="margin-left:-1px" class="spanlabelsQuestions">B7:BP:</span><input name="ctlContentPlaceHolder_B7_BP1" type="text" onkeypress="javascript:return isNumber (event)"   runat="server" id="txtE1_BP" class="textarea" style="width:50px; margin-left:5px;" />
         <asp:RangeValidator ID="RangetxtE1_BP" runat="server" Type="Integer" MinimumValue="60" MaximumValue="200" ControlToValidate="txtE1_BP" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 60 and 200" />
            <span style="font-weight:bolder" >-</span>
        <input name="ctlContentPlaceHolder_B7_BP2" type="text" onkeypress="javascript:return isNumber (event)" id="txtE1_BP2"  runat="server" class="textarea" style="width:50px; margin-left:-2px " />
              <asp:RangeValidator ID="Range_txtE1_BP" runat="server" Type="Integer" MinimumValue="30" MaximumValue="100" ControlToValidate="txtE1_BP2" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 30 and 100" />
            <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Pulse" class="spanlabelsQuestions">Pulse:</span><input name="ctlContentPlaceHolder_E1_Pulse" type="text" onkeypress="javascript:return isNumber (event)" id="txtE1_Pulse"  runat="server" class="textarea" style="width:50px; margin-left:5px" />               <asp:RangeValidator ID="RangetxtE1_Pulse" runat="server" Type="Integer" MinimumValue="50" MaximumValue="110" ControlToValidate="txtE1_Pulse" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 50 and 110" />                          <span style="width:50px">&nbsp;&nbsp;&nbsp;</span>
            <span title="Pulse" class="spanlabelsQuestions">Temperature:</span><input name="ctlContentPlaceHolder_E1_Temperature" type="text" onkeypress="javascript:return isNumber (event)" id="txtE1_Temperature"  runat="server" class="textarea"  style="width:50px; margin-left:5px" />                <asp:RangeValidator ID="RangetxtE1_Temperature" runat="server" Type="Double" MinimumValue="33" MaximumValue="45" ControlToValidate="txtE1_Temperature" ForeColor="red" Font-Size="10px"  Display="Dynamic" ErrorMessage="Value must be a whole number between 33 and 45" />              <br />
    </div>
    <div style="visibility:hidden"><hr/></div>
<div>
    <span title="opmed" class="spanlabelsnormal" style="margin-left:0px;">E2: List pre/post operative medication given:</span>
    <asp:DropDownList ID="ddE2_Medication" runat="server" Width="200px" CssClass="ddFacilityName"></asp:DropDownList>
    <%--<input name="ctlContentPlaceHolder_E2_Medication" type="text"  id="txtE2_Medication" class="textarea" style="width:400px; margin-left:5px" />--%> 
<br />
</div>

       <div style="visibility:hidden"><hr/></div>
      <div>  <span title="E3_PostInstruction" style="margin-left:-15px" class="spanlabelsQuestions">E3: Client given post operative instructions:</span>

      <span title="E3_PostInstruction" style="color:Black;float:left;margin-left:25px;font-size:14px"></span>
      <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
      <asp:DropDownList ID="ddE3_PostInstruction" runat="server" AutoPostBack="false" CssClass="ddYN">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
   <asp:ListItem Text="YES" Value="1"></asp:ListItem>
   <asp:ListItem Text="NO" Value="2"></asp:ListItem>
      </asp:DropDownList>
      
  <br />
      </div>
        <div style="visibility:hidden"><hr/></div>

        <div>
            <span title="E4_Dis_OfficerName" style="margin-left:-95px" class="spanlabelsnormal">E4: Discharging officer:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
            <asp:DropDownList ID="ddE4_Dis_OfficerName" runat="server" AutoPostBack="true" Width="200px" CssClass="ddFacilityName"></asp:DropDownList>

             <span style='font-family:Verdana;float:Left;visibility:hidden; width:50px'>0</span>
            <span title="E4_Dis_OfficerCadre" class="spanlabelsnormal">E5: Cadre:</span><span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span>
             <span style='font-family:Verdana;float:Left;visibility:hidden; width:15px'>0</span> <input name="ctlContentPlaceHolder_E4_Dis_OfficerCadre" type="text"  id="txtE5_CadreAssSurg" runat="server" disabled="disabled" class="textarea" style="width:30px;  margin-left:5px" />
        <br />
   <div />  </div>
              </asp:Panel>
     </div>   
    <br /><br />
        

               <script>
                   // WRITE THE VALIDATION SCRIPT IN THE HEAD TAG.
                   function isNumber(evt) {
                       var iKeyCode = (evt.which) ? evt.which : evt.keyCode
                       if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
                           return false;

                       return true;
                   }
</script>
      
      
      
      
      
      
      <script type="text/javascript">
          //window.onload = RelOthers;
          function InfoOthers() {
              var selectbox = document.getElementById("<%=ddA5_InfoSource.ClientID%>");
            var selectedOption = selectbox.options[selectbox.selectedIndex];
            var selectedIndex = selectbox.selectedIndex;
            var selectedOption = selectbox.options[selectedIndex];



            if (selectedOption.text == "Other (Specify)") {
                document.getElementById("<%=txtA5_InfoSourceOther.ClientID%>").disabled = false;
                document.getElementById("<%=txtA5_InfoSourceOther.ClientID%>").focus()
            }
                //document.forms[0].elements("txtRelOther").disabled = false;
            else {
                document.getElementById("<%=txtA5_InfoSourceOther.ClientID%>").disabled = true;
                document.getElementById('<%= txtA5_InfoSourceOther.ClientID%>').value = ""
                document.getElementById("<%=ddB1_FacResult.ClientID%>").focus()
            }
            // document.forms[0].elements("txtRelOther").disabled = true;

          }

<%--          function enableTextbox() {
              if (document.getElementById("<%=ddB5_Allergy.ClientID%>").value == "1") {
                  document.getElementById("<%=txtB5_OtherSpecify.ClientID%>").disabled = false;
              }
              else {
                  document.getElementById("<%=txtB5_OtherSpecify.ClientID%>").disabled = true;
                  document.getElementById('<%= txtB5_OtherSpecify.ClientID%>').value = ""
                  document.getElementById("<%=ddB5_Allergy.ClientID%>").focus()
              }
          }--%>


          function B1_HIVResult() {
              if (document.getElementById("<%=ddB1_FacResult.ClientID%>").value == "0" || document.getElementById("<%=ddB1_FacResult.ClientID%>").value == "3") {
                  document.getElementById("<%=ddB1_SelfResult.ClientID%>").disabled = false;
                 
              }
              else {
                  document.getElementById("<%=ddB1_SelfResult.ClientID%>").disabled = true;
                  document.getElementById('<%= ddB1_SelfResult.ClientID%>').value = ""
                  document.getElementById("<%=ddB1_PartResult.ClientID%>").focus()
              }
          }

          function enableTextbox() {
              if (document.getElementById("<%=ddB5_Allergy.ClientID%>").value == "YES") {
                          document.getElementById("<%=txtB5_OtherSpecify.ClientID%>").disabled = false;
              }
              else {
                  document.getElementById("<%=txtB5_OtherSpecify.ClientID%>").disabled = true;
                  document.getElementById('<%= txtB5_OtherSpecify.ClientID%>').value = ""
                  document.getElementById("<%=ddB5_Allergy.ClientID%>").focus()
              }
          }

          function B6_SurgOp() {
              if (document.getElementById("<%=ddB6_Surgical.ClientID%>").value == "YES") {
                  document.getElementById("<%=txtB6_OtherSpecify.ClientID%>").disabled = false;
              }
              else {
                  document.getElementById("<%=txtB6_OtherSpecify.ClientID%>").disabled = true;
                  document.getElementById('<%= txtB6_OtherSpecify.ClientID%>').value = ""
                  document.getElementById("<%=ddB6_Surgical.ClientID%>").focus()
              }
          }
          function VMMC_Proceed() {
              <%--              var health = document.getElementById("<%=ddC1_Health.ClientID%>").value;
    var counseled = window.document.getElementById("<%=ddC2_Counseled.ClientID%>").value;
    var consent = window.document.getElementById("<%=ddC3_Consent.ClientID%>").value;--%>

              if (document.getElementById("<%=ddC1_Health.ClientID%>").value !== "1" || document.getElementById("<%=ddC2_Counseled.ClientID%>").value !== "1" || document.getElementById("<%=ddC3_Consent.ClientID%>").value !== "1")  {
                 //document.getElementById("<%=txtD1_MC_Date.ClientID%>").disabled = false;
                  document.getElementById('<%=pnl_MCProcedure.ClientID%>').style.visibility = 'visible';
              }
              else {
                  //document.getElementById("<%=txtD1_MC_Date.ClientID%>").disabled = true;
                  document.getElementById('<%=pnl_MCProcedure.ClientID%>').style.visibility = 'hidden';
              }
          }

</script> 
      
        <script type="text/javascript">
            function CompareSelectedValues() {
                var health = document.getElementById("<%=ddC1_Health.ClientID%>").value;
                var counseled = document.getElementById("<%=ddC2_Counseled.ClientID%>").value;
                var consent = document.getElementById("<%=ddC3_Consent.ClientID%>").value;
                if (health.selectedIndex != 1 || counseled.selectedIndex != 1 || consent.selectedIndex != 1) {
                    document.getElementById('<%=pnl_MCProcedure.ClientID%>').style.visibility = 'visible';
                } else {
                    document.getElementById('<%=pnl_MCProcedure.ClientID%>').style.visibility = 'hidden';
                }
            }
    </script>

    <script>
        function Anaesthesia() {
            if (document.getElementById("<%=ddD5_Anaesthesia.ClientID%>").value == "2") {
                document.getElementById("<%=txtD5_SpecifyOther.ClientID%>").disabled = false;
            }
            else {
                document.getElementById("<%=txtD5_SpecifyOther.ClientID%>").disabled = true;
                document.getElementById("<%= txtD5_SpecifyOther.ClientID%>").value = "";
                
            }
        }

    </script>
    <script>
            function CircumType() {
            if (document.getElementById("<%=ddD6_Procedure.ClientID%>").value == "3") {
                document.getElementById("<%=txtD6_SpecifyOther.ClientID%>").disabled = false;
            }
            else {
                document.getElementById("<%=txtD6_SpecifyOther.ClientID%>").disabled = true;
                document.getElementById("<%= txtD6_SpecifyOther.ClientID%>").value = "";
                
            }
        }

        
        function aeoccurred() {
            if (document.getElementById("<%=ddD7_AEDuring.ClientID%>").value == "1") {
                document.getElementById("<%=ddD7_AEType.ClientID%>").disabled = false;
                document.getElementById("<%=ddD9_AESeverity.ClientID%>").disabled = false;
            }
            else {
                document.getElementById("<%=ddD7_AEType.ClientID%>").disabled = true;
                document.getElementById("<%= ddD7_AEType.ClientID%>").value = "";

                document.getElementById("<%=ddD9_AESeverity.ClientID%>").disabled = true;
                document.getElementById("<%= ddD9_AESeverity.ClientID%>").value = "";
            }
        }
    </script>

    <script>
        function HourDifference() {


            //start = document.getElementById('<%= lblD2_StartTime.ClientID%>').innerHTML;
            //end = document.getElementById('<%= lblD3_EndTime.ClientID%>').innerHTML;

            start = document.getElementById('<%= txtD2_StartTime.ClientID%>').value;
            end = document.getElementById('<%= txtD3_EndTime.ClientID%>').value;

            startMinutes = parseInt(start.substr(3, 2));
            startHours = parseInt(start.substr(0, 2));
            endMinutes = parseInt(end.substr(3, 2));
            endHours = parseInt(end.substr(0, 2));

            minutesDiff = endMinutes - startMinutes;
            hoursDiff = endHours - startHours;

            if (minutesDiff < 0) {
                hoursDiff--;
                minutesDiff = 60 + minutesDiff;
            }

            if (minutesDiff < 10) {
                minutesDiff = "0" + minutesDiff;
            }

            if (hoursDiff < 0) {
                hoursDiff = 24 + hoursDiff;
            }

            hours = hoursDiff.toString();
            minutes = minutesDiff.toString();

            if (hours.length < 2) {
                hours = "0" + hours;
            }

            if (minutes.length < 2) {
                minutes = minutes + "0";
            }
            document.getElementById('<%= txtDuration.ClientID%>').value = minutes;
            document.getElementById('<%= lblDuration.ClientID%>').innerHTML = document.getElementById('<%= txtDuration.ClientID%>').value;
            
            
        }
 
    
 function Compare() {
     var strStartTime = document.getElementById("txtD2_StartTime").value;
     var strEndTime = document.getElementById("txtD3_EndTime").value;
 
        var startTime = new Date().setHours(GetHours(strStartTime), GetMinutes(strStartTime), 0);
        var endTime = new Date(startTime)
        endTime = endTime.setHours(GetHours(strEndTime), GetMinutes(strEndTime), 0);
        //if (startTime > endTime) {
        //    alert("Start Time is greater than end time");
        //}
        if (startTime == endTime) {
            alert("Start Time equals end time");
        }
        if (startTime < endTime) {
            alert("Start Time is less than end time");
        }
    }
    function GetHours(d) {
        var h = parseInt(d.split(':')[0]);
        if (d.split(':')[1].split(' ')[1] == "PM") {
            h = h + 12;
        }
        return h;
    }
    function GetMinutes(d) {
        return parseInt(d.split(':')[1].split(' ')[0]);
        document.getElementById('<%= txtDuration.ClientID%>').value = arseInt(d.split(':')[1].split(' ')[0]);
        document.getElementById('<%= lblDuration.ClientID%>').innerHTML = document.getElementById('<%= txtDuration.ClientID%>').value;
    }
</script>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">

    <div>
        <hr /><br />
    <span title="Note" class="spanlabelsnormal" style="font-family:Verdana; font-size:9px; margin-top:15px; margin-left:25px;">NOTE: IF A SEVERE AE IS OBSERVED, INFORM FACILITY IN CHARGE AND COMPLETE INCIDENCE FORM</span>
        <hr />
   <span style='font-family:Verdana;float:Left;visibility:hidden; width:300px'>0</span> <asp:Button ID="cmdSave" CssClass="ButtonProperty"  runat="server" Text="Save Record" />
    <span style='font-family:Verdana;float:Left;visibility:hidden; width:50px'>0</span>
    <asp:Button ID="cmdFolloup" runat="server" CssClass="ButtonProperty"  Text="Follow Up" />
    <br /><br />
</div>
</asp:Content>
