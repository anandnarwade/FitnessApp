Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class print169
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
                        DisableControls(False)
                    End If

                End If
            End If
        End If
    End Sub


    Private Sub bindGrd(ByVal _id As String)

        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("SELECT V.id, C.name, V.* FROM V169 AS V INNER JOIN CustomerMaster AS C ON V.empEmail = C.email WHERE V.id = '" & _id & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        lblName.Text = dr("name").ToString()
                        txtRestHr.Text = dr("EssRestingHR").ToString()
                        txtExeHR.Text = dr("EssExerciseHR").ToString()
                        txtHRDate.Text = dr("EssHRDate").ToString()
                        ConvertToDtFormat(txtHRDate)
                        'If (txtHRDate.Text <> "") Then
                        '    Dim hrDt As Date = txtHRDate.Text
                        '    txtHRDate.Text = hrDt.ToString("dd-MM-yyyy")
                        'End If
                        txtHRDate.Enabled = False
                        txtRestingBP.Text = dr("EssRestingBP").ToString()

                        txtBpDate.Text = dr("EssRestingBPDate").ToString()
                        txtBCADate.Text = dr("BCADate").ToString()
                        ConvertToDtFormat(txtBpDate)
                        ConvertToDtFormat(txtBCADate)


                        txtWeightIB.Text = dr("WeightIb").ToString()
                        txtHeightIN.Text = dr("HeightIn").ToString()
                        txtWeightkg.Text = dr("WeightKg").ToString()
                        txtHeightm.Text = dr("HeightM").ToString()
                        txtBMI.Text = dr("BCABMI").ToString()
                        txtMenCest.Text = dr("SKMmenChest").ToString()
                        txtMenAbdomen.Text = dr("SKMmenAbdomen").ToString()
                        txtMenThigh.Text = dr("SKMmenThigh").ToString()
                        txtMenTotal.Text = dr("SKMmenTotal").ToString()
                        txtWomenTriceps.Text = dr("SKMwomenTriceps").ToString()
                        txtWomenSuprailium.Text = dr("SKMwomenSuprailium").ToString()
                        txtWomenThigh.Text = dr("SKMwomenThigh").ToString()
                        txtWomenTotal.Text = dr("SKMwomenTotal").ToString()
                        txtfatBodyEstimation.Text = dr("SKMBodyFatEst").ToString()
                        txtSKMDate.Text = dr("SKMDate").ToString()
                        ConvertToDtFormat(txtSKMDate)
                        txtGMDate.Text = dr("GMDate").ToString()
                        ConvertToDtFormat(txtGMDate)
                        txtAbdomen.Text = dr("GMAbdomen").ToString()
                        txtHip.Text = dr("GMHip").ToString()
                        txtWaist.Text = dr("GMWaist").ToString()
                        txtRaioWH.Text = dr("GMWaistToHipRatio").ToString()

                    End While
                End If
                con.Close()

            End Using
        End Using



    End Sub

    Public Sub ConvertToDtFormat(ByVal _txtControl As TextBox)
        If (_txtControl.Text <> "") Then
            Dim hrDt As Date = _txtControl.Text
            _txtControl.Text = hrDt.ToString("dd-MM-yyyy")
        End If
    End Sub

    Protected Sub DisableControls(ByVal State As Boolean)
        txtAbdomen.Enabled = False
        txtBCADate.Enabled = False
        txtBMI.Enabled = False
        txtBpDate.Enabled = False
        txtExeHR.Enabled = False
        txtfatBodyEstimation.Enabled = False
        txtGMDate.Enabled = False
        txtHeightIN.Enabled = False
        txtHeightm.Enabled = False
        txtHip.Enabled = False
        txtHRDate.Enabled = False
        txtMenAbdomen.Enabled = False
        txtMenCest.Enabled = False
        txtMenThigh.Enabled = False
        txtMenTotal.Enabled = False
        txtRaioWH.Enabled = False
        txtRestHr.Enabled = False
        txtRestingBP.Enabled = False
        txtSKMDate.Enabled = False
        txtWaist.Enabled = False
        txtWeightIB.Enabled = False
        txtWeightkg.Enabled = False
        txtWomenSuprailium.Enabled = False
        txtWomenThigh.Enabled = False
        txtWomenTotal.Enabled = False
        txtWomenTriceps.Enabled = False

    End Sub

End Class