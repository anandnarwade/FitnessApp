Imports System.Data.SqlClient

Public Class v1_1_5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                bindData()
                bindV115Grid()
            End If
        End If
    End Sub

    Public Sub bindData()
        Dim obj As New GenericClass
        obj.fillGrid("SELECT id, question, sequence FROM QuestionsMaster WHERE type = 'Par-q and you' ORDER BY sequence ASC", GridParq)
    End Sub

    Public Sub bindV115Grid()
        Dim obj As New GenericClass
        obj.fillGrid("Select v.id, c.name as [name], v.parentname, v.witnessname, v.createdon from V115 as v inner join CustomerMaster as c on v.email = c.email where v.email = '" & Session("Email").ToString() & "'", GridV115)
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
End Class