Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Text.RegularExpressions
Imports System.Drawing

Public Class search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        gvCustomers.Columns(0).Visible = True
        If Not IsPostBack Then
            Me.BindGrid()



        End If
    End Sub


    Public ReadOnly Property TransId() As String
        Get
            Return lblTransId.Text
        End Get
    End Property

    Public ReadOnly Property ClientUniqCode() As String
        Get
            Return lblClientUniqCode.Text
        End Get
    End Property

    Public ReadOnly Property ClientName() As String
        Get
            Return lblFullClientName.Text
        End Get
    End Property


    Public ReadOnly Property ClientUniqCodetxt() As String
        Get
            Return txtClientUniqCode.Text
        End Get
    End Property


    Protected Sub Search(sender As Object, e As EventArgs)
        Me.BindGrid()
    End Sub

    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT TransId,ClientUniqCode, FullClientName, PhoneNo, Ageyrs, NationalId,RecrutingIntervention, RecrutingInterventionName FROM Registration WHERE ClientUniqCode LIKE '%' + @searchText + '%' or FullClientName LIKE '%' + @searchText + '%'  or PhoneNo LIKE '%' + @searchText + '%'"
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@searchText", txtSearch.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    gvCustomers.DataSource = dt
                    gvCustomers.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvCustomers.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub

    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = Regex.Replace(e.Row.Cells(0).Text, txtSearch.Text.Trim(), _
                Function(match As Match) String.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value), _
                            RegexOptions.IgnoreCase)
            e.Row.Attributes("onclick") = Page.ClientScript.GetPostBackClientHyperlink(gvCustomers, "Select$" & e.Row.RowIndex)
            e.Row.ToolTip = "Click to select this row."
        End If
    End Sub

    Protected Sub gvCustomers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvCustomers.SelectedIndexChanged
        For Each row As GridViewRow In gvCustomers.Rows

            If row.RowIndex = gvCustomers.SelectedIndex Then
                lblClientUniqCode.Text = row.Cells(1).Text
                txtClientUniqCode.Text = row.Cells(1).Text
                lblFullClientName.Text = row.Cells(2).Text

                Server.Transfer("~/Registration/Registration_edit.aspx")
                row.BackColor = ColorTranslator.FromHtml("#A1DCF2")
                row.ToolTip = String.Empty
            Else
                row.BackColor = ColorTranslator.FromHtml("#FFFFFF")
                row.ToolTip = "Click to select this row."

            End If

        Next
    End Sub

End Class