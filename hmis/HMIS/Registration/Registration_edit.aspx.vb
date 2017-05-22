Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data.SqlTypes
Imports System.Globalization

Public Class Registration_edit
    Inherits System.Web.UI.Page

    Private connectionString As String = _
  WebConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cmpDate.ValueToCompare = DateTime.Now.ToString("d")
        CompaDOB.ValueToCompare = DateTime.Now.ToString("d")
        'DateTime.ParseExact(txtRegDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture)
        'DateTime.ParseExact(txtDOB.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture)

        'If Not Page.PreviousPage Is Nothing Then
        '    Dim placeholder As Control =
        '        PreviousPage.Controls(0).FindControl("main")
        '    Dim clientuniqcodetxt As TextBox =
        '     CType(placeholder.FindControl("clientuniqcodetxt"), TextBox)
        '    If Not clientuniqcodetxt Is Nothing Then
        '        txtClientUniqCode.Text = clientuniqcodetxt.Text
        '    End If
        'End If
        If Not Page.PreviousPage Is Nothing Then
            Dim placeholder As Control =
                PreviousPage.Controls(0).FindControl("main")
            Dim ClientUniqCode As Label =
            CType(placeholder.FindControl("lblClientUniqCode"), Label)
            If Not ClientUniqCode Is Nothing Then
                lblClientUniqCode.Text = ClientUniqCode.Text
                txtClientUniqCode.Text = lblClientUniqCode.Text
            End If
        End If

        If Not Page.PreviousPage Is Nothing Then
            Dim placeholder As Control =
                PreviousPage.Controls(0).FindControl("main")
            Dim TransId As Label =
            CType(placeholder.FindControl("lblTransId"), Label)
            If Not TransId Is Nothing Then
                lblTransId.Text = TransId.Text
                txtClientUniqCode.Text = lblClientUniqCode.Text
            End If
        End If

        If Not Page.PreviousPage Is Nothing Then
            Dim placeholder As Control =
                PreviousPage.Controls(0).FindControl("main")
            Dim ClientName As Label =
            CType(placeholder.FindControl("lblFullClientName"), Label)
            If Not ClientName Is Nothing Then
                lblFullClientName.Text = ClientName.Text

            End If
        End If

        If Not Page.IsPostBack Then

            'txtAge.Attributes.Add("readonly", "readonly")



            ddFacilityDistrict.DataSource = IRDODistricts()
            ddFacilityDistrict.DataTextField = "DistName"
            ddFacilityDistrict.DataValueField = "DisCode"
            ddFacilityDistrict.DataBind()
            ddFacilityDistrict.Items.Add(New ListItem("--select a district--", -1))
            ddFacilityDistrict.AppendDataBoundItems = True
            ddFacilityDistrict.SelectedIndex = 0


            lblIRDOINT.Text = ddFacilityDistrict.SelectedValue.ToString


            GetDistCode()

            ddEducatLevel.DataSource = EducationLevel()
            ddEducatLevel.DataTextField = "Level"
            ddEducatLevel.DataValueField = "ID"
            ddEducatLevel.DataBind()

            ddRecruitingIntv.Items.Add(New ListItem("--Intervention--", -1))
            ddRecruitingIntv.AppendDataBoundItems = True
            ddRecruitingIntv.SelectedIndex = -1
            ddRecruitingIntv.DataSource = IRDOInterventions()
            ddRecruitingIntv.DataTextField = "InterventionName"
            ddRecruitingIntv.DataValueField = "ID"
            ddRecruitingIntv.DataBind()


            ddPersonDistrict.Items.Add(New ListItem("--select a district--", -1))
            ddPersonDistrict.AppendDataBoundItems = True
            ddPersonDistrict.SelectedIndex = -1
            'ddPersonDistrict.Items(-1).Attributes("disabled") = "disabled"
            ddPersonDistrict.DataSource = PersonDistrict()
            ddPersonDistrict.DataTextField = "District"
            'ddFacilityDistrict.DataValueField = "DisCode"
            ddPersonDistrict.DataBind()



            Dim ContactDistrictSelected As String = ddPersonDistrict.SelectedItem.Text

            'ddDistrict.datasource = ContactDistrict(ContactDistrictSelected)
            'ddDistrict.datatextfield = "district".ToString.ToUpper()
            ''dddistrict.datavaluefield = "distid"
            'ddDistrict.DataBind()



            ddLocation.DataSource = ContactLocation(ContactDistrictSelected)
            ddLocation.DataTextField = "Location"
            'ddDistrict.DataValueField = "ID"
            ddLocation.DataBind()
            'ddLocation.Items.Add(New ListItem("--select a Location--", -1))
            'ddLocation.AppendDataBoundItems = True
            'ddLocation.SelectedIndex = 0

            ' Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text

            'ddDivision.DataSource = ContactDivision(ContactLocationSelected)
            'ddDivision.DataTextField = "Division".ToString.ToUpper()
            ''ddDistrict.DataValueField = "ID"
            'ddLocation.DataBind()

            'Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text

            ddNearestHF.DataSource = Facilities(ContactDistrictSelected)
            ddNearestHF.DataTextField = "Facility Name".ToString.ToUpper()
            ddNearestHF.DataValueField = "Facility Code"
            ddNearestHF.DataBind()
            ddNearestHF.Items.Add(New ListItem("--select a Facility--", -1))
            'ddNearestHF.AppendDataBoundItems = True
            ddNearestHF.SelectedIndex = 0

            Dim Sex As New ArrayList()
            Sex.Add("MALE")
            Sex.Add("FEMALE")
            Sex.Add("TRANSGENDER")
            'Add blank item at index 0.
            ddgender.Items.Insert(0, New ListItem("", ""))
            'Loop and add items from ArrayList.
            For Each Gender As Object In Sex
                ddgender.Items.Add(New ListItem(Gender.ToString(), Gender.ToString()))
            Next

            'Dim Marital As New ArrayList()
            'Marital.Add("Married")
            'Marital.Add("Single")
            'Marital.Add("Seperated/Divorced")
            'Marital.Add("Widowed")
            ''Add blank item at index 0.
            'ddMaritalStatus.Items.Insert(0, New ListItem("", ""))
            ''Loop and add items from ArrayList.
            'For Each MaritalStat As Object In Marital
            '    ddMaritalStatus.Items.Add(New ListItem(MaritalStat.ToString(), MaritalStat.ToString()))
            'Next


            ddMaritalStatus.DataSource = MaritalStatus()
            ddMaritalStatus.DataValueField = "MaritId"
            ddMaritalStatus.DataTextField = "MaritalStatusName".ToString.ToUpper()
            ddMaritalStatus.DataBind()



            ddReligion.DataSource = Religion()
            ddReligion.DataValueField = "RelId"
            ddReligion.DataTextField = "ReligionName".ToString.ToUpper()
            ddReligion.DataBind()
            '---------------------------------------------------------------------------------
            'Dim ContactDistrictSelected As String = ddPersonDistrict.SelectedItem.Text
            'ContactLocation(ContactDistrictSelected)
            'PopulateFields()
            ddLocation.DataSource = ContactLocation1()
            ddLocation.DataTextField = "Location".ToString.ToUpper()
            'ddDistrict.DataValueField = "ID"
            ddLocation.DataBind()
            'ddLocation.Items.Add(New ListItem("--select a Location--", -1))
            'ddLocation.AppendDataBoundItems = True
            'ddLocation.SelectedIndex = 0

            'ddDistrict.DataSource = ContactDistrict(ContactDistrictSelected)
            'ddDistrict.DataTextField = "District".ToString.ToUpper()
            ''ddDistrict.DataValueField = "ID"
            'ddDistrict.DataBind()

            Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text

            ddDivision.DataSource = ContactDivision1()
            ddDivision.DataTextField = "Division".ToString.ToUpper()
            ddDivision.DataBind()

            ddNearestHF.DataSource = Facilities1()
            ddNearestHF.DataTextField = "Facility Name".ToString.ToUpper()
            ddNearestHF.DataValueField = "Facility Code"
            ddNearestHF.DataBind()
            'ddNearestHF.Items.Add(New ListItem("--select a Facility--", -1))
            'ddNearestHF.AppendDataBoundItems = True
            'ddNearestHF.SelectedIndex = 0

        End If
        ' PopulateFields()
        getData()
    End Sub

    Public ReadOnly Property ClientUniqCode() As String
        Get
            Return lblClientUniqCode.Text
        End Get
    End Property

    Public ReadOnly Property ClientUniqCodetxt() As String
        Get
            Return txtClientUniqCode.Text
        End Get
    End Property

    Public ReadOnly Property ClientName() As String
        Get
            Return lblFullClientName.Text
        End Get
    End Property

    Public ReadOnly Property txtClientName() As String
        Get
            Return txtFullClientName.Text
        End Get
    End Property

    Private Function IRDOInterventions() As DataTable
        Dim sql As String = "SELECT * FROM IRDOInterventions "
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function



    Private Function IRDODistricts() As DataTable
        Dim sql As String = "SELECT * FROM IRDODistricts "
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function MaritalStatus() As DataTable
        Dim sql As String = "SELECT * FROM MaritalStatus "
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function Religion() As DataTable
        Dim sql As String = "SELECT * FROM Religion "
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function PersonDistrict() As DataTable
        Dim sql As String = "SELECT DISTINCT County, District FROM CountryBoundary ORDER BY District"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function EducationLevel() As DataTable
        Dim sql As String = "SELECT DISTINCT ID, Level FROM EducationLevel ORDER BY ID ASC"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function ContactDistrict(ByVal ContactDistrictSelected As String) As DataTable
        Dim sql As String = "SELECT DISTINCT District FROM CountryBoundary where District ='" & ContactDistrictSelected & "'" & " ORDER BY District"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function ContactDistrict1() As DataTable
        Dim sql As String = "SELECT DISTINCT District FROM CountryBoundary"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function ContactLocation(ByVal ContactDistrictSelected As String) As DataTable
        Dim sql As String = "SELECT DISTINCT Location FROM CountryBoundary where District ='" & ContactDistrictSelected & "'" & " ORDER BY Location"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function ContactLocation1() As DataTable
        Dim sql As String = "SELECT DISTINCT Location FROM CountryBoundary"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Sub PopulateFields()
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)
            Dim keyval As String = lblClientUniqCode.Text
            'using cmd as new sqlcommand("select * from benchmarkstrans")
            'Using cmd As New sqlcommand("select * from benchmarkstrans where uniqueident  = '" + lbluniquebatch.text + "'")
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "Registration_CRUD_Sp"
            cmd.Parameters.Add("@ClientUniqCode", SqlDbType.NVarChar).Value = lblClientUniqCode.Text.Trim()
            cmd.Parameters.AddWithValue("@Action", "SELECT")
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    If dt.Rows.Count > 0 Then

                        txtClientNo.Value = dt.Rows(0)("ClientNumber").ToString()
                        txtIRDOReference.Value = dt.Rows(0)("ClientUniqCode").ToString()
                        txtRegDate.Text = dt.Rows(0)("RegDate").ToString()
                        ddFacilityDistrict.Text = dt.Rows(0)("DistrictRegId").ToString()
                        txtSurname.Value = dt.Rows(0)("Surname").ToString()
                        txtOthernames.Value = dt.Rows(0)("Othernames").ToString()
                        txtDOB.Value = dt.Rows(0)("DOB").ToString()
                        txtAge.Value = dt.Rows(0)("Age").ToString()
                        ddgender.Text = dt.Rows(0)("gender").ToString()
                        ddDistrict.Value = dt.Rows(0)("DistrictRes").ToString()
                        ddDivision.Text = dt.Rows(0)("DivisionRes")
                        ddLocation.Text = dt.Rows(0)("LocationRes")
                        txtPhoneNo.Value = dt.Rows(0)("PhoneNo")
                        txtIDNo.Value = dt.Rows(0)("IDNo").ToString()
                        ddEducatLevel.Text = dt.Rows(0)("EducLevel")
                        ddReligion.Text = dt.Rows(0)("Religion")
                        txtRelOther.Value = dt.Rows(0)("RelOther")
                        ddMaritalStatus.Text = dt.Rows(0)("MaritalStatus")
                        ddRecruitingIntv.Text = dt.Rows(0)("RecrutingIntervention")
                        txtCardIssuer.Value = dt.Rows(0)("CardIssuer")

                    End If
                    con.Close()
                End Using
            End Using
        End Using
        'End Using
    End Sub

    Private Function ContactDivision(ByVal ContactLocationSelected As String) As DataTable
        Dim sql As String = "SELECT DISTINCT Division FROM CountryBoundary where Location ='" & ContactLocationSelected & "'" & " ORDER BY Division ASC"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function ContactDivision1() As DataTable
        Dim sql As String = "SELECT DISTINCT Division FROM CountryBoundary "
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Private Function Facilities(ByVal ContactDistrictSelected As String) As DataTable
        Dim sql As String = "SELECT [Facility Code], [Facility Name], District, Province FROM Facilities where District ='" & ContactDistrictSelected & "'" & " ORDER BY [Facility Code]"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function


    Private Function Facilities1() As DataTable
        Dim sql As String = "SELECT [Facility Code], [Facility Name], District, Province FROM Facilities"
        Dim conn As New SqlConnection(connectionString)
        conn.Open()
        Dim cmd As New SqlCommand(sql, conn)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        conn.Close()
        Return dt
    End Function

    Protected Sub ddPersonDistrict_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddPersonDistrict.SelectedIndexChanged
        Dim ContactDistrictSelected As String = ddPersonDistrict.SelectedItem.Text
        'ContactLocation(ContactDistrictSelected)
        'PopulateFields()
        ddLocation.DataSource = ContactLocation(ContactDistrictSelected)
        ddLocation.DataTextField = "Location".ToString.ToUpper()
        'ddDistrict.DataValueField = "ID"
        ddLocation.DataBind()
        'ddLocation.Items.Add(New ListItem("--select a Location--", -1))
        'ddLocation.AppendDataBoundItems = True
        'ddLocation.SelectedIndex = 0

        'ddDistrict.DataSource = ContactDistrict(ContactDistrictSelected)
        'ddDistrict.DataTextField = "District".ToString.ToUpper()
        ''ddDistrict.DataValueField = "ID"
        'ddDistrict.DataBind()

        Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text

        ddDivision.DataSource = ContactDivision(ContactLocationSelected)
        ddDivision.DataTextField = "Division".ToString.ToUpper()
        ddDivision.DataBind()

        ddNearestHF.DataSource = Facilities(ContactDistrictSelected)
        ddNearestHF.DataTextField = "Facility Name".ToString.ToUpper()
        ddNearestHF.DataValueField = "Facility Code"
        ddNearestHF.DataBind()
        'ddNearestHF.Items.Add(New ListItem("--select a Facility--", -1))
        'ddNearestHF.AppendDataBoundItems = True
        'ddNearestHF.SelectedIndex = 0
    End Sub

    Protected Sub ddLocation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddLocation.SelectedIndexChanged
        Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text

        ddDivision.DataSource = ContactDivision(ContactLocationSelected)
        ddDivision.DataTextField = "Division".ToString.ToUpper()
        ddDivision.DataBind()

    End Sub

    'Private Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
    '    If Calendar1.Visible = True Then
    '        Calendar1.Visible = False
    '    Else
    '        Calendar1.Visible = True
    '    End If
    'End Sub

    'Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
    '    txtRegDate.Text = Calendar1.SelectedDate.ToShortDateString()
    '    Calendar1.Visible = False
    'End Sub

    Protected Sub ddFacilityDistrict_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddFacilityDistrict.SelectedIndexChanged

        GetDistCode()
        lblIRDOINT.Text = ddFacilityDistrict.SelectedValue.ToString
    End Sub

    Sub GetDistCode()
        ' Create a Select statement that searches for a record
        ' matching the specific author ID from the Value property.
        Dim IRDODist As String = ddFacilityDistrict.SelectedItem.Text
        Dim selectSQL As String
        selectSQL = "SELECT * FROM IRDODistricts  "
        selectSQL &= "WHERE DistName = " & ddFacilityDistrict.SelectedItem.Text
        ' Define the ADO.NET objects.
        Dim con As New SqlConnection(connectionString)
        Dim cmd As New SqlCommand(selectSQL, con)
        Dim reader As SqlDataReader
        ' Try to open database and read information.
        Try
            con.Open()
            reader = cmd.ExecuteReader()
            reader.Read()
            ' Fill the controls.
            lblDistricCode.Text = reader("DisCode").ToString()
            'txtCardIssuer.Text = reader("DisCode").ToString()

            reader.Close()
            'lblResults.Text = ""
        Catch err As Exception
            'lblResults.Text = "Error getting author. "
            'lblResults.Text &= err.Message
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click


        Dim ClientNumber As Integer = Integer.Parse(txtClientNo.Value)
        'Dim ClientUniqCode As String = txtIRDOReference.Value.ToUpper()
        Dim RegDate As DateTime = Convert.ToDateTime(txtRegDate.Text.Trim())
        Dim DistrictRegId As String = ddFacilityDistrict.Text
        Dim ClientSurName As String = txtSurname.Value.ToString.ToUpper()
        Dim ClientOtherName As String = txtOthernames.Value.ToString.ToUpper()
        Dim FullClientName As String = String.Concat(txtSurname.Value.ToString, " ", txtOthernames.Value.ToString).ToUpper()
        Dim DOB As DateTime = Convert.ToDateTime(txtDOB.Value.Trim())
        Dim Ageyrs As Integer = Integer.Parse(txtAge.Value)
        Dim Gender As String = ddgender.Text.ToUpper()
        Dim DistrictRes As String = ddDistrict.Value.ToUpper()
        Dim NearestHF As String = ddNearestHF.SelectedValue.ToString.ToUpper()
        Dim DivisionRes As String = ddDivision.SelectedValue.ToString.ToUpper()
        Dim LocationRes As String = ddLocation.SelectedValue.ToString.ToUpper()
        Dim PhoneNo As String = txtPhoneNo.Value.ToUpper()
        Dim NationalId As String = txtIDNo.Value.ToUpper()
        Dim EducLevel As Integer = Integer.Parse(ddEducatLevel.SelectedValue.ToString)
        Dim Religion As String = ddReligion.SelectedValue.ToString.ToUpper()
        Dim RelOther As String = txtRelOther.Value.ToUpper()
        Dim MaritalStatus As String = ddMaritalStatus.SelectedValue.ToString.ToUpper()
        Dim RecrutingIntervention As Integer = Integer.Parse(ddRecruitingIntv.SelectedValue.ToString)
        Dim RecrutingInterventionName As String = ddRecruitingIntv.SelectedItem.ToString
        Dim CardIssuer As String = txtCardIssuer.Value.ToUpper()
        Dim DOE As DateTime = Convert.ToDateTime(DateTime.Now)
        Dim DateUpdated As DateTime = Convert.ToDateTime(DateTime.Now)

        Dim Year_in_Digits = RegDate.ToString("yy")

        Dim UniversalNumber As String = String.Concat(ddFacilityDistrict.Text, "/", ClientNumber.ToString, "/", Year_in_Digits)
        Dim ClientUniqCode As String = UniversalNumber

        Dim strConnString As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure

        cmd.CommandText = "Registration_Insert_sp"


        cmd.Parameters.AddWithValue("@ClientNumber  ", ClientNumber)
        cmd.Parameters.AddWithValue("@ClientUniqCode  ", ClientUniqCode)
        cmd.Parameters.AddWithValue("@RegDate  ", RegDate)
        cmd.Parameters.AddWithValue("@DistrictRegId  ", DistrictRegId)
        cmd.Parameters.AddWithValue("@ClientSurName  ", ClientSurName)
        cmd.Parameters.AddWithValue("@ClientOtherName  ", ClientOtherName)
        cmd.Parameters.AddWithValue("@FullClientName  ", FullClientName)
        cmd.Parameters.AddWithValue("@DOB  ", DOB)
        cmd.Parameters.AddWithValue("@Ageyrs  ", Ageyrs)
        cmd.Parameters.AddWithValue("@Gender  ", Gender)
        cmd.Parameters.AddWithValue("@DistrictRes  ", DistrictRes)
        cmd.Parameters.AddWithValue("@DivisionRes  ", DivisionRes)
        cmd.Parameters.AddWithValue("@LocationRes  ", LocationRes)
        cmd.Parameters.AddWithValue("@NearestHF  ", NearestHF)
        cmd.Parameters.AddWithValue("@PhoneNo  ", PhoneNo)
        cmd.Parameters.AddWithValue("@NationalId  ", NationalId)
        cmd.Parameters.AddWithValue("@EducLevel  ", EducLevel)
        cmd.Parameters.AddWithValue("@Religion  ", Religion)
        cmd.Parameters.AddWithValue("@RelOther  ", RelOther)
        cmd.Parameters.AddWithValue("@MaritalStatus  ", MaritalStatus)
        cmd.Parameters.AddWithValue("@RecrutingIntervention  ", RecrutingIntervention)
        cmd.Parameters.AddWithValue("@RecrutingInterventionName  ", RecrutingInterventionName)
        cmd.Parameters.AddWithValue("@CardIssuer  ", CardIssuer)
        cmd.Parameters.AddWithValue("@DOE  ", DateTime.Now)
        cmd.Parameters.AddWithValue("@DateUpdated  ", DateTime.Now)
        cmd.Parameters.AddWithValue("@UserId  ", 1)

        cmd.Connection = con

        Try
            con.Open()
            Dim affectedRows As Integer = cmd.ExecuteNonQuery()
            'lblResults.Text = "Record inserted successfully"
            ''        'Response.Redirect(Request.Url.AbsoluteUri)
            'Response.Redirect("select.aspx", True)


            If affectedRows > 0 Then
                'lblResults.Text = "Record inserted successfully"
                ScriptManager.RegisterClientScriptBlock(Page, Page.[GetType](), Guid.NewGuid().ToString(), "alert('Record saved successfully');", True)
                'Response.Redirect("select.aspx", True)
                'Response.Redirect(Request.Url.AbsoluteUri)
            Else
                ScriptManager.RegisterClientScriptBlock(Page, Page.[GetType](), Guid.NewGuid().ToString(), "alert('Record already exists');", True)

            End If
        Catch ex As Exception
            'lblResults.Text = "Error inserting record. "
            Throw ex
            ' lblResults.Text &= ex.Message
        Finally
            con.Close()
            con.Dispose()
        End Try

        'con.Open()
        'cmd.ExecuteNonQuery()
        'con.Close()

    End Sub

    Sub getData()
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

        Dim ids As String = Convert.ToString(Me.lblClientUniqCode.Text)

        Dim selectSQL As String
        selectSQL = "select * from Registration "
        selectSQL &= "WHERE ClientUniqCode = '" & txtClientUniqCode.Text & "'"

        Dim dt As New DataTable()
        Dim connection As New SqlConnection(constr)
        connection.Open()
        Dim sqlCmd As New SqlCommand(selectSQL, connection)
        Dim sqlDa As New SqlDataAdapter(sqlCmd)
        sqlDa.Fill(dt)
        If dt.Rows.Count > 0 Then


            txtClientNo.Value = dt.Rows(0)("ClientNumber").ToString()
            txtIRDOReference.Value = dt.Rows(0)("ClientUniqCode").ToString()
            txtRegDate.Text = Convert.ToDateTime(dt.Rows(0)("RegDate")).ToString("dd/MM/yyyy")
            ddFacilityDistrict.Text = dt.Rows(0)("DistrictRegId").ToString()
            ddPersonDistrict.Text = dt.Rows(0)("DistrictRes").ToString()
            txtSurname.Value = dt.Rows(0)("ClientSurName").ToString()
            txtOthernames.Value = dt.Rows(0)("ClientOtherName").ToString()
            txtDOB.Value = Convert.ToDateTime(dt.Rows(0)("DOB")).ToString("dd/MM/yyyy")
            txtAge.Value = dt.Rows(0)("Ageyrs").ToString()
            ddgender.Text = dt.Rows(0)("gender").ToString()
            ddDistrict.Value = dt.Rows(0)("DistrictRes").ToString()
            ddDivision.Text = dt.Rows(0)("DivisionRes")
            ddLocation.Text = dt.Rows(0)("LocationRes")
            ddNearestHF.Text = dt.Rows(0)("NearestHF")
            txtPhoneNo.Value = dt.Rows(0)("PhoneNo")
            txtIDNo.Value = dt.Rows(0)("NationalId").ToString()
            ddEducatLevel.Text = dt.Rows(0)("EducLevel")
            ddReligion.Text = dt.Rows(0)("Religion").ToString()
            txtRelOther.Value = dt.Rows(0)("RelOther")
            ddMaritalStatus.Text = dt.Rows(0)("MaritalStatus").ToString()
            ddRecruitingIntv.Text = dt.Rows(0)("RecrutingIntervention")
            'ddRecruitingIntv.Text = dt.Rows(0)("RecrutingInterventionName")
            txtCardIssuer.Value = dt.Rows(0)("CardIssuer")

        End If
        connection.Close()
        'Catch ex As Exception
        'lblResults.Text = "Error getting record. "
        ' lblResults.Text &= ex.Message
        '  End Try
    End Sub

    

    Protected Sub cmdAddIntv_Click(sender As Object, e As EventArgs) Handles cmdAddIntv.Click
        Server.Transfer("~/Registration/Interventions.aspx")
    End Sub
End Class