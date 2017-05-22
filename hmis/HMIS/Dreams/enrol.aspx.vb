Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.UI.WebControls
Imports System.Data.SqlTypes
Imports System.Globalization

Public Class enrol
    Inherits System.Web.UI.Page

    Private connectionString As String = _
    WebConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'ComptxtDOB.ValueToCompare = DateTime.Now.ToString("d")
        Session("UserName") = User.Identity.Name

        If Not Page.IsPostBack Then
            MultiView1.SetActiveView(view_intro)
            btnDemo.Text = "Demographic Information"
            btnMod1IndHH.Text = "1: Individual & Household Info"
            btn_elig.Text = "Eligibility"
            lblHeader.Text = " Navigation"
            'ddCountryId.Items.Add(New ListItem("--select a country--", -1))
            'ddCountryId.AppendDataBoundItems = True
            'ddCountryId.SelectedIndex = 0
            ddPartnerId.DataBind()
            ddPartnerId.SelectedValue = 8

        End If
    End Sub

    Protected Sub btn_elig_Click(sender As Object, e As EventArgs) Handles btn_elig.Click
        MultiView1.SetActiveView(view_intro)
        btn_elig.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.OrangeRed
        btnDemo.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        btn_elig.Text = "Eligibility "
        lblHeader.Text = " DREAMS ELIGIBILITY"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False

        GetClientdetails()
    End Sub

    Protected Sub btnDemo_Click(sender As Object, e As EventArgs) Handles btnDemo.Click
        MultiView1.SetActiveView(View1)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnDemo.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnDemo.ForeColor = Drawing.Color.OrangeRed
        btn_elig.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "DEMOGRAPHIC INFORMATION"
    End Sub

    Protected Sub btnMod1IndHH_Click(sender As Object, e As EventArgs) Handles btnMod1IndHH.Click
        MultiView1.SetActiveView(View2)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.OrangeRed
        btnDemo.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "MODULE 1: INDIVIDUAL AND HOUSEHOLD INFORMATION"
    End Sub

    Protected Sub btnMod2Edu_Click(sender As Object, e As EventArgs) Handles btnMod2Edu.Click
        MultiView1.SetActiveView(View3)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnMod2Edu.Text = "2: Education & Employment"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.OrangeRed
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        btnDemo.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "  MODULE 2: EDUCATION & EMPLOYMENT"
    End Sub

 
    Protected Sub BtnMod3HIV_Click(sender As Object, e As EventArgs) Handles BtnMod3HIV.Click
        MultiView1.SetActiveView(View4)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnMod2Edu.Text = "2: Education & Employment"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.OrangeRed
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        btnDemo.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "  MODULE 3: HIV TESTING"
    End Sub

    Protected Sub BtnMod4SexAct_Click(sender As Object, e As EventArgs) Handles BtnMod4SexAct.Click
        MultiView1.SetActiveView(View5)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnMod2Edu.Text = "2: Education & Employment"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.OrangeRed
        btnDemo.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "  MODULE 4: SEXUAL ACTIVITY "
    End Sub

    Protected Sub BtnMod5RepHealth_Click(sender As Object, e As EventArgs) Handles BtnMod5RepHealth.Click
        MultiView1.SetActiveView(View6)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnMod2Edu.Text = "2: Education & Employment"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.OrangeRed
        'BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        btnDemo.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "  MODULE 5: REPRODUCTIVE HEALTH "
    End Sub

    Protected Sub BtnMod6Gender_Click(sender As Object, e As EventArgs) Handles BtnMod6Gender.Click
        MultiView1.SetActiveView(View7)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnMod2Edu.Text = "2: Education & Employment"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.OrangeRed
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        btnDemo.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "  MODULE 6: GENDER BASED VIOLENCE  "
    End Sub

    Protected Sub BtnMod7NonPresc_Click(sender As Object, e As EventArgs) Handles BtnMod7NonPresc.Click
        MultiView1.SetActiveView(View8)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnMod2Edu.Text = "2: Education & Employment"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.OrangeRed
        btnDemo.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "  MODULE 7: NON-PRESCRIPTION DRUG USE  "
    End Sub

    Protected Sub BtnMod7Prog_Click(sender As Object, e As EventArgs) Handles BtnMod7Prog.Click
        MultiView1.SetActiveView(View9)
        btn_elig.Font.Bold = False
        btnDemo.Text = "Demographic Information"
        btnMod2Edu.Text = "2: Education & Employment"
        btnDemo.Font.Bold = False
        btnMod1IndHH.Font.Bold = True
        btnMod1IndHH.ForeColor = Drawing.Color.Black
        btnMod2Edu.ForeColor = Drawing.Color.Black
        BtnMod3HIV.ForeColor = Drawing.Color.Black
        BtnMod4SexAct.ForeColor = Drawing.Color.Black
        BtnMod5RepHealth.ForeColor = Drawing.Color.Black
        BtnMod6Gender.ForeColor = Drawing.Color.Black
        BtnMod7NonPresc.ForeColor = Drawing.Color.Black
        BtnMod7Prog.ForeColor = Drawing.Color.OrangeRed
        btnDemo.ForeColor = Drawing.Color.Black
        btn_elig.ForeColor = Drawing.Color.Black
        btnMod1IndHH.Font.Bold = False
        btnMod2Edu.Font.Bold = False
        lblHeader.Text = "  MODULE 7: NON-PRESCRIPTION DRUG USE  "
    End Sub

    Protected Sub cmdNext_s1_Click(sender As Object, e As EventArgs) Handles cmdNext_s1.Click
        'MultiView1.SetActiveView(View1)

        Try
            Page.Validate()

            If Not Page.IsValid Then
                Return
            End If
        Catch ex As Exception
            lblResults.Text = "Error getting record. "
        End Try
        'Dim AuditDate As DateTime = CDate(Date.ParseExact(DATEDBE.Text, "dd-MM-yyyy", DateTimeFormatInfo.InvariantInfo).ToShortDateString)
        Dim strConnString As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "Dreams_ScreenInster_sp"
        cmd.Parameters.AddWithValue("@DreamsIdNumber", SqlDbType.VarChar).Value = txtClientID.Text.ToUpper.Trim()
        'cmd.Parameters.AddWithValue("@ImplementingPartner", SqlDbType.VarChar).Value = ddPartnerId.Text.Trim()
        cmd.Parameters.AddWithValue("@PartnerID", SqlDbType.VarChar).Value = ddPartnerId.SelectedValue
        cmd.Parameters.AddWithValue("@RecruitingWardID", SqlDbType.VarChar).Value = ddFacilityDistrict.SelectedValue
        cmd.Parameters.AddWithValue("@ClientFirstName", SqlDbType.VarChar).Value = txtFirstName.Text.ToUpper.Trim()
        cmd.Parameters.AddWithValue("@ClientMiddleName", SqlDbType.VarChar).Value = txtMiddleName.Text.ToUpper.Trim()
        cmd.Parameters.AddWithValue("@ClientLastName", SqlDbType.VarChar).Value = txtLastName.Text.ToUpper.Trim()
        cmd.Parameters.AddWithValue("@ClientDoB", SqlDbType.Date).Value = DateTime.Parse(txtDoB.Text)
        cmd.Parameters.AddWithValue("@ClientAge", SqlDbType.VarChar).Value = txtAge.Text.Trim()
        cmd.Parameters.AddWithValue("@Q1a_Aged10to24Yrs", SqlDbType.VarChar).Value = ddQ1a_Aged10to24Yrs.SelectedValue
        cmd.Parameters.AddWithValue("@Q1b_Aged10to24Yrs_VerificationDoc", SqlDbType.VarChar).Value = ddQ1b_Aged10to24Yrs_VerificationDoc.SelectedValue
        cmd.Parameters.AddWithValue("@Q1c_Aged10to24Yrs_Other", SqlDbType.VarChar).Value = txtQ1c_Aged10to24Yrs_Other.Text.ToUpper.Trim()
        cmd.Parameters.AddWithValue("@Q2a_ResidingInWard", SqlDbType.VarChar).Value = ddQ2a_ResidingInWard.SelectedValue
        cmd.Parameters.AddWithValue("@Q2b_ResidingInWardName", SqlDbType.VarChar).Value = ddQ2b_ResidingInWardName.SelectedValue
        cmd.Parameters.AddWithValue("@Q3_Aged10to17_Consent", SqlDbType.VarChar).Value = ddQ3_Aged10to17_Consent.SelectedValue
        cmd.Parameters.AddWithValue("@Q4_AgreedToEnrol", SqlDbType.VarChar).Value = ddQ4_AgreedToEnrol.SelectedValue
        cmd.Parameters.AddWithValue("@Q4_AgreedToEnrol_Comments", SqlDbType.VarChar).Value = txtQ4_AgreedToEnrol_Comments.Text.ToUpper.Trim()
        cmd.Parameters.AddWithValue("@Q5_Status", SqlDbType.VarChar).Value = ddQ5_Status.SelectedValue
        cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
        cmd.Parameters.AddWithValue("@UpdatedDate", DateTime.Now)
        cmd.Parameters.AddWithValue("@username", SqlDbType.VarChar).Value = User.Identity.Name
        'cmd.Parameters.AddWithValue("@UniqueIdent", SqlDbType.Int).Value = txtDreamsID.Text.Trim()

        cmd.Connection = con
        Try
            con.Open()
            Dim affectedrows As Integer = cmd.ExecuteNonQuery()
            lblResults.Text = "record inserted successfully"
            'Response.Redirect(Request.Url.AbsoluteUri)
            'Response.Redirect("select.aspx", True)


            If affectedrows > 0 Then
                lblResults.Text = "record inserted successfully"
                ScriptManager.RegisterClientScriptBlock(Page, Page.[GetType](), Guid.NewGuid().ToString(), "alert('record saved successfully');", True)
                '  Response.Redirect("select.aspx", True)
                'Response.Redirect(Request.Url.AbsoluteUri)

            Else
                ScriptManager.RegisterClientScriptBlock(Page, Page.[GetType](), Guid.NewGuid().ToString(), "alert('record already exists');", True)

            End If
        Catch ex As Exception
            lblResults.Text = "error inserting record. "
            ' Throw ex
            lblResults.Text &= ex.Message
        Finally
            con.Close()
            con.Dispose()
        End Try
        GetClientdetails()
    End Sub

    Private Sub cmdPrev_dem_Click(sender As Object, e As EventArgs) Handles cmdPrev_dem.Click
        MultiView1.SetActiveView(view_intro)
    End Sub

    Protected Sub cmdNext_dem_Click(sender As Object, e As EventArgs) Handles cmdNext_dem.Click
        'MultiView1.SetActiveView(View2)
    End Sub

    Sub GetClientdetails()
        Dim clientname As String = txtFirstName.Text + " " + txtMiddleName.Text + " " + txtLastName.Text
        txtFullName.Text = clientname
        txtDreamsUniqueID.Text = txtClientID.Text
        txtDoBDemo.Text = txtDoB.Text
    End Sub

    Sub insert()


        Try
            Page.Validate()

            If Not Page.IsValid Then
                Return
            End If
        Catch ex As Exception
            lblResults.Text = "Error getting record. "
        End Try
        'Dim AuditDate As DateTime = CDate(Date.ParseExact(DATEDBE.Text, "dd-MM-yyyy", DateTimeFormatInfo.InvariantInfo).ToShortDateString)
        Dim strConnString As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "Dreams_ScreenInster_sp"
        cmd.Parameters.AddWithValue("@Q1_DoBVerification ", SqlDbType.VarChar).Value = txtQ1_DoBVerification.Text.Trim()
        cmd.Parameters.AddWithValue("@Q2_DateOfEnrol ", SqlDbType.VarChar).Value = txtQ2_DateOfEnrol.Text.Trim()
        cmd.Parameters.AddWithValue("@Q3_AgeAtEnrol ", SqlDbType.VarChar).Value = txtQ3_AgeAtEnrol.Text.Trim()
        cmd.Parameters.AddWithValue("@Q4_MaritalStatus ", SqlDbType.VarChar).Value = ddQ4_MaritalStatus.Text.Trim()
        cmd.Parameters.AddWithValue("@Q5_PhoneNumber ", SqlDbType.VarChar).Value = txtQ5_PhoneNumber.Text.Trim()
        cmd.Parameters.AddWithValue("@Q6_DSSIDNumber ", SqlDbType.VarChar).Value = txtQ6_DSSIDNumber.Text.Trim()
        cmd.Parameters.AddWithValue("@Q7a_CountyOfResidence ", SqlDbType.VarChar).Value = txtQ7a_CountyOfResidence.Text.Trim()
        cmd.Parameters.AddWithValue("@Q7b_SubCounty ", SqlDbType.VarChar).Value = txtQ7b_SubCounty.Text.Trim()
        cmd.Parameters.AddWithValue("@Q7c_WardID ", SqlDbType.VarChar).Value = ddQ7c_WardID.Text.Trim()
        cmd.Parameters.AddWithValue("@Q7d_WardName ", SqlDbType.VarChar).Value = txtQ7d_WardName.Text.Trim()
        cmd.Parameters.AddWithValue("@Q7e_InformalSettlement ", SqlDbType.VarChar).Value = txtQ7e_InformalSettlement.Text.Trim()
        cmd.Parameters.AddWithValue("@Q7f_Village ", SqlDbType.VarChar).Value = txtQ7f_Village.Text.Trim()
        cmd.Parameters.AddWithValue("@Q7fg_LandMark ", SqlDbType.VarChar).Value = txtQ7fg_LandMark.Text.Trim()
        cmd.Parameters.AddWithValue("@Q8_DreamsIdNumber ", SqlDbType.VarChar).Value = txtDreamsUniqueID.Text.Trim()
        cmd.Parameters.AddWithValue("@Q9a_PrimaryCareGiverName ", SqlDbType.VarChar).Value = txtQ9a_PrimaryCareGiverName.Text.Trim()
        cmd.Parameters.AddWithValue("@Q9b_PrimaryCareGiverRelationship ", SqlDbType.VarChar).Value = ddQ9b_PrimaryCareGiverRelationship.Text.Trim()
        cmd.Parameters.AddWithValue("@Q9c_PrimaryCareGiverPhoneNumber ", SqlDbType.VarChar).Value = txtQ9c_PrimaryCareGiverPhoneNumber.Text.Trim()
        cmd.Parameters.AddWithValue("@Q9d_PrimaryCareGiverNationalId ", SqlDbType.VarChar).Value = txtQ9d_PrimaryCareGiverNationalId.Text.Trim()
        cmd.Parameters.AddWithValue("@username ", SqlDbType.VarChar).Value = User.Identity.Name
        cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
        cmd.Parameters.AddWithValue("@UpdatedDate", DateTime.Now)
        cmd.Parameters.AddWithValue("@username", SqlDbType.VarChar).Value = User.Identity.Name
        'cmd.Parameters.AddWithValue("@UniqueIdent", SqlDbType.Int).Value = txtDreamsID.Text.Trim()

        cmd.Connection = con
        Try
            con.Open()
            Dim affectedrows As Integer = cmd.ExecuteNonQuery()
            lblResults.Text = "record inserted successfully"
            'Response.Redirect(Request.Url.AbsoluteUri)
            'Response.Redirect("select.aspx", True)


            If affectedrows > 0 Then
                lblResults.Text = "record inserted successfully"
                ScriptManager.RegisterClientScriptBlock(Page, Page.[GetType](), Guid.NewGuid().ToString(), "alert('record saved successfully');", True)
                '  Response.Redirect("select.aspx", True)
                'Response.Redirect(Request.Url.AbsoluteUri)

            Else
                ScriptManager.RegisterClientScriptBlock(Page, Page.[GetType](), Guid.NewGuid().ToString(), "alert('record already exists');", True)

            End If
        Catch ex As Exception
            lblResults.Text = "error inserting record. "
            ' Throw ex
            lblResults.Text &= ex.Message
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Sub


    Sub CurrentFacility()
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)

            'Dim Ward As DropDownList = TryCast(Login1.FindControl("ddFaciltiy"), DropDownList)
            'Dim facode As Integer = FacilityList.SelectedValue.ToString()
            Dim wardid As Integer = ddFacilityDistrict.SelectedValue

            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "SelectCurrentWard_Sp"
            cmd.Parameters.Add("@wardid", SqlDbType.Int).Value = wardid

            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    If dt.Rows.Count > 0 Then

                        Session("WardId") = dt.Rows(0)("WardId").ToString()
                        Session("WardName") = dt.Rows(0)("WardName").ToString()
                        Session("SubCountyName") = dt.Rows(0)("SubCountyName").ToString()
                        Session("CountyName") = dt.Rows(0)("CountyName").ToString()
                        Session("WardActive") = dt.Rows(0)("WardActive").ToString()
                        'Session("DistId") = dt.Rows(0)("DistId").ToString()
                        'Session("County") = dt.Rows(0)("County").ToString()
                        'Session("Location") = dt.Rows(0)("Location").ToString()
                        'Session("SubLocation") = dt.Rows(0)("SubLocation").ToString()
                        'Session("Division") = dt.Rows(0)("Division").ToString()
                        'Session("Location") = dt.Rows(0)("Location").ToString()
                        'Session("FacilityCode") = dt.Rows(0)("FacilityCode").ToString()
                    End If
                    con.Close()
                End Using
            End Using
        End Using
    End Sub

 
  
    Protected Sub ddFacilityDistrict_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddFacilityDistrict.SelectedIndexChanged
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)

            'Dim Ward As DropDownList = TryCast(Login1.FindControl("ddFaciltiy"), DropDownList)
            'Dim facode As Integer = FacilityList.SelectedValue.ToString()
            Dim wardid As Integer = ddFacilityDistrict.SelectedValue

            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "SelectCurrentWard_Sp"
            cmd.Parameters.Add("@wardid", SqlDbType.Int).Value = wardid

            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    If dt.Rows.Count > 0 Then

                        Session("WardId") = dt.Rows(0)("WardId").ToString()
                        Session("WardName") = dt.Rows(0)("WardName").ToString()
                        Session("SubCountyName") = dt.Rows(0)("SubCountyName").ToString()
                        Session("CountyName") = dt.Rows(0)("CountyName").ToString()
                        Session("WardActive") = dt.Rows(0)("WardActive").ToString()
                        'Session("DistId") = dt.Rows(0)("DistId").ToString()
                        'Session("County") = dt.Rows(0)("County").ToString()
                        'Session("Location") = dt.Rows(0)("Location").ToString()
                        'Session("SubLocation") = dt.Rows(0)("SubLocation").ToString()
                        'Session("Division") = dt.Rows(0)("Division").ToString()
                        'Session("Location") = dt.Rows(0)("Location").ToString()
                        'Session("FacilityCode") = dt.Rows(0)("FacilityCode").ToString()
                    End If
                    con.Close()
                End Using
            End Using
        End Using
    End Sub
End Class