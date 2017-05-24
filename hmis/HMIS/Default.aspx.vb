Public Class _Default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        loadFacilities()
    End Sub
 Sub loadFacilities()
        Dim sql As String = "Select * from Dreams_Wards order by WardName asc"
        Dim dt As DataTable = OpenTable.Query(sql)
        ddFaciltiy.DataSource = dt
        ddFaciltiy.Items.Add("--- Select Ward ---")
        ddFaciltiy.DataValueField = "WardId"
        ddFaciltiy.DataTextField = "WardName"
        ddFaciltiy.DataBind()
    End Sub
Protected Sub cmdLogin_Click(sender As Object, e As EventArgs)
        If Not Page.IsPostBack Then

        End If

        Try
'ResolveUrl("~/Admin/Home.aspx")
         '   Response.Redirect("~/Admin/Home.aspx")
            Server.Transfer("~/Admin/Home.aspx")
        Catch ex As Exception
            ex.Message.ToString()
        End Try


    End Sub

End Class