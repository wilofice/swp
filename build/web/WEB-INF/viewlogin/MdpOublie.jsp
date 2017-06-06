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
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper" >
            <div class="row">
                <div class="col-lg-8 col-lg-offset-1">
                    
                    <form action="mdpOublie" method="Post">
                      <div class="form-group">
                        <br/><br/>
                        <label for="emailU"><h3>Entrez votre adresse mail</h3></label><br/>
                        <span> <em>Un mail de récupération du mot de passe vous sera envoyé</em></span>
                        <br/> <br/>
                        <input type="text" class="form-control" id="emailU" name="emailU"> <br/>
                        <c:if test="${!empty erreur}"> <span style="color: red"><em> Le mail que vous avez saisi est incorrecte </em> </span></c:if>
                      </div>
                      <button type="submit" class="btn btn-default">Envoyer</button>
                      <button type="button" class="btn btn-default" onclick="window.location.href = 'http://localhost:8080/swp/login';"> Annuler</button>
                      <br/><br/>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
    
        <script src="js/jquery.js"></script>

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
    </body>
</html>