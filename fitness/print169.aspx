<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="print169.aspx.vb" Inherits="fitness.print169" %>

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
                <div class="col-sm-10">
                    <h2><b>Essential Cardiovascular Assessment Results</b></h2>
                </div>
                 <div class="col-sm-2">
                   
                </div>
            </div>
        <hr />
            <br />


        <div class="row">
            <div class="col-sm-12">
                <b>Name :</b> <asp:Label ID="lblName" runat="server"></asp:Label>
            </div>
        </div>
        <hr />

        <div class="row">
            <div class="col-sm-12 text-center">
                <h5><b>Essential Cardiovascular Assessment Results</b></h5>
            </div>
        </div>
        <br />

    <div class="row">
        
        <div class="col-sm-6" style="border-right:1px solid #ced4da; ">
            <div class="row">
                 <div class="col-sm-6">
                     &nbsp;<br />
                <b>HEART RATE</b>
            </div>
            <div class="col-sm-6">
                <div>Date</div>
                <div>
                    <asp:TextBox ID="txtHRDate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                </div>
            </div>
            </div>

            <br />
              <div class="row">

        <div class="col-sm-6">
            <div>Resting Heart Rate</div>
            <div>
                <asp:TextBox ID="txtRestHr" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>
        <div class="col-sm-6">
            <div>Exercise Heart Rate</div>
            <div>
                <asp:TextBox ID="txtExeHR" runat="server" Font-Size="12px" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>



    </div>
           
        </div>
      
        <div class="col-sm-6">
            <div class="row">
                 <div class="col-sm-6">
                     &nbsp;<br />
                    <b>BLOOD PRESSURE</b>
                </div>
                <div class="col-sm-6">
                     <div>Date</div>
                    <div>
                        <asp:TextBox ID="txtBpDate" autocomplete="off" Font-Size="12px" runat="server" CssClass="form-control form-control-sm date"></asp:TextBox>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                 <div class="col-sm-6">
                    <div>Resting BP</div>
                    <div>
                        <asp:TextBox ID="txtRestingBP" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                </div>
            </div>
             
        </div>
    </div>

            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <h6><b>Body-composition Assessment Results</b> </h6>
                </div>

            </div>
            <br />
            <div class="row">
                
                 <div class="col-sm-6">
                     <div class="row">
                         <div class="col-sm-12">
                             &nbsp;<br />
                              <b>Height, Weight, and Body Mass Index</b>
                         </div>
                     </div>
                     <br />
                     <div class="row">
                         <div class="col-sm-6">
                             <div>Weight (lb)</div>
                             <div>
                                 <asp:TextBox ID="txtWeightIB" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                          <div class="col-sm-6">
                             <div>Height (in)</div>
                             <div>
                                 <asp:TextBox ID="txtHeightIN" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                     </div>
                    
                     

                      <div class="row">
                         <div class="col-sm-6">
                             <div>Weight (kg)</div>
                             <div>
                                 <asp:TextBox ID="txtWeightkg" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                          <div class="col-sm-6">
                             <div>Height (m)</div>
                             <div>
                                 <asp:TextBox ID="txtHeightm" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                         </div>
                     </div>
                    
                 </div>
               
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-6">
                            <div>Date</div>
                            <div>
                                <asp:TextBox ID="txtBCADate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-12">
                            &nbsp;<br />
                            &nbsp;<br />
                            
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-sm-6 text-right">
                            &nbsp;<br />
                           
                        </div>
                        <div class="col-sm-6">
                            <b>BMI</b> <br />
                            <asp:TextBox ID="txtBMI" ClientIDMode="Static" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                   
                    
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-6" style="border-right:1px solid #ced4da;">
                    <div class="row">
                        <div class="col-sm-8">
                             
                    <h6><b>Skinfold Measurements</b></h6>
                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                 <div class="col-sm-12">
                            <div>Date</div>
                            <div>
                                <asp:TextBox ID="txtSKMDate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                            </div>
                        </div>
                            </div>
                            
                        </div>
                    </div>
                    <hr />

                    <div class="row">
                        <div class="col-sm-6">
                            <b>MEN</b>
                        </div>
                        <div class="col-sm-6">
                            <b>WOMEN</b>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                             <div>Chest</div>
                             <div>
                                 <asp:TextBox ID="txtMenCest" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                         <div class="col-sm-6">
                             <div>Triceps</div>
                             <div>
                                 <asp:TextBox ID="txtWomenTriceps" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                             <div>Abdomen</div>
                             <div>
                                 <asp:TextBox ID="txtMenAbdomen" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                        <div class="col-sm-6">
                             <div>Suprailium</div>
                             <div>
                                 <asp:TextBox ID="txtWomenSuprailium" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="col-sm-6">
                             <div>Thigh</div>
                             <div>
                                 <asp:TextBox ID="txtMenThigh" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                        <div class="col-sm-6">
                             <div>Thigh</div>
                             <div>
                                 <asp:TextBox ID="txtWomenThigh" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-6">
                             <div>Total</div>
                             <div>
                                 <asp:TextBox ID="txtMenTotal" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                        <div class="col-sm-6">
                             <div>Total</div>
                             <div>
                                 <asp:TextBox ID="txtWomenTotal" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                             <div>% Body-fat estimation</div>
                             <div>
                                 <asp:TextBox ID="txtfatBodyEstimation" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                   
                </div>


                <div class="col-sm-6" style="padding-left:30px; padding-right:30px;">
                    <div class="row">
                        <div class="col-sm-12">

                       
                        <div class="row">
                            <div class="col-sm-8">

                                <h6><b>Girth Measurements</b></h6>
                            </div>
                            <div class="col-sm-4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div>Date</div>
                                        <div>
                                            <asp:TextBox ID="txtGMDate" Font-Size="12px" runat="server" autocomplete="off" CssClass="form-control form-control-sm date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>Abdomen</div>
                             <div>
                                 <asp:TextBox ID="txtAbdomen" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                            </div>
                        </div>
                      
                        <div class="row">
                             <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>HIP</div>
                             <div>
                                 <asp:TextBox ID="txtHip" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>Waist</div>
                             <div>
                                 <asp:TextBox ID="txtWaist" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm dec"></asp:TextBox>
                             </div>
                            </div>
                        </div>


                        <div class="row">
                             <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                 <div>Waist-to-Hip Ratio</div>
                             <div>
                                 <asp:TextBox ID="txtRaioWH" ClientIDMode="Static" Font-Size="12px" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             </div>
                            </div>
                        </div>
                       </div>
                    </div>
                </div>
            </div>

            
      
    </div>
    </form>
</body>
</html>
