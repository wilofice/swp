<%-- 
    Document   : EmploiEns
    Created on : 27-avr.-2017, 14:12:33
    Author     : genereux
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

    <title>SwapMyLecture</title>


     <link href="css/bootstrap.min.css" rel="stylesheet">
     <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>    
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
  
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
       <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/mycss.css" rel="stylesheet">
    <script type="text/javascript" src="js/ens_js.js" ></script>
    <script type="text/javascript" src="js/notify.js" ></script>
    <script type="text/javascript">
    $(document).ready(function() {
        //$('#emailgroupe').multiselect();
    });
    </script>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                </button>
                <a class="navbar-brand" href="index.html"><img src="images/swp.png" width="180" height="25"></a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i  class="fa fa-bell"></i> <b class="caret"></b><span id="numbernot"  class="badge" ></span> </a>
                    <ul  id="notif" class="dropdown-menu alert-dropdown">
                       
                    </ul>
                </li>
                <li class="dropdown">
                   <a href="#" class="toggle"><i class="fa fa-fw fa-gear"></i></a> 
                </li>
                <li class="dropdown">
                   <a href="#" class="toggle"><i class="fa fa-question-circle"></i></a> 
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${sessionScope.ens.nom}"></c:out> <c:out value="${sessionScope.ens.prenom}"></c:out><b class="caret"></b></a>
                    <p id="idofens" style="display: none;"><c:out value="${sessionScope.ens.id}"></c:out></p>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="profil"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="login"><i class="fa fa-sign-out"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="gestionemploiens"><i class="fa fa-calendar "></i> Emplois du temps</a>
                        
                        
                        
                    </li>        
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-9">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: bold;">EMPLOI DU TEMPS <span id="datedujour">29/04/2017</span> Semaine  <span id="semaineactuelle"> 1</span></div>
                                    
                    
                        <div class="panel-body">
                            <div class="row">    
                               
                                 <!-- /.liste Semestre -->
                                <div class="col-lg-2">
                                    <label>Semaine</label>
                                    <!--<select class="form-control" id="semaineselect" onfocus="this.size=5;" onblur="this.size=1;" onchange="this.size=1;this.blur();">-->
                                    <select class="form-control" id="semaineselect" ></select>
                                </div>
                           <!-- <///c:if test="////$//{//afficherMasquer.equals('yes')}">-->
                                <div class="col-lg-3 col-lg-offset-7">
                                    <label style="display: none"> Afficher/masquer</label><br/>
                                  <div id="boutonSwitch" class="btn-group btn-toggle" > 
                                    <button id="btnAfficher" class="btn btn-primary active">Afficher</button>
                                    <button id="btnMasquer" class="btn btn-default">Masquer</button>
                                  </div>
                                </div>
                           <!-- <///c:if> -->
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
                                            <td class="seance" id="l8">
                                                <c:if test="${not empty seanceHashMap['lundi']['8']}">
                                                    <c:if test="${!seanceHashMap['lundi']['8'].type.equals('seance') && !seanceHashMap['lundi']['8'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#l8').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancel8" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["8"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidl8" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenoml8"><c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidl8" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenoml8"><c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaul8"><c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemaill8" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenoml8"><c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatel8" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["8"].numC.date}'></c:out></span>
                                                    <span id="heurel8" style="display: none;">08h à 10h</span>
                                                    <span id="jourl8" style="display: none;">Lundi</span>
                                                </c:if>
                                                
                                            </td>
                                            
                                            <td class="seance" id="l10">
                                                <c:if test="${not empty seanceHashMap['lundi']['10']}">
                                                    <c:if test="${!seanceHashMap['lundi']['10'].type.equals('seance') && !seanceHashMap['lundi']['10'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#l10').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancel10" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["10"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidl10" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["10"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenoml10"><c:out value='${(seanceHashMap["lundi"])["10"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidl10" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["10"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenoml10"><c:out value='${(seanceHashMap["lundi"])["10"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaul10"><c:out value='${(seanceHashMap["lundi"])["10"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemaill10" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["10"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenoml10"><c:out value='${(seanceHashMap["lundi"])["10"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatel10" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["10"].numC.date}'></c:out></span>
                                                    <span id="heurel10" style="display: none;">10h à 12h</span>
                                                    <span id="jourl10" style="display: none;">Lundi</span>
                                                </c:if>
                                               
                                            </td>
                                            <td class="seance" id="l14">
                                                <c:if test="${not empty seanceHashMap['lundi']['14']}">
                                                     <c:if test="${!sseanceHashMap['lundi']['14'].type.equals('seance') && !seanceHashMap['lundi']['14'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#l14').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancel14" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["14"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidl14" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["14"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenoml14"><c:out value='${(seanceHashMap["lundi"])["14"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidl14" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["14"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenoml14"><c:out value='${(seanceHashMap["lundi"])["14"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaul14"><c:out value='${(seanceHashMap["lundi"])["14"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemaill14" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["14"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenoml14"><c:out value='${(seanceHashMap["lundi"])["14"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatel14" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["14"].numC.date}'></c:out></span>
                                                    <span id="heurel14" style="display: none;">14h à 16h</span>
                                                    <span id="jourl14" style="display: none;">Lundi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="l16">
                                                <c:if test="${not empty seanceHashMap['lundi']['16']}">
                                                    <c:if test="${!seanceHashMap['lundi']['16'].type.equals('seance') && !seanceHashMap['lundi']['16'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#l16').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancel16" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["16"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidl16" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["16"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenoml16"><c:out value='${(seanceHashMap["lundi"])["16"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidl16" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["16"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenoml16"><c:out value='${(seanceHashMap["lundi"])["16"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaul16"><c:out value='${(seanceHashMap["lundi"])["16"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemaill16" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["16"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenoml16"><c:out value='${(seanceHashMap["lundi"])["16"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatel16" style="display: none;"><c:out value='${(seanceHashMap["lundi"])["16"].numC.date}'></c:out></span>
                                                    <span id="heurel16" style="display: none;">16h à 18h</span>
                                                    <span id="jourl16" style="display: none;">Lundi</span>
                                                </c:if>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MARDI</td>
                                            <td class="seance" id="m8">
                                                <c:if test="${not empty seanceHashMap['mardi']['8']}">
                                                    <c:if test="${!seanceHashMap['mardi']['8'].type.equals('seance') && !seanceHashMap['mardi']['8'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#m8').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancem8" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["8"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidm8" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["8"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomm8"><c:out value='${(seanceHashMap["mardi"])["8"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidm8" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["8"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomm8"><c:out value='${(seanceHashMap["mardi"])["8"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaum8"><c:out value='${(seanceHashMap["mardi"])["8"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailm8" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["8"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomm8"><c:out value='${(seanceHashMap["mardi"])["8"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatem8" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["8"].numC.date}'></c:out></span>
                                                    <span id="heurem8" style="display: none;">08h à 10h</span>
                                                    <span id="jourm8" style="display: none;">Mardi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="m10">
                                                <c:if test="${not empty seanceHashMap['mardi']['10']}">
                                                    <c:if test="${!seanceHashMap['mardi']['10'].type.equals('seance') && !seanceHashMap['mardi']['10'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#m10').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancem10" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["10"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidm10" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["10"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomm10"><c:out value='${(seanceHashMap["mardi"])["10"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidm10" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["10"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomm10"><c:out value='${(seanceHashMap["mardi"])["10"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaum10"><c:out value='${(seanceHashMap["mardi"])["10"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailm10" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["10"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomm10"><c:out value='${(seanceHashMap["mardi"])["10"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatem10" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["10"].numC.date}'></c:out></span>
                                                    <span id="heurem10" style="display: none;">10h à 12h</span>
                                                    <span id="jourm10" style="display: none;">Mardi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="m14">
                                                <c:if test="${not empty seanceHashMap['mardi']['14']}">
                                                    <c:if test="${!seanceHashMap['mardi']['14'].type.equals('seance') && !seanceHashMap['mardi']['14'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#m14').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancem14" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["14"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidm14" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["14"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomm14"><c:out value='${(seanceHashMap["mardi"])["14"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidm14" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["14"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomm14"><c:out value='${(seanceHashMap["mardi"])["14"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaum14"><c:out value='${(seanceHashMap["mardi"])["14"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailm14" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["14"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomm14"><c:out value='${(seanceHashMap["mardi"])["14"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatem14" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["14"].numC.date}'></c:out></span>
                                                    <span id="heurem14" style="display: none;">14h à 16h</span>
                                                    <span id="jourm14" style="display: none;">Mardi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="m16">
                                                <c:if test="${not empty seanceHashMap['mardi']['16']}">
                                                    <c:if test="${!seanceHashMap['mardi']['16'].type.equals('seance') && !seanceHashMap['mardi']['16'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#m16').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancem16" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["16"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidm16" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["16"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomm16"><c:out value='${(seanceHashMap["mardi"])["16"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidm16" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["16"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomm16"><c:out value='${(seanceHashMap["mardi"])["16"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaum16"><c:out value='${(seanceHashMap["mardi"])["16"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailm16" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["16"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomm16"><c:out value='${(seanceHashMap["mardi"])["16"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatem16" style="display: none;"><c:out value='${(seanceHashMap["mardi"])["16"].numC.date}'></c:out></span>
                                                    <span id="heurem16" style="display: none;">16h à 18h</span>
                                                    <span id="jourm16" style="display: none;">Mardi</span>
                                                </c:if>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MERCREDI</td>
                                            <td class="seance" id="mer8">
                                                <c:if test="${not empty seanceHashMap['mercredi']['8']}">
                                                    <c:if test="${!seanceHashMap['mercredi']['8'].type.equals('seance') && !seanceHashMap['mercredi']['8'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#mer8').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancemer8" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["8"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidmer8" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["8"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenommer8"><c:out value='${(seanceHashMap["mercredi"])["8"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidmer8" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["8"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenommer8"><c:out value='${(seanceHashMap["mercredi"])["8"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaumer8"><c:out value='${(seanceHashMap["mercredi"])["8"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailmer8" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["8"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenommer8"><c:out value='${(seanceHashMap["mercredi"])["8"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatemer8" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["8"].numC.date}'></c:out></span>
                                                    <span id="heuremer8" style="display: none;">08h à 10h</span>
                                                    <span id="jourmer8" style="display: none;">Mercredi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="mer10">
                                                <c:if test="${not empty seanceHashMap['mercredi']['10']}">
                                                    <c:if test="${!seanceHashMap['mercredi']['10'].type.equals('seance') && !seanceHashMap['mercredi']['10'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#mer10').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancemer10" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["10"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidmer10" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["10"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenommer10"><c:out value='${(seanceHashMap["mercredi"])["10"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidmer10" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["10"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenommer10"><c:out value='${(seanceHashMap["mercredi"])["10"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaumer10"><c:out value='${(seanceHashMap["mercredi"])["10"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailmer10" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["10"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenommer10"><c:out value='${(seanceHashMap["mercredi"])["10"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatemer10" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["10"].numC.date}'></c:out></span>
                                                    <span id="heuremer10" style="display: none;">10h à 12h</span>
                                                    <span id="jourmer10" style="display: none;">Mercredi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="mer14">
                                                <c:if test="${not empty seanceHashMap['mercredi']['14']}">
                                                    <c:if test="${!seanceHashMap['mercredi']['14'].type.equals('seance') && !seanceHashMap['mercredi']['14'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#mer14').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancemer14" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["14"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidmer14" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["14"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenommer14"><c:out value='${(seanceHashMap["mercredi"])["14"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidmer14" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["14"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenommer14"><c:out value='${(seanceHashMap["mercredi"])["14"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaumer14"><c:out value='${(seanceHashMap["mercredi"])["14"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailmer14" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["14"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenommer14"><c:out value='${(seanceHashMap["mercredi"])["14"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatemer14" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["14"].numC.date}'></c:out></span>
                                                    <span id="heuremer14" style="display: none;">14h à 16h</span>
                                                    <span id="jourmer14" style="display: none;">Mercredi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="mer16">
                                                <c:if test="${not empty seanceHashMap['mercredi']['16']}">
                                                    <c:if test="${!seanceHashMap['mercredi']['16'].type.equals('seance') && !seanceHashMap['mercredi']['16'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#mer16').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancemer16" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["16"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidmer16" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["16"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenommer16"><c:out value='${(seanceHashMap["mercredi"])["16"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidmer16" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["16"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenommer16"><c:out value='${(seanceHashMap["mercredi"])["16"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveaumer16"><c:out value='${(seanceHashMap["mercredi"])["16"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailmer16" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["16"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenommer16"><c:out value='${(seanceHashMap["mercredi"])["16"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatemer16" style="display: none;"><c:out value='${(seanceHashMap["mercredi"])["16"].numC.date}'></c:out></span>
                                                    <span id="heuremer16" style="display: none;">16h à 18h</span>
                                                    <span id="jourmer16" style="display: none;">Mercredi</span>
                                                </c:if>
                                                
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>JEUDI</td>
                                            <td class="seance" id="j8">
                                                <c:if test="${not empty seanceHashMap['jeudi']['8']}">
                                                    <c:if test="${!seanceHashMap['jeudi']['8'].type.equals('seance') && !seanceHashMap['jeudi']['8'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#j8').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancej8" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["8"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidj8" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["8"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomj8"><c:out value='${(seanceHashMap["jeudi"])["8"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidj8" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["8"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomj8"><c:out value='${(seanceHashMap["jeudi"])["8"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauj8"><c:out value='${(seanceHashMap["jeudi"])["8"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailj8" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["8"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomj8"><c:out value='${(seanceHashMap["jeudi"])["8"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatej8" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["8"].numC.date}'></c:out></span>
                                                    <span id="heurej8" style="display: none;">08h à 10h</span>
                                                    <span id="jourj8" style="display: none;">Jeudi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="j10">
                                                <c:if test="${not empty seanceHashMap['jeudi']['10']}">
                                                    <c:if test="${!seanceHashMap['jeudi']['10'].type.equals('seance') && !seanceHashMap['jeudi']['10'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#j10').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancej10" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["10"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidj10" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["10"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomj10"><c:out value='${(seanceHashMap["jeudi"])["10"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidj10" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["10"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomj10"><c:out value='${(seanceHashMap["jeudi"])["10"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauj10"><c:out value='${(seanceHashMap["jeudi"])["10"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailj10" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["10"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomj10"><c:out value='${(seanceHashMap["jeudi"])["10"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatej10" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["10"].numC.date}'></c:out></span>
                                                    <span id="heurej10" style="display: none;">10h à 12h</span>
                                                    <span id="jourj10" style="display: none;">Jeudi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="j14">
                                                <c:if test="${not empty seanceHashMap['jeudi']['14']}">
                                                    <c:if test="${!seanceHashMap['jeudi']['14'].type.equals('seance') && !seanceHashMap['jeudi']['14'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#j14').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancej14" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["14"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidj14" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["14"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomj14"><c:out value='${(seanceHashMap["jeudi"])["14"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidj14" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["14"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomj14"><c:out value='${(seanceHashMap["jeudi"])["14"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauj14"><c:out value='${(seanceHashMap["jeudi"])["14"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailj14" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["14"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomj14"><c:out value='${(seanceHashMap["jeudi"])["14"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatej14" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["14"].numC.date}'></c:out></span>
                                                    <span id="heurej14" style="display: none;">14h à 16h</span>
                                                    <span id="jourj14" style="display: none;">Jeudi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="j16">
                                                <c:if test="${not empty seanceHashMap['jeudi']['16']}">
                                                    <c:if test="${!seanceHashMap['jeudi']['16'].type.equals('seance') && !seanceHashMap['jeudi']['16'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#j16').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancej16" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["16"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidj16" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["16"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomj16"><c:out value='${(seanceHashMap["jeudi"])["16"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidj16" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["16"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomj16"><c:out value='${(seanceHashMap["jeudi"])["16"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauj16"><c:out value='${(seanceHashMap["jeudi"])["16"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailj16" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["16"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomj16"><c:out value='${(seanceHashMap["jeudi"])["16"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatej16" style="display: none;"><c:out value='${(seanceHashMap["jeudi"])["16"].numC.date}'></c:out></span>
                                                    <span id="heurej16" style="display: none;">16h à 18h</span>
                                                    <span id="jourj16" style="display: none;">Jeudi</span>
                                                </c:if>
                                                
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>VENDREDI</td>
                                            <td class="seance" id="v8">
                                                <c:if test="${not empty seanceHashMap['vendredi']['8']}">
                                                    <c:if test="${!seanceHashMap['vendredi']['8'].type.equals('seance') && !seanceHashMap['vendredi']['8'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#v8').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancev8" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["8"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidv8" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["8"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomv8"><c:out value='${(seanceHashMap["vendredi"])["8"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidv8" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["8"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomv8"><c:out value='${(seanceHashMap["vendredi"])["8"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauv8"><c:out value='${(seanceHashMap["vendredi"])["8"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailv8" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["8"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomv8"><c:out value='${(seanceHashMap["vendredi"])["8"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatev8" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["8"].numC.date}'></c:out></span>
                                                    <span id="heurev8" style="display: none;">08h à 10h</span>
                                                    <span id="jourv8" style="display: none;">Vendredi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="v10">
                                                <c:if test="${not empty seanceHashMap['vendredi']['10']}">
                                                    <c:if test="${!seanceHashMap['vendredi']['10'].type.equals('seance') && !seanceHashMap['vendredi']['10'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#v10').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancev10" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["10"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidv10" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["10"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomv10"><c:out value='${(seanceHashMap["vendredi"])["10"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidv10" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["10"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomv10"><c:out value='${(seanceHashMap["vendredi"])["10"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauv10"><c:out value='${(seanceHashMap["vendredi"])["10"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailv10" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["10"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomv10"><c:out value='${(seanceHashMap["vendredi"])["10"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatev10" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["10"].numC.date}'></c:out></span>
                                                    <span id="heurev10" style="display: none;">10h à 12h</span>
                                                    <span id="jourv10" style="display: none;">Vendredi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="v14">
                                                <c:if test="${not empty seanceHashMap['vendredi']['14']}">
                                                    <c:if test="${!seanceHashMap['vendredi']['14'].type.equals('seance') && !seanceHashMap['vendredi']['14'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#v14').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancev14" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["14"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidv14" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["14"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomv14"><c:out value='${(seanceHashMap["vendredi"])["14"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidv14" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["14"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomv14"><c:out value='${(seanceHashMap["vendredi"])["14"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauv14"><c:out value='${(seanceHashMap["vendredi"])["14"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailv14" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["14"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomv14"><c:out value='${(seanceHashMap["vendredi"])["14"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatev14" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["14"].numC.date}'></c:out></span>
                                                    <span id="heurev14" style="display: none;">14h à 16h</span>
                                                    <span id="jourv14" style="display: none;">Vendredi</span>
                                                </c:if>
                                                
                                            </td>
                                            <td class="seance" id="v16">
                                                <c:if test="${not empty seanceHashMap['vendredi']['16']}">
                                                    <c:if test="${!seanceHashMap['vendredi']['16'].type.equals('seance') && !seanceHashMap['vendredi']['16'].type.equals('examen')}">
                                                        <script>
                                                            document.write("<span>Rattrapage Possible</span>");
                                                           $(document).ready(function(){
                                                               $('#v16').addClass('myratt');
                                                           });
                                                        </script>
                                                        
                                                    </c:if>
                                                    <span id="idseancev16" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["16"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidv16" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["16"].numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomv16"><c:out value='${(seanceHashMap["vendredi"])["16"].numEmp.numM.nomM}'></c:out></span>
                                                     <br/>
                                                     <span>Groupe</span>
                                                    <span id="groupeidv16" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["16"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomv16"><c:out value='${(seanceHashMap["vendredi"])["16"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauv16"><c:out value='${(seanceHashMap["vendredi"])["16"].numEmp.numG.niveau}'></c:out></span>
                                                    <span>Année</span>
                                                     <br/>
                                                    <span id="groupemailv16" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["16"].numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomv16"><c:out value='${(seanceHashMap["vendredi"])["16"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdatev16" style="display: none;"><c:out value='${(seanceHashMap["vendredi"])["16"].numC.date}'></c:out></span>
                                                    <span id="heurev16" style="display: none;">16h à 18h</span>
                                                    <span id="jourv16" style="display: none;">Vendredi</span>
                                                </c:if>
                                                
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">Paramètres Séance</div>
                        <div class="panel-body">
                            <div class="text-center">
                               <div class="btn-group-vertical" >
                                    <button type="button" class="btn btn-primary active"data-toggle="modal" data-target="#SigAbsc">Signaler Abscence</button>
                                    <br>
                                    <button type="button" class="btn btn-primary active"data-toggle="modal" data-target="#AjSeaSupp">Ajouter Scéance supplémentaire</button>
                                    <br>
                                    <button type="button" class="btn btn-primary active"data-toggle="modal" data-target="#Plann">Plannifier un Examen</button>
                                    <br>
                                </div>
                              
                                
                            </div>
                        </div>
                        </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">Legende</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-2">
                                    <div style="width:20px;height:10px;background-color:#6699FF;-moz-border-radius: 10px; "></div>
                                </div>
                                <div class="col-lg-10">
                                    <label><h6>Séance(s) Reportée(s)</h6></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2">
                                    <div style="width:20px;height:10px;background-color:#66CC33;-moz-border-radius: 10px; "></div>
                                </div>
                                <div class="col-lg-10">
                                    <label><h6>Séance(s) Permutée(s)</h6></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2">
                                    <div style="width:20px;height:10px;background-color:#FFAF37;-moz-border-radius: 10px; "></div>
                                </div>
                                <div class="col-lg-10">
                                    <label><h6>Séance(s) Supplémentaire(s) Ajoutée(s)</h6></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2">
                                    <div style="width:20px;height:10px;background-color:#FFFF33;-moz-border-radius: 10px; "></div>
                                </div>
                                <div class="col-lg-10">
                                    <label><h6>Séance(s) d'Examen Ajoutée(s)</h6></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                            
                                <div class="modal fade" id="SigAbsc" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="signalerabscence" method="POST">
                                            <div class="modal-header">
                                                     <h4 class="modal-title">Signaler Abscence</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <label>A:</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="form-group">
                                                            <select class="form-control" id="emailgroupe" name="emailgroupe">
                                                                
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input id="seancetoabsentid" type="text" style="display: none;" name="seancetoabsentid" value=""/>
                                                <input id="currentsemaineid" type="text" style="display: none;" name="currentsemaineid" value=""/>
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <label for="objetmessage">Objet:</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <!--<textearea rows="1" cols="50">Absence pour un cour</textarea>-->
                                                        <input type="text" id="objetmessage" name="objetmessage" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                                <div class="row" style="padding-top: 10px;">
                                                    <div class="col-lg-2">
                                                   
                                                         <label for="message">Message</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <textarea id="message" class="form-control" rows="5" cols="200" style="text-align: left" name="message">
                                                        </textarea>
                                                        <textarea id="messageD" name="messageD" style="display: none;"></textarea>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <br>
                                                <div class="modal-footer">
                                                <button type="submit" class="btn btn-default">Envoyer</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                            </div>
                                            
                                        </div>
                                    </div>
                                

                                 <div class="modal fade" id="AjSeaSupp" role="dialog">
                                    <div class="modal-dialog">
                                        <form action="addseance"  methode="POST">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                    <h4 class="modal-title">Ajouter Scéance supplémentaire</h4>
                                            </div>
                                            <div class="modal-body">
                                                
                                                
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <select class="form-control" name="classe" id="grpselect">
                                                            <c:forEach items="${listGrp}" var="grp">
                                                                <option value="${grp.numG}">
                                                                   Groupe <c:out value="${grp.nomG}"/>  Genie <c:out value="${grp.nomFiliere}"/> année <c:out value="${grp.niveau}"/>
                                                                </option>
                                                                <script>
                                                                    var grps = document.getElementById("grpselect");
                                                                    grps.selectedIndex = "-1";
                                                                    </script>
                                                                
                                                                    
                                                            </c:forEach>
                                                            
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <select class="form-control" name="matiere" id="matselect">
                                                            <!--<c:forEach items="${listMat}" var="mat">
                                                                <option>
                                                                  <c:out value="${mat.nomM}"/> 
                                                                </option>
                                                                
                                                                
                                                            </c:forEach>-->
                                                          
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <select class="form-control" name="creneau" id="creselect">
                                                            
                                  
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-default">Ajouter</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>

                                </div>-->

                                 <!--<div class="modal fade" id="Plann" role="dialog">
                                    <div class="modal-dialog">
                                        <form action="addexam" method="GET">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                    <h4 class="modal-title">Plannifier un Examen </h4>
                                            </div>
                                            <div class="modal-body">
                                                
                                                
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <select class="form-control" name="classe" id="grpselect">
                                                            <c:forEach items="${listGrp}" var="grp">
                                                                <option value="${grp.numG}">
                                                                   Groupe <c:out value="${grp.nomG}"/>  Genie <c:out value="${grp.nomFiliere}"/> année <c:out value="${grp.niveau}"/>
                                                                </option>
                                                                <script>
                                                                    var grps = document.getElementById("grpselect");
                                                                    grps.selectedIndex = "-1";
                                                                    </script>
                                                                
                                                                    
                                                            </c:forEach>
                                                            
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <select class="form-control" name="matiere" id="matselect">
                                                            <!--<c:forEach items="${listMat}" var="mat">
                                                                <option>
                                                                  <c:out value="${mat.nomM}"/> 
                                                                </option>
                                                                
                                                                
                                                            </c:forEach>-->
                                                          
                                                            <!--</select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <select class="form-control" name="creneau" id="creselect">
                                                            
                                  
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-default" >Ajouter</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>-->
                    
                                  <!-- Le modal pour le choix d'une séance pour rattraper -->
              <div class="modal fade" id="SeanceRatt" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="choisirseancederattrapage" method="POST">
                                            <div class="modal-header">
                                                     <h4 class="modal-title">Reporter Seance </h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <label>A:</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="form-group">
                                                            <select class="form-control" id="emailgroupeReport" name="emailgroupeReport">
                                                                
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input id="seancereportid" type="text" style="display: none;" name="seancereportid" value=""/>
                                                <input id="seanceAbsenceid" type="text" style="display: none;" name="seanceAbsenceid" value=""/>
                                                <input id="currentsemainereportid" type="text" style="display: none;" name="currentsemainereportid" value=""/>
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <label for="objetmessageReport">Objet:</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <!--<textearea rows="1" cols="50">Absence pour un cour</textarea>-->
                                                        <input type="text" id="objetmessageReport" name="objetmessageReport" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                                <div class="row" style="padding-top: 10px;">
                                                    <div class="col-lg-2">
                                                   
                                                         <label for="messageReport">Message</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <textarea id="messageReport" class="form-control" rows="5" cols="200" style="text-align: left" name="messageReport">
                                                          
                                                        </textarea>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <br>
                                                <div class="modal-footer">
                                                <button type="submit" class="btn btn-default">Envoyer</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                            </div>
                                            
                                        </div>
                                    </div>
                                  
                                  
                                                    <div style="display: none;" class="abscenceclass" id="abscanca">
                                                        <c:if test="${not empty sessionScope.seancetoabsent}">
                                                    <span id="idseanceabscanca" style="display: none;"><c:out value='${sessionScope.seancetoabsent.numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereidabscanca" style="display: none;"><c:out value='${sessionScope.seancetoabsent.numEmp.numM.codeM}'></c:out></span>
                                                   
                                                    <span id="matierenomabscanca"><c:out value='${sessionScope.seancetoabsent.numEmp.numM.nomM}'></c:out></span>
                                                    <br/>
                                                    <c:if test="${not empty sessionScope.seancetoabsent.numEmp.numG.numG}"><span>Groupe</span></c:if>
                                                    <span id="groupeidabscanca" style="display: none;"><c:out value='${sessionScope.seancetoabsent.numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenomabscanca"><c:out value='${sessionScope.seancetoabsent.numEmp.numG.nomG}'></c:out></span>
                                                    <span id="niveauabscanca"><c:out value='${sessionScope.seancetoabsent.numEmp.numG.niveau}'></c:out></span>
                                                    <c:if test="${not empty sessionScope.seancetoabsent.numEmp.numG.niveau}"><span>Année</span></c:if>
                                                     <br/>
                                                    <span id="groupemailabscanca" style="display: none;"><c:out value='${sessionScope.seancetoabsent.numEmp.numG.email}'></c:out></span>
                                                     
                                                    <span id="filierenomabscanca"><c:out value='${sessionScope.seancetoabsent.numEmp.numG.nomFiliere}'></c:out></span>
                                                    <br/>
                                                    <span id="realdateabscanca" style="display: none;"><c:out value='${sessionScope.seancetoabsent.numC.date}'></c:out></span>
                                                    <span id="heureabscanca" style="display: none;">08h à 10h</span>
                                                    <span id="jourabscanca" style="display: none;">Lundi</span>
                                                            </c:if>
                                                </div>
                                 
                                  <div style="display: none;">
                                  <c:if test="${not empty notification}"> 
                                      
                                  <script>
                                          $(document).ready(function() {
                                             $.notify("Abscence correctement signalée!", "success"); 
                                          });
                                      </script>
                                  </c:if>
                                      
                                  </div>
</body>

</html>
