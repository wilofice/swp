<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<html lang="fr">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SwapMyLecture</title>
    <script src="js/VerifyForm.js"></script>
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
    
     <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

  

</head>

<body>
    <script type="text/javascript">
        
    function ModifierMat(codeM){
            window.location.href = "http://localhost:8080/swp/ModifierMat?codeM="+codeM;
        }
        
        function redirectToAdd(){
            window.location.href = "http://localhost:8080/swp/addmatiere";
            
        }
        
       
    $(window).on('load',function(){
        $('#myModal').modal('show');
    });
</script>
        
        
        
       
    </script>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                </button>
                <a class="navbar-brand" href="/swp/gestionemploi?grpid=1&semestreid=2"><img src="images/swp.png" width="180" height="25"></a>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${sessionScope.ens.nom}"></c:out> <c:out value="${sessionScope.ens.prenom}"></c:out><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
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
                        <a href="/swp/gestionemploi?grpid=1&semestreid=2"><i class="fa fa-calendar "></i> Emplois du temps</a>
                    </li>
                    <li class="active">
                        <a href="/swp/addmatiere"><i class="fa fa-calendar "></i> Matières</a>
                    </li> 
                    <li>
                        <a href="/swp/addgroupe"><i class="fa fa-users"></i>  Groupes</a>
                    </li>       
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
                <!-- /.row -->
                <!-- Flot Charts -->
                <div class="row">
                    <div class="col-lg-12">
                       <div class="container">
 
 <h2>Les matières enregistrées</h2>      
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Numéro</th>
        <th>code </th>
        <th>Nom </th>
       
      </tr>
    </thead>
    <tbody>
    <c:if test="${!empty listmat}">
        <c:forEach items="${listmat}" var="mat" varStatus="status">
            <tr>
                <td><c:out value="${status.count}"/></td> 
                <td><c:out value="${mat.codeM}"/></td>
                <td><c:out value="${mat.nomM}"/></td>
                <td>
                    <button type="button" class="btn btn-default" onclick="ModifierMat(<c:out value="${mat.codeM}"/>)" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i> </button> &nbsp;
                    <button type="button" class="btn btn-default" onclick="SupprimerMat(<c:out value="${mat.codeM}"/>)"><i class="fa fa-trash fa-lg" aria-hidden="true" ></i></button>
                </td>
            </tr>
         </c:forEach>
    </c:if>
    </tbody>
  </table>
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" >
  Ajouter une Matière
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Modifier Matière </h4>
      </div>
        
        <form action="ModifierMat" method="Post" >
      <div class="modal-body">
          <input type="text" name="codeMat" style="display: none;" value="<c:out value="${matSelected.codeM}"/>"/>
       <div class="form-group">
        <label for="codeM">Code Matière</label>
        <input type="text" class="form-control" id="codeM" name="codeM"  value="<c:out value="${matSelected.getCodeM()}"/>" required>
        </div>
  <div class="form-group">
        <label for="nomM">Nom Matière </label>
        <input type="text" class="form-control" id="nomM" name="nomM"  value="<c:out value="${matSelected.getNomM()}"/>"required >
        </div>

  </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" onclick="redirectToAdd()">Annuler</button>
            <button id="submit" type="submit" class="btn btn-primary"  >Sauvegarder</button>
          </div>
        </form>
        </div>
  </div>
  </div>

  </div>
  </div>
     </div>
   </div>
            <!-- /.container-fluid -->

    </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    
    <script src="js/VerifyForm.js"></script>
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
    

</b
</html>
