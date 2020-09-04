Imports System.Data.SqlClient

Public Class printV115
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qryString As String = Request.QueryString("id")
        If (qryString <> "") Then
            If Regex.IsMatch(qryString, "^[0-9 ]+$") Then
                bindGrd(qryString)
            End If

        End If

        If (Not IsPostBack) Then

        End If
    End Sub

    Private Sub bindGrd(ByVal _id As String)
        Dim obj As New GenericClass
        obj.fillGrid("Select v.id, v.v115Id, q.question, v.answer from V115Transactions as v inner join QuestionsMaster as q on v.qid = q.id where q.type='Par-q and you' and v.v115Id = '" & _id & "'", GridParq)

        If (GridParq.Rows.Count > 0) Then
            For Each row As GridViewRow In Me.GridParq.Rows
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


        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("SELECT * FROM V115 WHERE id = '" & _id & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        lblName.Text = dr("parentname").ToString
                        lblDate.Text = DateTime.Now.ToString("dd-MMM-yyyy")
                    End While
                End If
                con.Close()

            End Using
        End Using
    End Sub

End Class