Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class printv143
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
        obj.fillGrid("Select v.id, v.v143id, v.qid, q.sequence, q.question, v.answer from V143Transactions as v inner join QuestionsMaster as q on v.qid = q.id where q.type = 'V143' and v143id = '" & _id & "' order by q.sequence asc", GridPrintV143)

        If (GridPrintV143.Rows.Count > 0) Then
            For Each row As GridViewRow In Me.GridPrintV143.Rows
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

End Class