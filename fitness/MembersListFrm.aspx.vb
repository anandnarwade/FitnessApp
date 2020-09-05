Imports System.Data.SqlClient

Public Class MembersListFrm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                Me.BindGrid()
            End If
        End If
    End Sub

    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Dim query As String = "Select  name as [Name], email as [Email], mobile as [Mobile], IsRegister from CustomerMaster order by id desc"
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    GridMembersList.DataSource = dt
                    GridMembersList.DataBind()
                End Using
            End Using
        End Using
    End Sub

End Class