Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class v143
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            bindData()
            bindV143Grid()
        End If
    End Sub

    Public Sub bindData()
        Dim obj As New GenericClass
        obj.fillGrid("SELECT id, question, sequence FROM QuestionsMaster WHERE type = 'V143' ORDER BY sequence ASC", GridV143)
    End Sub

    Public Sub bindV143Grid()
        Dim obj As New GenericClass
        obj.fillGrid("Select v.id, c.name, v.email, v.createdon from v143 as v inner join CustomerMaster as c on v.email= c.email where v.email = '" & Session("Email").ToString() & "'", GrdV143)
    End Sub




    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim trId As Long
        Dim _v143 As Boolean = False
        Dim _v143Tr As Boolean = False

        If (validateGrid() = False) Then
            If (_v143 = False) Then
                Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
                Using con As New SqlConnection(constring)
                    Using cmd As New SqlCommand("sp_143", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@email", Session("Email").ToString())
                        cmd.Parameters.AddWithValue("@v143id", 0)

                        cmd.Parameters("@v143id").Direction = ParameterDirection.Output
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                        trId = cmd.Parameters("@v143id").Value
                    End Using
                End Using

                _v143 = True


            End If

            If (_v143) Then
                _v143Tr = insertTransactions(trId)
            End If
        Else

            lblMessage.Visible = True
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
            lblMessage.Text = "Please select all fields and try again"

        End If

        If (_v143Tr) Then
            lblMessage.Visible = True
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
            lblMessage.CssClass = "badge badge-success"
            lblMessage.Text = "Your data has been saved."
        End If

    End Sub


    Public Function validateGrid() As Boolean
        Dim res As Boolean = False
        Dim GridRows As Integer = GridV143.Rows.Count
        Dim rowCnt As Integer = 0

        For Each row As GridViewRow In GridV143.Rows
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
        Dim GridRows As Integer = GridV143.Rows.Count
        Dim rowCnt As Integer = 0
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        For Each row As GridViewRow In GridV143.Rows
            Dim rdoY As RadioButton = TryCast(row.FindControl("RdoYes"), RadioButton)
            Dim rdoN As RadioButton = TryCast(row.FindControl("RdoNo"), RadioButton)
            Dim lblId As Label = TryCast(row.FindControl("lblId"), Label)
            Dim ans As String = Nothing
            If (rdoY.Checked Or rdoN.Checked) Then
                If (rdoY.Checked) Then
                    ans = "Yes"
                Else
                    ans = "No"
                End If
            End If
            Using con As New SqlConnection(constring)
                Using cmd As New SqlCommand("sp_143Trans", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@v143id", _trid)
                    cmd.Parameters.AddWithValue("@qid", lblId.Text)
                    cmd.Parameters.AddWithValue("@answer", ans)
                    cmd.Parameters.AddWithValue("@createdby", Session("Email").ToString())


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


        Dim url As String = "printV143.aspx?id=" & v126Id
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1080,height=720,left=100,top=100,resizable=yes');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)
    End Sub

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument

        bindGrdForEdit(v126Id)
        Dim gen As New GenericClass
        gen.SaveData("Delete from V143Transactions where v143id = '" & v126Id & "'")
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showModal();", True)
    End Sub

    Private Sub bindGrdForEdit(ByVal _id As String)
        Dim obj As New GenericClass
        obj.fillGrid("Select v.id, v.v143id, v.qid, q.sequence, q.question, v.answer from V143Transactions as v inner join QuestionsMaster as q on v.qid = q.id where q.type = 'V143' and v143id = '" & _id & "' order by q.sequence asc", GridV143)

        If (GridV143.Rows.Count > 0) Then
            For Each row As GridViewRow In Me.GridV143.Rows
                Dim lblAns As Label = TryCast(row.FindControl("lblAns"), Label)
                Dim RdoYes As RadioButton = TryCast(row.FindControl("RdoYes"), RadioButton)
                Dim RdoNo As RadioButton = TryCast(row.FindControl("RdoNo"), RadioButton)

                If (lblAns.Text = "Yes") Then
                    RdoYes.Checked = True
                Else
                    RdoNo.Checked = True
                End If


            Next
        End If



    End Sub



    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteV137(ByVal id As String) As String
        Dim result As String = Nothing
        Dim tbl1 As Boolean = False
        Dim tbl2 As Boolean = False
        Dim Gen As New GenericClass
        Dim cmd As New SqlCommand

        cmd.CommandText = "Delete from V143Transactions where v143id = @id"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.CommandType = CommandType.Text
        tbl1 = Gen.SaveDataFromCmd(cmd)
        If (tbl1) Then
            Dim cmd2 As New SqlCommand
            cmd2.CommandText = "delete from V143 where id = @id"
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