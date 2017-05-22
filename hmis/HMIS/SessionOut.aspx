<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HMIS.Master" CodeBehind="SessionOut.aspx.vb" Inherits="HMIS.SessionOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
  

			<div>
    <br/>
			<br/>
			<br/>
			<br/>
			<table " style=" cellpadding="0" cellspacing="2" width="600";BORDER-RIGHT: #e1e4eb thin double; BORDER-TOP: #e1e4eb thin double; BORDER-LEFT: #e1e4eb thin double; BORDER-BOTTOM: #e1e4eb thin double;HEIGHT:250px" border="1" rules="none" align="center" frame="border">
				<tr valign="middle">
					<td style="height:20px">
						<table cellpadding="0" cellspacing="0" width="100%" border="1" rules="none" frame="below">
							<tr>
								<td align="center">
									<p><font color="#003366" size="4">Your Session Has Been Expired.</font></p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="height:20px"></td>
				</tr>
				<tr valign="top">
					<td>
						<p><font size="2">There would be two reason, Why your session expired ?</font></p>
						<p><font size="2">1. You are accessing site for more than 12 hours.</font></p>
						<p><font size="2">2. Your session has been idle for more than 20 minutes.</font></p>
					</td>
				</tr>
				<tr>
					<td  class="Header3" style="height:20px; background-color:#e1e4eb; " align="center" >
                        <asp:HyperLink ID="hlGoToLogin" runat="server" NavigateUrl="~/Admin/default.aspx" Target="_parent">----Click Here To Relogin ----</asp:HyperLink></td>
				</tr>
			</table>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
