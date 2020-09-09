Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class login
    Inherits System.Web.UI.Page

    Dim conStr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
    Dim con As New SqlConnection(conStr)
    Public Shared registerMode As Boolean = False
    Public Shared emailMobileVerified As Boolean = False
    Dim _generic As New GenericClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not IsPostBack) Then
            ' _generic.SendEmail("anand.narwade11@gmail.com")
        End If

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        If Page.IsValid Then
            Dim res As Boolean = False
            Dim name As String = Nothing

            Dim lgcmd As New SqlCommand("Select top 1 * from PasswordMaster inner join CustomerMaster on PasswordMaster.email = CustomerMaster.email  where PasswordMaster.email = @email and pwd = @pwd order by PasswordMaster.Id desc", con)
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

                Dim _generic As New GenericClass
                Dim IsAdmin As Boolean = _generic._IsExists("Select IsAdmin from CustomerMaster where email = '" & txtUserId.Text & "'")

                If (IsAdmin) Then
                    Session("Admin") = "Y"
                Else
                    Session("Admin") = "N"
                End If

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
        Me.registerMode = False
        Me.emailMobileVerified = False

    End Sub

    Protected Sub ddmType_SelectedIndexChanged(sender As Object, e As EventArgs)
        'if servic - orgName, designation, dept
        'if business - business type, business name, daily routine
        'if corporate- spoc name, contact no


    End Sub

    Protected Sub btnGenerat_Click(sender As Object, e As EventArgs)
        Me.registerMode = True
    End Sub

    Protected Sub btnFilled_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then

            If (hiddenOTP.Value = txtOTP.Text) Then

                Dim _email As String = txtPEmail.Text
                Dim _mobile As String = txtUMobile.Text
                Session("Email") = _email

                emailMobileVerified = True
            Else

                lblEmail.Text = "Invalid OTP"
            End If



            ' registerMode = False

        End If
    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If (args.Value.Count > 0) Then
            Dim _email As String = args.Value.ToString()

            Dim sqlCmd As New SqlCommand
            sqlCmd.CommandText = "Select * From CustomerMaster where email = @email and mobile = @mobile and IsRegister != 1"
            sqlCmd.Parameters.AddWithValue("@email", _email)
            sqlCmd.Parameters.AddWithValue("@mobile", txtUMobile.Text)

            Dim res As Boolean = _generic._IsExistsFromCMD(sqlCmd)
            If (res) Then

                args.IsValid = True

            Else
                CustomValidator1.ErrorMessage = "email not found!"
                args.IsValid = False
            End If
        Else
            CustomValidator1.ErrorMessage = "Please enter email address!"
            args.IsValid = False

        End If

    End Sub

    Protected Sub CustomValidator2_ServerValidate(source As Object, args As ServerValidateEventArgs)
        'MobileNoValidations
        If (args.Value.Count = 10) Then
            Dim _mobile As String = args.Value

            Dim sqlCmd As New SqlCommand
            sqlCmd.CommandText = "Select * From CustomerMaster where mobile = @mobile and email = @email and IsRegister != 1"
            sqlCmd.Parameters.AddWithValue("@mobile", _mobile)
            sqlCmd.Parameters.AddWithValue("@email", txtPEmail.Text)

            Dim res As Boolean = _generic._IsExistsFromCMD(sqlCmd)
            If (res) Then

                args.IsValid = True

            Else
                CustomValidator2.ErrorMessage = "mobile no. not found!"
                args.IsValid = False
            End If

        Else
            CustomValidator2.ErrorMessage = "Enter 10 digit mobile no."
            args.IsValid = False
        End If
    End Sub

    Protected Sub CustomPassword_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If (args.Value.Count > 8) Then
            Dim _password As String = args.Value
            Dim _Validate As Boolean = ValidatePassword(_password)
            If (_Validate) Then
                args.IsValid = True
            Else
                CustomPassword.ErrorMessage = "password is combination of 2 number, 2 Uppercase, 2 LowerCase, 2 SpecialChar"
                args.IsValid = False
            End If

        Else
            CustomPassword.ErrorMessage = "password should be 8 char long"
            args.IsValid = False
        End If
    End Sub

    Function ValidatePassword(ByVal pwd As String,
    Optional ByVal minLength As Integer = 8,
    Optional ByVal numUpper As Integer = 2,
    Optional ByVal numLower As Integer = 2,
    Optional ByVal numNumbers As Integer = 2,
    Optional ByVal numSpecial As Integer = 2) As Boolean

        ' Replace [A-Z] with \p{Lu}, to allow for Unicode uppercase letters.
        Dim upper As New System.Text.RegularExpressions.Regex("[A-Z]")
        Dim lower As New System.Text.RegularExpressions.Regex("[a-z]")
        Dim number As New System.Text.RegularExpressions.Regex("[0-9]")
        ' Special is "none of the above".
        Dim special As New System.Text.RegularExpressions.Regex("[^a-zA-Z0-9]")

        ' Check the length.
        If Len(pwd) < minLength Then Return False
        ' Check for minimum number of occurrences.
        If upper.Matches(pwd).Count < numUpper Then Return False
        If lower.Matches(pwd).Count < numLower Then Return False
        If number.Matches(pwd).Count < numNumbers Then Return False
        If special.Matches(pwd).Count < numSpecial Then Return False

        ' Passed all checks.
        Return True
    End Function

    Protected Sub btnSubmitPwd_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then
            If (Session("Email") <> "") Then

                Dim pwdSave As Boolean = False
                Dim IsReg As Boolean = False
                Dim sqlCmdPwd As New SqlCommand
                sqlCmdPwd.CommandText = "INSERT INTO PasswordMaster VALUES(@email, @pwd, 1)"
                sqlCmdPwd.CommandType = CommandType.Text

                sqlCmdPwd.Parameters.AddWithValue("@email", Session("Email").ToString())
                sqlCmdPwd.Parameters.AddWithValue("@pwd", txtNewPassword.Text)

                pwdSave = _generic.SaveDataFromCmd(sqlCmdPwd)


                Dim SqlResCmd As New SqlCommand
                SqlResCmd.CommandText = "UPDATE CustomerMaster SET IsRegister = 1 WHERE email = @email"
                SqlResCmd.Parameters.AddWithValue("@email", Session("Email").ToString())

                IsReg = _generic.SaveDataFromCmd(SqlResCmd)

                'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "<script>alert('Registration Success!');</script>", True)
                msg.Visible = True

                'lblMessage.Text = "Registration Success!"
                registerMode = False
                emailMobileVerified = False
                ' Response.Redirect("Login.aspx")

            End If
        End If
    End Sub

    Private Function GenerateOTP(sender As Object, e As EventArgs) As String
        Dim alphabets As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Dim small_alphabets As String = "abcdefghijklmnopqrstuvwxyz"
        Dim numbers As String = "1234567890"

        Dim characters As String = numbers
        'If rbType.SelectedItem.Value = "1" Then
        '    characters += Convert.ToString(alphabets & small_alphabets) & numbers
        'End If
        ' Dim length As Integer = Integer.Parse(ddlLength.SelectedItem.Value)
        Dim length As Integer = 4
        Dim otp As String = String.Empty
        For i As Integer = 0 To length - 1
            Dim character As String = String.Empty
            Do
                Dim index As Integer = New Random().Next(0, characters.Length)
                character = characters.ToCharArray()(index).ToString()
            Loop While otp.IndexOf(character) <> -1
            otp += character
        Next
        'lblOTP.Text = otp
        Return otp
    End Function

    Protected Sub txtSentOTP_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then

            hiddenOTP.Value = GenerateOTP(Nothing, Nothing)

            _generic.SendOTPOnEmail(txtPEmail.Text, hiddenOTP.Value)

        End If
    End Sub


End Class