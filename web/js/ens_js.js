taille = $('#notif').find('li').length;

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') !== -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function getCountMessage() {
    var id = $('#idofens').text();
    req = initRequest();
    url = "/swp/notifications?ensid=" + id;
    console.log("enseignant numero "+id);
    req.open("GET", url, true);
    console.log("test test test");
    req.onreadystatechange = backcall;
    req.send(null);
}

function appendNotif(mseg) {
    var a = document.createElement("a");
    a.setAttribute("href", "#");
    a.innerHTML = mseg;
    var li = document.createElement("li");
    li.appendChild(a);
    var ul = document.getElementById("notif");
    ul.appendChild(li);
    var tr = document.createElement("tr");
    li.appendChild(tr); 
    
}
function extractContent(responseXML) {
     if (responseXML === null) {
        console.log("in pasrse error");
        return false;
    }
    else{
        var m = responseXML.getElementsByTagName("message")[0];
        var msg = m.childNodes[0].nodeValue;
        console.log("msg rec = " + msg);
        return msg;
        
        
    }
    
}

function testtaillechange() {
    if (taille < $('#notif').find('li').length) {
        getCountMessage();
    }
}

function backcall() {
    console.log(req);
    
    if (req.readyState === 4) {
        if (req.status === 200) {
            console.log(req.responseXML);
            var m = extractContent(req.responseXML);
            appendNotif(m);
            console.log("in call21");
            var numeronot = document.getElementById("numbernot");
            numeronot.innerHTML = $("#notif").children("li").length;
            getCountMessage();
        }
    }
    
    
}
function getMatiere() {
    var id = $('#grpselect option:selected').attr("value");
    req = initRequest();
    url = "/swp/getmatandcrenbyprp?classe=" + id;
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}
function getExamMatiere() {
    var id = $('#grpexamselect option:selected').attr("value");
    req = initRequest();
    url = "/swp/getmatandcrenbyprp?classe=" + id;
    req.open("GET", url, true);
    req.onreadystatechange = callexamback;
    req.send(null);
}

function callback() {
    console.log(req);
    
    if (req.readyState === 4) {
        if (req.status === 200) {
            console.log(req.responseXML);
            parseMessages(req.responseXML);
            
            
        }
    }
}
function callexamback() {
    console.log(req);
    
    if (req.readyState === 4) {
        if (req.status === 200) {
            console.log(req.responseXML);
            parseExamMessages(req.responseXML);
            
            
        }
    }
}

$('#grpselect').change(function(event){
    groupeSelect = document.getElementById("grpselect");
    while (groupeSelect.firstChild) {
        groupeSelect.removeChild(groupeSelect.firstChild);
    }

    matiere = document.getElementById("matselect");
    creneau = document.getElementById("creselect");
    while (matiere.firstChild) {
        matiere.removeChild(matiere.firstChild);
    }

    while (creneau.firstChild) {
        creneau.removeChild(creneau.firstChild);
    }
    
    getMatiere();
     
});


function appendMatieres(codeM, nomM) {
    //console.log("id = " + id + "nomg" + nomG );
    option = document.createElement("option");
    option.setAttribute("value", codeM );
    option.innerHTML= nomM;
    matiereselect = document.getElementById("matselect");
    matiereselect.appendChild(option);
}
function appendExamMatieres(codeM, nomM) {
    //console.log("id = " + id + "nomg" + nomG );
    option = document.createElement("option");
    option.setAttribute("value", codeM );
    option.innerHTML= nomM;
    matiereexamselect = document.getElementById("matexamselect");
    matiereexamselect.appendChild(option);
}

function appendCreneau(numC, dateC, heureC) {
    option = document.createElement("option");
    option.setAttribute("value", numC );
    option.innerHTML= dateC + " " + heureC;
    creneauselect = document.getElementById("creselect");
    creneauselect.appendChild(option);
}
function appendExamCreneau(numC, dateC, heureC) {
    option = document.createElement("option");
    option.setAttribute("value", numC );
    option.innerHTML= dateC + " " + heureC;
    creneauexamselect = document.getElementById("creexamselect");
    creneauexamselect.appendChild(option);
}


