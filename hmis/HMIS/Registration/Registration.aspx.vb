Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data.SqlTypes
Imports System.Globalization

Public Class Registration
    Inherits System.Web.UI.Page

    Private connectionString As String = _
  WebConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If IsNothing(Session("Username")) Then
        '    Response.Redirect("../SessionOut.aspx")
        'End If

        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Login.aspx")
        End If
        cmpDate.ValueToCompare = DateTime.Now.ToString("d")
        CompaDOB.ValueToCompare = DateTime.Now.ToString("d")

        lblIRDOReference.Text = txtIRDOReference.Value

        'txtRegDate.Attributes.Add("onblur", "checkDate(this);")
        'txtDOB.Attributes.Add("onblur", "checkDate(this);")

        If Not Page.IsPostBack Then

            'txtAge.Attributes.Add("readonly", "readonly")

            'Dim strDate As String = Request.QueryString(txtIRDOReference.UniqueID)

            'lblIRDOReference.Text = strDate

        

            lblIRDOReference.Text = txtIRDOReference.Value

            'ddFacilityDistrict.DataSource = IRDODistricts()
            'ddFacilityDistrict.DataTextField = "DistName"
            'ddFacilityDistrict.DataValueField = "DisCode"
            'ddFacilityDistrict.DataBind()
            'ddFacilityDistrict.Items.Add(New ListItem("Select", -1))
            'ddFacilityDistrict.AppendDataBoundItems = True
            'ddFacilityDistrict.SelectedIndex = 0

            'lblIRDOINT.Text = ddFacilityDistrict.SelectedValue.ToString

            'If Not Session("CurrentFacility") Is Nothing Then
            '    'txtFacilityName.Value = Session("CurrentFacility").ToString()
            '    ' lblFacilityCode.Text = Session("FacilityCode").ToString()
            '    lblIRDOINT.Text = Session("DisCode").ToString()
            '    'txtFacilitySubLoc.Value = Session("SubLocation").ToString()
            '    txtFacilityDistrict.Value = Session("DistName").ToString()
            '    'txtFacilityCountry.Value = Session("County").ToString()
            '    'txtFacilityName.Value = Session("CurrentFacility").ToString()
            'Else

            '    'Response.Redirect("~/Admin/Default.aspx")
            'End If


            ddEducatLevel.Items.Add(New ListItem("", -1))
            ddEducatLevel.AppendDataBoundItems = True
            ddEducatLevel.SelectedIndex = -1
            ddEducatLevel.DataSource = EducationLevel()
            ddEducatLevel.DataTextField = "Level"
            ddEducatLevel.DataValueField = "ID"
            ddEducatLevel.DataBind()

            ddRecruitingIntv.Items.Add(New ListItem("", -1))
            ddRecruitingIntv.AppendDataBoundItems = True
            ddRecruitingIntv.SelectedIndex = -1
            ddRecruitingIntv.DataSource = IRDOInterventions()
            ddRecruitingIntv.DataTextField = "InterventionName"
            ddRecruitingIntv.DataValueField = "ID"
            ddRecruitingIntv.DataBind()


            ddPersonDistrict.Items.Add(New ListItem("Select", -1))
            ddPersonDistrict.AppendDataBoundItems = True
            ddPersonDistrict.SelectedIndex = -1
            ddPersonDistrict.DataSource = PersonDistrict()
            ddPersonDistrict.DataTextField = "District".ToUpper()
            'ddFacilityDistrict.DataValueField = "DisCode"
            ddPersonDistrict.DataBind()



            Dim ContactDistrictSelected As String = ddPersonDistrict.SelectedItem.Text

            'ddDistrict.datasource = ContactDistrict(ContactDistrictSelected)
            'ddDistrict.datatextfield = "district".ToString.ToUpper()
            ''dddistrict.datavaluefield = "distid"
            'ddDistrict.DataBind()



            ddLocation.DataSource = ContactLocation(ContactDistrictSelected)
            ddLocation.Items.Insert(0, New ListItem("", ""))
            ddLocation.DataTextField = "Location".ToString.ToUpper()
            'ddDistrict.DataValueField = "ID"
            ddLocation.DataBind()
            'ddLocation.Items.Add(New ListItem("--select a Location--", -1))
            'ddLocation.AppendDataBoundItems = True
            'ddLocation.SelectedIndex = 0

            ''Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text

            'ddDivision.DataSource = ContactDivision(ContactLocationSelected)
            'ddDivision.DataTextField = "Division".ToString.ToUpper()
            ''ddDistrict.DataValueField = "ID"
            'ddLocation.DataBind()

            'Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text
            ddNearestHF.Items.Insert(0, New ListItem("", ""))
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

            ddMaritalStatus.Items.Add(New ListItem("", -1))
            ddMaritalStatus.AppendDataBoundItems = True
            ddMaritalStatus.SelectedIndex = -1
            ddMaritalStatus.DataSource = MaritalStatus()
            ddMaritalStatus.DataValueField = "MaritId"
            ddMaritalStatus.DataTextField = "MaritalStatusName".ToString.ToUpper()
            ddMaritalStatus.DataBind()


            ddReligion.Items.Add(New ListItem("", -1))
            ddReligion.AppendDataBoundItems = True
            ddReligion.SelectedIndex = -1
            ddReligion.DataSource = Religion()
            ddReligion.DataValueField = "RelId"
            ddReligion.DataTextField = "ReligionName".ToString.ToUpper()
            ddReligion.DataBind()



        End If

    End Sub

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

    Protected Sub ddPersonDistrict_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddPersonDistrict.SelectedIndexChanged
        Dim ContactDistrictSelected As String = ddPersonDistrict.SelectedItem.Text
        'ContactLocation(ContactDistrictSelected)

        ddLocation.DataSource = ContactLocation(ContactDistrictSelected)

        ddLocation.Items.Add(New ListItem("", ""))
        ddLocation.AppendDataBoundItems = True

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
        ddDistrict.Value = ddPersonDistrict.SelectedItem.Text
        Dim ContactLocationSelected As String = ddLocation.SelectedItem.Text

        ddDivision.DataSource = ContactDivision(ContactLocationSelected)
        ddDivision.DataTextField = "Division".ToString.ToUpper()
        ddDivision.DataBind()

        ddNearestHF.Items.Add(New ListItem("", ""))
        ddNearestHF.AppendDataBoundItems = True
        ddNearestHF.SelectedIndex = 0
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

  

    

    Protected Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click


        Dim ClientNumber As Integer = Integer.Parse(txtClientNo.Value)
        'Dim ClientUniqCode As String = txtIRDOReference.Value.ToUpper()
        Dim RegDate As DateTime = Convert.ToDateTime(txtRegDate.text.Trim())
        Dim DistrictRegId As String = lblIRDOINT.Text
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
        Dim Religion As Integer = Integer.Parse(ddReligion.SelectedValue.ToString)
        Dim RelOther As String = txtRelOther.Value.ToUpper()
        Dim MaritalStatus As Integer = Integer.Parse(ddMaritalStatus.SelectedValue.ToString)
        Dim RecrutingIntervention As Integer = Integer.Parse(ddRecruitingIntv.SelectedValue.ToString)
        Dim RecrutingInterventionName As String = ddRecruitingIntv.SelectedItem.ToString
        Dim CardIssuer As String = txtCardIssuer.Value.ToUpper()
        Dim DOE As DateTime = Convert.ToDateTime(DateTime.Now)
        Dim DateUpdated As DateTime = Convert.ToDateTime(DateTime.Now)

        Dim Year_in_Digits = RegDate.ToString("yy")

        Dim UniversalNumber As String = String.Concat(lblIRDOINT.Text, "/", ClientNumber.ToString, "/", Year_in_Digits)
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
            lblResults.Text = "Error inserting record. "
            Throw ex
            lblResults.Text &= ex.Message
        Finally
            con.Close()
            con.Dispose()
        End Try

        'con.Open()
        'cmd.ExecuteNonQuery()
        'con.Close()

    End Sub
    'Private Sub BindGrid()
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("ahfdata").ConnectionString
    '    Using con As New SqlConnection(constr)
    '        Dim keyval As String = lblClientUniqCode.Text
    '        'using cmd as new sqlcommand("select * from benchmarkstrans")
    '        'Using cmd As New sqlcommand("select * from benchmarkstrans where uniqueident  = '" + lbluniquebatch.text + "'")
    '        Dim cmd As New SqlCommand()
    '        cmd.CommandType = CommandType.StoredProcedure
    '        cmd.CommandText = "Registration_CRUD_Sp"
    '        cmd.Parameters.Add("@ClientUniqCode", SqlDbType.NVarChar).Value = keyval
    '        Using sda As New SqlDataAdapter()
    '            cmd.Connection = con
    '            sda.SelectCommand = cmd
    '            Using dt As New DataTable()
    '                sda.Fill(dt)

    '                'Dim CD4Total As Decimal = 0
    '                'Dim Link_CareTotal As Decimal = 0
    '                'For Each oRow As DataRow In dt.Rows
    '                '    CD4Total += Convert.ToDecimal(oRow("CD4_Test_LastYear"))
    '                '    Link_CareTotal += Convert.ToDecimal(oRow("Link_Care_OneMonth"))
    '                'Next

    '                GridView1.DataSource = dt
    '                GridView1.DataBind()
    '                'lblFileNo.Text = GridView1.Rows.Count
    '                ''Dim total As Integer = dt.AsEnumerable().Sum(Function(row) row.Field(Of Decimal)("Price"))lblCD4LastYear

    '                'lblCD4LastYear.Text = CD4Total.ToString()
    '                'lblLink_Care_OneMonth.Text = Link_CareTotal.ToString()
    '                'Cal_Percentage()

    '            End Using
    '        End Using
    '    End Using
    '    'End Using
    'End Sub

    'Protected Sub OnRowEditing(sender As Object, e As GridViewEditEventArgs)
    '    GridView1.EditIndex = e.NewEditIndex
    '    Me.BindGrid()
    '    'lblFileNo.Text = GridView1.Rows.Count
    '    'PopulateFields()
    '    'panDataEntry.Visible = False
    '    'Cal_Percentage()
    'End Sub


End Class