Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports fitness.GenericClass
Public Class Par_q_and_you
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            bindData()
        End If
    End Sub

    Public Sub bindData()
        Dim obj As New GenericClass
        obj.fillGrid("SELECT id, question, sequence FROM QuestionsMaster WHERE type = 'Par-q and you' ORDER BY sequence ASC", GridParq)

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
    End Sub

End Class