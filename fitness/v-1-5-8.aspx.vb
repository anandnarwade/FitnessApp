Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class v_1_5_8
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                bindData()
            End If
        End If
    End Sub

    Public Sub bindData()
        Dim obj As New GenericClass
        obj.fillGrid("Select id, medications, effects, recommandations, createdon from V158 where email = '" & Session("Email").ToString() & "'", GridV115)
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim res As Boolean = False
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("sp_158", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@email", Session("Email").ToString())
                cmd.Parameters.AddWithValue("@medications", txtTypeOfMedi.Text)
                cmd.Parameters.AddWithValue("@effects", txtEffets.Text)
                cmd.Parameters.AddWithValue("@recommandations", txtRecommand.Text)


                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
                res = True
            End Using
        End Using

        If (res) Then
            Response.Redirect("v-1-5-8.aspx")
        End If
    End Sub

    Protected Sub lnkPrint_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument


        Dim url As String = "printv158.aspx?id=" & v126Id
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1080,height=720,left=100,top=100,resizable=yes');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)

    End Sub
End Class