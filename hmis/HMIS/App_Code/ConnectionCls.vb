Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Public Class ConnectionCls
    Public Function getConnectionString() As String
        Dim strCon As String
        strCon = System.Configuration.ConfigurationManager.AppSettings("IRDOHMIS")
        Return strCon
    End Function


    Public Sub FillCombo(ByRef ComboName As Object, ByVal SourceString As String, Optional ByVal AddBlankItem As Boolean = False)
        Dim dbCon As SqlConnection
        dbCon = New SqlConnection(getConnectionString())
        dbCon.Open()
        Dim sqlCmd As New SqlCommand(SourceString, dbCon)
        Dim drCombo As SqlDataReader
        Try
            drCombo = sqlCmd.ExecuteReader()
            ComboName.DataSource = drCombo
            ComboName.DataValueField = drCombo.GetName(0)
            ComboName.DataTextField = drCombo.GetName(1)
            ComboName.DataBind()
            drCombo.Close()
            If AddBlankItem Then
                ComboName.Items.Add(New System.Web.UI.WebControls.ListItem("", ""))
                ComboName.SelectedIndex = ComboName.Items.Count - 1
            End If

            dbCon.Close()
        Catch ex As Exception
            ' drCombo.Close()
        End Try
    End Sub
End Class
