Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Imports System.Web.Configuration
Imports HMIS.currentFacility


Public Class _default
    Inherits System.Web.UI.Page

    Private connectionString As String = _
WebConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

 

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Me.IsPostBack Then
        '    If IsNothing(Session("Username")) Then
        '        Response.Redirect("../SessionOut.aspx")
        '    End If
        'End If

        If Not Me.IsPostBack Then

            If Me.Page.User.Identity.IsAuthenticated Then
                FormsAuthentication.SignOut()

                Response.Redirect("~/Admin/Default.aspx")
            End If



            Dim ctrlusername As TextBox = TryCast(Login1.FindControl("Username"), TextBox)
            Dim username = ctrlusername.Text

            Dim lblFullName As Label = CType(Me.Master.FindControl("lblFullName"), Label)


            If Login1.UserName = "" Then
                lblFullName.Visible = False
                'lblFacility.Visible = False
            End If


        End If


        Dim navDiv As HtmlContainerControl = DirectCast(Me.Master.FindControl("DivMenu2"), HtmlContainerControl)
        navDiv.Visible = False

        Dim facDiv As HtmlContainerControl = DirectCast(Me.Master.FindControl("facility"), HtmlContainerControl)
        facDiv.Visible = False

        Dim mymenu As Menu = Master.FindControl("Menu2")
        mymenu.Visible = False


    End Sub

    Public ReadOnly Property FacilityName() As String
        Get
            Return lblFacilityDistrict.Text
        End Get
    End Property

    Protected Sub ValidateUser(sender As Object, e As AuthenticateEventArgs) Handles Login1.Authenticate
        Try
            Dim userId As Integer = 0
            Dim roles As String = String.Empty
            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("Validate_User")
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Username", Login1.UserName)
                    cmd.Parameters.AddWithValue("@Password", Login1.Password)
                    cmd.Connection = con
                    con.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    reader.Read()
                    userId = Convert.ToInt32(reader("UserId"))
                    roles = reader("Roles").ToString()
                    con.Close()
                End Using



                Select Case userId
                    Case -1
                        Login1.FailureText = "Username and/or password is incorrect."
                        Exit Select
                    Case -2
                        Login1.FailureText = "Account has not been activated."
                        Exit Select
                    Case Else
                        Dim ticket As New FormsAuthenticationTicket(1, Login1.UserName, DateTime.Now, DateTime.Now.AddMinutes(2880), Login1.RememberMeSet, roles, _
                         FormsAuthentication.FormsCookiePath)
                        Dim hash As String = FormsAuthentication.Encrypt(ticket)
                        Dim cookie As New HttpCookie(FormsAuthentication.FormsCookieName, hash)

                        If ticket.IsPersistent Then
                            cookie.Expires = ticket.Expiration
                        End If
                        Response.Cookies.Add(cookie)
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(Login1.UserName, Login1.RememberMeSet))


                        Exit Select
                End Select
            End Using
        Catch ex As Exception

        End Try
    End Sub

    Private Function UserSites(ByVal userName As String) As DataTable
        Dim ctrlusername As TextBox = TryCast(Login1.FindControl("Username"), TextBox)

        Dim sql As String = "SELECT     u.UserName, u.FullName, d.FacilityCode, d.FacilityName, d.County, d.IRDODistId, d.Division, d.Type, d.Owner, d.Location, d.SubLocation, d.DescriptionofLocation, " _
        & "d.Constituency, t.DistId, t.DistName, t.DisCode FROM UserSites us INNER JOIN Users u ON us.UserId = u.UserId INNER JOIN IRDOFacilities d ON Us.[Facility Code] = d.FacilityCode INNER JOIN " _
        & "IRDODistricts t ON d.IRDODistId = t.DistId where u.UserName ='" & ctrlusername.Text & "'"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()

        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt


    End Function

    Public ReadOnly Property FacilityDistrict() As String
        Get
            Return lblFacilityDistrict.Text
        End Get
    End Property

    Public ReadOnly Property FacilityCode() As String
        Get
            Return lblFacilityCode.Text
        End Get
    End Property

    Protected Sub UserName_TextChanged(sender As Object, e As EventArgs)
        'Dim strUsername As String
        'strUsername = User.Identity.Name

        'Dim username As String = username.text
        Try


            Dim FacilityList As DropDownList = TryCast(Login1.FindControl("ddFaciltiy"), DropDownList)
            Dim ctrlusername As TextBox = TryCast(Login1.FindControl("Username"), TextBox)
            Dim Password As TextBox = TryCast(Login1.FindControl("Password"), TextBox)
            'Dim FacilityCode As TextBox = TryCast(Login1.FindControl("Password"), TextBox)
            'Dim Password As TextBox = TryCast(Login1.FindControl("Password"), TextBox)
            Dim username = ctrlusername.Text
            'FacilityList.Items.Insert(0, New ListItem("", "0"))
            'FacilityList.AppendDataBoundItems = True
            'FacilityList.SelectedIndex = 0
            FacilityList.DataSource = UserSites(username)
            FacilityList.DataValueField = "FacilityCode"
            FacilityList.DataTextField = "FacilityName"
            FacilityList.DataBind()
            Password.Focus()

            Dim facName As String = FacilityList.SelectedItem.ToString()


            'HttpContext.Current.Session("facName1") = facName
            'HttpContext.Current.Session("FacilityName") = FacilityList.SelectedItem.ToString()
            'DirectCast(Master.FindControl("lblFacility"), Label).Text = Session("facName1")
            'DirectCast(Master.FindControl("txtFacilityName"), TextBox).Text = Session("facName1")
            ' Session("FacilityCode") = FacilityList.SelectedValue
            Session("CurrentFacility") = facName
            Dim lblFacility As New Label
            lblFacility = CType(Master.FindControl("lblFacility"), Label)
            lblFacility.Text = FacilityList.SelectedItem.ToString()
            CurrentFacility()

            'Dim facode As Integer = Convert.ToInt32(FacilityList.SelectedValue)


            'Dim currentFac As New currentFacility()
            'currentFac.CurrentSelectedFacility(facode)
            'txtMasterFacilityCode.Text = currentFac.FacilityCode
        Catch ex As Exception
            lblFacilityError.Text = "Please check connection or login name"
        End Try
    End Sub

    'Public Property FacName() As String
    '    Get
    '        Return TryCast(Login1.FindControl("ddFaciltiy"), DropDownList).SelectedValue.ToString()
    '    End Get
    '    Set(ByVal value As String)
    '        TryCast(Login1.FindControl("ddFaciltiy"), DropDownList).SelectedValue = value
    '    End Set
    'End Property


    Protected Sub ddFaciltiy_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim FacilityList As DropDownList = TryCast(Login1.FindControl("ddFaciltiy"), DropDownList)
        Dim facName As String = FacilityList.SelectedItem.ToString()
        Session("CurrentFacility") = facName
        Dim lblFacility As New Label
        lblFacility = CType(Master.FindControl("lblFacility"), Label)
        lblFacility.Text = FacilityList.SelectedItem.ToString()

        'Dim facode As Integer = Convert.ToInt32(FacilityList.SelectedValue)
        'Dim txtMasterFacilityCode As TextBox = DirectCast(Master.FindControl("txtFacilityCode"), TextBox)
        'Dim currentFac As New currentFacility()
        'currentFac.CurrentSelectedFacility(facode)
        'txtMasterFacilityCode.Text = currentFac.FacilityCode



    End Sub



    Sub CurrentFacility()
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)

            Dim FacilityList As DropDownList = TryCast(Login1.FindControl("ddFaciltiy"), DropDownList)
            Dim facode As Integer = FacilityList.SelectedValue.ToString()

            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "SelectCurrentFacility_Sp"
            cmd.Parameters.Add("@FacilityCode", SqlDbType.Int).Value = facode

            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    If dt.Rows.Count > 0 Then

                        Session("UserId") = dt.Rows(0)("UserId").ToString()
                        Session("UserName") = dt.Rows(0)("UserName").ToString()
                        Session("FullName") = dt.Rows(0)("FullName").ToString()
                        Session("DistName") = dt.Rows(0)("DistName").ToString()
                        Session("DisCode") = dt.Rows(0)("DisCode").ToString()
                        Session("DistId") = dt.Rows(0)("DistId").ToString()
                        Session("County") = dt.Rows(0)("County").ToString()
                        Session("Location") = dt.Rows(0)("Location").ToString()
                        Session("SubLocation") = dt.Rows(0)("SubLocation").ToString()
                        Session("Division") = dt.Rows(0)("Division").ToString()
                        Session("Location") = dt.Rows(0)("Location").ToString()
                        Session("FacilityCode") = dt.Rows(0)("FacilityCode").ToString()
                    End If
                    con.Close()
                End Using
            End Using
        End Using
    End Sub




End Class