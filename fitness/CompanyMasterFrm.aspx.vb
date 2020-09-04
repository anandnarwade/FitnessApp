Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class CompanyMasterFrm
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

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then
            Dim res As Boolean = False
            Dim id As Integer = 0
            Dim _action As String = String.Empty
            If (btnSave.Text = "SAVE") Then
                _action = "INSERT"
            Else
                id = Convert.ToInt64(hiddenId.Value)
                _action = "UPDATE"
            End If
            res = CompanyFunction(id, _action)

            If (res) Then
                Me.BindGrid()
                txtCompanyCode.Text = ""
                txtCmpName.Text = ""
                txtBranchCode.Text = ""
                txtBranchName.Text = ""
                txtShortCode.Text = ""
                txtAddress.Text = ""
                txtCity.Text = ""
                txtState.Text = ""
                btnSave.Text = "SAVE"
                lblMessage.Visible = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "Your data has been saved."
            End If
        End If
    End Sub


    Private Function CompanyFunction(ByVal id As Integer, ByVal action As String) As Boolean
        Dim result As Boolean = False
        Dim query As String = "sp_company"
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@CompanyCode", txtCompanyCode.Text)
                cmd.Parameters.AddWithValue("@CompanyName", txtCmpName.Text)
                cmd.Parameters.AddWithValue("@BranchCode", txtBranchCode.Text)
                cmd.Parameters.AddWithValue("@BranchName", txtBranchName.Text)
                cmd.Parameters.AddWithValue("@ShortCode", txtShortCode.Text)
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                cmd.Parameters.AddWithValue("@City", txtCity.Text)
                cmd.Parameters.AddWithValue("@State", txtState.Text)
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
        Dim query As String = "Select * from CompanyMaster order by id desc"
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    GridCompany.DataSource = dt
                    GridCompany.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs)
        Dim _id As String = TryCast(sender, LinkButton).CommandArgument

        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Select * from CompanyMaster where id = '" & _id & "'")
                cmd.Connection = con
                con.Open()
                Dim sdr As SqlDataReader = cmd.ExecuteReader()
                'Create a new DataSet.



                'Load DataReader into the DataTable.

                If (sdr.HasRows) Then
                    While (sdr.Read)
                        txtCompanyCode.Text = sdr("CompanyCode").ToString()
                        txtCmpName.Text = sdr("CompanyName").ToString()
                        txtBranchCode.Text = sdr("BranchCode").ToString()
                        txtBranchName.Text = sdr("BranchName").ToString()
                        txtShortCode.Text = sdr("ShortCode").ToString()
                        txtAddress.Text = sdr("Address").ToString()
                        txtCity.Text = sdr("City").ToString()
                        txtState.Text = sdr("State").ToString()
                        hiddenId.Value = sdr("Id").ToString()
                        btnSave.Text = "UPDATE"
                    End While
                End If
                sdr.Close()

                con.Close()
            End Using
        End Using
    End Sub
End Class