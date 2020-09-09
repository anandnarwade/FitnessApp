Imports System.Data.SqlClient

Public Class forgotpwd
    Inherits System.Web.UI.Page

    Public Shared CreatePwd As Boolean = False


    Dim _generic As New GenericClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then

        End If
    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If (args.Value.Count > 0) Then
            Dim _email As String = args.Value.ToString()

            Dim sqlCmd As New SqlCommand
            sqlCmd.CommandText = "Select * From CustomerMaster where email = @email and mobile = @mobile "
            sqlCmd.Parameters.AddWithValue("@email", _email)
            sqlCmd.Parameters.AddWithValue("@mobile", txtUMobile.Text)

            Dim res As Boolean = _generic._IsExistsFromCMD(sqlCmd)
            If (res) Then

                args.IsValid = True

            Else
                CustomValidator1.ErrorMessage = "email id did not match!"
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
            sqlCmd.CommandText = "Select * From CustomerMaster where mobile = @mobile and email = @email"
            sqlCmd.Parameters.AddWithValue("@mobile", _mobile)
            sqlCmd.Parameters.AddWithValue("@email", txtPEmail.Text)

            Dim res As Boolean = _generic._IsExistsFromCMD(sqlCmd)
            If (res) Then

                args.IsValid = True

            Else
                CustomValidator2.ErrorMessage = "mobile no. did not found!"
                args.IsValid = False
            End If

        Else
            CustomValidator2.ErrorMessage = "Enter 10 digit mobile no."
            args.IsValid = False
        End If
    End Sub


    Protected Sub btnFilled_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then

            If (hiddenOTP.Value = txtOTP.Text) Then

                Dim _email As String = txtPEmail.Text
                Dim _mobile As String = txtUMobile.Text
                Session("Email") = _email
                CreatePwd = True

            Else

                lblOtpMsg.Text = "Invalid OTP"
            End If



            ' registerMode = False

        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub txtSentOTP_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then

            hiddenOTP.Value = _generic.GenerateOTP()

            _generic.SendOTPOnEmail(txtPEmail.Text, hiddenOTP.Value)

        End If
    End Sub

    Protected Sub btnSubmitPwd_Click(sender As Object, e As EventArgs)
        If (Page.IsValid) Then
            If (Session("Email") <> "") Then

                Dim pwdSave As Boolean = False
                Dim IsReg As Boolean = False
                Dim sqlCmdPwd As New SqlCommand
                Dim _Version As String = _generic._StrResult("Select ISNULL(max(version), 0) + 1 from PasswordMaster where email = '" & Session("Email").ToString() & "'")
                sqlCmdPwd.CommandText = "INSERT INTO PasswordMaster VALUES(@email, @pwd, '" & _Version & "')"
                sqlCmdPwd.CommandType = CommandType.Text

                sqlCmdPwd.Parameters.AddWithValue("@email", Session("Email").ToString())
                sqlCmdPwd.Parameters.AddWithValue("@pwd", txtNewPassword.Text)

                pwdSave = _generic.SaveDataFromCmd(sqlCmdPwd)






                'lblMessage.Text = "Registration Success!"
                CreatePwd = False
                'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "success();", True)
                msg.Visible = True
                ' Response.Redirect("Login.aspx")

            End If
        End If
    End Sub

    Protected Sub CustomPassword_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If (args.Value.Count > 8) Then
            Dim _password As String = args.Value
            Dim _Validate As Boolean = _generic.ValidatePassword(_password)
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

    Protected Sub btnTest2_Click(sender As Object, e As EventArgs)
        'ClientScript.RegisterStartupScript(Me.[GetType](), "", "success();", True)
        msg.Visible = True
        'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "success();", True)
    End Sub
End Class