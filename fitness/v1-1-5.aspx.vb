Imports System.Data.SqlClient

Public Class v1_1_5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                bindV115Grid()
                'bindV115Grid()
            End If
        End If
    End Sub

    Public Sub bindData()
        Dim obj As New GenericClass

        obj.fillGrid("SELECT id, question, sequence FROM QuestionsMaster WHERE type = 'Par-q and you' ORDER BY sequence ASC", GridParq)
    End Sub

    Public Sub bindV115Grid()
        Dim obj As New GenericClass
        Dim Qry As String = Nothing
        If (Session("Admin").ToString() = "Y") Then
            Qry = "Select v.id, c.name as [name], v.parentname, v.witnessname, v.createdon from V115 as v inner join CustomerMaster as c on v.email = c.email "
        Else
            Qry = "Select v.id, c.name as [name], v.parentname, v.witnessname, v.createdon from V115 as v inner join CustomerMaster as c on v.email = c.email where v.email = '" & Session("Email").ToString() & "'"
        End If
        obj.fillGrid(Qry, GridV115)

    End Sub
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim trId As Long
        Dim _v115 As Boolean = False
        Dim _v115Tr As Boolean = False
        If validateGrid() = True Then

            If (_v115 = False) Then

                Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
                Using con As New SqlConnection(constring)
                    Using cmd As New SqlCommand("sp_v115", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@email", Session("Email").ToString())
                        cmd.Parameters.AddWithValue("@parentname", txtParent.Text)
                        cmd.Parameters.AddWithValue("@witnessname", txtWitness.Text)
                        cmd.Parameters.AddWithValue("@v115Id", 0)

                        cmd.Parameters("@v115Id").Direction = ParameterDirection.Output
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                        trId = cmd.Parameters("@v115Id").Value
                    End Using
                End Using

                _v115 = True
            End If


            If (_v115) Then

                _v115Tr = insertTransactions(trId)

            End If


        Else
            lblMessage.Visible = True
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
            lblMessage.Text = "Please select all fields and try again"
        End If

        If (_v115Tr) Then
            lblMessage.Visible = True
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
            lblMessage.CssClass = "badge badge-success"
            lblMessage.Text = "Your data has been saved."
        End If
        bindV115Grid()
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
                Using cmd As New SqlCommand("sp_v115Trans", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@v115Id", _trid)
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

        Dim v115Id As String = TryCast(sender, LinkButton).CommandArgument


        Dim url As String = "printV115.aspx?id=" & v115Id
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1080,height=720,left=100,top=100,resizable=yes');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)
    End Sub

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)

        Dim _id As String = TryCast(sender, LinkButton).CommandArgument
        HiddenTrId.Value = _id
        Dim StrQry As String = "SElect parentname, witnessname from V115 where id = '" & _id & "'"
        Dim StrQry2 As String = "Select * from V115Transactions where v115Id = '" & _id & "'"
        bindData()
        _bindData(StrQry, StrQry2)
        btnUpdate.Visible = True
        btnSubmit.Visible = False
        'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showModal();", True)
    End Sub

    Private Sub _bindData(ByVal Qry As String, ByVal Qry2 As String)

        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand(Qry, con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        txtParent.Text = dr("parentname").ToString()
                        txtWitness.Text = dr("witnessname").ToString()
                    End While
                End If
                con.Close()

            End Using
        End Using


        Using con2 As New SqlConnection(constring)
            Using cmd2 As New SqlCommand(Qry2, con2)

                cmd2.CommandType = CommandType.Text
                con2.Open()
                Dim dr As SqlDataReader = cmd2.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        Dim qId As String = dr("qid").ToString()
                        Dim ans As String = dr("answer").ToString()
                        If (GridParq.Rows.Count > 0) Then
                            For Each row As GridViewRow In GridParq.Rows
                                Dim lblId As Label = TryCast(row.FindControl("lblId"), Label)

                                Dim RdoYes As RadioButton = TryCast(row.FindControl("RdoYes"), RadioButton)
                                Dim RdoNo As RadioButton = TryCast(row.FindControl("RdoNo"), RadioButton)



                                If (lblId.Text = qId) Then

                                    Select Case (ans)
                                        Case "Yes"
                                            RdoYes.Checked = True

                                        Case "No"
                                            RdoNo.Checked = True
                                    End Select

                                End If

                            Next

                        End If
                    End While
                End If
                con2.Close()

            End Using


        End Using




    End Sub

    Protected Sub btnNew_Click(sender As Object, e As EventArgs)
        bindData()
        btnSubmit.Visible = True
        btnUpdate.Visible = False
        txtParent.Text = ""
        txtWitness.Text = ""
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showModal();", True)
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        Dim DataUpdate As Boolean = False
        Dim OldTransDelete As Boolean = False
        Dim InsertTran As Boolean = False
        Dim SqlCmd As New SqlCommand
        SqlCmd.CommandText = "UPDATE V115 SET parentname = @P , witnessname = @W , modifiedby = @M, modifiedon = GETDATE() WHERE id = @ID"
        SqlCmd.CommandType = CommandType.Text
        SqlCmd.Parameters.AddWithValue("@P", txtParent.Text)
        SqlCmd.Parameters.AddWithValue("@W", txtWitness.Text)
        SqlCmd.Parameters.AddWithValue("@M", Session("Email").ToString())
        SqlCmd.Parameters.AddWithValue("@ID", HiddenTrId.Value)
        Dim _generic As New GenericClass
        DataUpdate = _generic.SaveDataFromCmd(SqlCmd)

        If (DataUpdate) Then
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "Delete from V115Transactions where v115Id = @id"
            cmd.Parameters.AddWithValue("@id", HiddenTrId.Value)

            OldTransDelete = _generic.SaveDataFromCmd(cmd)

            If (OldTransDelete) Then
                InsertTran = insertTransactions(HiddenTrId.Value)
            End If
        End If

        If (InsertTran) Then
            txtParent.Text = ""
            txtWitness.Text = ""
            btnSubmit.Visible = True
            btnUpdate.Visible = False
            HiddenTrId.Value = ""
            lblMessage.Visible = True
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
            lblMessage.CssClass = "badge badge-success"
            lblMessage.Text = "Your data has been saved."
        End If

    End Sub



    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteV115(ByVal id As String) As String
        Dim result As String = Nothing
        Dim tbl1 As Boolean = False
        Dim tbl2 As Boolean = False
        Dim Gen As New GenericClass
        Dim cmd As New SqlCommand

        cmd.CommandText = "Delete from V115Transactions where v115Id = @id"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.CommandType = CommandType.Text
        tbl1 = Gen.SaveDataFromCmd(cmd)
        If (tbl1) Then
            Dim cmd2 As New SqlCommand
            cmd2.CommandText = "delete from V115 where id = @id"
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