Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data.SqlTypes
Imports System.Globalization
Imports HMIS.currentFacility



Public Class vmmc1
    Inherits System.Web.UI.Page

    Private connectionString As String = _
WebConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True

        'If IsNothing(Session("Username")) Then
        '    Response.Redirect("../SessionOut.aspx")
        'End If

        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Login.aspx")
        End If

        lblIRDOReference.Text = txtVMMCNo.Text
        lblDuration.Text = txtDuration.Text

        lblD2_StartTime.Text = txtD2_StartTime.Text
        lblD3_EndTime.Text = txtD3_EndTime.Text

        cmpDate.ValueToCompare = DateTime.Now.ToString("d")
        CompCounsDate.ValueToCompare = DateTime.Now.ToString("d")
        ComptxtD1_MC_Date.ValueToCompare = DateTime.Now.ToString("d")

        If Not Page.IsPostBack Then

            If Not Session("Username") Is Nothing Then

                lblFacilityCode.Text = Session("FacilityCode").ToString()
                'lblDistrictCode.Text = Session("DisCode").ToString()
                'lblDistId.Text = Session("DistId").ToString()
                'txtFacilitySubLoc.Value = Session("SubLocation").ToString()
                'txtFacilityDistrict.Value = Session("DistName").ToString()
                'txtFacilityCountry.Value = Session("County").ToString()
                'Hidden field
                txtFacilityNameHid.Value = Session("CurrentFacility").ToString()
                txtFacilitySubLocHid.Value = Session("SubLocation").ToString()
                txtFacilityDistrictHid.Value = Session("DistName").ToString()
                txtFacilityCountryHid.Value = Session("County").ToString()
                txtDistrictCode.Text = lblDistrictCode.Text.ToString()
                'txtFacilityName.Value = Session("CurrentFacility").ToString()
            Else

                'Response.Redirect("~/Admin/Default.aspx")
            End If

            lblFacilityDistrict.Text = Session("facName1")
            Dim facode As Integer = Convert.ToInt32(lblFacilityCode.Text)
            Dim currentFac As New currentFacility()
            currentFac.CurrentSelectedFacility(facode)
            With currentFac
                lblDistrictCode.Text = .DisCode
                txtDistrictCode.Text = .DisCode
                lblDistId.Text = .DistId
                txtFacilitySubLoc.Value = .SubLocation
                txtFacilityDistrict.Value = .DistName
                txtFacilityCountry.Value = .County
                txtFacilityName.Value = .FacilityName
            End With


            'Dim FacilityList As DropDownList = TryCast(Login1.FindControl("ddFaciltiy"), DropDownList)
            'Dim facode As Integer = FacilityList.SelectedValue.ToString()

            'Dim fac As New currentFacility()
            'With fac
            '    .DisCode = "Test"
            '    .DistName = "Kisumu East"
            '    .
            '    lblFacilityCode.Text = .DisCode
            '    
            'End With
            BindClient()
            PopulateInfoSource()
            PopulateCounselors()
            OPMedication_during()
            OPMedication_after()
            TypeOfCircum()
            AETOfype()
            Surgname()
            AssistSurgname()
            Dis_OfficerName()

        End If


    End Sub

    Protected Sub BindClient()
        Try
            Dim sqlCon As New SqlConnection(ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString)
            Using sqlCon
                Using cmd As New SqlCommand("SelectVMMCclient_Sp", sqlCon)
                    cmd.CommandType = CommandType.StoredProcedure
                    sqlCon.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader()
                        If dr.HasRows Then
                            ddClientNumber.DataSource = dr
                            ddClientNumber.DataTextField = "Client"
                            ddClientNumber.DataValueField = "ClientUniqCode"
                            ddClientNumber.DataBind()
                            ddClientNumber.Items.Insert(0, New ListItem("-Select-", "0"))
                        End If
                    End Using
                    sqlCon.Close()
                End Using
            End Using
        Catch ex As Exception
            Response.Write("Error:" + ex.Message.ToString())
        End Try
    End Sub



    Private Sub PopulateCounselors()
        Try


            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT DistId, CouselorName FROM IRDOCounselors where DistId = '" + Session("DistId") + "'")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddB1_CounsName.DataSource = cmd.ExecuteReader()
                    ddB1_CounsName.DataTextField = "CouselorName"
                    ddB1_CounsName.DataValueField = "DistId"
                    ddB1_CounsName.DataBind()
                    con.Close()
                End Using
            End Using
            ddB1_CounsName.Items.Insert(0, New ListItem("--Select Counselor--", "0"))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub

    Private Sub OPMedication_during()
        Try


            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT Id, MedName FROM Medication")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddD4_OPMedCode.DataSource = cmd.ExecuteReader()
                    ddD4_OPMedCode.DataTextField = "MedName"
                    ddD4_OPMedCode.DataValueField = "Id"
                    ddD4_OPMedCode.DataBind()
                    con.Close()
                End Using
            End Using
            ddD4_OPMedCode.Items.Insert(0, New ListItem("--Select--", "0"))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub

    Private Sub OPMedication_after()
        Try


            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT Id, MedName FROM Medication")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddE2_Medication.DataSource = cmd.ExecuteReader()
                    ddE2_Medication.DataTextField = "MedName"
                    ddE2_Medication.DataValueField = "Id"
                    ddE2_Medication.DataBind()

                    con.Close()
                End Using
            End Using
            ddE2_Medication.Items.Insert(0, New ListItem("--Select--", "0"))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub

    Private Sub TypeOfCircum()
        Try


            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT Id, Type FROM VMMCType")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddD6_Procedure.DataSource = cmd.ExecuteReader()
                    ddD6_Procedure.DataTextField = "Type"
                    ddD6_Procedure.DataValueField = "Id"
                    ddD6_Procedure.DataBind()
                    con.Close()
                End Using
            End Using
            ddD6_Procedure.Items.Insert(0, New ListItem("--Select--", "0"))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub

    Private Sub AETOfype()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT Id, Type FROM AEType")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddD7_AEType.DataSource = cmd.ExecuteReader()
                    ddD7_AEType.DataTextField = "Type"
                    ddD7_AEType.DataValueField = "Id"
                    ddD7_AEType.DataBind()
                    con.Close()
                End Using
            End Using
            ddD7_AEType.Items.Insert(0, New ListItem("", ""))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub

    Private Sub Surgname()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT Cadre, FullName, IRDODistId, Status FROM IRDOClinicians where IRDODistId = '" + Session("DistId") + "'")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddD10_Surgname.DataSource = cmd.ExecuteReader()
                    ddD10_Surgname.DataTextField = "FullName"
                    ddD10_Surgname.DataValueField = "Cadre"
                    ddD10_Surgname.DataBind()
                    con.Close()
                End Using
            End Using
            ddD10_Surgname.Items.Insert(0, New ListItem("", ""))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub

    Protected Sub ddD10_Surgname_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddD10_Surgname.SelectedIndexChanged
        txtD11_SurgCadre.Value = ddD10_Surgname.SelectedValue.ToString()
        ddD10_Surgname.Focus()
    End Sub

    Private Sub AssistSurgname()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT Cadre, FullName, IRDODistId, Status FROM IRDOClinicians where IRDODistId = '" + Session("DistId") + "'")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddD12_AssSurgname.DataSource = cmd.ExecuteReader()
                    ddD12_AssSurgname.DataTextField = "FullName"
                    ddD12_AssSurgname.DataValueField = "Cadre"
                    ddD12_AssSurgname.DataBind()
                    con.Close()
                End Using
            End Using
            ddD12_AssSurgname.Items.Insert(0, New ListItem("", ""))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub



    Private Sub Dis_OfficerName()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT Cadre, FullName, IRDODistId, Status FROM IRDOClinicians where IRDODistId = '" + Session("DistId") + "'")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    ddE4_Dis_OfficerName.DataSource = cmd.ExecuteReader()
                    ddE4_Dis_OfficerName.DataTextField = "FullName"
                    ddE4_Dis_OfficerName.DataValueField = "Cadre"
                    ddE4_Dis_OfficerName.DataBind()
                    con.Close()
                End Using
            End Using
            ddE4_Dis_OfficerName.Items.Insert(0, New ListItem("", ""))
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try

    End Sub


    Private Sub PopulateClientFields()
        Try

            Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
            Using con As New SqlConnection(constr)
                Dim keyval As String = ddClientNumber.SelectedValue.ToString()
                'using cmd as new sqlcommand("select * from benchmarkstrans")
                'Using cmd As New sqlcommand("select * from benchmarkstrans where uniqueident  = '" + lbluniquebatch.text + "'")
                Dim cmd As New SqlCommand()
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "PopulateVMMCclient_Sp"
                cmd.Parameters.Add("@ClientUniqCode", SqlDbType.NVarChar).Value = keyval
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        If dt.Rows.Count > 0 Then
                            lblUniversalNumber.Text = dt.Rows(0)("ClientUniqCode").ToString()
                            txtA1_ClientName.Value = dt.Rows(0)("FullClientName").ToString()
                            txtA1_ClientName.Value = dt.Rows(0)("FullClientName").ToString()
                            txtA2_ClientAge.Value = dt.Rows(0)("Ageyrs").ToString()
                            txtA3_ClientPhoneContact.Value = dt.Rows(0)("PhoneNo").ToString()
                            txtA4_ClientResidenceSubLoc.Value = dt.Rows(0)("LocationRes").ToString()
                            txtA4_ClientResidenceDistrict.Value = dt.Rows(0)("DistrictRes").ToString()
                            txtA4_ClientResidenceCounty.Value = dt.Rows(0)("County").ToString()
                            'txtRemarks.Text = dt.Rows(0)("Remarks").ToString()
                        End If
                        con.Close()
                    End Using
                End Using
            End Using
            'End Using
        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        End Try
    End Sub
    'Public Function GetFacilityDistrict(ByVal ctrlusername As String) As CurrentFacilityDistrict
    '    Dim conn As New Data.SqlClient.SqlConnection
    '    Dim sql As String
    '    Dim objSql As Data.SqlClient.SqlCommand
    '    Dim MyDataReader As Data.SqlClient.SqlDataReader
    '    conn.ConnectionString = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
    '    Dim FacilityDistrict As String = Nothing
    '    Dim DisCode As String = Nothing
    '    'sql = "SELECT cast(SUM(mile) as varchar(4)) AS milesum, cast(COUNT(mile) as varchar(3)) AS milecnt FROM Journal WHERE (mile <> 0)"
    '    sql = "SELECT Facilities.[Facility Code], Facilities.[Facility Name], Facilities.Province, Facilities.County, Facilities.District, " _
    '& "Facilities.Division, Facilities.Type, Facilities.Location, Facilities.[Sub Location], Facilities.[Description of Location],  " _
    '& "Facilities.Constituency, Facilities.[Nearest Town], Users.UserName, Users.FullName, IRDODistricts.DisCode FROM Facilities INNER JOIN " _
    '& "UserSites ON Facilities.[Facility Code] = UserSites.[Facility Code] INNER JOIN Users ON UserSites.UserId = Users.UserId INNER JOIN " _
    '& "IRDODistricts ON Facilities.District = IRDODistricts.DistName where Users.UserName =" & HttpContext.Current.User.Identity.Name & ";"


    '    objSql = New Data.SqlClient.SqlCommand(sql, conn)
    '    conn.Open()
    '    MyDataReader = objSql.ExecuteReader

    '    ' Declare return object
    '    Dim rsp As New CurrentFacilityDistrict

    '    While (MyDataReader.Read())
    '        '_currmiles = MyDataReader.Item("milesum")
    '        '_currdays = MyDataReader.Item("milecnt")
    '        ' Set object values
    '        rsp.FacilityDistrict = MyDataReader.Item("FacilityDistrict")
    '        rsp.DisCode = MyDataReader.Item("DisCode")

    '    End While
    '    conn.Close()

    '    Return rsp ' return Object of type MilesResponse
    '    'Return _currmiles.ToString
    '    'Return _currdays.ToString

    'End Function

    Sub VMMC_Insert()
        Dim ClientNumber As Integer = Integer.Parse(txtClientnumber.Text)
        Dim VMMCClientNumber As String = txtVMMCNo.Text.ToString.ToUpper()
        Dim VisitDate As DateTime = Convert.ToDateTime(txtVisitDate.Text)
        Dim FacilityRegNumber As Integer = Integer.Parse(txtFacilityRegNumber.Value)
        Dim FacilityCode As Integer = lblFacilityCode.Text.ToString.ToUpper()
        Dim FacilityName As String = txtFacilityName.Value.ToString.ToUpper()
        Dim IRDODistId As Integer = Integer.Parse(lblDistId.Text)
        Dim DeliveryType As Integer = Integer.Parse(ctlContentPlaceHolder_DeliveryType.SelectedValue)
        Dim FacilityVillage As String = txtFacilityVillage.Value.ToString.ToUpper()
        Dim FacilitySublocation As String = txtFacilitySubLoc.Value.ToString.ToUpper()
        Dim FacilityDistrict As String = txtFacilityDistrict.Value.ToString.ToUpper()
        Dim FacilityCounty As String = txtFacilityCountry.Value.ToString.ToUpper()
        Dim A1_ClientName As String = txtA1_ClientName.Value.ToString.ToUpper()
        Dim A2_ClientAge As Integer = Integer.Parse(txtA2_ClientAge.Value)
        Dim A3_ClientPhoneContact As String = txtA3_ClientPhoneContact.Value.ToString.ToUpper()
        Dim A4_ClientVillage As String = txtA4_ClientVillage.Value.ToString.ToUpper()
        Dim A4_ClientResidenceCounty As String = txtA4_ClientResidenceCounty.Value.ToString.ToUpper()
        Dim A4_ClientResidenceDistrict As String = txtA4_ClientResidenceDistrict.Value.ToString.ToUpper()
        Dim A4_ClientResidenceSubLoc As String = txtA4_ClientResidenceSubLoc.Value.ToString.ToUpper()
        Dim A5_InfoSource As Integer = Integer.Parse(ddA5_InfoSource.SelectedValue)
        Dim A5_InfoSourceOther As String = txtA5_InfoSourceOther.Value.ToString.ToUpper()
        'Dim B1_FacResult As Integer = ddB1_FacResult.SelectedValue
        'Dim B1_FacResult As Nullable(Of Integer)
        'If (ddB1_FacResult.SelectedValue = "") Then
        '    B1_FacResult = ""
        'Else
        '    B1_FacResult = Integer.Parse(ddB1_FacResult.SelectedValue)
        'End If

        'Dim B1_SelfResult As Nullable(Of Integer)
        'If (ddB1_SelfResult.SelectedValue = "") Then
        '    B1_SelfResult = ""
        'Else
        '    B1_SelfResult = Integer.Parse(ddB1_SelfResult.SelectedValue)
        'End If

        'Dim B1_PartResult As Nullable(Of Integer)
        'If (ddB1_PartResult.SelectedValue = "") Then
        '    B1_PartResult = ""
        'Else
        '    B1_PartResult = Integer.Parse(ddB1_PartResult.SelectedValue)
        'End If

        'Dim B1_SelfResult As Integer = ddB1_SelfResult.SelectedValue
        'Dim B1_PartResult As Integer = ddB1_PartResult.SelectedValue
        Dim B1_CounsName As String = ddB1_CounsName.SelectedItem.ToString.ToUpper()
        Dim B1_CounsDate As DateTime = Convert.ToDateTime(txtB1_CounsDate.Text)
        Dim B2_BleedDis As Integer = Integer.Parse(ddB2_BleedDis.SelectedValue)
        Dim B2_DiabetisDis As Integer = Integer.Parse(ddB4_Diabetes.SelectedValue)
        Dim B3_UrethDisch As Integer = Integer.Parse(ddB3_UrethDisch.SelectedValue)
        Dim B3_Gensore As Integer = Integer.Parse(ddB3_Gensore.SelectedValue)
        Dim B3_PainUrine As Integer = Integer.Parse(ddB3_PainUrine.SelectedValue)
        Dim B3_ScrotSwell As Integer = Integer.Parse(ddB3_ScrotSwell.SelectedValue)
        Dim B3_RectractfSkin As Integer = Integer.Parse(ddB3_RectractfSkin.SelectedValue)
        Dim B3_ReturnfSkin As Integer = Integer.Parse(ddB3_ReturnfSkin.SelectedValue)
        Dim B3_Erection As Integer = Integer.Parse(ddB3_Erection.SelectedValue)
        Dim B3_OtherSpecify As String = txtB3_OtherSpecify.Value.ToString.ToUpper()
        Dim B4_Anaemia As Integer = Integer.Parse(ddB4_Anaemia.SelectedValue)
        Dim B4_Diabetes As Integer = Integer.Parse(ddB4_Diabetes.SelectedValue)
        Dim B4_HIVAids As Integer = Integer.Parse(ddB4_HIVAids.SelectedValue)
        Dim B4_OtherSpecify As String = txtB4_OtherSpecify.Value.ToString.ToUpper()
        Dim B5_Allergy As Integer = Integer.Parse(ddB5_Allergy.SelectedValue)
        Dim B5_OtherSpecify As String = txtB5_OtherSpecify.Value.ToString.ToUpper()
        Dim B6_Surgical As Integer = Integer.Parse(ddB6_Surgical.SelectedValue)
        Dim B6_OtherSpecify As String = txtB6_OtherSpecify.Value.ToString.ToUpper()
        Dim B7_BP1 As Decimal = Decimal.Parse(txtB7_BP1.Value)
        Dim B7_BP2 As Decimal = Decimal.Parse(txtB7_BP2.Value)
        Dim B7_Pulse As Decimal = Decimal.Parse(txtB7_Pulse.Value)
        Dim B7_Weight As Decimal = Decimal.Parse(txtB7_Weight.Value)
        Dim B7_Temperature As Decimal = Decimal.Parse(txtB7_Temperature.Value)
        Dim C1_Health As Integer = Integer.Parse(ddC1_Health.SelectedValue)
        Dim C2_Counseled As Integer = Integer.Parse(ddC2_Counseled.SelectedValue)
        Dim C3_Consent As Integer = Integer.Parse(ddC3_Consent.SelectedValue)
        Dim C3_Explain As String = txtC3_Explain.Value.ToString.ToUpper()
        'Dim D1_MCDate As DateTime



        'If (txtD1_MC_Date.Text = "") Then
        '    D1_MCDate = Convert.ToDateTime(DBNull.Value)
        'Else
        '    D1_MCDate = DateTime.Parse(txtD1_MC_Date.Text)
        'End If
        'Dim d2_starttime As DateTime = Convert.ToDateTime(lblD2_StartTime.Text)
        'Dim d3_endtime As DateTime = Convert.ToDateTime(lblD3_EndTime.Text)
        'Dim d3_durationminutes As Integer = Integer.Parse(lblDuration.Text)
        ' Dim d4_opmedcode As Integer = Integer.Parse(ddD4_OPMedCode.SelectedValue)
        'Dim d5_anaesthesia As Integer = Integer.Parse(ddD5_Anaesthesia.SelectedValue)
        Dim d5_specifyother As String = txtD5_SpecifyOther.Value.ToString.ToUpper()
        'Dim d5_concentration As Integer = Integer.Parse(ddD5_Concentration.SelectedValue)
        'Dim D5_Volume As Decimal = txtD5_Volume.Value.ToString.ToUpper()
        'Dim D6_Procedure As Integer = Integer.Parse(ddD6_Procedure.SelectedValue)
        Dim D6_SpecifyOther As String = txtD6_SpecifyOther.Value.ToString.ToUpper()
        'Dim D7_AEDuring As Integer = Integer.Parse(ddD7_AEDuring.SelectedValue)
        'Dim D7_AEType As String
        'If (ddD7_AEType.SelectedValue = "") Then
        '    D7_AEType = Nothing
        'Else
        '    D7_AEType = Integer.Parse(ddD7_AEType.SelectedValue)
        'End If

        'Dim D9_AESeverity As Integer
        'If (ddD9_AESeverity.SelectedValue = "") Then
        '    D9_AESeverity = Nothing
        'Else
        '    D9_AESeverity = Integer.Parse(ddD9_AESeverity.SelectedValue)
        'End If

        Dim D10_Surgname As String = ddD10_Surgname.SelectedItem.ToString.ToUpper()
        Dim D11_SurgCadre As String = txtD11_SurgCadre.Value.ToString.ToUpper()
        Dim D12_AssSurgname As String = ddD12_AssSurgname.SelectedItem.ToString.ToUpper()
        Dim D13_CadreAssSurg As String = txtD13_CadreAssSurg.Value.ToString.ToUpper()
        'Dim E1_BP As Decimal = Decimal.Parse(txtE1_BP.Value)
        'Dim E1_BP2 As Decimal = Decimal.Parse(txtE1_BP2.Value)
        'Dim E1_Pulse As Decimal = Decimal.Parse(txtE1_Pulse.Value)
        'Dim E1_Temperature As Decimal = Decimal.Parse(txtE1_Temperature.Value)
        Dim E2_Medication As Integer = Integer.Parse(ddE2_Medication.SelectedValue)
        ' Dim E3_PostInstruction As Integer = Integer.Parse(ddE3_PostInstruction.SelectedValue)
        Dim E4_Dis_OfficerName As String = ddE4_Dis_OfficerName.SelectedItem.ToString.ToUpper()
        Dim E4_Dis_OfficerCadre As String = txtD11_SurgCadre.Value.ToString.ToUpper()
        Dim UniversalNumber As String = lblUniversalNumber.Text.ToString.ToUpper()
        Dim Intervention As String = "VMMC"
        Dim DOE As DateTime = Convert.ToDateTime(DateTime.Now)
        Dim DateUpdated As DateTime = Convert.ToDateTime(DateTime.Now)
        Dim UseridEntry As Integer = Integer.Parse(Session("UserId"))
        Dim UseridUpdated As Integer = Integer.Parse(Session("UserId"))


        Dim strConnString As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure

        cmd.CommandText = "VMMC_Insert_sp"
        cmd.Parameters.AddWithValue("@ClientNumber ", ClientNumber)
        cmd.Parameters.AddWithValue("@VMMCClientNumber ", VMMCClientNumber)
        cmd.Parameters.AddWithValue("@VisitDate ", VisitDate)
        cmd.Parameters.AddWithValue("@FacilityRegNumber ", FacilityRegNumber)
        cmd.Parameters.AddWithValue("@FacilityCode ", FacilityCode)
        cmd.Parameters.AddWithValue("@FacilityName ", FacilityName)
        cmd.Parameters.AddWithValue("@IRDODistId ", IRDODistId)
        cmd.Parameters.AddWithValue("@DeliveryType ", DeliveryType)
        cmd.Parameters.AddWithValue("@FacilityVillage ", FacilityVillage)
        cmd.Parameters.AddWithValue("@FacilitySublocation ", FacilitySublocation)
        cmd.Parameters.AddWithValue("@FacilityDistrict ", FacilityDistrict)
        cmd.Parameters.AddWithValue("@FacilityCounty ", FacilityCounty)
        cmd.Parameters.AddWithValue("@A1_ClientName ", A1_ClientName)
        cmd.Parameters.AddWithValue("@A2_ClientAge ", A2_ClientAge)
        cmd.Parameters.AddWithValue("@A3_ClientPhoneContact ", A3_ClientPhoneContact)
        cmd.Parameters.AddWithValue("@A4_ClientVillage ", A4_ClientVillage)
        cmd.Parameters.AddWithValue("@A4_ClientResidenceCounty ", A4_ClientResidenceCounty)
        cmd.Parameters.AddWithValue("@A4_ClientResidenceDistrict ", A4_ClientResidenceDistrict)
        cmd.Parameters.AddWithValue("@A4_ClientResidenceSubLoc ", A4_ClientResidenceSubLoc)
        cmd.Parameters.AddWithValue("@A5_InfoSource ", A5_InfoSource)
        cmd.Parameters.AddWithValue("@A5_InfoSourceOther ", A5_InfoSourceOther)
        cmd.Parameters.AddWithValue("@B1_FacResult ", SqlDbType.Int).Value = ddB1_FacResult.SelectedValue
        cmd.Parameters.AddWithValue("@B1_SelfResult ", SqlDbType.Int).Value = ddB1_SelfResult.SelectedValue
        cmd.Parameters.AddWithValue("@B1_PartResult ", SqlDbType.Int).Value = ddB1_PartResult.SelectedValue
        cmd.Parameters.AddWithValue("@B1_CounsName ", B1_CounsName)
        cmd.Parameters.AddWithValue("@B1_CounsDate ", B1_CounsDate)
        cmd.Parameters.AddWithValue("@B2_BleedDis ", B2_BleedDis)
        cmd.Parameters.AddWithValue("@B2_DiabetisDis ", B2_DiabetisDis)
        cmd.Parameters.AddWithValue("@B3_UrethDisch ", B3_UrethDisch)
        cmd.Parameters.AddWithValue("@B3_Gensore ", B3_Gensore)
        cmd.Parameters.AddWithValue("@B3_PainUrine ", B3_PainUrine)
        cmd.Parameters.AddWithValue("@B3_ScrotSwell ", B3_ScrotSwell)
        cmd.Parameters.AddWithValue("@B3_RectractfSkin ", B3_RectractfSkin)
        cmd.Parameters.AddWithValue("@B3_ReturnfSkin ", B3_ReturnfSkin)
        cmd.Parameters.AddWithValue("@B3_Erection ", B3_Erection)
        cmd.Parameters.AddWithValue("@B3_OtherSpecify ", B3_OtherSpecify)
        cmd.Parameters.AddWithValue("@B4_Anaemia ", B4_Anaemia)
        cmd.Parameters.AddWithValue("@B4_Diabetes ", B4_Diabetes)
        cmd.Parameters.AddWithValue("@B4_HIVAids ", B4_HIVAids)
        cmd.Parameters.AddWithValue("@B4_OtherSpecify ", B4_OtherSpecify)
        cmd.Parameters.AddWithValue("@B5_Allergy ", B5_Allergy)
        cmd.Parameters.AddWithValue("@B5_OtherSpecify ", B5_OtherSpecify)
        cmd.Parameters.AddWithValue("@B6_Surgical ", B6_Surgical)
        cmd.Parameters.AddWithValue("@B6_OtherSpecify ", B6_OtherSpecify)
        cmd.Parameters.AddWithValue("@B7_BP1 ", B7_BP1)
        cmd.Parameters.AddWithValue("@B7_BP2 ", B7_BP2)
        cmd.Parameters.AddWithValue("@B7_Pulse ", B7_Pulse)
        cmd.Parameters.AddWithValue("@B7_Weight ", B7_Weight)
        cmd.Parameters.AddWithValue("@B7_Temperature ", B7_Temperature)
        cmd.Parameters.AddWithValue("@C1_Health ", C1_Health)
        cmd.Parameters.AddWithValue("@C2_Counseled ", C2_Counseled)
        cmd.Parameters.AddWithValue("@C3_Consent ", C3_Consent)
        cmd.Parameters.AddWithValue("@C3_Explain ", C3_Explain)
        'cmd.Parameters.AddWithValue("@D1_MCDate ", D1_MCDate)

        If (txtD1_MC_Date.Text = "") Then
            cmd.Parameters.AddWithValue("@D1_MCDate", SqlDbType.Date).Value = SqlDateTime.Null
        Else
            cmd.Parameters.AddWithValue("@D1_MCDate", SqlDbType.Date).Value = DateTime.Parse(txtD1_MC_Date.Text)
        End If

        'cmd.Parameters.AddWithValue("@D2_StartTime ", d2_starttime)
        'cmd.Parameters.AddWithValue("@D3_EndTime ", d3_endtime)


        If (txtD2_StartTime.Text = "") Then
            cmd.Parameters.AddWithValue("@D2_StartTime", SqlDbType.Date).Value = SqlDateTime.Null
        Else
            cmd.Parameters.AddWithValue("@D2_StartTime", SqlDbType.Date).Value = DateTime.Parse(txtD2_StartTime.Text)
        End If

        If (txtD3_EndTime.Text = "") Then
            cmd.Parameters.AddWithValue("@D3_EndTime", SqlDbType.Date).Value = SqlDateTime.Null
        Else
            cmd.Parameters.AddWithValue("@D3_EndTime", SqlDbType.Date).Value = DateTime.Parse(txtD3_EndTime.Text)
        End If

        If (txtDuration.Text = "") Then
            cmd.Parameters.AddWithValue("@D3_DurationMinutes", SqlDbType.Int).Value = SqlInt32.Null
        Else
            cmd.Parameters.AddWithValue("@D3_DurationMinutes", SqlDbType.Int).Value = Convert.ToInt32(txtDuration.Text)
        End If

        If (ddD4_OPMedCode.Text = "") Then
            cmd.Parameters.AddWithValue("@D4_OPMedCode", SqlDbType.Int).Value = SqlInt32.Null
        Else
            cmd.Parameters.AddWithValue("@D4_OPMedCode", SqlDbType.Int).Value = Convert.ToInt32(ddD4_OPMedCode.Text)
        End If


        'cmd.Parameters.AddWithValue("@D3_DurationMinutes ", d3_durationminutes)
        'cmd.Parameters.AddWithValue("@D4_OPMedCode ", d4_opmedcode)

        'cmd.Parameters.AddWithValue("@D5_Anaesthesia ", d5_anaesthesia)

        If (ddD5_Anaesthesia.Text = "") Then
            cmd.Parameters.AddWithValue("@d5_anaesthesia", SqlDbType.Int).Value = SqlInt32.Null
        Else
            cmd.Parameters.AddWithValue("@d5_anaesthesia", SqlDbType.Int).Value = Convert.ToInt32(ddD5_Anaesthesia.Text)
        End If

        If (ddD5_Concentration.Text = "") Then
            cmd.Parameters.AddWithValue("@d5_concentration", SqlDbType.Int).Value = SqlInt32.Null
        Else
            cmd.Parameters.AddWithValue("@d5_concentration", SqlDbType.Int).Value = Convert.ToInt32(ddD5_Concentration.Text)
        End If

        If (txtD5_Volume.Value = "") Then
            cmd.Parameters.AddWithValue("@D5_Volume", SqlDbType.Decimal).Value = SqlDecimal.Null
        Else
            cmd.Parameters.AddWithValue("@D5_Volume", SqlDbType.Decimal).Value = Convert.ToDecimal(txtD5_Volume.Value)
        End If

        If (ddD6_Procedure.SelectedValue = "") Then
            cmd.Parameters.AddWithValue("@D6_Procedure", SqlDbType.Int).Value = SqlInt32.Null
        Else
            cmd.Parameters.AddWithValue("@D6_Procedure", SqlDbType.Int).Value = Convert.ToInt32(ddD6_Procedure.SelectedValue)
        End If

        If (ddD7_AEDuring.SelectedValue = "") Then
            cmd.Parameters.AddWithValue("@D7_AEDuring", SqlDbType.Int).Value = SqlInt32.Null
        Else
            cmd.Parameters.AddWithValue("@D7_AEDuring", SqlDbType.Int).Value = Convert.ToInt32(ddD7_AEDuring.SelectedValue)
        End If


        cmd.Parameters.AddWithValue("@D5_SpecifyOther ", d5_specifyother)
        'cmd.Parameters.AddWithValue("@D5_Concentration ", d5_concentration)
        'cmd.Parameters.AddWithValue("@D5_Volume ", D5_Volume)
        'cmd.Parameters.AddWithValue("@D6_Procedure ", D6_Procedure)
        cmd.Parameters.AddWithValue("@D6_SpecifyOther ", D6_SpecifyOther)
        'cmd.Parameters.AddWithValue("@D7_AEDuring ", D7_AEDuring)

        cmd.Parameters.AddWithValue("@D7_AEType ", SqlDbType.Int).Value = ddD7_AEType.SelectedValue
        cmd.Parameters.AddWithValue("@D9_AESeverity ", SqlDbType.Int).Value = ddD9_AESeverity.SelectedValue

        cmd.Parameters.AddWithValue("@D10_Surgname ", D10_Surgname)
        cmd.Parameters.AddWithValue("@D11_SurgCadre ", D11_SurgCadre)
        cmd.Parameters.AddWithValue("@D12_AssSurgname ", D12_AssSurgname)
        cmd.Parameters.AddWithValue("@D13_CadreAssSurg ", D13_CadreAssSurg)

        'cmd.Parameters.AddWithValue("@E1_BP ", E1_BP)
        If (txtE1_BP.Value = "") Then
            cmd.Parameters.AddWithValue("@E1_BP", SqlDbType.Decimal).Value = SqlDecimal.Null
        Else
            cmd.Parameters.AddWithValue("@E1_BP", SqlDbType.Decimal).Value = Convert.ToDecimal(txtE1_BP.Value)
        End If
        'cmd.Parameters.AddWithValue("@E1_BP2 ", E1_BP2)
        If (txtE1_BP2.Value = "") Then
            cmd.Parameters.AddWithValue("@E1_BP2", SqlDbType.Decimal).Value = SqlDecimal.Null
        Else
            cmd.Parameters.AddWithValue("@E1_BP2", SqlDbType.Decimal).Value = Convert.ToDecimal(txtE1_BP2.Value)
        End If
        'cmd.Parameters.AddWithValue("@E1_Pulse ", E1_Pulse)
        If (txtE1_Pulse.Value = "") Then
            cmd.Parameters.AddWithValue("@E1_Pulse", SqlDbType.Decimal).Value = SqlDecimal.Null
        Else
            cmd.Parameters.AddWithValue("@E1_Pulse", SqlDbType.Decimal).Value = Convert.ToDecimal(txtE1_Pulse.Value)
        End If
        'cmd.Parameters.AddWithValue("@E1_Temperature ", E1_Temperature)
        If (txtE1_Temperature.Value = "") Then
            cmd.Parameters.AddWithValue("@E1_Temperature", SqlDbType.Decimal).Value = SqlDecimal.Null
        Else
            cmd.Parameters.AddWithValue("@E1_Temperature", SqlDbType.Decimal).Value = Convert.ToDecimal(txtE1_Temperature.Value)
        End If
        cmd.Parameters.AddWithValue("@E2_Medication ", E2_Medication)
        'If (ddD7_AEDuring.SelectedValue = "") Then
        '    cmd.Parameters.AddWithValue("@D7_AEDuring", SqlDbType.Int).Value = SqlInt32.Null
        'Else
        '    cmd.Parameters.AddWithValue("@D7_AEDuring", SqlDbType.Int).Value = Convert.ToInt32(ddD7_AEDuring.SelectedValue)
        'End If
        ' cmd.Parameters.AddWithValue("@E3_PostInstruction ", E3_PostInstruction)
        If (ddE3_PostInstruction.SelectedValue = "") Then
            cmd.Parameters.AddWithValue("@E3_PostInstruction", SqlDbType.Int).Value = SqlInt32.Null
        Else
            cmd.Parameters.AddWithValue("@E3_PostInstruction", SqlDbType.Int).Value = Convert.ToInt32(ddE3_PostInstruction.SelectedValue)
        End If
        cmd.Parameters.AddWithValue("@E4_Dis_OfficerName ", E4_Dis_OfficerName)
        cmd.Parameters.AddWithValue("@E4_Dis_OfficerCadre ", E4_Dis_OfficerCadre)
        cmd.Parameters.AddWithValue("@UniversalNumber ", UniversalNumber)

        cmd.Parameters.AddWithValue("@Intervention ", Intervention)
        cmd.Parameters.AddWithValue("@DOE ", DOE)
        cmd.Parameters.AddWithValue("@DateUpdated ", DateUpdated)
        cmd.Parameters.AddWithValue("@UseridEntry ", UseridEntry)
        cmd.Parameters.AddWithValue("@UseridUpdated ", UseridUpdated)
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
            lblErrorMsg.Text = "Error inserting record. "
            Throw ex
            lblErrorMsg.Text &= ex.Message
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Sub


    Private Sub txtClientnumber_TextChanged(sender As Object, e As EventArgs) Handles txtClientnumber.TextChanged
        'Dim VisitDate As DateTime = Convert.ToDateTime(txtVisitDate.Text.Trim())
        'Dim Year_in_Digits = VisitDate.ToString("yy")
        'Dim UniversalNumber As String = String.Concat(txtDistrictCode.Text, "/", txtClientnumber.ToString, "/", Year_in_Digits)
        'Dim lblIRDOReference As String = UniversalNumber
    End Sub

    Protected Sub ddClientNumber_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddClientNumber.SelectedIndexChanged
        PopulateClientFields()
        txtA4_ClientVillage.Focus()
    End Sub


    Private Sub PopulateInfoSource()
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT Id, SourceName FROM VMMCInforSource")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                ddA5_InfoSource.DataSource = cmd.ExecuteReader()
                ddA5_InfoSource.DataTextField = "SourceName"
                ddA5_InfoSource.DataValueField = "Id"
                ddA5_InfoSource.DataBind()
                con.Close()
            End Using
        End Using
        ddA5_InfoSource.Items.Insert(0, New ListItem("--Select InfoSource--", "0"))
    End Sub


    Protected Sub ddE4_Dis_OfficerName_SelectedIndexChanged1(sender As Object, e As EventArgs) Handles ddE4_Dis_OfficerName.SelectedIndexChanged
        txtE5_CadreAssSurg.Value = ddE4_Dis_OfficerName.SelectedValue.ToString()
        ddE4_Dis_OfficerName.Focus()
    End Sub

    Protected Sub ddD12_AssSurgname_SelectedIndexChanged1(sender As Object, e As EventArgs) Handles ddD12_AssSurgname.SelectedIndexChanged
        txtD13_CadreAssSurg.Value = ddD12_AssSurgname.SelectedValue.ToString()
        ddD12_AssSurgname.Focus()
    End Sub

    Protected Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click
        VMMC_Insert()
    End Sub

    'Private Sub eligibility()
    '    Dim strMessage As String
    '    Dim intResponse As Integer


    '    If ddC1_Health.SelectedValue <> 1 Or ddC2_Counseled.SelectedValue <> 1 Or ddC3_Consent.SelectedValue <> 1 Then
    '        strMessage = "The client is not eligible for circumcision! Start new entry?"
    '        intResponse = MsgBox(strMessage, vbYesNo + vbQuestion, "Eligibility Test?")
    '        pnl_MCProcedure.Enabled = False
    '        pnl_MCProcedure.BackColor = Drawing.Color.DarkGray
    '        If intResponse = vbYes Then

    '        Else
    '            pnl_MCProcedure.Enabled = True
    '        End If
    '    Else

    '    End If
    'End Sub


    Protected Sub txD2_StartTime_TextChanged(sender As Object, e As EventArgs) Handles txD2_StartTime.TextChanged
        'Dim D2_StartTime As DateTime = Convert.ToDateTime(txtD2_StartTime.Value)
        'Dim D3_EndTime As DateTime = Convert.ToDateTime(txtD3_EndTime.Value)
        'Dim span As TimeSpan = D3_EndTime - D2_StartTime
        'lblDuration.Text = span.ToString()
        lblD2_StartTime.Text = String.Concat(txD2_StartTime.Text, ":", txD2_StartTime2.Text)
        txD2_StartTime2.Focus()
    End Sub

    Protected Sub txD2_StartTime2_TextChanged(sender As Object, e As EventArgs) Handles txD2_StartTime2.TextChanged
        lblD2_StartTime.Text = String.Concat(txD2_StartTime.Text, ":", txD2_StartTime2.Text)
        txD3_EndTime.Focus()
    End Sub

    Protected Sub txD3_EndTime_TextChanged(sender As Object, e As EventArgs) Handles txD3_EndTime.TextChanged
        lblD3_EndTime.Text = String.Concat(txD3_EndTime.Text, ":", txD3_EndTime2.Text)
        txD3_EndTime2.Focus()
    End Sub

    Protected Sub txD3_EndTime2_TextChanged(sender As Object, e As EventArgs) Handles txD3_EndTime2.TextChanged
        lblD3_EndTime.Text = String.Concat(txD3_EndTime.Text, ":", txD3_EndTime2.Text)
        ddD4_OPMedCode.Focus()
    End Sub

    Protected Sub ddC3_Consent_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddC3_Consent.SelectedIndexChanged
        ' eligibility()
    End Sub
End Class