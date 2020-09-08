Imports System.Data.SqlClient

Public Class MembersListFrm
    Inherits System.Web.UI.Page
    Dim _generic As New GenericClass

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

    Protected Sub btnGenerate_Click(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Dim _email As String = Nothing
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SElect email from CustomerMaster where IsRegister = 0")
                cmd.Connection = con
                con.Open()
                Dim sdr As SqlDataReader = cmd.ExecuteReader()
                'Create a new DataSet.



                'Load DataReader into the DataTable.

                If (sdr.HasRows) Then
                    While (sdr.Read)
                        _email = sdr("email").ToString()
                        If (_email <> "") Then
                            _generic.SendEmail(_email)
                        End If
                    End While
                End If
                sdr.Close()

                con.Close()
            End Using
        End Using

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
        lblMessage.CssClass = "badge badge-success"
        lblMessage.Text = "Email sent to users"
    End Sub
End Class