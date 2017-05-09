<%-- 
    Document   : draw
    Created on : 29-avr.-2017, 16:46:10
    Author     : genereux
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<c:if test="${!empty seanceHashMap}">
                                                    <span id="idseance11" style="display: none;">sqfdqd<c:out value='${(seanceHashMap["lundi"])["8"].numS}'></c:out></span>
                                                    <!-- Enregistrer les ids des groupes et matieres dans des élements html invisibles pour après les réutiliser-->
                                                    <span id="matiereid11" style="display: none;">fqdqs<c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numM.codeM}'></c:out></span>
                                                    <span id="matierenom11">dfsqf<c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numM.nomM}'></c:out></span>
                                                    <span id="groupeid11" style="display: none;">dqsf<c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.numG}'></c:out></span>
                                                    <span id="groupenom11">sqdfq<c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.nomG}'></c:out></span>
                                                    <span id="groupemail11" style="display: none;">sdqfq<c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.email}'></c:out></span>
                                                    <span id="filierenom11">fqsdf<c:out value='${(seanceHashMap["lundi"])["8"].numEmp.numG.nomFiliere}'></c:out></span>
                                                    <span id="realdate11" style="display: none;">fqsdf<c:out value='${(seanceHashMap["lundi"])["8"].numC.date}'></c:out></span>
                                                    <span id="heure11" style="display: none;">08h à 10h</span>
                                                    <span id="jour11" style="display: none;">Lundi</span>
                                                </c:if>


