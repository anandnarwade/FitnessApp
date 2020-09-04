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
            Dim rdoYes As RadioButton = TryCast(row.FindControl("RdoYes_"), RadioButton)
            Dim rdoNo As RadioButton = TryCast(row.FindControl("RdoNo_"), RadioButton)

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
            Dim rdoY As RadioButton = TryCast(row.FindControl("RdoYes_"), RadioButton)
            Dim rdoN As RadioButton = TryCast(row.FindControl("RdoNo_"), RadioButton)
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
End Class