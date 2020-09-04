Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class printV158
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

    Public Sub bindGrd(ByVal _id As String)
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("Select v.id, v.medications, v.effects, v.recommandations, c.name from V158 as v inner join CustomerMaster as c on v.email = c.email where v.id = '" & _id & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        lblDate.Text = DateTime.Now.ToString("dd-MMM-yyyy")
                        lblDate2.Text = DateTime.Now.ToString("dd-MMM-yyyy")
                        lblName.Text = dr("name").ToString()
                        lblMedi.Text = dr("medications").ToString()
                        lblEffects.Text = dr("effects").ToString()
                        txtrecommand.Text = dr("recommandations").ToString()
                    End While
                End If
                con.Close()

            End Using
        End Using
    End Sub



End Class