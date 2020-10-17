Imports System.Data.SqlClient

Public Class home
    Inherits System.Web.UI.Page

    Public Shared bodyCombot As String = Nothing
    Public Shared yoga As String = Nothing
    Public Shared zumba As String = Nothing

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
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("sELECT videoCategory,videoURL FROM VideoGallaryMaster WHERE isActive = 'true'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        If (dr("videoCategory").ToString() = "BODY COMBAT") Then
                            bodyCombot = dr("videoURL").ToString()
                        ElseIf (dr("videoCategory").ToString() = "ZUMBA")
                            zumba = dr("videoURL").ToString()

                        ElseIf (dr("videoCategory").ToString() = "YOGA")
                            yoga = dr("videoURL").ToString()
                        End If
                    End While
                End If
                con.Close()

            End Using
        End Using
    End Sub

End Class