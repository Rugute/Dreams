<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Home.aspx.vb" Inherits="HMIS.Home" %>

<%--<!DOCTYPE html>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="mainHolder" runat="server">

    <html>
<style>
		.section {
			border: 1px solid $headerColor;
			padding: 2px;
			text-align: left;
			margin-bottom: 1em;
		}
		.sectionHeader {
			background-color: $headerColor;
			color: $fontOnHeaderColor;
			display: block;
			padding: 2px;
			font-weight: bold;
		}
		table.vl {
			border-collapse: collapse;
			//background-color: #F3F9FF;
			}
		table.vl > tbody > tr > td, table.vl > tbody > tr > th {
			border: 1px solid black;
			vertical-align: baseline;
			padding: 4px;
			text-align: left;
		}
		tr.backgrd {
			border: 1px solid black;
			background-color: cyan;
			width: 7%;
		}
		tr.notes {
			border: 1px solid black;
			background-color: yellow;
			width: 7%;
		}
		td.header {
			border: 1px solid black;
			background-color: grey;
			width: 7%;
		}
		td.data {
			border: 1px solid black;
			text-align: left;
		}
		#rotate_text
		{
		 	id: rot_text;
			width:130px;
		  	height:100px;
		  	-ms-transform:rotate(270deg); /* IE 9 */
		  	-moz-transform:rotate(270deg); /* Firefox */
		  	-webkit-transform:rotate(270deg); /* Safari and Chrome */
			-o-transform:rotate(270deg); /* Opera */
		}
.tooltip{
	margin:8px;
	padding:8px;
	border:1px solid blue;
	background-color:yellow;
	position: absolute;
	z-index: 2;
}
	</style>
	<center><table><tr class="notes"><td><h2>Viral Load Lab Requisition Form (v3.0)</h2></td></tr></table></center>
	<section>
		<table class="vls" width="100%" border ="0">
			<tr  class="backgrd">
                                <td>Facility Name: <encounterLocation id="encounterLocation"/></td>
                                <td>Date Sample Dispatched: <encounterDate id="encounter_date" default="today"/></td>
                                <td>Time Sample Dispatched: ______________________________</td>
				
			</tr>
			<tr  class="backgrd">
			       <td>Facility MFL code: <obs conceptId="7459"/></td>
                               <td>VL focal person's name ________________________</td>
                               <td>Requesting clinician Name: <encounterProvider  default="currentUser" type="autocomplete"/></td>
			</tr>
			<tr  class="backgrd">
                              <td>County: <obs conceptId="7444"/></td>
                              <td>VL focal person's phone number________________________</td>
			      <td>Requesting clinician phone number: <obs conceptId="7459"/></td>
				
			</tr>
                        <tr  class="backgrd">
                               <td>Sub-County: ____________________</td>
                               <td>Facility Email Address: ______________&#160;&#160;&#160;&#160;Facility Phone: <obs conceptId="1459"/></td>
                               <td>Clinician Email: ____________________</td>
                        </tr>

		</table>
	</section>
	<section headerLabel="Patient Information">
<table class="vl" width="100%">
			<tr>
                                <td>Patient Name: <lookup class="value" expression="patient.personName"/></td>
				<td>Patient ID: <lookup expression="patient.getPatientIdentifier(3)"/></td>
			        <td>Date of Birth: <lookup class="value" complexExpression="#if( \$patient.birthdateEstimated ) ~#end"/> <lookup class="value"       expression="patient.birthdate"/></td>
	    		        <td>Sex: <lookup class="value" expression="patient.gender"/></td>
                                 <td>If Female select the following: <obs id="female" conceptId="8059 " answerConceptIds="6368,8060,1107" answerLabels="1- Pregnant,2-Breast feeding,3-None of the above" required="true"/></td>
			</tr>
		</table>
       
       
<table class="vl" width="100%">
			<tr class="backgrd">
				<td>Sample Type</td>
                                <td>Date of Collection</td>
                                <td>Date of Separation</td>
				<td>Date Started on ART</td>
                                <td>Current Regimen</td>
				<td>Date Initiated on Current Regimen</td>
				<td>Indicate if 1st Line (1) or 2nd Line (2)</td>
				<td>Justification Code (1)</td>
				<!--<td>Justification Code (2)</td>-->
				<td colspan="2">Rejection <br/> Y/N - Reason</td>
			</tr>
			<tr class="backgrd">
				
                               
				<td><obs id="just2" conceptId="7701" answerConceptIds="7697,7698,7699,7700" answerLabels="1-Frozen Plasma,2-Venous Blood (EDTA),3-DBS Capillary     (Infants),4-DBS Venous" required="true"/></td>
                                <td><obs id="just1" conceptId="7467" required="true"/></td> <!-- Date of collection -->
                               <td><obs id="just3" conceptId="8058" required="true"/></td>    
                               <td><obs id="just3" conceptId="6746"  required="true"/></td>
				
				<td><obs id="just4" conceptId="7760" required="true" /></td>
				<td><obs id="just5" conceptId="6739" required="true"/></td>
				<td><obs id="just6" conceptId="7704"  required="true"/></td>
				<td><obs id="just7" conceptId="7702" required="true"/></td>
				<!--<td><obs id="just8" conceptId="7703" /></td>-->
                                <td><obs id="just8" conceptId="8051" answerConceptIds="1065,1066" answerLabels="Yes,No" /></td> <!-- Rejection -->
                                <td><obs id="just8" conceptId="8052" /></td> <!-- Rejection Reason -->
			</tr>
			<tr class="backgrd">
<br/><td colspan="11">Shipped:<obs conceptId="7468" answerConceptIds="1065,1066" answerLabels="Yes,No" style="radio" defaultValue="1066" required="true"/><br/></td>
			</tr>
</table>
<section headerLabel="Viral Load Results">
		<table class="vl" width="100%">
			<tr class="backgrd">
				<td colspan="4">Viral Load Result:<obs conceptId="7471"/>copies/ml</td><td colspan="4">Log Results:<obs conceptId="7470"/> log</td>
			</tr>
<tr>
    <td style="text-align:center;" colspan="11">
        <div class="ke-form-buttons">
            <submit />
        </div>
    </td>
</tr>
		</table>
	</section>
 </section>
        <section>
</html>
    </section>
    </asp:Content>


