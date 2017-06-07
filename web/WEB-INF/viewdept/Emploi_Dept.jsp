
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

    <title>Emploi du temps</title>
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
     <script type="text/javascript" src="js/deptjs.js" ></script>
    

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
                <a class="navbar-brand" href=""><img src="images/swp.png" width="180" height="25"></a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${sessionScope.ens.nom}"></c:out> <c:out value="${sessionScope.ens.prenom}"></c:out><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        
                        <li>
                            <a href="login"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href=""><i class="fa fa-fw fa-dashboard"></i>Emplois du temps</a>
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
                                 <div class="col-lg-2">
                                
                                <label>Groupe</label>
                                <select  id="groupes" class="form-control">
                                    
                                    <c:forEach items="${listegroupe}" var="groupe">
                                        <c:if test="${groupe.numG == groupeSelect}">
                                            <option selected id="<c:out value='${groupe.numG}'></c:out>">Groupe <c:out value="${groupe.nomG}"></c:out> <c:out value="${groupe.niveau}"></c:out> Année</option>
                                        </c:if>
                                        <c:if test="${!(groupe.numG == groupeSelect)}">
                                            <option id="<c:out value='${groupe.numG}'></c:out>">Groupe <c:out value="${groupe.nomG}"></c:out> <c:out value="${groupe.niveau}"></c:out> Année</option>
                                        </c:if>
                                        </c:forEach>
                                </select>
                                 </div>
                                
                                <div class="col-lg-2">
                                <label>Semestre</label>
                                <select id="semestres" class="form-control">
                                    <c:forEach var="i" begin="1" end="2" step="1">
                                        <c:if test="${semaineSelect == i}">
                                            <option selected value="${i}">${i}</option>
                                        </c:if>
                                        <c:if test="${!(semaineSelect == i)}">
                                            <option value="${i}">${i}</option>
                                        </c:if>
                                    </c:forEach>
                                 
                              
                                 </select>
                                 </div>
                                 
                                <div class="col-lg-5">
                               <br/>
                               <button id="afficher" type="button" class="btn btn-primary active">Afficher</button>
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

                                            <td class="myradio" id="1" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['lundi']['8']}">
                                            <c:if test="${not empty emp}">
                                                 
                                                    <span id="idseanceEmp2" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp2" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp2" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp2"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp2" style=""><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp2" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp2" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp2"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp2" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp2"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns2"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp1" style="display: none;">8h à 10h</span>
                                                    <span id="jourEmp1" style="display: none;">Lundi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                                </c:forEach>
                                            </td>
                                            <td class="myradio" id="2" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['lundi']['10']}"> 
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp2" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp2" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp2" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp2"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp2" style=""><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp2" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp2" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp2"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp2" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp2"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns2"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp1" style="display: none;">10h à 12h</span>
                                                    <span id="jourEmp1" style="display: none;">Lundi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                            <td class="myradio" id="3" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['lundi']['14']}">    
                                            <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp3" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp3" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp3" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp3"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp3" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp3" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp3" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp3"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp3" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp3"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns3"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp3" style="display: none;">14h à 16h</span>
                                                    <span id="jourEmp3" style="display: none;">Lundi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                            <td class="myradio" id="4" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['lundi']['16']}" >  
                                            <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp4" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp4" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp4" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp4"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp4" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp4" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp4" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp4"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp4" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp4"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns4"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp4" style="display: none;">16h à 18h</span>
                                                    <span id="jourEmp4" style="display: none;">Lundi</span>
                                                    
                                            </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MARDI</td>
                                            <td class="myradio" id="5" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['mardi']['8']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp5" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp5" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp5" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp5"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp5" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp5" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp5" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp5"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp5" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp5"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns5"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp5" style="display: none;">08h à 10h</span>
                                                    <span id="jourEmp5" style="display: none;">Mardi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                        </c:forEach>
                                            </td>
                                            <td class="myradio" id="6" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['mardi']['10']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp6" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp6" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp6" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp6"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp6" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp6" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp6" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp6"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp6" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp6"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns6"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp6" style="display: none;">10h à 12h</span>
                                                    <span id="jourEmp6" style="display: none;">Mardi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                            <td class="myradio" id="7" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['mardi']['14']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp7" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp7" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp7" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp7"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp7" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp7" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp7" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp7"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp7" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp7"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns7"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp7" style="display: none;">14h à 16h</span>
                                                    <span id="jourEmp7" style="display: none;">Mardi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                            <td class="myradio" id="8" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['mardi']['16']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp8" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp8" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp8" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp8"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp8" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp8" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp8" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp8"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp8" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp8"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns8"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp8" style="display: none;">16h à 18h</span>
                                                    <span id="jourEmp8" style="display: none;">Mardi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                                   
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MERCREDI</td>
                                            <td class="myradio" id="9" data-container="body" data-toggle="popover" data-placement="right" data-content="" >
                                            <c:forEach var="emp" items="${empHashMap['mercredi']['8']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp9" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp9" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp9" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp9"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp9" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp9" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp9" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp9"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp9" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp9"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns9"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp9" style="display: none;">08h à 10h</span>
                                                    <span id="jourEmp9" style="display: none;">Mercredi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                           <td class="myradio" id="10" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                           <c:forEach var="emp" items="${not empty empHashMap['mercredi']['10']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp10" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp10" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp10" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp10"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp10" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp10" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp10" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp10"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp10" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp10"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns10"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp10" style="display: none;">10h à 12h</span>
                                                    <span id="jourEmp10" style="display: none;">Mercredi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                           </c:forEach>
                                            </td>
                                            <td class="myradio" id="11" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['mercredi']['14']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp11" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp11" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp11" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp11"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp11" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp11" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp11" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp11"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp11" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp11"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns11"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp11" style="display: none;">14h à 16h</span>
                                                    <span id="jourEmp11" style="display: none;">Mercredi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                            <td class="myradio" id="12" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                            <c:forEach var="emp" items="${empHashMap['mercredi']['16']}">
                                                <c:if test="${not empty emp}">
                                                    <span id="idseanceEmp12" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp12" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp12" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp12"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp12" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp12" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp12" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp12"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp12" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp12"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns12"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp12" style="display: none;">16h à 18h</span>
                                                    <span id="jourEmp12" style="display: none;">Mercredi</span>
                                                    
                                                </c:if>
                                                    <hr></hr>
                                            </c:forEach>
                                            </td>
                                        </tr>
                                         
                                            <td>JEUDI</td>
                                           <td class="myradio" id="13" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <c:forEach items="${empHashMap['jeudi']['8']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp13" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp13" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp13" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp13"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp13" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp13" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp13" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp13"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp13" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp13"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns13"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp13" style="display: none;">08h à 10h</span>
                                                    <span id="jourEmp13" style="display: none;">Jeudi</span>
                                                </c:if>
                                                    <hr></hr>
                                                </c:forEach>
                                            </td>
                                            <td class="myradio" id="14" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                 <c:forEach items="${empHashMap['jeudi']['10']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp14" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp14" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp14" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp14"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp14" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp14" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp14" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp14"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp14" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp14"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns14"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp14" style="display: none;">10h à 12h</span>
                                                    <span id="jourEmp14" style="display: none;">Jeudi</span>
                                                </c:if>
                                                    <hr></hr>
                                                    </c:forEach>
                                            </td>
                                            <td class="myradio" id="15" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <c:forEach items="${empHashMap['jeudi']['14']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp15" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp15" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp15" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp15"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp15" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp15"style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp15" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp15"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp15" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp15"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns15"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp15" style="display: none;">14h à 16h</span>
                                                    <span id="jourEmp15" style="display: none;">Jeudi</span>
                                                </c:if>
                                                    <hr></hr>
                                                </c:forEach>
                                            </td>
                                            <td class="myradio" id="16" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <c:forEach items="${empHashMap['jeudi']['16']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp16" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp16" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp16" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp16"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp16" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp16" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp16" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp16"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp16" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp16"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns16"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp16" style="display: none;">16h à 18h</span>
                                                    <span id="jourEmp16" style="display: none;">Jeudi</span>
                                                </c:if>
                                                    <hr></hr>
                                                </c:forEach>
                                            </td>
                                         <tr>
                                            <td>VENDREDI</td>
                                            <td class="myradio" id="17" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                
                                                <c:forEach items="${empHashMap['vendredi']['8']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp17" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp17" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp17" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp17"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp17" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp17" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp17" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp17"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp17" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp17"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns17"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp17" style="display: none;">08h à 10h</span>
                                                    <span id="jourEmp17" style="display: none;">Vendredi</span>
                                                </c:if>
                                                    <hr></hr>
                                                </c:forEach>
                                            </td>
                                            </td>
                                            <td class="myradio" id="18" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                 <c:forEach items="${empHashMap['vendredi']['10']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp18" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp18" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp18" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp18"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp18" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp18" style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp18" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp18"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp18" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp18"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns18"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp18" style="display: none;">10h à 12h</span>
                                                    <span id="jourEmp18" style="display: none;">Vendredi</span>
                                                </c:if>
                                                 </c:forEach>
                                            </td>
                                            <td class="myradio" id="19" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                 <c:forEach items="${empHashMap['vendredi']['14']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp19" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp19" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp19" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp19"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp19" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp19"style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp19" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp19"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp19" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp19"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns19"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp19" style="display: none;">14h à 16h</span>
                                                    <span id="jourEmp19" style="display: none;">Vendredi</span>
                                                </c:if>
                                                    <hr></hr>
                                                 </c:forEach>
                                                    
                                            </td>
                                            <td class="myradio" id="20" data-container="body" data-toggle="popover" data-placement="right" data-content="">
                                                <c:forEach items="${empHashMap['vendredi']['16']}" var="emp">
                                                 <c:if test="${ not empty emp}">
                                                    <span id="idseanceEmp20" style="display: none;"><c:out value='${emp.numEmp}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="groupeEmp20" style="display: none;"><c:out value='${emp.numG.numG}'></c:out></span>
                                                    <span id="matiereEmp20" style="display: none;"><c:out value='${emp.numM.codeM}'></c:out></span>
                                                    <span id="matiereNomEmp20"><c:out value='${emp.numM.nomM}'></c:out></span> <br/>
                                                    <span id="dateDEmp20" style="display: none;"><c:out value='${emp.dateD}'></c:out></span>
                                                    <span id="dateFEmp20"style="display: none;"><c:out value='${emp.dateF}'></c:out></span>
                                                    <span id="idEnsEmp20" style="display: none;"><c:out value='${emp.numE.id}'></c:out></span>
                                                    <span> Groupe </span><span id="groupeNomEmp20"><c:out value='${emp.numG.nomG}'></c:out></span>
                                                    <span id="niveauGrpEmp20" ><c:out value='${emp.numG.niveau}'></c:out></span><span>ère année</span>
                                                    <br/>
                                                    <span id="nomEnsEmp20"><c:out value='${emp.numE.nom}'></c:out></span>
                                                    <span id="prenomEns20"><c:out value='${emp.numE.prenom}'></c:out></span>
                                                    
                                                    <span id="heureEmp20" style="display: none;">16h à 18h</span>
                                                    <span id="jourEmp20" style="display: none;">Vendredi</span>
                                                </c:if>
                                                    <hr></hr>
                                                </c:forEach>
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

