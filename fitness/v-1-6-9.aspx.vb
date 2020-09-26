Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class v_1_6_9
    Inherits System.Web.UI.Page

    Dim _generic As New GenericClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")

        Else
            If (Not IsPostBack) Then
                BindGrid()
            End If
        End If

    End Sub

    Protected Sub btnSubmitFrm_Click(sender As Object, e As EventArgs)
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            Dim result As Boolean = False
            Dim _action As String = Nothing

            If (btnSubmitFrm.Text = "Submit") Then
                _action = "INSERT"

            ElseIf (btnSubmitFrm.Text = "UPDATE")
                _action = "UPDATE"
            End If

            result = V169function(hiddenID.Value, _action)
            If (result) Then
                btnSubmitFrm.Text = "Submit"
                BindGrid()
                lblMessage.Visible = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "Your data has been saved."
            End If
        End If
    End Sub




    Private Function V169function(ByVal id As Integer, ByVal action As String) As Boolean
        Dim result As Boolean = False
        Dim query As String = "sp_v169"
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString


        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@empEmail", Session("Email").ToString())
                cmd.Parameters.AddWithValue("@EssRestingHR", txtRestHr.Text)
                cmd.Parameters.AddWithValue("@EssExerciseHR", txtExeHR.Text)
                cmd.Parameters.AddWithValue("@EssHRDate", txtHRDate.Text)
                cmd.Parameters.AddWithValue("@EssRestingBP", txtRestingBP.Text)
                cmd.Parameters.AddWithValue("@EssRestingBPDate", txtBpDate.Text)
                cmd.Parameters.AddWithValue("@BCADate", txtBCADate.Text)
                cmd.Parameters.AddWithValue("@WeightIb", txtWeightIB.Text)
                cmd.Parameters.AddWithValue("@HeightIn", txtHeightIN.Text)
                cmd.Parameters.AddWithValue("@WeightKg", txtWeightkg.Text)
                cmd.Parameters.AddWithValue("@HeightM", txtHeightm.Text)
                cmd.Parameters.AddWithValue("@BCABMI", txtBMI.Text)
                cmd.Parameters.AddWithValue("@SKMmenChest", txtMenCest.Text)
                cmd.Parameters.AddWithValue("@SKMmenAbdomen", txtMenAbdomen.Text)
                cmd.Parameters.AddWithValue("@SKMmenThigh", txtMenThigh.Text)
                cmd.Parameters.AddWithValue("@SKMmenTotal", txtMenTotal.Text)
                cmd.Parameters.AddWithValue("@SKMwomenTriceps", txtWomenTriceps.Text)
                cmd.Parameters.AddWithValue("@SKMwomenSuprailium", txtWomenSuprailium.Text)
                cmd.Parameters.AddWithValue("@SKMwomenThigh", txtWomenThigh.Text)
                cmd.Parameters.AddWithValue("@SKMwomenTotal", txtWomenTotal.Text)
                cmd.Parameters.AddWithValue("@SKMBodyFatEst", txtfatBodyEstimation.Text)
                cmd.Parameters.AddWithValue("@SKMDate", txtSKMDate.Text)
                cmd.Parameters.AddWithValue("@GMDate", txtGMDate.Text)
                cmd.Parameters.AddWithValue("@GMAbdomen", txtAbdomen.Text)
                cmd.Parameters.AddWithValue("@GMHip", txtHip.Text)
                cmd.Parameters.AddWithValue("@GMWaist", txtWaist.Text)
                cmd.Parameters.AddWithValue("@GMWaistToHipRatio", txtRaioWH.Text)


                cmd.Parameters.AddWithValue("@loginUser", Session("Email").ToString())
                cmd.Parameters.AddWithValue("@action", action)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
                result = True
            End Using
        End Using

        Return result
    End Function

    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Dim query As String = "Select v.id, name, email, v.createdon  from V169 as v inner join CustomerMaster as c on v.empEmail = c.email order by CreatedOn desc"
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    GridV169.DataSource = dt
                    GridV169.DataBind()
                    If (GridV169.Rows.Count > 0) Then
                        GridV169.UseAccessibleHeader = True
                        GridV169.HeaderRow.TableSection = TableRowSection.TableHeader
                    End If
                End Using
            End Using
        End Using
    End Sub

    Protected Sub lnkPrint_Click(sender As Object, e As EventArgs)
        Dim v169Id As String = TryCast(sender, LinkButton).CommandArgument


        Dim url As String = "print169.aspx?id=" & v169Id
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1080,height=720,left=100,top=100,resizable=yes');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)
    End Sub

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)
        Dim v169Id As String = TryCast(sender, LinkButton).CommandArgument
        hiddenID.Value = v169Id
        bindDataForEdit(v169Id)
        btnSubmitFrm.Text = "UPDATE"
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showModal();", True)
    End Sub



    Private Sub bindDataForEdit(ByVal _id As String)

        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("SELECT V.id, C.name, V.* FROM V169 AS V INNER JOIN CustomerMaster AS C ON V.empEmail = C.email WHERE V.id = '" & _id & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        '  lblName.Text = dr("name").ToString()
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

    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteV137(ByVal id As String) As String
        Dim result As String = Nothing
        Dim tbl1 As Boolean = False
        Dim tbl2 As Boolean = False
        Dim Gen As New GenericClass
        Dim cmd As New SqlCommand

        cmd.CommandText = "Delete from V169 where id =  @id"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.CommandType = CommandType.Text
        tbl1 = Gen.SaveDataFromCmd(cmd)
        result = "Success"

        Return result
    End Function
End Class