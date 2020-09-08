Imports System.Data.SqlClient
Imports System.Drawing

Public Class print137
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                Dim qryString As String = Request.QueryString("id")
                If (qryString <> "") Then
                    If Regex.IsMatch(qryString, "^[0-9 ]+$") Then
                        ' bindGrd(qryString)
                        'Select v.id, c.name, v.empEmail, v.CreatedOn , v.* from v137 as v inner join CustomerMaster as c on v.empEmail = c.email where v.id = 4
                        bindGrd(qryString)
                    End If

                End If
            End If
        End If
    End Sub

    Private Sub bindGrd(ByVal _id As String)

        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("Select v.id, c.name, v.empEmail, v.CreatedOn , v.* from v137 as v inner join CustomerMaster as c on v.empEmail = c.email where v.id = '" & _id & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        lblName.Text = dr("name").ToString()
                        lblDate.Text = DateTime.Now.ToString("dd-MMM-yy")
                        ddmExeRate.SelectedItem.Text = dr("RateExp").ToString()
                        ddmAthlete.SelectedItem.Text = dr("IsAthlete").ToString()
                        txtAthelete.Text = dr("IfAthleteY").ToString()
                        ddmNegFeeling.SelectedItem.Text = dr("IsNegFeeling").ToString()
                        txtNegFeelingY.Text = dr("IfNegFeelingY").ToString()
                        ddmNegFeelingE.SelectedItem.Text = dr("IsNegFeelingFit").ToString()
                        txtNegfeelE.Text = dr("IsNegFeelingFitY").ToString()
                        ddmStExe.SelectedItem.Text = dr("IsStartExe").ToString()
                        txtExeTime.Text = dr("ExeTime").ToString()
                        ddmExeUnit.SelectedItem.Text = dr("ExeUnit").ToString()

                        ddmRegExe.SelectedItem.Text = dr("RegIndExe").ToString()
                        txtRegExeY.Text = dr("IfRegIndExeY").ToString()
                        txtRegExeTime.Text = dr("RegIndExeTime").ToString()
                        ddmRegExeUnit.SelectedItem.Text = dr("RegIndExeUnit").ToString()
                        ddmPerExe.SelectedItem.Text = dr("RateRedIndExe").ToString()
                        txtExeMonths.Text = dr("ExeFromMonths").ToString()
                        txtExeYear.Text = dr("ExeFromYeasrs").ToString()
                        txtPartiMonths.Text = dr("ParticipatedOtherExeMonths").ToString()
                        txtPartiYears.Text = dr("ParticipatedOtherExeYears").ToString()
                        ddmExeWorkDay.SelectedItem.Text = dr("ExeDuringWRKDY").ToString()
                        ddmExeWorkInteJob.SelectedItem.Text = dr("ExeInterfereWithJob").ToString()
                        ddmExeWorkJob.SelectedItem.Text = dr("ExeBenefitJob").ToString()
                        txtPosi.Text = dr("WeightInc").ToString()
                        txtNeg.Text = dr("WeightDec").ToString()
                    End While
                End If
                con.Close()

            End Using
        End Using



    End Sub

    Protected Sub GridQ5_DataBound(sender As Object, e As EventArgs)
        Dim row As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal)
        Dim cell As New TableHeaderCell()
        cell.Text = "Questions"
        cell.ColumnSpan = 2
        row.Controls.Add(cell)

        cell = New TableHeaderCell()
        cell.ColumnSpan = 5
        cell.Text = "Circle the number that best applies"
        row.Controls.Add(cell)

        row.BackColor = ColorTranslator.FromHtml("#CED4DA")
        GridQ5.HeaderRow.Parent.Controls.AddAt(0, row)
    End Sub

    Protected Sub GridQ15_DataBound(sender As Object, e As EventArgs)
        Dim row As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal)
        Dim cell As New TableHeaderCell()
        cell.Text = "Questions"
        cell.ColumnSpan = 2
        row.Controls.Add(cell)

        cell = New TableHeaderCell()
        cell.ColumnSpan = 3
        cell.Text = "Not at all important"
        row.Controls.Add(cell)

        cell = New TableHeaderCell()
        cell.ColumnSpan = 4
        cell.Text = "Somewhat important"
        row.Controls.Add(cell)

        cell = New TableHeaderCell()
        cell.ColumnSpan = 3
        cell.Text = "Extremely important"
        row.Controls.Add(cell)

        row.BackColor = ColorTranslator.FromHtml("#CED4DA")
        GridQ15.HeaderRow.Parent.Controls.AddAt(0, row)
    End Sub


End Class