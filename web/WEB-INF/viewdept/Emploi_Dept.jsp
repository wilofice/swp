<%-- 
    Document   : Emploi_Dept
    Created on : 26 avr. 2017, 19:14:10
    Author     : Azough Mehdi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">


    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Social Buttons CSS -->
    <link href="../vendor/bootstrap-social/bootstrap-social.css" rel="stylesheet">
     <link href="css/mycss.css" rel="stylesheet">
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
                        <a href="gestionemploi"><i class="fa fa-fw fa-dashboard"></i>Emplois du temps</a>
                    </li>
                    <li >
                        <a href="addmatiere"><i class="fa fa-book"></i>Matières</a>
                    </li>
                    <li>
                        <a href="addgroupe"><i class="fa fa-users"></i>Groupes</a>
                    </li>          
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        
        <div style="display: none;" id="listeenseignant">
            <c:forEach items="${listeenseignant}" var="ens">
                
                <p id="<c:out value="${ens.id}"/>"><c:out value="${ens.nom}"/> <c:out value="${ens.prenom}"/></p>
            </c:forEach>
        </div>
        
        <div style="display: none;" id="listematiere">
            <c:forEach items="${listeMatiere}" var="mat">
                <p id="<c:out value="${mat.codeM}"/>"><c:out value="${mat.nomM}"/></p>
            </c:forEach>
        </div>

        <div id="page-wrapper">

             <!-- /.row -->

             
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            EMPLOI DU TEMPS
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">    
                                <!-- /.liste niveau -->
                                 
                                 <!-- /.liste Semestre -->
                                 <div class="col-lg-2">
                                
                                <label>Groupe</label>
                                <select  id="groupes" class="form-control">
                                    <c:forEach items="${listegroupe}" var="groupe">
                                        <c:if test="${groupe.numG == numGselected}">
                                            <option id="<c:out value='${groupe.numG}'></c:out>">Groupe <c:out value="${groupe.nomG}"></c:out> <c:out value="${groupe.niveau}"></c:out> Année</option>
                                        </c:if>
                                        <c:if test="${!(groupe.numG == numGselected)}">
                                            <option id="<c:out value='${groupe.numG}'></c:out>">Groupe <c:out value="${groupe.nomG}"></c:out> <c:out value="${groupe.niveau}"></c:out> Année</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                 </div>
                                 <div class="col-lg-2">
                                <label>Semestre</label>
                                <select id="semestres" class="form-control">
                                 <option>1</option>
                                 <option selected>2 </option>
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
                                            <td class="myradio" id="1" data-container="body" data-toggle="popover" data-trigger="focus" data-placement="right" data-content="">
                                                
                                                <span style ="display: none; " id="emp1">1</span>
                                                <span id="matiere1"></span>
                                                <span id="matiereid1"></span>
                                                <br>
                                                <span id="enseignant1"></span>
                                                <span id="enseignantid1"></span>
                                                <br>
                                                <span id="sd1"></span>
                                                <span id="sf1"></span>
                                                <span style ="display: none;" id="jour1">Lundi</span>
                                                <span style ="display: none;" id="heure1">08:00</span>
                                            </td>
                                            <td class="myradio" id="2" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none;" id="emp2"></span>
                                                <span id="matiere2"></span>
                                                <br>
                                                <span id="enseignant2"></span>
                                                <br>
                                                <span id="sd2"></span>
                                                <span id="sf2"></span>
                                            </td>
                                            <td class="myradio" id="3" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none;" id="emp3"></span>
                                                <span id="matiere3"></span>
                                                <br>
                                                <span id="enseignant3"></span>
                                                <br>
                                                <span id="sd3"></span>
                                                <span id="sf3"></span>
                                            </td>
                                            <td class="myradio" id="4" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none;" id="emp4"></span>
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
                                            <td class="myradio" id="5" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp5"></span>
                                                <span id="matiere5"></span>
                                                <br>
                                                <span id="enseignant5"></span>
                                                <br>
                                                <span id="sd5"></span>
                                                <span id="sf5"></span>
                                            </td>
                                            <td class="myradio" id="6" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp6"></span>
                                                <span id="matiere6"></span>
                                                <br>
                                                <span id="enseignant6"></span>
                                                <br>
                                                <span id="sd6"></span>
                                                <span id="sf6"></span>
                                            </td>
                                            <td class="myradio" id="7" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none;" id="emp7"></span>
                                                <span id="matiere7"></span>
                                                <br>
                                                <span id="enseignant7"></span>
                                                <br>
                                                <span id="sd7"></span>
                                                <span id="sf7"></span>
                                            </td>
                                            <td class="myradio" id="8" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none;" id="emp8"></span>
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
                                            <td class="myradio" id="9" data-container="body" data-toggle="popover" data-placement="right" data-content="" >
                                                <span style ="display: none;" id="emp9"></span>
                                                <span id="matiere9"></span>
                                                <br>
                                                <span id="enseignant9"></span>
                                                <br>
                                                <span id="sd9"></span>
                                                <span id="sf9"></span>
                                            </td>
                                           <td class="myradio" id="10" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                               <span style ="display: none; "id="emp10"></span>
                                                <span id="matiere10"></span>
                                                <br>
                                                <span id="enseignant10"></span>
                                                <br>
                                                <span id="sd10"></span>
                                                <span id="sf10"></span>
                                            </td>
                                            <td class="myradio" id="11" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp11"></span>
                                                <span id="matiere11"></span>
                                                <br>
                                                <span id="enseignant11"></span>
                                                <br>
                                                <span id="sd11"></span>
                                                <span id="sf11"></span>
                                            </td>
                                            <td class="myradio" id="12" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp12"></span>
                                                <span id="matiere12"></span>
                                                <br>
                                                <span id="enseignant12"></span>
                                                <br>
                                                <span id="sd12"></span>
                                                <span id="sf12"></span>
                                            </td>
                                        </tr>
                                         
                                            <td>JEUDI</td>
                                           <td class="myradio" id="13" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                               <span style ="display: none; "id="emp13"></span>
                                                <span id="matiere13"></span>
                                                <br>
                                                <span id="enseignant13"></span>
                                                <br>
                                                <span id="sd13"></span>
                                                <span id="sf13"></span>
                                            </td>
                                            <td class="myradio" id="14" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp14"></span>
                                                <span id="matiere14"></span>
                                                <br>
                                                <span id="enseignant14"></span>
                                                <br>
                                                <span id="sd14"></span>
                                                <span id="sf14"></span>
                                            </td>
                                            <td class="myradio" id="15" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                               <span style ="display: none; " id="emp15"></span>
                                                <span id="matiere15"></span>
                                                <br>
                                                <span id="enseignant15"></span>
                                                <br>
                                                <span id="sd15"></span>
                                                <span id="sf15"></span>
                                            </td>
                                            <td class="myradio" id="16" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp16"></span>
                                                <span id="matiere16"></span>
                                                <br>
                                                <span id="enseignant16"></span>
                                                <br>
                                                <span id="sd16"></span>
                                                <span id="sf16"></span>
                                            </td>
                                         <tr>
                                            <td>VENDREDI</td>
                                            <td class="myradio" id="17" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp17"></span>
                                                <span id="matiere17"></span>
                                                <br>
                                                <span id="enseignant17"></span>
                                                <br>
                                                <span id="sd17"></span>
                                                <span id="sf17"></span>
                                            </td>
                                            </td>
                                            <td class="myradio" id="18" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp18"></span>
                                                <span id="matiere18"></span>
                                                <br>
                                                <span id="enseignant18"></span>
                                                <br>
                                                <span id="sd18"></span>
                                                <span id="sf18"></span>
                                            </td>
                                            <td class="myradio" id="19" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp19"></span>
                                                <span id="matiere19"></span>
                                                <br>
                                                <span id="enseignant19"></span>
                                                <br>
                                                <span id="sd19"></span>
                                                <span id="sf19"></span>
                                            </td>
                                            <td class="myradio" id="20" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <span style ="display: none; "id="emp20"></span>
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
                <div class="col-lg-3" style="display: none;">
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

