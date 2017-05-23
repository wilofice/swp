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
    <script type="text/javascript" src="js/profil.js" ></script>
    <!--<script type="text/javascript" src="js/ens_js.js" ></script>-->
    
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
                   <a href="#" class="toggle"><i class="fa fa-fw fa-gear"></i></a> 
                </li>
                <li class="dropdown">
                   <a href="#" class="toggle"><i class="fa fa-question-circle"></i></a> 
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${sessionScope.ens.nom}"></c:out> <c:out value="${sessionScope.ens.prenom}"></c:out><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-sign-out"></i> Log Out</a>
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
                    <form action="profil" method="POST">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: bold;">Profil</div>
                                    
                        
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px; padding-bottom: 10px;">
                                <div class="col-lg-3">
                                    <a id="modifier">Modifier</a>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px;">
                                <div class="col-lg-3">
                                    <label> Nom :</label>
                                </div>
                                <div class="col-lg-8">
                                        <input type="text" id="NomEns" name="NomEns" class="form-control" value="<c:out value='${sessionScope.ens.nom}'></c:out>" disabled="disabled" ></input>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px;">
                                <div class="col-lg-3">
                                    <label> Prenom :</label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" id="PrenomEns" name="PrenomEns" class="form-control" value="<c:out value='${sessionScope.ens.prenom}'></c:out>" disabled="disabled" ></input>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px;">
                                <div class="col-lg-3">
                                    <label> Email : </label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="email" id="EmailEns" name="EmailEns" class="form-control" value="<c:out value='${sessionScope.ens.email}'></c:out>" disabled="disabled" ></input>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px;">
                                <div class="col-lg-3">
                                    <label> Téléphone : </label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" id="TelEns" name="TelEns" class="form-control" value="<c:out value='${sessionScope.ens.tel}'></c:out>" disabled="disabled" ></input>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px; display: none;">
                                <div class="col-lg-3">
                                    <label> Identifiant : </label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" id="IdEns" name="IdEns" class="form-control" value="<c:out value='${sessionScope.ens.idUser.idUser}'></c:out>" disabled="disabled" ></input>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px;">
                                
                                
                                <div class="col-lg-3">
                                    
                                    <label> Mot de Passe : </label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="password" id="MdpEns" name="MdpEns" class="form-control" value="<c:out value='${sessionScope.ens.idUser.motdepasse}'></c:out>" disabled="disabled" ></input>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px;">
                            <button type="submit" class="btn btn-default">Sauvegarder</button>
                        </div>
                        
                    </div>
                    </form>
                </div>
                
                <div class="col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">Photo de Profil </div>
                        <img ></img>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>
                               

</body>

</html>
