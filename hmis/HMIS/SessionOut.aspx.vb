Public Class SessionOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim navDiv As HtmlContainerControl = DirectCast(Me.Master.FindControl("DivMenu2"), HtmlContainerControl)
        navDiv.Visible = False

        Dim facDiv As HtmlContainerControl = DirectCast(Me.Master.FindControl("facility"), HtmlContainerControl)
        facDiv.Visible = False

        Dim mymenu As Menu = Master.FindControl("Menu2")
        mymenu.Visible = False

    End Sub

End Class