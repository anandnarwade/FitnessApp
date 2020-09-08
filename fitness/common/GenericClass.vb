Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net.Configuration
Imports System.Net
Imports System.Net.Mail

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


End Class
