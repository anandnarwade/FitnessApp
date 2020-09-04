Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class SpocMasterfrm
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
            res = SPOCFunction(id, _action)

            If (res) Then
                ddmCompany.SelectedIndex = 0
                txtspocName.Text = ""
                txtDesig.Text = ""
                txtEmail.Text = ""
                txtContactNo.Text = ""
                ddmCategory.SelectedIndex = 0
                btnSave.Text = "SAVE"
                hiddenId.Value = ""
                Me.BindGrid()
                lblMessage.Visible = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "Your data has been saved."
            End If

        End If
    End Sub

    Private Function SPOCFunction(ByVal id As Integer, ByVal action As String) As Boolean
        Dim result As Boolean = False
        Dim query As String = "sp_spoc"
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@companyId", ddmCompany.SelectedValue.ToString())
                cmd.Parameters.AddWithValue("@companyCode", Nothing)
                cmd.Parameters.AddWithValue("@branchCode", Nothing)
                cmd.Parameters.AddWithValue("@spocname", txtspocName.Text)
                cmd.Parameters.AddWithValue("@designation", txtDesig.Text)
                cmd.Parameters.AddWithValue("@spocemail", txtEmail.Text)
                cmd.Parameters.AddWithValue("@spoccontactno", txtContactNo.Text)
                cmd.Parameters.AddWithValue("@category", ddmCategory.Text)
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
        Dim query As String = "Select s.id, c.CompanyName, s.spocname, s.designation, s.spocemail, s.spoccontactno, s.category from SPOCmaster as s inner join CompanyMaster as c on s.companyId = c.id order by id desc"
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    GridSpoc.DataSource = dt
                    GridSpoc.DataBind()

                    If (GridSpoc.Rows.Count > 0) Then
                        GridSpoc.UseAccessibleHeader = True
                        GridSpoc.HeaderRow.TableSection = TableRowSection.TableHeader
                    End If
                End Using
            End Using
        End Using
    End Sub

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)
        Dim _id As String = TryCast(sender, LinkButton).CommandArgument

        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT * FROM SPOCmaster WHERE id = '" & _id & "'")
                cmd.Connection = con
                con.Open()
                Dim sdr As SqlDataReader = cmd.ExecuteReader()
                'Create a new DataSet.



                'Load DataReader into the DataTable.

                If (sdr.HasRows) Then
                    While (sdr.Read)
                        ddmCompany.SelectedValue = sdr("companyId").ToString()
                        txtspocName.Text = sdr("spocname").ToString()
                        txtDesig.Text = sdr("designation").ToString()
                        txtEmail.Text = sdr("spocemail").ToString()
                        txtContactNo.Text = sdr("spoccontactno").ToString()
                        ddmCategory.Text = sdr("category").ToString()

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