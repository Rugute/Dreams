Imports System.Web.Services
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class HMIS
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Session("UserName") Is Nothing Then
            lblFacility.Text = Session("currentfacility").ToString()
            lblFacilityCode.Text = Session("FacilityCode").ToString()
            lblDistrict.Text = Session("distname").ToString()
        Else
            lblFacility.Text = ""
            'response.redirect("~/admin/default.aspx")
        End If



        If Not Page.IsPostBack Then
            Dim dt As DataTable = Me.GetData(0)
            PopulateMenu(dt, 0, Nothing)



        End If


        If Not Session("UserName") = "" Then
            lblFullName.Text = "Your are logged in as: " + Session("FullName")

        Else
            lblFullName.Visible = False

        End If

        'System.Web.HttpContext.Current.Session("facName") = lblFacility.Text

        'lblFacilityName.Text = System.Web.HttpContext.Current.Session("facName1").ToString()

        'If IsNothing(System.Web.HttpContext.Current.Session("facName2")) Then
        '    lblFacility.Text = HttpContext.Current.Session("FacilityName")
        'Else
        '    lblFacility.Text = System.Web.HttpContext.Current.Session("facName2").ToString()
        'End If




        'Dim lblFullName As Label = CType(Me.Master.FindControl("lblFullName"), Label)
        'If Login1.UserName = "" Then
        '    lblFullName.Visible = False
        'End If
    End Sub

    '<WebMethod> _
    'Public Shared Sub AbandonSession()
    '    HttpContext.Current.Session.Abandon()
    'End Sub

    'Private Sub Page_Unload(sender As Object, e As EventArgs) Handles Me.Unload
    '    AbandonSession()
    'End Sub
    Private Function GetData(parentMenuId As Integer) As DataTable
        Dim query As String = "SELECT [MenuId], [Title], [Description], [Url] FROM [Menus] WHERE ParentMenuId = @ParentMenuId"
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)
            Dim dt As New DataTable()
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Parameters.AddWithValue("@ParentMenuId", parentMenuId)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    sda.Fill(dt)
                End Using
            End Using
            Return dt
        End Using
    End Function

    Private Sub PopulateMenu(dt As DataTable, parentMenuId As Integer, parentMenuItem As MenuItem)
        Dim currentPage As String = Path.GetFileName(Request.Url.AbsolutePath)
        For Each row As DataRow In dt.Rows
            Dim menuItem As New MenuItem() With { _
             .Value = row("MenuId").ToString(), _
             .Text = row("Title").ToString(), _
              .NavigateUrl = row("Url").ToString(), _
             .Selected = row("Url").ToString().EndsWith(currentPage, StringComparison.CurrentCultureIgnoreCase) _
            }
            If parentMenuId = 0 Then
                Menu2.Items.Add(menuItem)
                Dim dtChild As DataTable = Me.GetData(Integer.Parse(menuItem.Value))
                PopulateMenu(dtChild, Integer.Parse(menuItem.Value), menuItem)
            Else
                parentMenuItem.ChildItems.Add(menuItem)
            End If
        Next
    End Sub


End Class