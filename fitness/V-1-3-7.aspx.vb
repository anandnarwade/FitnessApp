Imports System.Data.SqlClient
Imports System.Drawing

Public Class V_1_3_7
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                Me.BindGrid("Select v.id, c.name, v.empEmail, v.CreatedOn from v137 as v inner join CustomerMaster as c on v.empEmail = c.email", GridV137)
                Me.BindGrid("Select id,question, sequence from QuestionsMaster where type = 'v137' and subtype = 'Q5' order by sequence asc", GridQ5)
                Me.BindDataList("Select id ,question, sequence from QuestionsMaster where type = 'v137' and subtype = 'Q14' order by sequence asc", DLInterest)
                Me.BindGrid("Select id ,question, sequence from QuestionsMaster where type = 'v137' and subtype = 'Q15' order by sequence asc", GridQ15)
            End If
        End If
    End Sub


    Private Sub BindGrid(ByVal Qry As String, ByVal GridName As GridView)
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Dim query As String = Qry
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    GridName.DataSource = dt
                    GridName.DataBind()

                    If (GridV137.Rows.Count > 0) Then
                        GridV137.UseAccessibleHeader = True
                        GridV137.HeaderRow.TableSection = TableRowSection.TableHeader
                    End If
                End Using
            End Using
        End Using
    End Sub


    Private Sub BindDataList(ByVal Qry As String, ByVal DataListName As DataList)
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Dim query As String = Qry
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    DataListName.DataSource = dt
                    DataListName.DataBind()


                End Using
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

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            Dim _Id As Long = 0
            Dim _action As String = Nothing
            Dim result As Boolean = False

            If (btnSubmit.Text = "SAVE") Then
                _action = "INSERT"
            ElseIf (btnSubmit.Text = "UPDATE")
                _Id = hiddenId.Value
                _action = "UPDATE"
            End If

            result = V137function(_Id, _action)
            If (result) Then
                lblMessage.Visible = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel(); reload();", True)
                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "Your data has been saved."
            End If
        End If
    End Sub

    Private Function SaveQFive(ByVal _137Id As String) As Boolean
        Dim res As Boolean = False
        If (GridQ5.Rows.Count > 1) Then

            For Each row As GridViewRow In Me.GridQ5.Rows
                If (row.RowType = DataControlRowType.DataRow) Then
                    Dim lblQId As Label = TryCast(row.FindControl("lblQId"), Label)
                    Dim RdoOp1 As RadioButton = TryCast(row.FindControl("RdoOp1"), RadioButton)
                    Dim RdoOp2 As RadioButton = TryCast(row.FindControl("RdoOp2"), RadioButton)
                    Dim RdoOp3 As RadioButton = TryCast(row.FindControl("RdoOp3"), RadioButton)
                    Dim RdoOp4 As RadioButton = TryCast(row.FindControl("RdoOp4"), RadioButton)
                    Dim RdoOp5 As RadioButton = TryCast(row.FindControl("RdoOp5"), RadioButton)

                    Dim _rating As Integer

                    If (RdoOp1.Checked) Then
                        _rating = 1
                    ElseIf (RdoOp2.Checked)
                        _rating = 2
                    ElseIf (RdoOp3.Checked)
                        _rating = 3
                    ElseIf (RdoOp4.Checked)
                        _rating = 4
                    ElseIf (RdoOp5.Checked)
                        _rating = 5
                    End If
                    If (lblQId.Text <> "") Then
                        'res = saveTransactions(_137Id, lblQId.Text, "Q5", _rating)
                        res = saveTransactions(Convert.ToInt64(_137Id), Convert.ToInt32(lblQId.Text), "Q5", _rating.ToString())
                    End If

                End If



            Next

        End If
        Return res
    End Function


    Private Function SaveQ15(ByVal _137Id As String) As Boolean
        Dim res As Boolean = False
        If (GridQ15.Rows.Count > 1) Then

            For Each row As GridViewRow In Me.GridQ15.Rows
                If (row.RowType = DataControlRowType.DataRow) Then

                    Dim lblQId As Label = TryCast(row.FindControl("lblQId"), Label)
                    Dim RdoOp1 As RadioButton = TryCast(row.FindControl("RdoOp1"), RadioButton)
                    Dim RdoOp2 As RadioButton = TryCast(row.FindControl("RdoOp2"), RadioButton)
                    Dim RdoOp3 As RadioButton = TryCast(row.FindControl("RdoOp3"), RadioButton)
                    Dim RdoOp4 As RadioButton = TryCast(row.FindControl("RdoOp4"), RadioButton)
                    Dim RdoOp5 As RadioButton = TryCast(row.FindControl("RdoOp5"), RadioButton)
                    Dim RdoOp6 As RadioButton = TryCast(row.FindControl("RdoOp6"), RadioButton)
                    Dim RdoOp7 As RadioButton = TryCast(row.FindControl("RdoOp7"), RadioButton)
                    Dim RdoOp8 As RadioButton = TryCast(row.FindControl("RdoOp8"), RadioButton)
                    Dim RdoOp9 As RadioButton = TryCast(row.FindControl("RdoOp9"), RadioButton)
                    Dim RdoOp10 As RadioButton = TryCast(row.FindControl("RdoOp10"), RadioButton)


                    Dim _rating As Integer

                    If (RdoOp1.Checked) Then
                        _rating = 1
                    ElseIf (RdoOp2.Checked)
                        _rating = 2
                    ElseIf (RdoOp3.Checked)
                        _rating = 3
                    ElseIf (RdoOp4.Checked)
                        _rating = 4
                    ElseIf (RdoOp5.Checked)
                        _rating = 5
                    ElseIf (RdoOp6.Checked)
                        _rating = 6
                    ElseIf (RdoOp7.Checked)
                        _rating = 7
                    ElseIf (RdoOp8.Checked)
                        _rating = 8
                    ElseIf (RdoOp9.Checked)
                        _rating = 9
                    ElseIf (RdoOp10.Checked)
                        _rating = 10
                    End If

                    If (lblQId.Text <> "") Then
                        res = saveTransactions(Convert.ToInt64(_137Id), Convert.ToInt32(lblQId.Text), "Q15", _rating.ToString())
                    End If

                End If



            Next

        End If
        Return res
    End Function

    Private Function saveTransactions(ByVal _v137id As Long, ByVal _qid As Integer, ByVal _subQ As String, ByVal _ans As String) As Boolean
        Dim result As Boolean = False
        Dim query As String = "sp_137_Transactions"
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Dim _user As String = Session("Email").ToString()
        Dim Gen As New GenericClass
        Dim cmd As New SqlCommand
        cmd.CommandText = "INSERT INTO v137Transactions VALUES(@V137Id, @qid, @subQ, @Ans,@user ,getdate(), null, null)"
        cmd.Parameters.AddWithValue("@V137Id", _v137id)
        cmd.Parameters.AddWithValue("@qid", _qid)
        cmd.Parameters.AddWithValue("@subQ", _subQ)
        cmd.Parameters.AddWithValue("@Ans", _ans)
        cmd.Parameters.AddWithValue("@user", _user)
        result = Gen.SaveDataFromCmd(cmd)

        'Using con As SqlConnection = New SqlConnection(constr)
        '    Using cmd As SqlCommand = New SqlCommand(query)
        '        cmd.Connection = con
        '        cmd.CommandType = CommandType.StoredProcedure
        '        cmd.Parameters.AddWithValue("@id", 0)
        '        cmd.Parameters.AddWithValue("@v137id", _v137id)
        '        cmd.Parameters.AddWithValue("@qid", _qid)
        '        cmd.Parameters.AddWithValue("@subQ", _subQ)
        '        cmd.Parameters.AddWithValue("@Ans", Convert.ToString(_ans))
        '        cmd.Parameters.AddWithValue("@loginUser", Session("Email").ToString())
        '        con.Open()
        '        cmd.ExecuteNonQuery()
        '        con.Close()
        '        cmd.Dispose()
        '        result = True
        '    End Using
        'End Using
        Return result
    End Function


    Private Function SaveQ14(ByVal _v137id As String) As Boolean
        Dim result As Boolean = False

        If (DLInterest.Items.Count > 0) Then
            For Each row As DataListItem In DLInterest.Items
                Dim lblIntersetId As Label = TryCast(row.FindControl("lblIntersetId"), Label)
                Dim chkDlinterest As CheckBox = TryCast(row.FindControl("chkDlinterest"), CheckBox)



                If (chkDlinterest.Checked) Then
                    result = saveTransactions(_v137id, lblIntersetId.Text, "Q14", "1")
                End If
            Next
        End If

        Return result
    End Function

    Private Function V137function(ByVal id As Integer, ByVal action As String) As Boolean
        Dim result As Boolean = False
        Dim v137Id As Long = 0
        Dim query As String = "sp_v137"
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@empEmail", Session("Email").ToString())
                cmd.Parameters.AddWithValue("@RateExp", ddmExeRate.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@IsAthlete", ddmAthlete.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@IfAthleteY", txtAthelete.Text)
                cmd.Parameters.AddWithValue("@IsNegFeeling", ddmNegFeeling.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@IfNegFeelingY", txtNegFeelingY.Text)
                cmd.Parameters.AddWithValue("@IsNegFeelingFit", ddmNegFeelingE.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@IsNegFeelingFitY", txtNegfeelE.Text)
                cmd.Parameters.AddWithValue("@IsStartExe", ddmStExe.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@ExeTime", txtExeTime.Text)
                cmd.Parameters.AddWithValue("@ExeUnit", ddmExeUnit.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@RegIndExe", ddmRegExe.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@IfRegIndExeY", txtRegExeY.Text)
                cmd.Parameters.AddWithValue("@RegIndExeTime", txtRegExeTime.Text)
                cmd.Parameters.AddWithValue("@RegIndExeUnit", ddmRegExeUnit.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@RateRedIndExe", ddmPerExe.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@ExeFromMonths", txtExeMonths.Text)
                cmd.Parameters.AddWithValue("@ExeFromYeasrs", txtExeYear.Text)
                cmd.Parameters.AddWithValue("@ParticipatedOtherExeMonths", txtPartiMonths.Text)
                cmd.Parameters.AddWithValue("@ParticipatedOtherExeYears", txtPartiYears.Text)
                cmd.Parameters.AddWithValue("@ExeDuringWRKDY", ddmExeWorkDay.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@ExeInterfereWithJob", ddmExeWorkInteJob.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@ExeBenefitJob", ddmExeWorkJob.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@WeightInc", txtPosi.Text)
                cmd.Parameters.AddWithValue("@WeightDec", txtNeg.Text)
                cmd.Parameters.AddWithValue("@loginUser", Session("Email").ToString())
                cmd.Parameters.AddWithValue("@action", action)
                cmd.Parameters.AddWithValue("@v137Id", 0)
                cmd.Parameters("@v137Id").Direction = ParameterDirection.Output


                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()

                v137Id = cmd.Parameters("@v137Id").Value
                hiddenv137Id.Value = v137Id

                If (action = "UPDATE") Then
                    Dim _Gen As New GenericClass
                    _Gen.SaveData("Delete from v137Transactions where v137id = '" & id & "'")
                End If

                SaveQFive(hiddenv137Id.Value)
                SaveQ14(hiddenv137Id.Value)
                SaveQ15(hiddenv137Id.Value)

                result = True
            End Using
        End Using

        Return result
    End Function

    Protected Sub lnkPrint_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument


        Dim url As String = "print137.aspx?id=" & v126Id
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1080,height=720,left=100,top=100,resizable=yes');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)
    End Sub

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument
        hiddenId.Value = v126Id

        _fillDataForEdit(hiddenId.Value)

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showModal();", True)

    End Sub


    Private Sub _fillDataForEdit(ByVal _id As Integer)
        Dim sConnection As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using Con As New SqlConnection(sConnection)
            Con.Open()
            Using Com As New SqlCommand("SElect * from v137 where id = '" & _id & "'", Con)
                Using RDR = Com.ExecuteReader()
                    If RDR.HasRows Then
                        Do While RDR.Read
                            'txtName.Text = RDR.Item("Name").ToString()

                            ddmExeRate.SelectedValue = RDR.Item("RateExp").ToString()
                            ddmAthlete.SelectedItem.Text = RDR.Item("IsAthlete").ToString()
                            txtAthelete.Text = RDR.Item("IfAthleteY").ToString()
                            ddmNegFeeling.SelectedItem.Text = RDR.Item("IsNegFeeling").ToString()
                            txtNegFeelingY.Text = RDR.Item("IfNegFeelingY").ToString()
                            ddmNegFeelingE.SelectedItem.Text = RDR.Item("IsNegFeelingFit").ToString()
                            txtNegfeelE.Text = RDR.Item("IsNegFeelingFitY").ToString()
                            ddmStExe.SelectedItem.Text = RDR.Item("IsStartExe").ToString()
                            txtExeTime.Text = RDR.Item("ExeTime").ToString()
                            ddmExeUnit.SelectedItem.Text = RDR.Item("ExeUnit").ToString()
                            ddmRegExe.SelectedItem.Text = RDR.Item("RegIndExe").ToString()

                            txtRegExeTime.Text = RDR.Item("RegIndExeTime").ToString()
                            ddmRegExeUnit.SelectedItem.Text = RDR.Item("RegIndExeUnit").ToString()
                            txtRegExeY.Text = RDR.Item("IfRegIndExeY").ToString()
                            ddmPerExe.SelectedItem.Text = RDR.Item("RateRedIndExe").ToString()
                            txtExeMonths.Text = RDR.Item("ExeFromMonths").ToString()
                            txtExeYear.Text = RDR.Item("ExeFromYeasrs").ToString()
                            txtPartiMonths.Text = RDR.Item("ParticipatedOtherExeMonths").ToString()
                            txtPartiYears.Text = RDR.Item("ParticipatedOtherExeYears").ToString()
                            ddmExeWorkDay.SelectedItem.Text = RDR.Item("ExeDuringWRKDY").ToString()
                            ddmExeWorkInteJob.SelectedItem.Text = RDR.Item("ExeInterfereWithJob").ToString()

                            ddmExeWorkJob.SelectedItem.Text = RDR.Item("ExeBenefitJob").ToString()
                            txtPosi.Text = RDR.Item("WeightInc").ToString()
                            txtNeg.Text = RDR.Item("WeightDec").ToString()
                            btnSubmit.Text = "UPDATE"
                        Loop
                    End If
                End Using
            End Using
            Con.Close()


            Me.BindGrid("Select id,question, sequence from QuestionsMaster where type = 'v137' and subtype = 'Q5' order by sequence asc", GridQ5)


            Con.Open()
            Using Com2 As New SqlCommand("Select * from v137Transactions where subQ = 'Q5' and v137id = '" & _id & "'", Con)
                Using RDR = Com2.ExecuteReader()
                    If RDR.HasRows Then
                        Do While RDR.Read
                            Dim QId As String = RDR.Item("qid").ToString()
                            Dim Ans As String = RDR.Item("Ans").ToString()
                            If (GridQ5.Rows.Count > 2) Then
                                For Each row As GridViewRow In GridQ5.Rows


                                    Dim lblQId As Label = TryCast(row.FindControl("lblQId"), Label)
                                    Dim RdoOp1 As RadioButton = TryCast(row.FindControl("RdoOp1"), RadioButton)
                                    Dim RdoOp2 As RadioButton = TryCast(row.FindControl("RdoOp2"), RadioButton)
                                    Dim RdoOp3 As RadioButton = TryCast(row.FindControl("RdoOp3"), RadioButton)
                                    Dim RdoOp4 As RadioButton = TryCast(row.FindControl("RdoOp4"), RadioButton)
                                    Dim RdoOp5 As RadioButton = TryCast(row.FindControl("RdoOp5"), RadioButton)

                                    If (QId = lblQId.Text) Then
                                        Select Case Ans
                                            Case "1"
                                                RdoOp1.Checked = True
                                                Exit For

                                            Case "2"
                                                RdoOp2.Checked = True
                                                Exit For

                                            Case "3"
                                                RdoOp3.Checked = True
                                                Exit For

                                            Case "4"
                                                RdoOp4.Checked = True
                                                Exit For

                                            Case "5"
                                                RdoOp5.Checked = True
                                                Exit For

                                        End Select
                                    End If



                                Next
                            End If

                        Loop
                    End If
                End Using
            End Using
            Con.Close()




            Con.Open()
            Using Com3 As New SqlCommand("Select * from v137Transactions where subQ = 'Q14' and v137id = '" & _id & "'", Con)
                Using RDR = Com3.ExecuteReader()
                    If RDR.HasRows Then
                        Do While RDR.Read
                            Dim QId As String = RDR.Item("qid").ToString()
                            Dim Ans As String = RDR.Item("Ans").ToString()

                            If (DLInterest.Items.Count > 0) Then
                                For Each row As DataListItem In Me.DLInterest.Items
                                    Dim lblIntersetId As Label = TryCast(row.FindControl("lblIntersetId"), Label)
                                    Dim chkDlinterest As CheckBox = TryCast(row.FindControl("chkDlinterest"), CheckBox)
                                    Dim lbldlInterest As Label = TryCast(row.FindControl("lbldlInterest"), Label)

                                    If (QId = lblIntersetId.Text) Then

                                        chkDlinterest.Checked = True

                                    End If
                                Next
                            End If
                        Loop
                    End If
                End Using
            End Using
            Con.Close()


            Me.BindGrid("Select id ,question, sequence from QuestionsMaster where type = 'v137' and subtype = 'Q15' order by sequence asc", GridQ15)


            Con.Open()
            Using Com4 As New SqlCommand("Select * from v137Transactions where subQ = 'Q15' and v137id = '" & _id & "'", Con)
                Using RDR = Com4.ExecuteReader()
                    If RDR.HasRows Then
                        Do While RDR.Read
                            Dim QId As String = RDR.Item("qid").ToString()
                            Dim Ans As String = RDR.Item("Ans").ToString()

                            If (GridQ15.Rows.Count > 1) Then
                                For Each row As GridViewRow In Me.GridQ15.Rows
                                    Dim lblQId As Label = TryCast(row.FindControl("lblQId"), Label)

                                    Dim RdoOp1 As RadioButton = TryCast(row.FindControl("RdoOp1"), RadioButton)
                                    Dim RdoOp2 As RadioButton = TryCast(row.FindControl("RdoOp2"), RadioButton)
                                    Dim RdoOp3 As RadioButton = TryCast(row.FindControl("RdoOp3"), RadioButton)
                                    Dim RdoOp4 As RadioButton = TryCast(row.FindControl("RdoOp4"), RadioButton)
                                    Dim RdoOp5 As RadioButton = TryCast(row.FindControl("RdoOp5"), RadioButton)


                                    Dim RdoOp6 As RadioButton = TryCast(row.FindControl("RdoOp6"), RadioButton)
                                    Dim RdoOp7 As RadioButton = TryCast(row.FindControl("RdoOp7"), RadioButton)
                                    Dim RdoOp8 As RadioButton = TryCast(row.FindControl("RdoOp8"), RadioButton)
                                    Dim RdoOp9 As RadioButton = TryCast(row.FindControl("RdoOp9"), RadioButton)
                                    Dim RdoOp10 As RadioButton = TryCast(row.FindControl("RdoOp10"), RadioButton)


                                    If (QId = lblQId.Text) Then

                                        Select Case Ans
                                            Case "1"
                                                RdoOp1.Checked = True

                                            Case "2"
                                                RdoOp2.Checked = True
                                            Case "3"
                                                RdoOp3.Checked = True

                                            Case "4"
                                                RdoOp4.Checked = True

                                            Case "5"
                                                RdoOp5.Checked = True

                                            Case "6"
                                                RdoOp6.Checked = True

                                            Case "7"
                                                RdoOp7.Checked = True

                                            Case "8"
                                                RdoOp8.Checked = True

                                            Case "9"
                                                RdoOp9.Checked = True

                                            Case "10"
                                                RdoOp10.Checked = True

                                        End Select


                                    End If



                                Next
                            End If

                        Loop
                    End If
                End Using
            End Using
            Con.Close()


        End Using
    End Sub




    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteV137(ByVal id As String) As String
        Dim result As String = Nothing
        Dim tbl1 As Boolean = False
        Dim tbl2 As Boolean = False
        Dim Gen As New GenericClass
        Dim cmd As New SqlCommand

        cmd.CommandText = "Delete from v137Transactions where v137id = @id"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.CommandType = CommandType.Text
        tbl1 = Gen.SaveDataFromCmd(cmd)
        If (tbl1) Then
            Dim cmd2 As New SqlCommand
            cmd2.CommandText = "delete from v137 where id = @id"
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