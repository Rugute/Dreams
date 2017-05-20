<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">
    Private Sub Application_Start(sender As Object, e As EventArgs)
        RegisterRoutes(RouteTable.Routes)
    End Sub

    Private Shared Sub RegisterRoutes(routes As RouteCollection)
        routes.MapPageRoute("Index", "Default", "~/Default.aspx")
        routes.MapPageRoute("Administartor", "Admins", "~/Admin/Admin.aspx")
    End Sub
</script>
