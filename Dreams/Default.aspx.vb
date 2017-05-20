Imports System.Web.Routing

Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' Fires when the application is started
        '   RegisterRoute(RouteTable.Routes)
        Dim s As String = "select * from users"
        ' Dim dtx As DataTable =
        ' OpenTable.Query(s)
        ' Dim x As Integer = dt.Rows.Count
    End Sub

    Private Shared Sub RegisterRoute(routes As RouteCollection)
        routes.MapPageRoute("index", "Default", "~/Default.aspx")
    End Sub
End Class