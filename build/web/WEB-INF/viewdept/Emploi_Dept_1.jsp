<%-- 
    Document   : Emploi_Dept
    Created on : 26 avr. 2017, 19:14:10
    Author     : Azough Mehdi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>
    <script src="js/jquery-3.2.1.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

    <!-- Flot Charts JavaScript -->
    <!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="js/plugins/flot/flot-data.js"></script>
    

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Social Buttons CSS -->
    <link href="../vendor/bootstrap-social/bootstrap-social.css" rel="stylesheet">
     <link href="css/mycss.css" rel="stylesheet">

       <!-- jQuery -->
   <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>    <!-- Bootstrap Core JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="js/testjs.js" ></script>
    

  

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><logo>SwapMyLecture</logo></a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index_dept.html"><i class="fa fa-fw fa-dashboard"></i>Emplois du temps</a>
                    </li>
                    <li >
                        <a href="mat_dept.html"><i class="fa fa-book"></i>Matières</a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-users"></i>Groupes</a>
                    </li>          
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

             <!-- /.row -->

             
            <div class="row">
                <div class="col-lg-9">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            EMPLOI DU TEMPS
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">    
                                <!-- /.liste niveau -->
                                 <div class="col-lg-2">
                                <label> Semestre</label>
                                <select id="semestres" class="form-control">
                                 <option>1</option>
                                 <option>2 </option>
                                 <option>3</option>
                                 <option>4</option>
                                 <option>5</option>
                                 <option>6</option>
                                </select>
                                 </div>
                                 <!-- /.liste Semestre -->
                                 <div class="col-lg-2">
                                
                                <label>Groupe</label>
                                <select  id="groupes" class="form-control">
                                 
                                </select>
                                 </div>
                                <div class="col-lg-5">
                                                      <!-- /popun supprimer -->
                                                      <br>
    <button id="enregister" type="button" class="btn btn-primary active">Enregistrer tout</button>
       <div id="supprimer" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Confirmation</h4>
            </div>
            <div class="modal-body">
                <p>Etes-vous sûr de vouloir supprimer la séance dans cette séance du Mardi 7 Avril 2017 de 14h à 16h ?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Supprimer</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
            </div>
        </div>
    </div>
</div> 
    
