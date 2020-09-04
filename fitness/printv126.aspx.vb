Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class printv126
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
        obj.fillGrid("Select v.id, v.v126id, v.qid, q.sequence, q.question, v.answer from V126Transactions as v inner join QuestionsMaster as q on v.qid = q.id where q.type = 'V126' and v126id = '" & _id & "' order by q.sequence asc", GridParq)

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
            Using cmd As New SqlCommand("Select c.name, v.createdon, c.age, c.gender, v.physicianName, v.physicianPhone, v.emergencyContactPersonName, v.emergencyContactPersonPhone, v.MedicineDrugsAndReason, v.PhysicianKnowParticipation, v.PhysicalActivity from V126 as v inner join CustomerMaster as c on v.email = c.email where v.id = '" & _id & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        txtName.Text = dr("name").ToString()
                        txtDate.Text = DateTime.Now.ToString("dd-MMM-yyyy")
                        txtAge.Text = dr("age").ToString()
                        txtSex.Text = dr("gender").ToString()
                        txtphyName.Text = dr("physicianName").ToString()
                        txtphyNo.Text = dr("physicianPhone").ToString()
                        txtEmName.Text = dr("emergencyContactPersonName").ToString()
                        txtEmContact.Text = dr("emergencyContactPersonPhone").ToString()
                        txtmed.Text = dr("MedicineDrugsAndReason").ToString()
                        txtparticipting.Text = dr("PhysicianKnowParticipation").ToString()
                        txtphysicalAct.Text = dr("PhysicalActivity").ToString()
                    End While
                End If
                con.Close()

            End Using
        End Using
    End Sub

End Class