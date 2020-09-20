Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.IO

Public Class GenericClass
    Dim conStr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
    Dim con As New SqlConnection(conStr)
    Public DataDr As SqlDataReader
    Dim portalUrl As String = ""
    Public Sub fillGrid(ByVal Qry As String, ByVal GridName As GridView)

        Dim sda As New SqlDataAdapter(Qry, con)
        Dim dt As New DataTable
        sda.Fill(dt)

        If (dt.Rows.Count > 0) Then
            GridName.DataSource = dt
            GridName.DataBind()
            GridName.UseAccessibleHeader = True
            GridName.HeaderRow.TableSection = TableRowSection.TableHeader

        End If

    End Sub

    Public Function SaveData(ByVal TableQry As String) As Boolean
        Dim ans As Boolean = True
        Try
            Dim cmd As New SqlCommand(TableQry, con)
            If con.State = Data.ConnectionState.Closed Then con.Open()
            cmd.ExecuteNonQuery()
            ans = True
        Catch ex As Exception
            ans = False
        Finally
            If con.State = Data.ConnectionState.Open Then con.Close()
        End Try
        Return ans
    End Function

    Public Function SaveDataFromCmd(ByVal cmd As SqlCommand) As Boolean
        Dim ans As Boolean = True
        Try
            cmd.Connection = con
            If con.State = Data.ConnectionState.Closed Then con.Open()
            cmd.ExecuteNonQuery()
            ans = True
        Catch ex As Exception
            ans = False
        Finally
            If con.State = Data.ConnectionState.Open Then con.Close()
        End Try
        Return ans
    End Function

    Public Function _IsExists(ByVal Qry As String) As Boolean
        Dim Result As Boolean
        Try
            Dim cmd As New SqlCommand(Qry, con)
            If con.State = ConnectionState.Closed Then
                con.Open()
            End If
            DataDr = cmd.ExecuteReader
            If (DataDr.HasRows = True) Then
                Result = True
            End If
            DataDr.Close()
        Catch ex As Exception
            Result = False
        End Try
        Return Result
    End Function

    Public Function _IsExistsFromCMD(ByVal cmd As SqlCommand) As Boolean
        Dim Result As Boolean
        Try
            cmd.Connection = con
            If con.State = ConnectionState.Closed Then
                con.Open()
            End If
            DataDr = cmd.ExecuteReader
            If (DataDr.HasRows = True) Then
                Result = True
            End If
            DataDr.Close()
        Catch ex As Exception
            Result = False
        End Try
        Return Result
    End Function

    Public Function _StrResult(ByVal Qry As String) As String
        Dim Result As String = Nothing
        Try
            Dim cmd As New SqlCommand(Qry, con)
            If con.State = ConnectionState.Closed Then
                con.Open()
            End If

            Result = cmd.ExecuteScalar().ToString()
            con.Close()
        Catch ex As Exception

        End Try

        Return Result
    End Function

    Public Function SpSaveData(ByVal Procedure As String, ByVal StrPra As String(), ByVal PraValues As String()) As Boolean
        Dim Result As Boolean
        Try
            con.Open()
            Dim cmd As New SqlCommand
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = Procedure
            For i As Integer = 0 To StrPra.Count - 1
                cmd.Parameters.AddWithValue(StrPra(i), PraValues(i))
            Next
            cmd.ExecuteNonQuery()
            Result = True
        Catch ex As Exception
            Result = False
        Finally
            con.Close()
        End Try
        Return Result
    End Function


    Public Sub SendEmail(ByVal recivermail As String)


        Dim _msg As New MailMessage()
        Dim _client As New SmtpClient()
        Try
            _msg.Subject = "Access Created in Fitness app portal"
            _msg.Body = "<div style='width:100%; font-family:'verdana';, font-size:12px;'><p>Dear User, <br/> your access has been created in fitness app portal. <br/> Below is the portal URL Kindly setup your account.<p> <br/> <br/> URL : '" & portalUrl & "' </div>"
            _msg.From = New MailAddress("mail.duedate@gmail.com")
            _msg.To.Add(recivermail)
            _msg.IsBodyHtml = True
            _client.Host = "smtp.gmail.com"
            Dim basicauthenticationinfo As New NetworkCredential("mail.duedate@gmail.com", "mail.due")
            _client.Port = Integer.Parse("587")
            _client.EnableSsl = True
            _client.UseDefaultCredentials = False
            _client.Credentials = basicauthenticationinfo
            _client.DeliveryMethod = SmtpDeliveryMethod.Network
            _client.Send(_msg)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub


    Private Function FileExists(ByVal FileFullPath As String) _
     As Boolean
        If Trim(FileFullPath) = "" Then Return False

        Dim f As New IO.FileInfo(FileFullPath)
        Return f.Exists

    End Function



    Public Sub SendEmailWithAttachments(ByVal recivermail As String, ByVal attPath As String)

        Dim AttachmentFile As String = ""
        Dim _msg As New MailMessage()
        Dim _client As New SmtpClient()
        Try
            _msg.Subject = "Access Created in Fitness app portal"
            _msg.Body = "<div style='width:100%; font-family:'verdana';, font-size:12px;'><p>Dear User, <br/> your access has been created in fitness app portal. <br/> Below is the portal URL Kindly setup your account.<p> <br/> <br/> URL : '" & portalUrl & "' </div>"
            _msg.From = New MailAddress("mail.duedate@gmail.com")
            _msg.To.Add(recivermail)
            _msg.IsBodyHtml = True

            Dim attach As New Net.Mail.Attachment(attPath)
            _msg.Attachments.Add(attach)
            ' Dim _file As New FileInfo(HttpContext.Server.MapPath("/files/MemberTemplate.xlsx"))
            'If FileExists(AttachmentFile) Then _
            '     _msg.Attachments.Add(AttachmentFile)
            '_msg.Attachments.Add()
            _client.Host = "smtp.gmail.com"
            Dim basicauthenticationinfo As New NetworkCredential("mail.duedate@gmail.com", "mail.due")
            _client.Port = Integer.Parse("587")
            _client.EnableSsl = True
            _client.UseDefaultCredentials = False
            _client.Credentials = basicauthenticationinfo
            _client.DeliveryMethod = SmtpDeliveryMethod.Network
            _client.Send(_msg)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub






    Public Sub SendOTPOnEmail(ByVal recivermail As String, ByVal OTP As String)


        Dim _msg As New MailMessage()
        Dim _client As New SmtpClient()
        Try
            _msg.Subject = "Access Created in Fitness app portal"
            _msg.Body = "<div style='width:100%; font-family:'verdana';, font-size:12px;'><p>Dear User, <br/> OTP for fitness app portal : <b>'" & OTP & "'</b> <br/> <p>   </div>"
            _msg.From = New MailAddress("mail.duedate@gmail.com")
            _msg.To.Add(recivermail)
            _msg.IsBodyHtml = True
            _client.Host = "smtp.gmail.com"
            Dim basicauthenticationinfo As New NetworkCredential("mail.duedate@gmail.com", "mail.due")
            _client.Port = Integer.Parse("587")
            _client.EnableSsl = True
            _client.UseDefaultCredentials = False
            _client.Credentials = basicauthenticationinfo
            _client.DeliveryMethod = SmtpDeliveryMethod.Network
            _client.Send(_msg)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub

    Public Function GenerateOTP() As String
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


    Public Function ValidatePassword(ByVal pwd As String,
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


End Class