function parseMessages(responseXML) {
    if (responseXML === null) {
        console.log("in pasrse error");
        return false;
    } else {
        console.log("in pasrse");
        
        
        var matieres = responseXML.getElementsByTagName("matieres")[0];
        if (matieres.childNodes.length > 0) {
            for (loop = 0; loop < matieres.childNodes.length; loop++) {
                var matiere = matieres.childNodes[loop];
                var codeM = matiere.getElementsByTagName("codeM")[0];
                var nomM = matiere.getElementsByTagName("nomM")[0];
                
                appendMatieres(codeM.childNodes[0].nodeValue, nomM.childNodes[0].nodeValue);
                console.log("in loop groupes");
            }
        }
        
        var creneaux = responseXML.getElementsByTagName("creneaux")[0];
        if (creneaux.childNodes.length > 0) {
            for (loop = 0; loop < creneaux.childNodes.length; loop++) {
                var creneau = creneaux.childNodes[loop];
                var numC = creneau.getElementsByTagName("idc")[0];
                var dateC = creneau.getElementsByTagName("date")[0];
                var heureC = creneau.getElementsByTagName("heure")[0];
                
                appendCreneau(numC.childNodes[0].nodeValue, dateC.childNodes[0].nodeValue, heureC.childNodes[0].nodeValue);
                console.log("in loop semaines");
            }
        }
    }

}
function parseExamMessages(responseXML) {
    if (responseXML === null) {
        console.log("in pasrse error");
        return false;
    } else {
        console.log("in pasrse");
        
        
        var matieres = responseXML.getElementsByTagName("matieres")[0];
        if (matieres.childNodes.length > 0) {
            for (loop = 0; loop < matieres.childNodes.length; loop++) {
                var matiere = matieres.childNodes[loop];
                var codeM = matiere.getElementsByTagName("codeM")[0];
                var nomM = matiere.getElementsByTagName("nomM")[0];
                
                appendExamMatieres(codeM.childNodes[0].nodeValue, nomM.childNodes[0].nodeValue);
                console.log("in loop groupes");
            }
        }
        
        var creneaux = responseXML.getElementsByTagName("creneaux")[0];
        if (creneaux.childNodes.length > 0) {
            for (loop = 0; loop < creneaux.childNodes.length; loop++) {
                var creneau = creneaux.childNodes[loop];
                var numC = creneau.getElementsByTagName("idc")[0];
                var dateC = creneau.getElementsByTagName("date")[0];
                var heureC = creneau.getElementsByTagName("heure")[0];
                
                appendExamCreneau(numC.childNodes[0].nodeValue, dateC.childNodes[0].nodeValue, heureC.childNodes[0].nodeValue);
                console.log("in loop semaines");
            }
        }
    }

}

