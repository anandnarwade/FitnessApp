Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class V_1_2_6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            bindV115Grid()
            If (Not IsPostBack) Then
                bindData()
                bindV115Grid()
            End If
        End If
    End Sub

    Public Sub bindData()
        Dim obj As New GenericClass
        obj.fillGrid("SELECT id, question, sequence FROM QuestionsMaster WHERE type = 'V126' ORDER BY sequence ASC", GridParq)
    End Sub

    Public Sub bindV115Grid()
        Dim obj As New GenericClass
        obj.fillGrid("Select v.id, c.name, v.physicianName, v.physicianPhone, v.emergencyContactPersonName, v.emergencyContactPersonPhone, v.createdon from V126 as v inner join CustomerMaster as c on v.email = c.email where v.email = '" & Session("Email").ToString() & "'", GridV115)
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim trId As Long
        Dim _v126 As Boolean = False
        Dim _v126Tr As Boolean = False
        Dim _action As String = Nothing



        If (validateGrid()) Then

            If (btnSubmit.Text = "SAVE") Then
                _action = "INSERT"
            Else
                _action = "UPDATE"
            End If


            If (_v126 = False) Then
                Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
                Using con As New SqlConnection(constring)
                    Using cmd As New SqlCommand("sp_v126", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@id", hidden126Id.Value)
                        cmd.Parameters.AddWithValue("@email", Session("Email").ToString())
                        cmd.Parameters.AddWithValue("@physicianName", txtphysicianName.Text)
                        cmd.Parameters.AddWithValue("@physicianPhone", txtphysicianPhone.Text)
                        cmd.Parameters.AddWithValue("@emergencyContactPersonName", txtemergencyContactPersonName.Text)
                        cmd.Parameters.AddWithValue("@emergencyContactPersonPhone", txtemergencyContactPersonPhone.Text)
                        cmd.Parameters.AddWithValue("@MedicineDrugsAndReason", txtMedicineDrugsAndReason.Text)
                        cmd.Parameters.AddWithValue("@PhysicianKnowParticipation", txtPhysicianKnowParticipation.Text)
                        cmd.Parameters.AddWithValue("@PhysicalActivity", txtPhysicalActivity.Text)
                        cmd.Parameters.AddWithValue("@cretaedby", Session("Email").ToString())
                        cmd.Parameters.AddWithValue("@action", _action)
                        cmd.Parameters.AddWithValue("@v126", 0)

                        cmd.Parameters("@v126").Direction = ParameterDirection.Output
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                        trId = cmd.Parameters("@v126").Value
                    End Using
                End Using

                _v126 = True
            End If

            If (_v126) Then
                _v126Tr = insertTransactions(trId)
            End If
        Else

            lblMessage.Visible = True
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
            lblMessage.Text = "Please select all fields and try again"
        End If

        If (_v126Tr) Then
            lblMessage.Visible = True
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
            lblMessage.CssClass = "badge badge-success"
            lblMessage.Text = "Your data has been saved."
        End If


    End Sub


    Public Function validateGrid() As Boolean
        Dim res As Boolean = False
        Dim GridRows As Integer = GridParq.Rows.Count
        Dim rowCnt As Integer = 0

        For Each row As GridViewRow In GridParq.Rows
            Dim rdoYes As RadioButton = TryCast(row.FindControl("RdoYes"), RadioButton)
            Dim rdoNo As RadioButton = TryCast(row.FindControl("RdoNo"), RadioButton)

            If (rdoYes.Checked Or rdoNo.Checked) Then
                rowCnt = rowCnt + 1

            End If

        Next

        If GridRows = rowCnt Then
            res = True
        End If

        Return res
    End Function


    Public Function insertTransactions(ByRef _trid As Long) As Boolean
        Dim res As Boolean = False
        Dim GridRows As Integer = GridParq.Rows.Count
        Dim rowCnt As Integer = 0
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        For Each row As GridViewRow In GridParq.Rows
            Dim rdoYes As RadioButton = TryCast(row.FindControl("RdoYes"), RadioButton)
            Dim rdoNo As RadioButton = TryCast(row.FindControl("RdoNo"), RadioButton)
            Dim lblId As Label = TryCast(row.FindControl("lblId"), Label)
            Dim ans As String = Nothing
            If (rdoYes.Checked Or rdoNo.Checked) Then
                If (rdoYes.Checked) Then
                    ans = "Yes"
                Else
                    ans = "No"
                End If
            End If



            Using con As New SqlConnection(constring)
                Using cmd As New SqlCommand("sp_v126Transactions", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@v126id", _trid)
                    cmd.Parameters.AddWithValue("@qid", lblId.Text)
                    cmd.Parameters.AddWithValue("@answer", ans)
                    cmd.Parameters.AddWithValue("@loginUser", Session("Email").ToString())


                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                    rowCnt = rowCnt + 1
                End Using
            End Using


        Next

        If GridRows = rowCnt Then
            res = True
        End If

        Return res
    End Function

    Protected Sub lnkPrint_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument


        Dim url As String = "printv126.aspx?id=" & v126Id
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1080,height=720,left=100,top=100,resizable=yes');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)
    End Sub

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument


        hidden126Id.Value = v126Id
        _fillDataForEdit(v126Id)


        If (GridV115.Rows.Count > 0) Then
            GridV115.UseAccessibleHeader = True
            GridV115.HeaderRow.TableSection = TableRowSection.TableHeader
        End If
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showModal();", True)
    End Sub

    Private Sub _fillDataForEdit(ByVal _id As Integer)
        Dim sConnection As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using Con As New SqlConnection(sConnection)
            Con.Open()
            Using Com As New SqlCommand("SElect * from V126 where id = '" & _id & "'", Con)
                Using RDR = Com.ExecuteReader()
                    If RDR.HasRows Then
                        Do While RDR.Read
                            'txtName.Text = RDR.Item("Name").ToString()
                            txtphysicianName.Text = RDR.Item("physicianName").ToString()
                            txtphysicianPhone.Text = RDR.Item("physicianPhone").ToString()
                            txtemergencyContactPersonName.Text = RDR.Item("emergencyContactPersonName").ToString()
                            txtemergencyContactPersonPhone.Text = RDR.Item("emergencyContactPersonPhone").ToString()
                            txtMedicineDrugsAndReason.Text = RDR.Item("MedicineDrugsAndReason").ToString()
                            txtPhysicianKnowParticipation.Text = RDR.Item("PhysicianKnowParticipation").ToString()
                            txtPhysicalActivity.Text = RDR.Item("PhysicalActivity").ToString()
                            btnSubmit.Text = "UPDATE"

                        Loop
                    End If
                End Using
            End Using
            Con.Close()
        End Using

        If (GridParq.Rows.Count > 0) Then
            Using Con2 As New SqlConnection(sConnection)
                Con2.Open()
                Using cmd2 As New SqlCommand("Select * from V126Transactions where v126id ='" & _id & "'", Con2)
                    Using RDR = cmd2.ExecuteReader()
                        If RDR.HasRows Then
                            Do While RDR.Read
                                'txtName.Text = RDR.Item("Name").ToString()
                                Dim QueId As String = RDR.Item("qid").ToString()
                                Dim Ans As String = RDR.Item("answer").ToString()
                                For Each row As GridViewRow In Me.GridParq.Rows
                                    Dim lblId As Label = TryCast(row.FindControl("lblId"), Label)
                                    Dim RdoYes As RadioButton = TryCast(row.FindControl("RdoYes"), RadioButton)
                                    Dim RdoNo As RadioButton = TryCast(row.FindControl("RdoNo"), RadioButton)
                                    If (QueId = lblId.Text) Then
                                        Select Case (Ans)
                                            Case "Yes"
                                                RdoYes.Checked = True

                                            Case "No"
                                                RdoNo.Checked = True

                                        End Select
                                    End If

                                Next


                            Loop
                        End If
                    End Using
                End Using
                Con2.Close()
            End Using
        End If


    End Sub

    Protected Sub lnkDelete_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument
    End Sub



    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteV126(ByVal id As String) As String
        Dim result As String = Nothing
        Dim tbl1 As Boolean = False
        Dim tbl2 As Boolean = False
        Dim Gen As New GenericClass
        Dim cmd As New SqlCommand

        cmd.CommandText = "Delete from V126Transactions where v126id = @id"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.CommandType = CommandType.Text
        tbl1 = Gen.SaveDataFromCmd(cmd)
        If (tbl1) Then
            Dim cmd2 As New SqlCommand
            cmd2.CommandText = "delete from V126 where id = @id"
            cmd2.Parameters.AddWithValue("@id", id)
            cmd2.CommandType = CommandType.Text
            tbl2 = Gen.SaveDataFromCmd(cmd2)
        End If

        If (tbl2) Then
            result = "Success"
        Else
            result = "Error"
        End If

        Return result
    End Function
End Class