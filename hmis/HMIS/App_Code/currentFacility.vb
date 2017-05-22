Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient


Public Class currentFacility

    Private Shared ReadOnly _connectionString As String


    Private strUserName As String
    Private strFullName As String
    Private IntFacilityCode As Integer
    Private strFacilityName As String

    Private intIRDODistId As Integer
    Private strDivision As String
    Private strType As String
    Private strOwner As String

    Private strDescriptionofLocation As String
    Private strConstituency As String


    Private strDistName As String
    Private strDisCode As String
    Private intDistId As Integer
    Private strLocation As String
    Private strSubLocation As String
    Private strCounty As String


    Shared Sub New()
        _connectionString = WebConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
    End Sub

#Region "Public Propeties"
    Public Property UserLoginName() As String
        Get
            Return strUserName
        End Get
        Set(ByVal value As String)
            strUserName = value
        End Set
    End Property
    Public Property FullName() As String
        Get
            Return strFullName
        End Get
        Set(ByVal value As String)
            strFullName = value
        End Set
    End Property
    Public Property FacilityCode() As Integer
        Get
            Return IntFacilityCode
        End Get
        Set(ByVal value As Integer)
            IntFacilityCode = value
        End Set
    End Property

    Public Property txtFacilityCode() As Integer
        Get
            Return IntFacilityCode
        End Get
        Set(ByVal value As Integer)
            IntFacilityCode = value
        End Set
    End Property

    Public Property FacilityName() As String
        Get
            Return strFacilityName
        End Get
        Set(ByVal value As String)
            strFacilityName = value
        End Set
    End Property
    Public Property County() As String
        Get
            Return strCounty
        End Get
        Set(ByVal value As String)
            strCounty = value
        End Set
    End Property
    Public Property IRDODistId() As Integer
        Get
            Return intIRDODistId
        End Get
        Set(ByVal value As Integer)
            intIRDODistId = value
        End Set
    End Property
    Public Property Division() As String
        Get
            Return strDivision
        End Get
        Set(ByVal value As String)
            strDivision = value
        End Set
    End Property
    Public Property Type() As String
        Get
            Return strType
        End Get
        Set(ByVal value As String)
            strType = value
        End Set
    End Property
    Public Property Owner() As String
        Get
            Return strOwner
        End Get
        Set(ByVal value As String)
            strOwner = value
        End Set
    End Property
    Public Property Location() As String
        Get
            Return strLocation
        End Get
        Set(ByVal value As String)
            strLocation = value
        End Set
    End Property
    Public Property SubLocation() As String
        Get
            Return strSubLocation
        End Get
        Set(ByVal value As String)
            strSubLocation = value
        End Set
    End Property
    Public Property DescriptionofLocation() As String
        Get
            Return strDescriptionofLocation
        End Get
        Set(ByVal value As String)
            strDescriptionofLocation = value
        End Set
    End Property
    Public Property Constituency() As String
        Get
            Return strConstituency
        End Get
        Set(ByVal value As String)
            strConstituency = value
        End Set
    End Property
    Public Property DistId() As Integer
        Get
            Return intDistId
        End Get
        Set(ByVal value As Integer)
            intDistId = value
        End Set

    End Property
    Public Property DistName() As String
        Get
            Return strDistName
        End Get
        Set(ByVal value As String)
            strDistName = value
        End Set
    End Property
    Public Property DisCode() As String
        Get
            Return strDisCode
        End Get
        Set(ByVal value As String)
            strDisCode = value
        End Set
    End Property
#End Region

    Public Function GetAll() As List(Of currentFacility)
        Dim results As List(Of currentFacility) = New List(Of currentFacility)()
        Dim conn As New SqlConnection(_connectionString)
        Dim cmd As New SqlCommand("SELECT     u.UserName, u.FullName, d.FacilityCode, d.FacilityName, d.County, d.IRDODistId, d.Division, d.Type, d.Owner, d.Location, d.SubLocation, d.DescriptionofLocation, " _
        & "d.Constituency, t.DistName, t.DisCode FROM UserSites us INNER JOIN Users u ON us.UserId = u.UserId INNER JOIN IRDOFacilities d ON Us.[Facility Code] = d.FacilityCode INNER JOIN " _
        & "IRDODistricts t ON d.IRDODistId = t.DistId", conn)
        Using conn
            conn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            Do While dr.Read()
                Dim newcurrentFacility As New currentFacility()
                newcurrentFacility.DisCode = CStr(dr("DisCode"))
                newcurrentFacility.DistName = CStr(dr("DistName"))
                newcurrentFacility.FacilityName = CStr(dr("FacilityName"))
                results.Add(newcurrentFacility)
            Loop
        End Using
        Return results
    End Function

    Function CurrentSelectedFacility(ByVal facode As Integer)
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)



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
                        DistName = dt.Rows(0)("DistName").ToString()
                        strDisCode = dt.Rows(0)("DisCode").ToString()
                        intDistId = dt.Rows(0)("DistId").ToString()
                        strCounty = dt.Rows(0)("County").ToString()
                        IntFacilityCode = dt.Rows(0)("FacilityCode").ToString()
                        strFacilityName = dt.Rows(0)("FacilityName").ToString()
                        strLocation = dt.Rows(0)("Location").ToString()
                        strSubLocation = dt.Rows(0)("SubLocation").ToString()
                        strDivision = dt.Rows(0)("Division").ToString()
                        strLocation = dt.Rows(0)("Location").ToString()

                    End If
                    con.Close()
                End Using
            End Using
        End Using
        Return DisCode
    End Function

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


