Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data.SqlTypes
Imports System.Globalization

Public Class Interventions
    Inherits System.Web.UI.Page

    Private connectionString As String = _
WebConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
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

            ddErgInterventionId.Items.Add(New ListItem("--Intervention--", -1))
            ddErgInterventionId.AppendDataBoundItems = True
            ddErgInterventionId.SelectedIndex = -1
            ddErgInterventionId.DataSource = IRDOInterventions()
            ddErgInterventionId.DataTextField = "InterventionName"
            ddErgInterventionId.DataValueField = "ID"
            ddErgInterventionId.DataBind()


            Me.BindGrid()

        End If

    End Sub

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

    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)
            Dim keyval As String = txtClientUniqCode.Text
            'using cmd as new sqlcommand("select * from benchmarkstrans")
            'Using cmd As New sqlcommand("select * from benchmarkstrans where uniqueident  = '" + lbluniquebatch.text + "'")
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "RegIntvSelect_Sp"
            cmd.Parameters.Add("@ClientUniqCode", SqlDbType.VarChar, 50).Value = txtClientUniqCode.Text
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)

                    GridView1.DataSource = dt
                    GridView1.DataBind()


                End Using
            End Using
        End Using
        'End Using
    End Sub

    Protected Sub cmdAddIntv_Click(sender As Object, e As EventArgs) Handles cmdAddIntv.Click
        ' Try
        Dim ClientUniqCode As String = txtClientUniqCode.Text.ToUpper()
        'Dim RegVisitDate As DateTime = Convert.ToDateTime(txtRegVisitDate.Value.Trim())

        Dim RegVisitDate As Date = Date.ParseExact(txtRegVisitDate.Value, "dd/MM/yyyy", CultureInfo.CurrentCulture)

        Dim InterventionId As Integer = Integer.Parse(ddErgInterventionId.SelectedValue.ToString)
        Dim ClientUniqIntvCode As String = ddErgInterventionId.SelectedItem.ToString
        Dim UniqueIdent As String = String.Concat(txtClientUniqCode.Text.ToUpper(), " ", ddErgInterventionId.SelectedValue.ToString)

        Dim constr As String = ConfigurationManager.ConnectionStrings("IRDOHMIS").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()

                cmd.CommandText = "RegistrationIntv_Insert_sp"
                cmd.CommandType = CommandType.StoredProcedure
                Using sda As New SqlDataAdapter()
                    cmd.Parameters.AddWithValue("@ClientUniqCode  ", ClientUniqCode)
                    cmd.Parameters.AddWithValue("@VisitDate  ", RegVisitDate)
                    cmd.Parameters.AddWithValue("@InterventionId  ", InterventionId)
                    cmd.Parameters.AddWithValue("@ClientUniqIntvCode  ", ClientUniqIntvCode)
                    cmd.Parameters.AddWithValue("@UniqueIdent  ", UniqueIdent)
                    cmd.Parameters.AddWithValue("@DOE  ", DateTime.Now)
                    cmd.Parameters.AddWithValue("@DateUpdated  ", DateTime.Now)
                    cmd.Parameters.AddWithValue("@UserId  ", 1)

                    cmd.Connection = con
                    'con.Open()
                    'cmd.ExecuteNonQuery()
                    'con.Close()




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

                End Using
            End Using
        End Using
        Me.BindGrid()

        txtRegVisitDate.Value = ""
        ddErgInterventionId.SelectedValue = -1


        'Catch ex As Exception
        ' Throw ex
        ' lblResults.Text = "Enter all fields "
        ' Finally

        ' End Try
    End Sub

End Class