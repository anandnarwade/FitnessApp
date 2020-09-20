Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class CompanyMasterFrm
    Inherits System.Web.UI.Page

    Public Shared ShowSpoc As Boolean = False
    Public Shared ProCount As Boolean = False
    Public Shared showMember As Boolean = False


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else

            If (GridCompany.Rows.Count > 0) Then
                GridCompany.UseAccessibleHeader = True
                GridCompany.HeaderRow.TableSection = TableRowSection.TableHeader
            End If

            If (Not IsPostBack) Then
                ShowSpoc = False
                ProCount = False
                showMember = False
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
                ShowSpoc = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc();HideLabel();", True)
                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "Company Data has been saved successfully"

                ' ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc();", True)
            End If
        End If
    End Sub


    Private Function CompanyFunction(ByVal id As Integer, ByVal action As String) As Boolean
        Dim result As Boolean = False
        Dim CompanyId As Long = 0
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
                cmd.Parameters.AddWithValue("@CompanyId", CompanyId)

                cmd.Parameters("@CompanyId").Direction = ParameterDirection.Output
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()

                CompanyId = cmd.Parameters("@CompanyId").Value

                If (CompanyId > 0) Then
                    hiddenCompanyIdForSpoc.Value = CompanyId
                End If
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

                    If (GridCompany.Rows.Count > 0) Then
                        GridCompany.UseAccessibleHeader = True
                        GridCompany.HeaderRow.TableSection = TableRowSection.TableHeader
                    End If
                End Using
            End Using
        End Using
    End Sub


    Private Sub BindSpocGrid(ByVal id As Int32, ByVal typeId As Int32, ByVal GridName As GridView)
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Dim query As String = "Select s.id, c.CompanyName, s.spocname, s.designation, s.spocemail, s.spoccontactno, s.category from SPOCmaster as s inner join CompanyMaster as c on s.companyId = c.id where c.id = '" & id & "' and s.typeId = '" & typeId & "' order by id desc"
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    GridName.DataSource = dt
                    GridName.DataBind()

                    If (GridName.Rows.Count > 0) Then
                        GridName.UseAccessibleHeader = True
                        GridName.HeaderRow.TableSection = TableRowSection.TableHeader
                    End If
                End Using
            End Using
        End Using
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs)
        Dim _id As String = TryCast(sender, LinkButton).CommandArgument
        hiddenCompanyIdForSpoc.Value = _id

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

        Dim gen As New GenericClass
        txtPrapCnt.Text = gen._StrResult("Select PraposeCount from CompanyMemberCount where CompanyId = '" & _id & "'")
        ShowSpoc = True
        ProCount = True
        BindSpocGrid(_id, 2, GridSpoc)
        BindSpocGrid(_id, 3, GridMember)
        gen.fillGrid("SElect * from CompanyMemberCount where CompanyId = '" & _id & "'", GridCount)
        Me.BindGrid()
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); showMember(); ShowPrCount(); HideLabel();", True)
    End Sub

    Protected Sub btnAddSpoc_Click(sender As Object, e As EventArgs)
        If (Me.Page.IsValid) Then
            Dim res As Boolean = False
            Dim id As Integer = 0
            Dim ErrorCnt As Boolean = False
            Dim _action As String = String.Empty
            Dim typeId As Integer = 2

            If (btnAddSpoc.Text = "SAVE") Then
                If (GridSpoc.Rows.Count > 0) Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); HideLabel();", True)
                    lblMessage.Text = "SPOC already added"
                    lblMessage.CssClass = "badge badge-danger"
                    GridSpoc.UseAccessibleHeader = True
                    GridSpoc.HeaderRow.TableSection = TableRowSection.TableHeader
                    Exit Sub
                End If
                _action = "INSERT"
            Else
                id = Convert.ToInt64(hiddenSpocId.Value)
                _action = "UPDATE"
            End If
            res = SPOCFunction(id, _action, typeId, hiddenCompanyIdForSpoc.Value, txtspocName.Text, txtEmail.Text, txtContactNo.Text)

            If (res) Then
                'ddmCompany.SelectedIndex = 0
                txtspocName.Text = ""

                txtEmail.Text = ""
                txtContactNo.Text = ""

                btnAddSpoc.Text = "SAVE"

                Me.BindGrid()
                Me.BindSpocGrid(hiddenCompanyIdForSpoc.Value, 2, GridSpoc)
                Me.BindSpocGrid(hiddenCompanyIdForSpoc.Value, 3, GridMember)
                lblMessage.Visible = True
                ProCount = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); ShowPrCount(); HideLabel();", True)
                'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "", True)

                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "Your data has been saved."
            End If
        End If
    End Sub


    Private Function SPOCFunction(ByVal id As Integer, ByVal action As String, ByVal typeId As Integer, ByVal companyId As String, ByVal name As String, ByVal email As String, ByVal contactNo As String) As Boolean
        Dim result As Boolean = False
        Dim query As String = "sp_spoc"
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@companyId", companyId)
                cmd.Parameters.AddWithValue("@companyCode", Nothing)
                cmd.Parameters.AddWithValue("@branchCode", Nothing)
                cmd.Parameters.AddWithValue("@spocname", name)
                cmd.Parameters.AddWithValue("@designation", Nothing)
                cmd.Parameters.AddWithValue("@spocemail", email)
                cmd.Parameters.AddWithValue("@spoccontactno", contactNo)
                cmd.Parameters.AddWithValue("@category", Nothing)
                cmd.Parameters.AddWithValue("@typeId", typeId)
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

    Protected Sub btnTEst_Click(sender As Object, e As EventArgs)

        If (GridCompany.Rows.Count > 0) Then
            GridCompany.UseAccessibleHeader = True
            GridCompany.HeaderRow.TableSection = TableRowSection.TableHeader
        End If
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc();", True)
    End Sub

    Protected Sub btnSaveCount_Click(sender As Object, e As EventArgs)
        If (Me.Page.IsValid) Then
            If (hiddenCompanyIdForSpoc.Value.ToString <> "") Then
                Dim res As Boolean = False
                Dim _gen As New GenericClass
                If (btnSaveCount.Text = "SAVE") Then
                    Dim checkIfAlreadyExists As Boolean = False

                    checkIfAlreadyExists = _gen._IsExists("Select * from CompanyMemberCount where CompanyId = '" & hiddenCompanyIdForSpoc.Value & "'")

                    If (Not checkIfAlreadyExists) Then
                        res = MemberCountSave()
                    Else
                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); ShowPrCount(); HideLabel();", True)
                        lblMessage.Text = "Praposed count already added"
                        lblMessage.CssClass = "badge badge-danger"
                    End If


                    If (res) Then



                        'send mail to team member and spoc
                        Dim _filePath As String = Server.MapPath("/Files/MemberTemlate.xlsx")
                        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
                        Using con As New SqlConnection(constr)
                            Using cmd As New SqlCommand("SElect spocemail from SPOCmaster where companyId = '" & hiddenCompanyIdForSpoc.Value & "'")
                                cmd.Connection = con
                                con.Open()
                                Dim sdr As SqlDataReader = cmd.ExecuteReader()

                                If (sdr.HasRows) Then
                                    While (sdr.Read)
                                        Dim email As String = sdr.Item("spocemail").ToString()
                                        _gen.SendEmailWithAttachments(email, _filePath)


                                    End While
                                End If
                                sdr.Close()

                                con.Close()
                            End Using
                        End Using


                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)

                        lblMessage.CssClass = "badge badge-success"
                        lblMessage.Text = "Member Count Save Successfully."

                        Response.Redirect("MembersFrm.aspx")
                    End If

                ElseIf (btnSaveCount.Text = "UPDATE")
                    Dim sqlcmd As New SqlCommand
                    sqlcmd.CommandText = "UPDATE CompanyMemberCount SET PraposeCount = @PCNT, ApprovedCount = @ACNT, startdate = @SDATE, enddate = @EDATE WHERE Id = @Id"
                    sqlcmd.Parameters.AddWithValue("@PCNT", txtPrapCnt.Text)
                    sqlcmd.Parameters.AddWithValue("@ACNT", txtAppCnt.Text)
                    sqlcmd.Parameters.AddWithValue("@SDATE", txtStartDAte.Text)
                    sqlcmd.Parameters.AddWithValue("@EDATE", txtendDate.Text)
                    sqlcmd.Parameters.AddWithValue("@Id", hiddenCountId.Value)

                    res = _gen.SaveDataFromCmd(sqlcmd)

                    If (res) Then
                        txtAppCnt.Text = ""
                        txtPrapCnt.Text = ""
                        txtStartDAte.Text = ""
                        txtendDate.Text = ""
                        btnSaveCount.Text = ""
                        _gen.fillGrid("SElect * from CompanyMemberCount where CompanyId = '" & hiddenCompanyIdForSpoc.Value & "'", GridCount)

                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); showMember(); ShowPrCount(); HideLabel();", True)
                    End If
                End If

            End If
        Else
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); ShowPrCount(); HideLabel();", True)
        End If
    End Sub

    Public Function MemberCountSave() As Boolean


        Dim Result As Boolean = False

        Try
            Dim Query As String = "INSERT INTO [dbo].[CompanyMemberCount]([CompanyId],[PraposeCount],[ApprovedCount],[startdate],[enddate])VALUES(@CompanyId, @PraposeCount, @ApprovedCount, @StartDate, @EndDate)"


            Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString

            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand(Query)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@CompanyId", hiddenCompanyIdForSpoc.Value)
                    cmd.Parameters.AddWithValue("@PraposeCount", txtPrapCnt.Text)
                    cmd.Parameters.AddWithValue("@ApprovedCount", txtAppCnt.Text)
                    cmd.Parameters.AddWithValue("@StartDate", txtStartDAte.Text)
                    cmd.Parameters.AddWithValue("@EndDate", txtendDate.Text)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                    Result = True
                End Using
            End Using
        Catch ex As Exception

        End Try

        Return Result
    End Function

    Protected Sub lnkEditSpoc_Click(sender As Object, e As EventArgs)
        Dim _id As String = TryCast(sender, LinkButton).CommandArgument
        hiddenSpocId.Value = _id
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
                        hiddenCompanyIdForSpoc.Value = sdr("companyId").ToString()
                        txtspocName.Text = sdr("spocname").ToString()

                        txtEmail.Text = sdr("spocemail").ToString()
                        txtContactNo.Text = sdr("spoccontactno").ToString()
                        ' ddmCategory.Text = sdr("category").ToString()

                        'hiddenId.Value = sdr("Id").ToString()
                        btnAddSpoc.Text = "UPDATE"
                    End While
                End If
                sdr.Close()

                con.Close()
            End Using
        End Using
        If (GridSpoc.Rows.Count > 0) Then
            GridSpoc.UseAccessibleHeader = True
            GridSpoc.HeaderRow.TableSection = TableRowSection.TableHeader
        End If
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc();", True)
    End Sub



    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If (args.Value <> "") Then
            If (txtStartDAte.Text <> "") Then

                Dim startDAte = Convert.ToDateTime(txtStartDAte.Text)
                Dim EndDate = Convert.ToDateTime(txtendDate.Text)

                If (startDAte > EndDate) Then
                    args.IsValid = False
                    CustomValidator1.ErrorMessage = "End date should be greather than start date"
                Else
                    args.IsValid = True
                End If


            End If
        Else
            args.IsValid = False
            CustomValidator2.ErrorMessage = "End Date is required"
        End If
    End Sub

    Protected Sub btnAddMember_Click(sender As Object, e As EventArgs)
        If (Me.Page.IsValid) Then
            Dim memberId As Integer
            Dim result As Boolean = False
            Dim _action As String = Nothing
            Dim typeId As Int32 = 3
            If (btnAddMember.Text = "SAVE") Then
                _action = "INSERT"
                Dim _Gen As New GenericClass
                Dim cmd As New SqlCommand
                cmd.CommandText = "Select * from SPOCmaster where spocemail = @email or spoccontactno = @mob"
                cmd.Parameters.AddWithValue("@email", txtMemberEmail.Text)
                cmd.Parameters.AddWithValue("@mob", txtMemberMobile.Text)
                Dim IsAlreadyExists As Boolean = _Gen._IsExistsFromCMD(cmd)
                If (Not IsAlreadyExists) Then
                    result = SPOCFunction(memberId, _action, "3", hiddenCompanyIdForSpoc.Value, txtMemberName.Text, txtMemberEmail.Text, txtMemberMobile.Text)

                Else
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); showMember(); ShowPrCount(); HideLabel();", True)
                    'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "", True)

                    lblMessage.CssClass = "badge badge-danger"
                    lblMessage.Text = "Member already exists"
                End If
            ElseIf (btnAddMember.Text = "UPDATE")
                _action = "UPDATE"

                Dim isAlreadyExistsForUpdate = False
                Dim _Gen As New GenericClass
                Dim cmd As New SqlCommand
                cmd.CommandText = "Select * from SPOCmaster where spocemail = @email or spoccontactno = @mob and id != @id"
                cmd.Parameters.AddWithValue("@email", txtMemberEmail.Text)
                cmd.Parameters.AddWithValue("@mob", txtMemberMobile.Text)
                cmd.Parameters.AddWithValue("@id", hiddenMemberId.Value)

                isAlreadyExistsForUpdate = _Gen._IsExistsFromCMD(cmd)

                If (Not isAlreadyExistsForUpdate) Then
                    Dim mobileNo As String = txtMemberMobile.Text
                    result = SPOCFunction(hiddenMemberId.Value, _action, typeId, hiddenCompanyIdForSpoc.Value, txtMemberName.Text, txtMemberEmail.Text, mobileNo)
                End If


            End If

            If (result) Then
                btnAddMember.Text = "SAVE"
                txtMemberName.Text = ""
                txtMemberMobile.Text = ""
                txtMemberEmail.Text = ""
                Me.BindGrid()
                Me.BindSpocGrid(hiddenCompanyIdForSpoc.Value, 2, GridSpoc)
                Me.BindSpocGrid(hiddenCompanyIdForSpoc.Value, 3, GridMember)
                lblMessage.Visible = True
                ProCount = True
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); showMember(); ShowPrCount(); HideLabel();", True)
                'ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "", True)

                lblMessage.CssClass = "badge badge-success"
                lblMessage.Text = "Your data has been saved."
            End If
        End If
    End Sub

    Protected Sub lnkMemberEdit_Click(sender As Object, e As EventArgs)
        Dim _id As String = TryCast(sender, LinkButton).CommandArgument
        hiddenMemberId.Value = _id
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT * FROM SPOCmaster WHERE id = '" & _id & "'")
                cmd.Connection = con
                con.Open()
                Dim sdr As SqlDataReader = cmd.ExecuteReader()

                If (sdr.HasRows) Then
                    While (sdr.Read)
                        hiddenCompanyIdForSpoc.Value = sdr("companyId").ToString()
                        txtMemberName.Text = sdr("spocname").ToString()

                        txtMemberEmail.Text = sdr("spocemail").ToString()
                        txtMemberMobile.Text = sdr("spoccontactno").ToString()


                        'hiddenId.Value = sdr("Id").ToString()
                        btnAddMember.Text = "UPDATE"
                    End While
                End If
                sdr.Close()

                con.Close()
            End Using
        End Using
        If (GridMember.Rows.Count > 0) Then
            GridMember.UseAccessibleHeader = True
            GridMember.HeaderRow.TableSection = TableRowSection.TableHeader
        End If
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showMember();", True)


    End Sub

    Protected Sub CustomValidator3_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If (args.Value <> "") Then
            If (txtAppCnt.Text <> "" And txtPrapCnt.Text <> "") Then
                Dim prapose As Int16 = Convert.ToInt16(txtPrapCnt.Text)
                Dim appcnt As Int16 = Convert.ToInt16(txtAppCnt.Text)

                If (appcnt > prapose) Then
                    args.IsValid = False
                    CustomValidator3.ErrorMessage = "Approve count should be less than equal to prapose aount"
                Else
                    args.IsValid = True
                End If
            End If
        Else
            args.IsValid = False
            CustomValidator3.ErrorMessage = "Approve count is required"
        End If
    End Sub

    Protected Sub lnkCountEdit_Click(sender As Object, e As EventArgs)
        Dim _id As String = TryCast(sender, LinkButton).CommandArgument
        hiddenCountId.Value = _id

        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Select * from CompanyMemberCount where Id = '" & _id & "'")
                cmd.Connection = con
                con.Open()
                Dim sdr As SqlDataReader = cmd.ExecuteReader()

                If (sdr.HasRows) Then
                    While (sdr.Read)
                        hiddenCompanyIdForSpoc.Value = sdr("companyId").ToString()
                        txtPrapCnt.Text = sdr("PraposeCount").ToString()

                        txtAppCnt.Text = sdr("ApprovedCount").ToString()
                        txtStartDAte.Text = sdr("startdate").ToString()
                        txtendDate.Text = sdr("enddate").ToString()

                        'hiddenId.Value = sdr("Id").ToString()
                        btnSaveCount.Text = "UPDATE"
                    End While
                End If
                sdr.Close()

                con.Close()
            End Using
        End Using
        If (GridMember.Rows.Count > 0) Then
            GridMember.UseAccessibleHeader = True
            GridMember.HeaderRow.TableSection = TableRowSection.TableHeader
        End If
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showSpoc(); showMember(); ShowPrCount(); HideLabel();", True)



    End Sub
End Class