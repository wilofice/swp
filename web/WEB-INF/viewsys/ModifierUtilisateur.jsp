
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

    <title>Swap my lecture - Matière</title>

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
        
        function editUtil(id){
            window.location.href = "/swp/editUtilisateur?id="+id;
           
        }
        
        function redirectToAdd(){
            window.location.href = "/swp/addUtilisateur";
            
        }
        
        $(document).ready(function(){
        // Show the Modal on load
        console.log("i got here");
        $("#myModal").modal("show"); });
    console.log("i got here dkmjfqlkd");
        
        
       
    </script>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                </button>
                <a class="navbar-brand" href="addUtilisateur"><img src="images/swp.png" width="180" height="25"></a>
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
                            <a href="profil"><i class="fa fa-fw fa-user"></i> Profil</a>
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
                        <a href="addUtilisateur"><i class="fa fa-calendar "></i> Liste Utilisateurs</a>
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
 
 <h2>Utilisateurs</h2>      
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Mail</th>
        <th>Téléphone</th>
        <th>Rôle</th>
        <th>idUser</th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${!empty listEns}">
        <c:forEach items="${listEns}" var="Util" varStatus="status">
            <tr>
                <td><c:out value="${Util.nom}"/></td>
                <td><c:out value="${Util.prenom}"/></td>
                <td><c:out value="${Util.email}"/></td>
                <td><c:out value="${Util.tel}"/></td>
                <td><c:out value="${Util.rôle}"/></td>
                <td><c:out value="${Util.idUser.idUser}"/></td>
                <td>
                    <button type="button" class="btn btn-default" onclick="editUtil(<c:out value="${Util.id}"/>)" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i> </button> &nbsp;
                    <button type="button" class="btn btn-default" onclick="deleteUtil(<c:out value="${Util.id}"/>)"><i class="fa fa-trash fa-lg" aria-hidden="true" ></i></button>
                </td>
            </tr>
         </c:forEach>
    </c:if>
    </tbody>
  </table>
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Ajouter Utilisateur
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Modifier Utilisateur </h4>
      </div>
        
        <form action="editUtilisateur" method="Post" >
      <div class="modal-body">
          <input type="text" name="ensid" style="display: none;" value="<c:out value="${ensSelected.id}"/>"/>
      <div class="form-group">
        <label for="nomU">Nom *</label>
        <input type="text" class="form-control" id="nomU" name="nomU" aria-describedby="emailHelp" placeholder="Entrer le nom de l'utilisateur" value="<c:out value="${ensSelected.getNom()}"/>">
        </div>
      <div class="form-group">
        <label for="prenomU">Prénom *</label>
        <input type="text" class="form-control" id="prenomU" name="prenomU" placeholder="Entrer le Prénom de l'utilisateur" value="<c:out value="${ensSelected.getPrenom()}"/>">
      </div>
      <div class="form-group row">
         
          <div class="col-xs-7"> 
             <label> Mail *</label>
            <input type="text" class="form-control" id="P1Mail" name="P1Mail" placeholder="Entrer l'adresse mail de l'utilisateur" value="<c:out value="${ensSelected.email.split('@')[0]}"/>">
          </div>
          <div class="col-xs-5"> 
              <label> <br/> </label>
                <select class="form-control form-control-inline" name="P2Mail" id="P2Mail" value="<c:out value="${ensSelected.email.split('@')[1]}"/>">
                    <option id="emi">@emi.ac.ma</option>
                    <option id="gmail">@gmail.com</option>
                    <option id="yahoo">@yahoo.fr</option>
                </select>
          </div>
      </div>
      <div class="form-group">
        <label for="telU">Téléphone </label>
        <input type="tel" class="form-control" onblur="verifTel(this)" id="telU" name="telU" placeholder="Entrer le numéro de  téléphone de l'utilisateur" value="<c:out value="${ensSelected.getTel()}"/>">
      </div>
       <div class="form-group">
        <label for="RoleU">Rôle</label>
            <select class="form-control" name="roleU" id="roleU" selectedOption="<c:out value="${ensSelected.getRôle()}"/>">
                <option id="Ens" >Enseignant</option>
                <option id="Chefdept">Chef de département</option>
                <option id="Coordfil">Coordinateur de filière</option>
            </select>
       </div>
      <div class="form-group">
        <label for="idUser">IdUser</label>
        <input type="text" class="form-control" id="idUser" name="idUser" placeholder="Entrer l'identifiant de l'utilisateur" value="<c:out value="${ensSelected.getIdUser().getIdUser()}"/>" disabled>
      </div>
            
  </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" onclick="redirectToAdd()">Annuler</button>
            <button type="submit" class="btn btn-primary">Enregistrer</button>
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
