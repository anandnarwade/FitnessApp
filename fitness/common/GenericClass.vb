Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class GenericClass
    Dim conStr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
    Dim con As New SqlConnection(conStr)
    Public DataDr As SqlDataReader
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

End Class
