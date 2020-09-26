Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class v_1_5_8
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Email") = "") Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                bindData()
            End If
        End If
    End Sub

    Public Sub bindData()
        Dim obj As New GenericClass
        obj.fillGrid("Select id, medications, effects, recommandations, createdon from V158 where email = '" & Session("Email").ToString() & "'", GridV115)
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim res As Boolean = False
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString

        If (btnSubmit.Text = "SAVE") Then

            Using con As New SqlConnection(constring)
                Using cmd As New SqlCommand("sp_158", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@email", Session("Email").ToString())
                    cmd.Parameters.AddWithValue("@medications", txtTypeOfMedi.Text)
                    cmd.Parameters.AddWithValue("@effects", txtEffets.Text)
                    cmd.Parameters.AddWithValue("@recommandations", txtRecommand.Text)


                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                    res = True
                End Using
            End Using

        ElseIf (btnSubmit.Text = "UPDATE")
            Dim _Generic As New GenericClass
            Dim sqlCmd = New SqlCommand()
            sqlCmd.CommandText = "UPDATE V158 SET medications = @M, effects = @E, recommandations = @R WHERE id = @ID"
            sqlCmd.Parameters.AddWithValue("@M", txtTypeOfMedi.Text)
            sqlCmd.Parameters.AddWithValue("@E", txtEffets.Text)
            sqlCmd.Parameters.AddWithValue("@R", txtRecommand.Text)
            sqlCmd.Parameters.AddWithValue("@ID", hiddenId.Value)
            res = _Generic.SaveDataFromCmd(sqlCmd)
        End If



        If (res) Then
            btnSubmit.Text = "SAVE"
            Response.Redirect("v-1-5-8.aspx")
        End If
    End Sub

    Protected Sub lnkPrint_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument


        Dim url As String = "printv158.aspx?id=" & v126Id
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1080,height=720,left=100,top=100,resizable=yes');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)

    End Sub

    Protected Sub lnkEdit_Click(sender As Object, e As EventArgs)
        Dim v126Id As String = TryCast(sender, LinkButton).CommandArgument

        bindDataForEdit(v126Id)
        btnSubmit.Text = "UPDATE"

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "showModal();", True)
    End Sub


    Public Sub bindDataForEdit(ByVal _id As String)
        Dim constring As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constring)
            Using cmd As New SqlCommand("Select v.id, v.medications, v.effects, v.recommandations, c.name from V158 as v inner join CustomerMaster as c on v.email = c.email where v.id = '" & _id & "'", con)

                cmd.CommandType = CommandType.Text
                con.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader

                If (dr.HasRows) Then
                    While (dr.Read())


                        txtTypeOfMedi.Text = dr("medications").ToString()
                        txtEffets.Text = dr("effects").ToString()
                        txtRecommand.Text = dr("recommandations").ToString()
                    End While
                End If
                con.Close()

            End Using
        End Using
    End Sub


    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteV137(ByVal id As String) As String
        Dim result As String = Nothing
        Dim tbl1 As Boolean = False
        Dim tbl2 As Boolean = False
        Dim Gen As New GenericClass
        Dim cmd As New SqlCommand

        cmd.CommandText = "Delete from V158 where id =  @id"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.CommandType = CommandType.Text
        tbl1 = Gen.SaveDataFromCmd(cmd)
        result = "Success"

        Return result
    End Function
End Class