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
            result = V169function(0, "INSERT")
            If (result) Then
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
End Class