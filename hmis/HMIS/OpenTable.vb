Imports System.Data.SqlClient

Public Class OpenTable
    Public Shared ConnectionString As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
    Public Shared Function Query(sqlstr As String) As DataTable

        Dim cn As New SqlConnection(ConnectionString)
        Dim adp As New SqlDataAdapter(sqlstr, cn)
        Dim ds As New DataSet()
        adp.Fill(ds)
        Dim dt As DataTable = ds.Tables(0)
        Return (dt)

    End Function
    Public Shared Function NonQuery(sqlstr As String) As Integer
        Dim cn As New SqlConnection(ConnectionString)
        cn.Open()
        Dim cmd As New SqlCommand(sqlstr, cn)
        Dim n As Integer = cmd.ExecuteNonQuery()
        cn.Close()
        Return (n)
    End Function

    Public Shared Function GetNextID(tablename As String, columnname As String) As Integer
        Dim cn As New SqlConnection(ConnectionString)
        Dim n As Integer = 0
        If Query(Convert.ToString("select * from ") & tablename).Rows.Count > 0 Then
            Dim sqlstr As String = Convert.ToString((Convert.ToString("select max(") & columnname) + ") from ") & tablename
            Dim adp As New SqlDataAdapter(sqlstr, cn)
            Dim ds As New DataSet()
            adp.Fill(ds)
            Dim dt As DataTable = ds.Tables(0)
            If dt.Rows.Count > 0 Then
                n = Convert.ToInt32(dt.Rows(0).ItemArray(0))
            End If
        End If
        n += 1
        Return (n)
    End Function

    Public Sub New()
    End Sub

End Class
