<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HMIS.Master" CodeBehind="test.aspx.vb" Inherits="HMIS.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
         <script  type="text/javascript">
        <%--       function getAge() {
            var inputdob = document.getElementById('<%=txtDOB.ClientID%>').value;
            if (inputdob == "") {
                alert("Enter date of Birth");
                document.getElementById('<%=txtAge.ClientID %>').value = "";
                return false;
            }
            var DOBDate = new Date(inputdob);
            var currentDate = new Date();
            var months = currentDate.getMonth() - DOBDate.getMonth();   
            var years = currentDate.getFullYear() - DOBDate.getFullYear();
            var days = currentDate.getDate() - DOBDate.getDate();
            if (years < 0) {
                alert("Date of Birth is incorrect");
                return false;
            }
            else if (months < 0) {
                years = parseInt(years, 10);
                months = 12 + parseInt(months, 10);
                if (days < 0) {
                    months = parseInt(months, 10);
                    days = 30 + parseInt(days, 10);
                    document.getElementById('<%=txtAge.ClientID %>').value = years;
                    
                }
                else
                    document.getElementById('<%=txtAge.ClientID%>').value = years;
                   
            }
           
                }
           --%>

             function getAge() {
                 var inputdob = document.getElementById('<%=TxtDOB.ClientID%>').value;
            if (inputdob == "") {
                alert("Enter date of Birth");
                document.getElementById('<%=txtAge.ClientID %>').value = "";
                return false;
            }
            var DOBDate = new Date(inputdob);
            var currentDate = new Date();
            var months = currentDate.getMonth() - DOBDate.getMonth();
            var years = currentDate.getFullYear() - DOBDate.getFullYear();
            var days = currentDate.getDate() - DOBDate.getDate();
            if (years < 0) {
                alert("Date of Birth is incorrect");
                return false;
            }
            else if (months < 0) {
                years = parseInt(years, 10);
                months = 12 + parseInt(months, 10);
                if (days < 0) {
                    months = parseInt(months, 10);
                    days = 30 + parseInt(days, 10);
                    document.getElementById('<%=txtAge.ClientID %>').value = years;
                }
                else
                    document.getElementById('<%=txtAge.ClientID %>').value = years;
            }
            else {
                if (months == 0) {
                    years = parseInt(years, 10);
                    if (days < 0) {
                        dayDiff = 30 + parseInt(days, 10);
                        document.getElementById('<%=txtMonths.ClientID%>').innerHTML = months;
                    }
                    else
                        document.getElementById('<%=txtMonths.ClientID%>').value = months;
                }

            }
    }
      </script>

  <link rel="stylesheet" href="http://localhost:51379/code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />








