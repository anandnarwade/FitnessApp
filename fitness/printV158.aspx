<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="printV158.aspx.vb" Inherits="fitness.printV158" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="Content/bootswatch-united.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
               <div class="col-sm-12">
                   <h4 style="text-transform:uppercase"><center>Sample Medical Release Form</center></h4>
               </div>
                   
               
            </div>
            <div class="row">
                <div class="col-sm-12">
                      <p>
                    Date <asp:Label ID="lblDate" runat="server"></asp:Label> <br />
                    Dear Doctor:
                    Your patient, <asp:Label ID="lblName" runat="server"></asp:Label> wishes to start a personalized training program. The <br />
                    activity will involve the following <br />
                    <center>(type, frequency, duration, and intensity of activities)</center> <br />
                    If your patient is taking medications that will affect his or her exercise capacity or heart-rate response to exercise,
please indicate the manner of the effect (raises or lowers exercise capacity or heart-rate response):
                    <br />
                    Type of medication(s) <asp:Label ID="lblMedi" runat="server"></asp:Label> <br />
                    Effect(s) <asp:Label ID="lblEffects" runat="server"></asp:Label> <br />
                    Please identify any recommendations or restrictions that are appropriate for your patient in this exercise program:

                    <asp:Label ID="txtrecommand" runat="server"></asp:Label> <br />

                    Thank you.
                    Sincerely

                    <br />
                    <br />
                    _____________________________________________________________________ has my approval to begin an exercise program with
                the recommendations or restrictions stated above.

                    <br />
                    <br />
                    Signed_________________________   Date <asp:Label ID="lblDate2" runat="server"></asp:Label> Phone____________________

                </p>
                </div>
              
            </div>
        </div>
    </form>
</body>
</html>
