<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fit.Master" CodeBehind="home.aspx.vb" Inherits="fitness.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="height:500px; ">
        <div class="col-sm-12">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="padding:10px;">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="banner/banner01.jpg" style="height:400px;" class="d-block w-100 img-fluid" alt="banner 1">
    </div>
    <div class="carousel-item">
      <img src="banner/banner02.jpg" style="height:400px" class="d-block w-100 img-fluid" alt="banner 1">
    </div>
    <div class="carousel-item">
      <img src="banner/banner03.jpg" style="height:400px" class="d-block w-100 img-fluid" alt="banner 1">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

        </div>

         

    </div>

    <div class="row">
        <div class="col-sm-4">
            <div class="card" style="padding-left:10px;">
                <div class="card-body">
                    <div class="row text-center" style="text-align:center;">
                        
                    <img class="img-fluid" src="banner/1.jpg" />
                    </div>
                    <hr />
                    <div class="row">
                        
                        <p style="text-align:center">
                            <b>BODY COMBAT</b> <br />
                            BodyCombat is the empowering cardio workout where you are totally unleashed. This fiercely ...
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="card" style="padding-left:10px;">
                <div class="card-body">
                    <div class="row text-center" style="text-align:center;">
                        
                    <img class="img-fluid" src="banner/2.jpg" />
                    </div>
                     <hr />
                    <div class="row">
                        
                        <p style="text-align:center">
                            <b>YOGA FITNESS</b> <br />
                            Whether you’re a regular yoga guru or are just starting out with the basics, Fitness Fir ...
                        </p>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-sm-4">
            <div class="card" style="padding-left:10px;">
                <div class="card-body">
                    <div class="row text-center" style="text-align:center;">
                        
                    
                        <img class="img-fluid" src="banner/3.jpg" />
                    
                    </div>
                     <hr />
                    <div class="row">
                        
                        <p style="text-align:center">
                            <b>ZUMBA FITNESS</b> <br />
                            This is the activity that everyone’s been talking about. Fun, hypnotic and easy-to-follo ...
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>