<br>
                                </div>

                            </div>
                                  <br>
                                  
                            <div class="table-responsive">
                                <table class="table table-bordered ">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>8h-10h</th>
                                            <th>10h-12h</th>
                                            <th>14h-16h</th>
                                            <th>16h-18h</th>
                                        </tr>
                                    </thead>
                                   <tbody class="myradio-group">
                                        <tr>
                                            <td>LUNDI</td>
                                            <td class="myradio" id="1">
                                                <span style ="display: none; " id="<c:out value='${(empHashMap["lundi"])["8"].numEmp}'></c:out>" ></span>
                                                <span id="matiere1"><c:out value='${(empHashMap["lundi"])["8"].numM.nomM}'></c:out></span>
                                                <br>
                                                <span id="enseignant1"><c:out value="${(empHashMap['lundi'])['8'].numE.nom}"></c:out></span>
                                                <br>
                                                <span id="sd1"></span>
                                                <span id="sf1"></span>
                                            </td>
                                            <td class="emp2" id="2">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere2"></span>
                                                <br>
                                                <span id="enseignant2"></span>
                                                <br>
                                                <span id="sd2"></span>
                                                <span id="sf2"></span>
                                            </td>
                                            <td class="myradio" id="3">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere3"></span>
                                                <br>
                                                <span id="enseignant3"></span>
                                                <br>
                                                <span id="sd3"></span>
                                                <span id="sf3"></span>
                                            </td>
                                            <td class="myradio" id="4">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere4"></span>
                                                <br>
                                                <span id="enseignant4"></span>
                                                <br>
                                                <span id="sd4"></span>
                                                <span id="sf4"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MARDI</td>
                                            <td class="myradio" id="5">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere5"></span>
                                                <br>
                                                <span id="enseignant5"></span>
                                                <br>
                                                <span id="sd5"></span>
                                                <span id="sf5"></span>
                                            </td>
                                            <td class="myradio" id="6">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere6"></span>
                                                <br>
                                                <span id="enseignant6"></span>
                                                <br>
                                                <span id="sd6"></span>
                                                <span id="sf6"></span>
                                            </td>
                                            <td class="myradio" id="7">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere7"></span>
                                                <br>
                                                <span id="enseignant7"></span>
                                                <br>
                                                <span id="sd7"></span>
                                                <span id="sf7"></span>
                                            </td>
                                            <td class="myradio" id="8">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere8"></span>
                                                <br>
                                                <span id="enseignant8"></span>
                                                <br>
                                                <span id="sd8"></span>
                                                <span id="sf8"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MERCREDI</td>
                                            <td class="myradio" id="9">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere9"></span>
                                                <br>
                                                <span id="enseignant9"></span>
                                                <br>
                                                <span id="sd9"></span>
                                                <span id="sf9"></span>
                                            </td>
                                           <td class="myradio" id="10">
                                               <span style ="display: none; "id=""></span>
                                                <span id="matiere10"></span>
                                                <br>
                                                <span id="enseignant10"></span>
                                                <br>
                                                <span id="sd10"></span>
                                                <span id="sf10"></span>
                                            </td>
                                            <td class="myradio" id="11">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere11"></span>
                                                <br>
                                                <span id="enseignant11"></span>
                                                <br>
                                                <span id="sd11"></span>
                                                <span id="sf11"></span>
                                            </td>
                                            <td class="myradio" id="12">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere12"></span>
                                                <br>
                                                <span id="enseignant12"></span>
                                                <br>
                                                <span id="sd12"></span>
                                                <span id="sf12"></span>
                                            </td>
                                        </tr>
                                         
                                            <td>JEUDI</td>
                                           <td class="myradio" id="13">
                                               <span style ="display: none; "id=""></span>
                                                <span id="matiere13"></span>
                                                <br>
                                                <span id="enseignant13"></span>
                                                <br>
                                                <span id="sd13"></span>
                                                <span id="sf13"></span>
                                            </td>
                                            <td class="myradio" id="14">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere14"></span>
                                                <br>
                                                <span id="enseignant14"></span>
                                                <br>
                                                <span id="sd14"></span>
                                                <span id="sf14"></span>
                                            </td>
                                            <td class="myradio" id="15">
                                               <span style ="display: none; "id=""></span>
                                                <span id="matiere15"></span>
                                                <br>
                                                <span id="enseignant15"></span>
                                                <br>
                                                <span id="sd15"></span>
                                                <span id="sf15"></span>
                                            </td>
                                            <td class="myradio" id="16">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere16"></span>
                                                <br>
                                                <span id="enseignant16"></span>
                                                <br>
                                                <span id="sd16"></span>
                                                <span id="sf16"></span>
                                            </td>
                                         <tr>
                                            <td>VENDREDI</td>
                                            <td class="myradio" id="17">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere17"></span>
                                                <br>
                                                <span id="enseignant17"></span>
                                                <br>
                                                <span id="sd17"></span>
                                                <span id="sf17"></span>
                                            </td>
                                            </td>
                                            <td class="myradio" id="18">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere18"></span>
                                                <br>
                                                <span id="enseignant18"></span>
                                                <br>
                                                <span id="sd18"></span>
                                                <span id="sf18"></span>
                                            </td>
                                            <td class="myradio" id="19">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere19"></span>
                                                <br>
                                                <span id="enseignant19"></span>
                                                <br>
                                                <span id="sd19"></span>
                                                <span id="sf19"></span>
                                            </td>
                                            <td class="myradio" id="20">
                                                <span style ="display: none; "id=""></span>
                                                <span id="matiere20"></span>
                                                <br>
                                                <span id="enseignant20"></span>
                                                <br>
                                                <span id="sd20"></span>
                                                <span id="sf20"></span>
                                            </td>
                                                </div>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Paramètres Séance
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            

                         <div class="form-group">
                                <label>Semaine début</label>
                                <select class="form-control" id="sdselect">
                                 
                                </select>
                             </div>

                         <div class="form-group">
                                <label>Semaine fin</label>
                                <select class="form-control" id="sfselect">
                                 
                                </select>
                             </div>

                         <div class="form-group">
                                <label>Matière</label>
                                <select class="form-control" id="matiereselect">
                                 
                                </select>
                             </div>

                         <div class="form-group">
                                <label>Enseignant</label>
                                <select class="form-control" id="enseignantselect">
                                
                                </select>
                             </div>
                               
                            </div>
             <!-- /.table-responsive -->

            <!-- /boutons crud -->
     <div class="text-center">
   <div class="btn-group-vertical">
      <button type="button" id="reset" class="btn btn-primary active" data-toggle="modal" data-target="#ajouter">Réenitialiser</button>
                                   <!-- /popun ajouter -->
                                 <!-- Modal -->
  <div id="ajouter" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close">&times;</button>
                <h4 class="modal-title">Confirmation</h4>
            </div>
            <div class="modal-body">
                <p>Etes-vous sûr de vouloir ajouter la séance dans cette séance du Mardi 7 Avril 2017 de 14h à 16h ?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Ajouter</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
            </div>
        </div>
    </div>
</div> 
<br>


                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>       
</div>
        </div>
        <!-- /#page-wrapper -->

    </div>  
    <!-- /#wrapper -->

    <!-- jQuery -->
    


</body>

</html>

