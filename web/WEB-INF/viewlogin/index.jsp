<%-- 
    Document   : index
    Created on : 22-avr.-2017, 1:17:38
    Author     : genereux
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

  <meta charset="UTF-8">

  <title>SWP</title>

    <style>
@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
</style>

<link rel="stylesheet" href="css/styles.css" type="text/css">

</head>

<body>
     <img class="background" src="images/emi.jpg" alt="emi" />
    <div class="login">
                    <form action="" method = "POST">
                        <input type="email" placeholder="email" name="id" required><br>
                        <c:if test="${!empty erreurlogin}">
                            <p class="loginerror">Cet utisateur n'existe pas!</p>
                        </c:if>
                        
                        <input type="password" placeholder="password" name="password" required><br>
                        <c:if test="${!empty erreurpassword}">
                            <p class="motdepasserror">Le mot de passe est incorrect.</p>
                        </c:if> 
			<input type="submit" value="Login">
                    </form>	
        <a href="/swp/mdpOublie"><span style="color: white;">Mot de passe oublié?</span></a>
    </div>
		
</body>
</html>
