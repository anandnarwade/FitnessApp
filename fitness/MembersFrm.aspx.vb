
Imports System.IO
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Configuration


Public Class MembersFrm
    Inherits System.Web.UI.Page
    Public Shared Uploaded As Boolean = False

    Dim _generic As New GenericClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                _generic.SaveData("delete from TempExcel")
            End If
        End If
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs)
        Dim dirPath As String = Server.MapPath("~/Files/" + DateTime.Now.ToString("yyyyMMddHHmmss") + "/")
        Dim excelPath As String = Path.Combine(dirPath, Path.GetFileName(FileUpload1.PostedFile.FileName))
        ' Dim excelPath As String = Server.MapPath(dirPath) + Path.GetFileName(FileUpload1.PostedFile.FileName)
        If (Not Directory.Exists(dirPath)) Then
            Directory.CreateDirectory(dirPath)
        End If
        FileUpload1.SaveAs(excelPath)

        Dim connString As String = String.Empty
        Dim extension As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
        Select Case extension
            Case ".xls"
                'Excel 97-03
                connString = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString
                Exit Select
            Case ".xlsx"
                'Excel 07 or higher
                connString = ConfigurationManager.ConnectionStrings("Excel07+ConString").ConnectionString
                Exit Select

        End Select
        connString = String.Format(connString, excelPath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()
            Dim dtExcelData As New DataTable()

            '[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            dtExcelData.Columns.AddRange(New DataColumn(5) {New DataColumn("SrNo", GetType(Integer)),
                                                        New DataColumn("Name", GetType(String)),
                                                        New DataColumn("Email", GetType(String)),
                                                        New DataColumn("Mobile", GetType(String)),
                                                        New DataColumn("CompanyCode", GetType(String)),
                                                        New DataColumn("BranchCode", GetType(String))})

            Using oda As New OleDbDataAdapter((Convert.ToString("SELECT * FROM [") & sheet1) + "]", excel_con)
                oda.Fill(dtExcelData)

            End Using
            excel_con.Close()

            Dim conString As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
            Using con As New SqlConnection(conString)
                Using sqlBulkCopy As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.TempExcel"

                    '[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("SrNo", "SrNo")
                    sqlBulkCopy.ColumnMappings.Add("Name", "Name")
                    sqlBulkCopy.ColumnMappings.Add("Email", "Email")
                    sqlBulkCopy.ColumnMappings.Add("Mobile", "Mobile")
                    sqlBulkCopy.ColumnMappings.Add("CompanyCode", "CompanyCode")
                    sqlBulkCopy.ColumnMappings.Add("BranchCode", "BranchCode")
                    con.Open()
                    sqlBulkCopy.WriteToServer(dtExcelData)
                    con.Close()

                    GridData.DataSource = dtExcelData
                    GridData.DataBind()


                    Uploaded = validateExel()
                    If (Not Uploaded) Then
                        lblMessage.Visible = True
                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
                        lblMessage.CssClass = "badge badge-danger"
                        lblMessage.Text = "Please correct red highlited rows and reupload file."
                    End If
                End Using
            End Using
        End Using
    End Sub

    Private Function validateExel() As Boolean
        Dim Result As Boolean = False
        If (GridData.Rows.Count > 0) Then
            For Each dr As GridViewRow In GridData.Rows
                Dim emailExists As Boolean = False
                Dim MobileExists As Boolean = False
                Dim ccExists As Boolean = False
                Dim BCExists As Boolean = False

                Dim lblEmail As Label = TryCast(dr.FindControl("lblEmail"), Label)
                Dim lblMobile As Label = TryCast(dr.FindControl("lblMobile"), Label)
                Dim lblCompanyCode As Label = TryCast(dr.FindControl("lblCompanyCode"), Label)
                Dim lblBranchCode As Label = TryCast(dr.FindControl("lblBranchCode"), Label)
                Dim chkOk As CheckBox = TryCast(dr.FindControl("chkOk"), CheckBox)

                emailExists = _generic._IsExists("Select * from CustomerMaster where email = '" & lblEmail.Text & "'")
                MobileExists = _generic._IsExists("Select * from CustomerMaster where mobile = '" & lblMobile.Text & "'")
                ccExists = _generic._IsExists("Select * from CompanyMaster where CompanyCode = '" & lblCompanyCode.Text & "'")
                If (emailExists) Then
                    lblEmail.ForeColor = System.Drawing.Color.Red
                End If

                If (MobileExists) Then
                    lblMobile.ForeColor = Drawing.Color.Red
                End If

                If (ccExists = False) Then
                    lblCompanyCode.ForeColor = Drawing.Color.Red
                End If

                If (emailExists = False) And (MobileExists = False) And ccExists = True Then
                    chkOk.Checked = True
                    Result = True


                Else
                    chkOk.Checked = False
                    Result = False

                End If


                chkOk.Enabled = False
            Next
        End If
        Return Result
    End Function

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim REsult As Boolean = False
        If (GridData.Rows.Count > 0) Then
            For Each dr As GridViewRow In GridData.Rows
                Dim Res As Boolean = False
                Dim lblEmail As Label = TryCast(dr.FindControl("lblEmail"), Label)
                Dim lblMobile As Label = TryCast(dr.FindControl("lblMobile"), Label)
                Dim lblCompanyCode As Label = TryCast(dr.FindControl("lblCompanyCode"), Label)
                Dim lblBranchCode As Label = TryCast(dr.FindControl("lblBranchCode"), Label)
                Dim lblName As Label = TryCast(dr.FindControl("lblName"), Label)

                Res = _generic.SaveData("INSERT INTO CustomerMaster (name, email, mobile, IsRegister, createdby, createdon) VALUES('" & lblName.Text & "', '" & lblEmail.Text & "', '" & lblMobile.Text & "', 0, '" & Session("Email").ToString() & "', GETDATE())")
                If (Res) Then
                    REsult = True
                Else
                    REsult = False
                End If

            Next

            If (REsult) Then
                lblMessage.Visible = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "file uploaded successfully"
            Else
                lblMessage.Visible = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
                lblMessage.CssClass = "badge badge-danger"
                lblMessage.Text = "file uploaded with errors"
            End If

            GridData.DataSource = Nothing
            GridData.DataBind()
        End If


    End Sub
End Class