$(document).ready(function(){
    
    //getCountMessage();
    
var currentDate  = new Date(),
    currentDay   = currentDate.getDate() < 10 
                 ? '0' + currentDate.getDate() 
                 : currentDate.getDate(),
    currentMonth = currentDate.getMonth() < 9 
                 ? '0' + (currentDate.getMonth() + 1) 
                 : (currentDate.getMonth() + 1);

document.getElementById("datedujour").innerHTML = currentDay + '/' + currentMonth + '/' +  currentDate.getFullYear();

//for(var i = 1; i <= 28; i++) {
//    option = document.createElement("option");
//    option.innerHTML = i;
//    $('#semaineselect').append(option);
//}
//var sara=13;
//$('#semaineselect').val(sara);
//console.log("SARA SARA GOT HERE ");
//$("#semaineselect").prop("selectedIndex",25 );
// $(window).on('load',function(){
//        var sara=13;
//        $('#semaineselect').val(sara);
//    });

$('.myradio-group .seance').dblclick(function(){ 
    $(this).parent().parent().find('.seance').removeClass('selected');
    $(this).addClass('selected');
    console.log("double clicked");
    console.log("abccenceclasse   " + $('.abscenceclass').attr("id") + $(this).attr("id"));
    
    var idselected = $(this).attr("id"); 
    var id = $('.abscenceclass').attr("id");
    var numS = $('#idseance' + id).text();
    
    var jour = $('#jour' + id).text();
    var heure = $('#heure' + id).text();
    var groupenom = $('#groupenom' + id).text();
    var groupemail = $('#groupemail' + id).text();
    var filierenom = $('#filierenom' + id).text();
    var matierenom = $('#matierenom' + id).text();
    var realdate = $('#realdate' + id).text();
    
    var jourSelected = $('#jour' + idselected).text();
    var heureSelected = $('#heure' + idselected).text();
    console.log("Hello jour et heure " + $('#jour' + idselected).text() + $('#heure' + idselected).text());
    
    $('#seancereportid').attr("value", idselected);
    $('#seanceAbsenceid').attr("value", numS);
    $('#currentsemainereportid').attr("value", "25");
    option = document.createElement("option");
    option.setAttribute("value", groupemail);
    
    option.innerHTML = groupemail;
    emailgroupeselect = document.getElementById("emailgroupeReport");
    emailgroupeselect.appendChild(option);
    var messageReport = "La séance annulée de " + matierenom + " du " + jour + " de " + heure + " Sera programmée pour "+ jourSelected +" de "+heureSelected;
    $('#messageReport').text(messageReport);
    
    var objetmessageReport = "Séance de Rattrapage de " + matierenom + " le " + jourSelected + " de " + heureSelected;
    $('#objetmessageReport').attr("value", objetmessageReport);  
    
    $('#SeanceRatt').modal("show");
    
    
});

$('.myradio-group .seance').click(function(){

    $(this).parent().parent().find('.seance').removeClass('selected');
    $(this).addClass('selected');
    //alert("#" + this.id)
    $("#SigAbsc").removeClass('disabled');   
    //$("#modifier").removeClass('disabled');
    //$("#supprimer").removeClass('disabled');
    var id = $(this).attr("id"); 
    var numS = $('#idseance' + id).text();
    
    var jour = $('#jour' + id).text();
    var heure = $('#heure' + id).text();
    var groupenom = $('#groupenom' + id).text();
    var groupemail = $('#groupemail' + id).text();
    var filierenom = $('#filierenom' + id).text();
    var matierenom = $('#matierenom' + id).text();
    var realdate = $('#realdate' + id).text();
    
    $('#seancetoabsentid').attr("value", numS);
    option = document.createElement("option");
    option.setAttribute("value", groupemail);
    option.innerHTML = groupemail;
    emailgroupeselect = document.getElementById("emailgroupe");
    emailgroupeselect.appendChild(option);
    
    var message = "La seance de " + matierenom + " du " + jour + " de " + heure + " a été reportée pour une date ultérieure"+"\n";
    $('#message').text(message);      
    var objetmessage = "Report";
    $('#objetmessage').attr("value", objetmessage);
    
//    var messageD = "La seance de " + matierenom + " du " + jour + " de " + heure + " a été reportée pour une date ultérieure"+"\n";
//    $('#messageD').text(messageD);
    
    var currentsemaineid = $('#semaineselect option:selected').text();
    currentsemaineid = "15";
    $('#currentsemaineid').attr("value", currentsemaineid);  
    $("#SigAbsc").attr("data-target", "#SigAbsc" + this.id);
    $("#AjSeaSupp").attr("data-target", "#AjSeaSupp" + this.id);
    $("#Plann").attr("data-target", "#Plann" + this.id);

});

$('#grpselect').change(function(event){
    

    matiere = document.getElementById("matselect");
    creneau = document.getElementById("creselect");
    while (matiere.firstChild) {
        matiere.removeChild(matiere.firstChild);
    }

    while (creneau.firstChild) {
        creneau.removeChild(creneau.firstChild);
    }
    
    getMatiere();
     
});
$('#grpexamselect').change(function(event){
    

    matiere = document.getElementById("matexamselect");
    creneau = document.getElementById("creexamselect");
    while (matiere.firstChild) {
        matiere.removeChild(matiere.firstChild);
    }

    while (creneau.firstChild) {
        creneau.removeChild(creneau.firstChild);
    }
    
    getExamMatiere();
     
});




$('#semaineselect').change(function(){
    var semaineid = $('#semaineselect option:selected').text();
    var postFormStr = '<form action="gestionemploiens" method="post">' +
  '<input type="text" name="semaineid" value="' + semaineid  + '" />' + 
  '</form>';


    var formElement = $(postFormStr);

    $('body').append(formElement);
    $(formElement).submit();
});



});
