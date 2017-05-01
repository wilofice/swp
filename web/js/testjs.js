function test(){
    alert("hey");
}

function init(){
    
}



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



function getSemestreId() {
    var id = $('#semestres option:selected').text();
    req = initRequest();
    url = "/swp/getgrpbysemstr?semestreid=" + id;
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function callback() {
    console.log(req);
    
    if (req.readyState === 4) {
        if (req.status === 200) {
            console.log(req.responseXML);
            parseMessages(req.responseXML);
            
            console.log("in call21");
        }
    }
}

function appendGroupes(id, nomG) {
    console.log("id = " + id + "nomg" + nomG );
    option = document.createElement("option");
    option.setAttribute("id", id);
    option.innerHTML= nomG;
    groupeSelect = document.getElementById("groupes");
    groupeSelect.appendChild(option);
}

function appendSemaines(id_semaine) {
    console.log("id = " + id_semaine);
    optionsd = document.createElement("option");
    optionsd.setAttribute("id", "sd" + id_semaine);
    optionsd.innerHTML= id_semaine;
    sdselect = document.getElementById("sdselect");
    sdselect.appendChild(optionsd);
    
    optionsf = document.createElement("option");
    optionsf.setAttribute("id", "sf" + id_semaine);
    optionsf.innerHTML= id_semaine;
    sfselect = document.getElementById("sfselect");
    sfselect.appendChild(optionsf);
    
}

function parseMessages(responseXML) {
    
    if (responseXML === null) {
        console.log("in pasrse error");
        return false;
    } else {
        console.log("in pasrse");
        groupeSelect = document.getElementById("groupes");
        while (groupeSelect.firstChild) {
            groupeSelect.removeChild(groupeSelect.firstChild);
        }
        
        sdselect = document.getElementById("sdselect");
        sfselect = document.getElementById("sfselect");
        while (sdselect.firstChild) {
            sdselect.removeChild(sdselect.firstChild);
        }
        
        while (sfselect.firstChild) {
            sfselect.removeChild(sfselect.firstChild);
        }
        var groupes = responseXML.getElementsByTagName("groupes")[0];
        if (groupes.childNodes.length > 0) {
            for (loop = 0; loop < groupes.childNodes.length; loop++) {
                var groupe = groupes.childNodes[loop];
                var id = groupe.getElementsByTagName("id")[0];
                var nomG = groupe.getElementsByTagName("nomG")[0];
                var niveau = groupe.getElementsByTagName("niveau")[0];
                var nomFiliere = groupe.getElementsByTagName("nomFiliere")[0];
                appendGroupes(id.childNodes[0].nodeValue, nomG.childNodes[0].nodeValue);
                console.log("in loop groupes");
            }
        }
        
        var semaines = responseXML.getElementsByTagName("semaines")[0];
        if (semaines.childNodes.length > 0) {
            for (loop = 0; loop < semaines.childNodes.length; loop++) {
                var semaine = semaines.childNodes[loop];
                var id_semaine = semaine.getElementsByTagName("id_semaine")[0];
                var date_debut = semaine.getElementsByTagName("date_debut")[0];
                var id_semestre = semaine.getElementsByTagName("id_semestre")[0];
                
                appendSemaines(id_semaine.childNodes[0].nodeValue);
                console.log("in loop semaines");
            }
        }
    }

}

function getEMP(grpid, semestreid) {
    req = initRequest();
    url = "/swp/getempbygrp?grpid=" + grpid + "&semestreid=" + semestreid;
    req.open("GET", url, false);
    req.onreadystatechange = null;
    req.send(null);
}


$(document).ready(function(){
    $("#groupselect").prop("selectedIndex", -1);
    $("#sdselect").prop("selectedIndex", -1);
    $("#sfselect").prop("selectedIndex", -1);
    $("#enseignantselect").prop("selectedIndex", -1);
    $("#matiereselect").prop("selectedIndex", -1);
    $("#semestres").prop("selectedIndex", -1);
    $("#groupes").prop("selectedIndex", -1);

$('.myradio-group .myradio').click(function(){
    var idg =$(".myradio-group").find('.selected').attr("id");
    
    $(this).parent().parent().find('.myradio').removeClass('selected');
    $(this).addClass('selected');
   
    
    //alert("#" + this.id)
    $("#ajouter").removeClass('disabled');
    
    //$("#modifier").removeClass('disabled');
    //$("#supprimer").removeClass('disabled');
    $("#ajouter").attr("data-target", "#mymodal" + this.id);
    $("#modifier").attr("data-target", "#mymodal" + this.id);
    $("#supprimer").attr("data-target", "#mymodal" + this.id);
   
    
    


});

$('#groupselect').change(function(){
     var text = $("#groupselect option:selected").text();
     var id = $(".myradio-group").find('.selected').attr("id");
     var groupeid = "#groupe" + id;
     var spantag = $(".myradio-group").find('.selected').find(groupeid);
     spantag.text(text);
});

$('#sdselect').change(function(){
    var tiret=" -"
     var text = $("#sdselect option:selected").text()+tiret;
    
     var id = $(".myradio-group").find('.selected').attr("id");
     var sdid = "#sd" + id;
     var spantag = $(".myradio-group").find('.selected').find(sdid);
     spantag.text(text);

});

$('#sfselect').change(function(){
     var tiret=" -"
     var text = $("#sfselect option:selected").text();
    
     var id = $(".myradio-group").find('.selected').attr("id");
     var sfid = "#sf" + id;
     var spantag = $(".myradio-group").find('.selected').find(sfid);
     spantag.text(text);

});

$('#matiereselect').change(function(){
     var text = $("#matiereselect option:selected").text();
    
     var id = $(".myradio-group").find('.selected').attr("id");
     var matiereid = "#matiere" + id;
     var spantag = $(".myradio-group").find('.selected').find(matiereid);
     spantag.text(text);

});

$('#enseignantselect').change(function(){
     var text = $("#enseignantselect option:selected").text();
    
     var id = $(".myradio-group").find('.selected').attr("id");
     var enseignantid = "#enseignant" + id;
     var spantag = $(".myradio-group").find('.selected').find(enseignantid);
     spantag.text(text);

});


//reset de la case sélectionné
$('#reset').click(function(){
    var id = $(".myradio-group").find('.selected').children().text("");
    $('.myradio-group .myradio').removeClass("selected");
    $("#groupselect").prop("selectedIndex", -1);
    $("#sdselect").prop("selectedIndex", -1);
    $("#sfselect").prop("selectedIndex", -1);
    $("#enseignantselect").prop("selectedIndex", -1);
    $("#matiereselect").prop("selectedIndex", -1);



});

$('#enregister').click(function(){
    alert("lsqdjfq");
    return;
    var groupe1 = $("#groupe1").text();
    var sd1 = $("sd1").text();
    var sf1 = $("sf1").text();
    var matiere1 = $("matiere1").text();
    var enseignant1 = $("enseignant1").text();
    
    var postFormStr = '<form action="gestionemploi" method="post">' +
  '<input type="text" name="groupe1" value="' + 1 + '" />' + 
  '<input type="text" name="sd1" value="' + 1 + '" />' +
  '<input type="text" name="sf1" value="' + 2 + '" />' +
  '<input type="text" name="matiere1" value="uml" />' +
  '<input type="text" name="enseignant1" value="' + 1 + '" />' +
  '</form>';


    var formElement = $(postFormStr);

    $('body').append(formElement);
    $(formElement).submit();

});

//reset de la case sélectionné
$('#reset').click(function(){
    var id = $(".myradio-group").find('.selected').children().text("");
});

//charger les groupes selon le semestre selectionné 

$('#semestres').change(function(event){
    groupeSelect = document.getElementById("groupes");
    while (groupeSelect.firstChild) {
        groupeSelect.removeChild(groupeSelect.firstChild);
    }

    sdselect = document.getElementById("sdselect");
    sfselect = document.getElementById("sfselect");
    while (sdselect.firstChild) {
        sdselect.removeChild(sdselect.firstChild);
    }

    while (sfselect.firstChild) {
        sfselect.removeChild(sfselect.firstChild);
    }
    
    getSemestreId();
     
});

$('#groupes').change(function(event){
    var grpid = $('#groupes option:selected').attr("id");
    var semestreid = $('#semestres option:selected').text();
    getEMP(grpid, semestreid);
});


});

