Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class login
    Inherits System.Web.UI.Page

    Dim conStr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
    Dim con As New SqlConnection(conStr)
    Public Shared registerMode As Boolean = False





    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not IsPostBack) Then

        End If

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        If Page.IsValid Then
            Dim res As Boolean = False
            Dim name As String = Nothing

            Dim lgcmd As New SqlCommand("Select * from PasswordMaster inner join CustomerMaster on PasswordMaster.email = CustomerMaster.email  where PasswordMaster.email = @email and pwd = @pwd", con)
            lgcmd.CommandType = CommandType.Text
            lgcmd.Parameters.AddWithValue("@email", txtUserId.Text)
            lgcmd.Parameters.AddWithValue("@pwd", txtPassword.Text)
            con.Open()
            Dim dr As SqlDataReader = lgcmd.ExecuteReader()
            If (dr.HasRows) Then
                While (dr.Read)
                    res = True
                    name = dr("Name").ToString
                End While

            End If
            con.Close()
            lgcmd.Dispose()

            If (res) Then
                Session("Email") = txtUserId.Text
                Session("Name") = name
                Response.Redirect("home.aspx")
            End If



        End If
    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs)
        Me.registerMode = True
    End Sub

    Protected Sub btnSubmitRegistration_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then
            Dim gender As Int16 = 0
            Dim age As Int16
            Dim _dob As DateTime = Convert.ToDateTime(txtDob.Text)
            age = DateTime.Now.Year - _dob.Year

            If (rdoMale.Checked) Then
                gender = 1
            End If

            Try
                Dim cmd As New SqlCommand("sp_customer", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@id", Nothing)
                cmd.Parameters.AddWithValue("@custcode", DateTime.Now.ToString("ddMMyyHHmmss"))
                cmd.Parameters.AddWithValue("@name", txtName.Text)
                cmd.Parameters.AddWithValue("@email", txtEmail.Text)
                cmd.Parameters.AddWithValue("@mobile", txtMob.Text)
                cmd.Parameters.AddWithValue("@dob", txtDob.Text)
                cmd.Parameters.AddWithValue("@age", age)
                cmd.Parameters.AddWithValue("@gender", gender)
                cmd.Parameters.AddWithValue("@location", txtlocation.Text)
                cmd.Parameters.AddWithValue("@city", txtCity.Text)
                cmd.Parameters.AddWithValue("@state", txtState.Text)
                cmd.Parameters.AddWithValue("@reference", txtReferene.Text)
                cmd.Parameters.AddWithValue("@type", ddmType.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@orgname", txtOrgName.Text)
                cmd.Parameters.AddWithValue("@designation", txtDesignaton.Text)
                cmd.Parameters.AddWithValue("@dept", txtDept.Text)
                cmd.Parameters.AddWithValue("@business", txtbusiness.Text)
                cmd.Parameters.AddWithValue("@bussname", txtBusinessname.Text)
                cmd.Parameters.AddWithValue("@dailyroutine", txtDailyRoutine.Text)
                cmd.Parameters.AddWithValue("@spocname", txtSpocName.Text)
                cmd.Parameters.AddWithValue("@spocmob", txtspocContact.Text)
                cmd.Parameters.AddWithValue("@loginUser", "SELF")
                cmd.Parameters.AddWithValue("@action", "INSERT")

                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
                cmd.Dispose()
            Catch ex As Exception

            End Try
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        Me.registerMode = Not registerMode
    End Sub

    Protected Sub ddmType_SelectedIndexChanged(sender As Object, e As EventArgs)
        'if servic - orgName, designation, dept
        'if business - business type, business name, daily routine
        'if corporate- spoc name, contact no


    End Sub
End Class