
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SwapMyLecture</title>

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
        
        function editGroupe(id){
            window.location.href = "editGroupe?id="+id;
           
        }
        
        function redirectToAdd(){
            window.location.href = "addgroupe";
            
        }
        
        $(document).ready(function(){
        // Show the Modal on load
        console.log("i got here");
        $("#myModal").modal("show"); });
    console.log("i got here");
        
        
       
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
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="/swp/gestionemploi?grpid=1&semestreid=2"><i class="fa fa-calendar "></i> Emplois du temps</a>
                    </li>
                    <li >
                        <a href="/swp/addmatiere"><i class="fa fa-book"></i>  Matières</a>
                    </li>
                    <li class="active">
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
 
 <h2>Groupes</h2>      
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Numéro</th>
        <th>Niveau</th>
        <th>Groupe</th>
        <th>Filière</th>
        <th>Mail</th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${!empty listGroupe}">
        <c:forEach items="${listGroupe}" var="groupe" varStatus="status">
            <tr>
                <td><c:out value="${status.count}"/></td>
                <td><c:out value="${groupe.niveau}"/></td>
                <td><c:out value="${groupe.nomG}"/></td>
                <td><c:out value="${groupe.nomFiliere}"/></td>
                <td><c:out value="${groupe.email}"/></td>
                
                <td>
                    <button type="button" class="btn btn-default" onclick="editGroup('<c:out value="${groupe.numG}"/>')"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" data-toggle="modal" data-target="#myModal" ></i> </button> &nbsp;
                    <button type="button" class="btn btn-default" onclick="deleteGroup('<c:out value="${groupe.numG}"/>')"><i class="fa fa-trash fa-lg" aria-hidden="true" ></i></button>
                 </td>
                
                
            </tr>
         </c:forEach>
    </c:if>
    </tbody>
  </table>
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Ajouter un groupe
</button>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Groupe </h4>
      </div>
        
        <form action="editGroupe" method="Post" >
      <div class="modal-body">
          <input type="text" name="numG" style="display: none;" value="<c:out value="${groupeSelected.numG}"/>"/>
     
        
     <div class="form-group">
    <label for="nomG">Groupe</label>
    <input type="text" class="form-control" id="nomG" name="nomG"  placeholder="Entrez le groupe" value="<c:out value="${groupeSelected.getNomG()}"/>">
    </div>
       <div class="form-group">
<label for="nomFiliere">Filière</label>  
<select id="nomFiliere" class="form-control" name="nomFiliere" value="<c:out value="${groupeSelected.getNomFiliere()}"/>" >
  
  <option>Informatique</option>
  <option>Civil</option>
  <option>Électrique</option>
  <option>RT</option>
  <option>Industriel</option>
  <option>Mécanique</option>
  <option>Minéral</option>
  <option>MIS</option>
  <option>Procédés</option>  
  
</select>
  </div>

  <div class="form-group">
    <label for="niveau">Niveau</label>    
    <select id="niveau" class="form-control" name="niveau" value="<c:out value="${groupeSelected.niveau}"/>">
        
        <option>1</option>
        <option>2</option>
        <option>3</option>  
  
</select>
  
  </div>
    
      <div class="form-group">
            <label for="mail">Mail</label>
            <input type="email" class="form-control" id="mail" name="mail"  placeholder="Entrez le  mail du groupe" value="<c:out value="${groupeSelected.email}"/>">
      </div>  
            
  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
        <button type="submit" class="btn btn-primary">Modifier</button>
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
