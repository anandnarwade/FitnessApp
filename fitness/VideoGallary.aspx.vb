Imports System.Data.SqlClient

Public Class VideoGallary
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                bindGrid()
            End If
        End If
    End Sub

    Public Sub bindGrid()
        Dim gen As New GenericClass
        gen.fillGrid("Select id, videoCategory as [Category], videoURL as [URL], isActive as [IsActive] from VideoGallaryMaster", GridVideo)
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)


        Dim baseurl As String = txtVideoURL.Text
        Dim url As String = Nothing

        Try
            baseurl = baseurl.Split("=")(1)
            baseurl.Remove(0)
            url = "https://www.youtube.com/embed/" & baseurl
        Catch ex As Exception

        End Try


        Dim isAc As Boolean = False
        If (chkActive.Checked = True) Then
            isAc = True
        Else
            isAc = False
        End If

        If (btnSave.Text = "Save") Then
            Dim res As Int16 = saveData(url, isAc)
        ElseIf (btnSave.Text = "UPDATE")
            If (url = "") Then
                url = txtVideoURL.Text
            End If
            Dim re2 As Int16 = UpdateData(url, isAc)
        End If

    End Sub

    Public Function saveData(ByVal url As String, ByVal isActive As Boolean) As Int16
        Dim i As Int16 = 0
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("INSERT INTO [dbo].[VideoGallaryMaster]([videoCategory],[videoURL],[isActive],[createdby],[createdOn]) VALUES (@category ,@url ,@isActive ,@createdBy,getdate())", con)
                cmd.CommandType = CommandType.Text


                cmd.Parameters.AddWithValue("@category", ddmCate.SelectedValue)
                cmd.Parameters.AddWithValue("@url", url)
                cmd.Parameters.AddWithValue("@isActive", isActive)
                cmd.Parameters.AddWithValue("@createdBy", Session("Email").ToString())
                ' cmd.Parameters("@v126").Direction = ParameterDirection.Output
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
                i = 1
                ddmCate.SelectedIndex = 0
                txtVideoURL.Text = ""
                chkActive.Checked = False
                btnSave.Text = "Save"
                bindGrid()
                ' trId = cmd.Parameters("@v126").Value
            End Using
        End Using


        Return i
    End Function


    Public Function UpdateData(ByVal url As String, ByVal isActive As Boolean) As Int16
        Dim i As Int16 = 0
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)

            Dim qrytxt As String = "UPDATE VideoGallaryMaster SET videoCategory = @category, videoURL = @url, isActive = @isActive , modifiedBy = @modi, modifiedOn = GETDATE() where id = @id;"
            If (isActive = True) Then
                qrytxt = qrytxt & " UPDATE VideoGallaryMaster SET isActive = 0 WHERE videoCategory = @category and id ! = @id"
            End If
            Using cmd As New SqlCommand(qrytxt, con)
                cmd.CommandType = CommandType.Text


                cmd.Parameters.AddWithValue("@category", ddmCate.SelectedValue)
                cmd.Parameters.AddWithValue("@url", url)
                cmd.Parameters.AddWithValue("@isActive", isActive)
                cmd.Parameters.AddWithValue("@modi", Session("Email").ToString())
                cmd.Parameters.AddWithValue("@id", hiddenId.Value)
                ' cmd.Parameters("@v126").Direction = ParameterDirection.Output
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    Throw ex
                End Try

                con.Close()
                i = 1
                ddmCate.SelectedIndex = 0
                txtVideoURL.Text = ""
                chkActive.Checked = False
                hiddenId.Value = ""
                btnSave.Text = "Save"
                bindGrid()
                ' trId = cmd.Parameters("@v126").Value
            End Using
        End Using


        Return i
    End Function

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)
        Dim id As String = TryCast(sender, LinkButton).CommandArgument
        hiddenId.Value = id
        bindData()
        btnSave.Text = "UPDATE"
        GridVideo.UseAccessibleHeader = True
        GridVideo.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub


    Public Sub bindData()
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("Select id, videoCategory, videoURL, isActive from VideoGallaryMaster where id = '" & hiddenId.Value & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())
                        ddmCate.SelectedValue = dr("videoCategory").ToString()
                        txtVideoURL.Text = dr("videoURL").ToString()
                        Dim isAc As Boolean = False
                        isAc = Convert.ToBoolean(dr("isActive").ToString())

                        chkActive.Checked = isAc
                    End While
                End If
                con.Close()

            End Using
        End Using
    End Sub
End Class