<table>
        <tr>
            <td colspan ="3"><asp:Label ID="lblFacilityDistrict" class="required" runat="server"  Text="Facility District:"></asp:Label> 
                            <asp:Label ID="lblDistricCode" runat="server" Text=""></asp:Label></td>
            <td colspan="3"><asp:Label ID="lblPersonDistrict"  runat="server" class="required" Text="Person District"></asp:Label><asp:DropDownList ID="ddPersonDistrict" CssClass="ddlist" Width="40%"  runat="server" AutoPostBack="True"></asp:DropDownList></td>

            
        </tr>
            <tr>
                            <td colspan="3"><asp:Label ID="lblRegDate" class="required" runat="server" Text="Reg. Date:"></asp:Label>
                <asp:TextBox ID="txtRegDate" runat="server" CssClass="textboxes"  MaxLength="11" Width="120px"></asp:TextBox>
                                                <script type="text/javascript">
                                                    $(function () {
                                                        $("#<%=txtRegDate.ClientID%>").datepicker({
                                                            showOnFocus: false,
                                                            dateFormat: "dd/mm/yy",
                                                            showOn: "button",
                                                            buttonImage: "../img/cal_icon.gif",
                                                            buttonImageOnly: true,
                                                            buttonText: "Select date"
                                                        });
                                                    });

    </script>
               <span class="smallerlabel">DD/MM/YYYY </span>
       <%--         <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../img/cal_icon.gif" />
                                <span class="smallerlabel">DD-MMM-YYYY </span>--%>
                            </td>
                <td colspan="2" >      <asp:Label ID="lblClientNumber"  class="required"  runat="server" Text="A1: Client No:"></asp:Label>
                <asp:TextBox ID="txtClientNo" CssClass="textboxes" MaxLength="10" runat="server"></asp:TextBox>    </td><td colspan="2"><asp:Label ID="lblIRDOReference" runat="server" class="required" Text="IRDO Reference:"></asp:Label><asp:TextBox ID="txtIRDOReference" CssClass="textboxes" width="50%" runat="server"  ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3"> 
                <asp:Label ID="lblSurname"  class="required" runat="server" Text="B1: Surname:"></asp:Label>                                 
                
                                    <asp:TextBox ID="txtSurname" CssClass="textboxesLong" Width="50%" MaxLength="50" runat="server"></asp:TextBox>
                </td>
            <td colspan="2">        <asp:Label ID="lblOthernames"  class="required"  runat="server" Text="Other names"></asp:Label>
                                    <asp:TextBox ID="txtOthernames" CssClass="textboxesLong" Width="60%" MaxLength="100" runat="server"></asp:TextBox>
                                    </td>

            </tr>
        <tr>
            <td colspan="2" ><label id="lblSex" class="required" >
                                       B3: Sex:</label>
                                    <asp:DropDownList ID="ddgender" CssClass="ddlist" runat="server">
                                    </asp:DropDownList></td>
            <td colspan="3" ><label id="lblDOB" class="required">
                                        DOB:</label>
                                    <asp:TextBox ID="TxtDOB" CssClass="textboxes" MaxLength="11" runat="server" onchange="Javascript:getAge(this)"  Width="120px"></asp:TextBox>

    <script type="text/javascript">
        $(function () {
            $("#<%=TxtDOB.ClientID%>").datepicker({
                showOnFocus: false,
                dateFormat: "dd/mm/yy",
                showOn: "button",
                buttonImage: "../img/cal_icon.gif",
                buttonImageOnly: true,
                buttonText: "Select date",
                changeMonth: false,
                changeYear: false,
                showAnim: 'slideDown',
                duration: 'fast'
            });
        });
    </script>
                <span class="smallerlabel">DD/MM/YYYY  </span>
                <%--<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../img/cal_icon.gif"  onkeypress="javascript:getAge()"/>
                         <span class="smallerlabel">DD-MMM-YYYY </span>
                <script>
                                $(function() {
                                    $("#<%= TxtDOB.ClientID%>").datepicker();
                                    $("#<%= txtRegDate.ClientID%>").datepicker();
                                });
                                </script>--%>
            </td>
                 
             
                            <td>        <span id="Age" class="required">Age:</span><asp:TextBox ID="txtAge" CssClass="textboxes" MaxLength="2" Width="20px" runat="server"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" Text="years"></asp:Label><asp:Label ID="lblAge" runat="server" Text=""></asp:Label>
                                <span id="Month" class="required">Month:</span><asp:TextBox ID="txtMonths" CssClass="textboxes" MaxLength="2" Width="20px" runat="server"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="Months"></asp:Label><asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </td>
            
        </tr>
       <tr>
           <td colspan="6"><asp:Label ID="lblContactInfo" CssClass="labelheaders" runat="server" Text="Contact Information"></asp:Label></td>
       </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lblLocation" class="required" runat="server" Text="B6: Location"></asp:Label>
                <asp:DropDownList ID="ddLocation" CssClass="ddlist" width="50%" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td><td colspan="3">
                <asp:Label ID="lblDivision"  class="required" runat="server" Text="B5: Division:"></asp:Label><asp:DropDownList ID="ddDivision"  CssClass="ddlist" Width="50%" runat="server" AutoPostBack="True"></asp:DropDownList>
            </td><td colspan="2">
                <asp:Label ID="lblDistrict" runat="server" class="required" Text="B4: District:"></asp:Label><asp:DropDownList ID="ddDistrict" CssClass="ddlist"  Width="50%" runat="server"></asp:DropDownList>
            </td>
        </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lblNearestHF" runat="server" class="required"  Text="B7: Nearest Health Facility:"></asp:Label>
                    <asp:DropDownList ID="ddNearestHF"  CssClass="ddlist"   runat="server" AutoPostBack="True"></asp:DropDownList>
                </td>
                <td >
                    <asp:Label ID="lblPhoneNo" runat="server" class="required" Text="B8: Phone No:"></asp:Label><asp:TextBox ID="txtPhoneNo" CssClass="textboxes" runat="server"></asp:TextBox>
                </td>
                <td >
                    <asp:Label ID="lblIDNo"  class="required" runat="server" Text="ID.No.:"></asp:Label><asp:TextBox ID="txtIDNo"  CssClass="textboxes" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblEducatLevel" class="required" runat="server" Text="B9: Education Level:"></asp:Label><asp:DropDownList ID="ddEducatLevel"  CssClass="ddlist" Width="50%" runat="server"></asp:DropDownList></td>
                <td colspan="2"><asp:Label ID="lblReligion" class="required" runat="server" Text="B10: Religion:"></asp:Label><asp:DropDownList ID="ddReligion"  CssClass="ddlist" Width="50%" runat="server"></asp:DropDownList></td>
            <td ><asp:Label ID="lblRelOther"  class="required" runat="server" Text="B10. Other:"></asp:Label><asp:TextBox ID="txtRelOther"  CssClass="textboxesLong" runat="server"></asp:TextBox></td>
            
            </tr>
            <tr>
                <td colspan="3"><asp:Label ID="lblMaritalStatus" class="required" runat="server" Text="B11: Marital Status:"></asp:Label><asp:DropDownList ID="ddMaritalStatus"  CssClass="ddlist" runat="server"></asp:DropDownList></td>
                <td colspan="3"><asp:Label ID="lblCardIssuer"  class="required" runat="server" Text="B13: Person Issuing Card:"></asp:Label><asp:TextBox ID="txtCardIssuer"  CssClass="textboxesLong" runat="server"></asp:TextBox></td>
               
            </tr>

            <tr>
            <td colspan="1"><asp:Label ID="lblRecruitingIntv" class="required" runat="server" Text="Recruiting Intervention:"></asp:Label><asp:DropDownList ID="ddRecruitingIntv"  CssClass="ddlist" runat="server"></asp:DropDownList></td>
            </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
