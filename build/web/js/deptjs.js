function test(){
    alert("hey i create");
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


function edit() {
    var idthis =$(".myradio-group").find('.selected').attr("id");
    $("#matiere" + idthis).text($("#matiere option:selected").text());
    $("#matiereid" + idthis).text($("#matiere option:selected").attr("value"));
    $("#sd" + idthis).text($("#semaineDebut option:selected").text());
    $("#sf" + idthis).text($("#semainefin option:selected").text());
    $("#enseignant" + idthis).text($("#enseignant option:selected").text());
    $("#enseignantid" + idthis).text($("#enseignant option:selected").attr("value"));
    $(".myradio-group").find('.selected').popover('hide');
}

function mydelete() {
    var idthis =$(".myradio-group").find('.selected').attr("id");
    $("#matiere" + idthis).text("");
    $("#matiereid" + idthis).text("");
    $("#sd" + idthis).text("");
    $("#sf" + idthis).text("");
    $("#enseignant" + idthis).text("");
    $("#enseignantid" + idthis).text("");
    $(".myradio-group").find('.selected').popover('hide');
}

function getEMP(grpid, semestreid) {
    req = initRequest();
    url = "/swp/getempbygrp?grpid=" + grpid + "&semestreid=" + semestreid;
    req.open("GET", url, false);
    req.onreadystatechange = null;
    req.send(null);
}

function addEmp() {
    console.log($("#semaineDebut option:selected").text());

    console.log($("#matiere option:selected").attr("value"));
    console.log($("#groupes option:selected").attr("id"));
    xhr = new XMLHttpRequest();
    
    params = "emptoeditadd=" + $("#emptoeditadd").text() + "&numerocase=" +$("#numerocase").text() + "&sd="+$("#semaineDebut option:selected").text();
    params += "&sf=" + $("#semainefin option:selected").text() + "&enseignant=" + $("#enseignant option:selected").attr("value") + "&matiere=" + $("#matiere option:selected").attr("value");
    params += "&groupe=" + $("#groupes option:selected").attr("id");
    params += "&semestre=" + $("#semestres option:selected").text();
    xhr.open ("GET", "/swp/addemp?" + params, true);
    console.log(params);
    var idthis = $(".myradio-group").find('.selected').attr("id");
    xhr.onreadystatechange = mycallback(idthis);
    xhr.send(null);
    
    groupeselected = $("#groupes option:selected").attr("id");
    $("#matiere" + idthis).text($("#matiere option:selected").text());
    $("#matiereid" + idthis).text($("#matiere option:selected").attr("value"));
    $("#sd" + idthis).text($("#semaineDebut option:selected").text());
    $("#sf" + idthis).text($("#semainefin option:selected").text());
    $("#enseignant" + idthis).text($("#enseignant option:selected").text());
    $("#enseignantid" + idthis).text($("#enseignant option:selected").attr("value"));
    $(".myradio-group").find('.selected').popover('hide');
}

function mycallback(idthis) {
    console.log(xhr);
     console.log("salma " +xhr.readyState );
    console.log()
    if (xhr.readyState === 4) {
        
        console.log("after requete is ready");
        if (xhr.status === 200) {
            console.log("requete OK = " + xhr);
            console.log(xhr.responseXML);
            var idofemp = parseResponse(xhr.responseXML);
            console.log("idofemp " + idofemp);
            $("#emp" + idthis).text(idofemp);
            console.log("in call21");
        }
    }
}


function parseResponse(responseXML) {
    if (responseXML === null) {
        console.log("in pasrse error");
        return false;
    } else {
        var emplois = responseXML.getElementsByTagName("emplois")[0];
        if (emplois.childNodes.length > 0) {
            for (loop = 0; loop < emplois.childNodes.length; loop++) {
                var emp = emplois.childNodes[loop];
                var idofemptag = emp.getElementsByTagName("idemploi")[0];
                var idofemp = idofemptag.childNodes[0].nodeValue;
                return idofemp;
            }
        }
    }
}
$(document).ready(function(){
    $("#groupselect").prop("selectedIndex", -1);
    $("#sdselect").prop("selectedIndex", -1);
    $("#sfselect").prop("selectedIndex", -1);
    $("#enseignantselect").prop("selectedIndex", -1);
    $("#matiereselect").prop("selectedIndex", -1);
    //$("#semestres").prop("selectedIndex", -1);
    //$("#groupes").prop("selectedIndex", -1);
    groupeselected = $("#groupes option:selected").attr("id");
    semestreactuelle = $("#semestres option:selected").text();
   
       
$('.myradio-group .myradio').click(function(){
    var id =$(".myradio-group").find('.selected').attr("id");
    console.log(id);
        
    $(".myradio-group").find('.selected').popover("hide");
    $(this).parent().parent().find('.myradio').removeClass('selected');
    $(this).addClass('selected');
    var idthis = $(this).attr("id");
    console.log(idthis);
    groupeselected = $("#groupes option:selected").attr("id");
    empid = $("#idseanceEmp" + idthis).text();
    jour = $("#jourEmp" + idthis).text();
    heure = $("#heureEmp" + idthis).text();
    matierenom = $("#matiereNomEmp" + idthis).text();
    matiereid = $("#matiereEmp" + idthis).text();
    semainedebut = $("#dateDEmp" + idthis).text();
    semainefin = $("#dateFEmp" + idthis).text();
    enseignantnom = $("#nomEnsEmp" + idthis).text();
    enseignantid = $("#idEnsEmp" + idthis).text();
     console.log("resultat de la recuperation");
       
     console.log(enseignantnom);
     console.log(enseignantid);
    var semestreactuelle = $("#semestres option:selected").text();
    var optionsemestretext = "";
    if(semestreactuelle === "1") {
        for(loop = 1; loop <= 14; loop++) {
            if( semainedebut===loop){
                  optionsemestretext += '<option "selected="selected">' + loop + '</option>';
            }
            else{
                  optionsemestretext += '<option>' + loop + '</option>';
            }
            
        }
    } else {
        for(loop = 15; loop <= 28; loop++) {
             if($(this).attr("id")===loop){
                  optionsemestretext += '<option "selected="selected">' + loop + '</option>';
            }
            else{
                  optionsemestretext += '<option>' + loop + '</option>';
            }
        }
    }
    var listeenseignanttext = "";
    $("#listeenseignant").children("p").each(function() {
       console.log($(this));
        if($(this).attr("id")===enseignantid ){
             listeenseignanttext += '<option' + ' id = "' + $(this).attr("id") + '" selected="selected" value="'+ $(this).attr("id") + '">' +  $(this).text() + '</option>';
        }
        else{
            listeenseignanttext += '<option' + ' id = "' + $(this).attr("id") + '" value="'+ $(this).attr("id") + '">' +  $(this).text() + '</option>';
        }
        console.log("voici ens select");
        
    });
    
    var listematiere  = "";
    
    $("#listematiere").children("p").each(function() {
        if($(this).attr("id")=== matiereid ){
              listematiere += '<option' + ' id = "' + $(this).attr("id") + '" selected="selected" value="'+ $(this).attr("id") + '" >' +  $(this).text() + '</option>';
        }
        else{
             listematiere += '<option' + ' id = "' + $(this).attr("id") + '" value="'+ $(this).attr("id") + '" >' +  $(this).text() + '</option>';
        }
     
    });
    
    $(this).attr("title", "Emploi du temps");
    console.log("jour = " + jour + "heure = " + heure); 
    if(enseignantnom === ''){
        console.log(enseignantnom);
        console.log(enseignantid);
        console.log(matierenom);
        $(this).attr("data-content", '<form id="myform" action="addemp" name="myformtoemp" method="POST"><span id="emptoeditadd" name="emptoeditadd" style="display: none;" >' + empid + '</span> '+
                                          '<span id="numerocase" name="numerocase" style="display: none;">' + idthis + '</span>'+
                                          '<span id="jour" >' + (jour === undefined? '':jour) + '</span>  '+
                                          '<span id="heure" > ' + (heure === undefined? '': heure)+ '</span>'+
                                          '<span id="groupeselectionne" style="display: none;">' + groupeselected +  '</span>'+
                                          '<br/>'+
                                         '<div class="form-group">'+
                                             
                                           '<label>Semaine Debut</label>'+
                                            '<select class="form-control" id="semaineDebut" name="sd">'+
                                             optionsemestretext +
   
                                            '</select>'+
                                         '</div>'+
                                          
                                          '<div class="form-group">'+
                                           '<label>Semaine Fin</label>'+
                                            '<select class="form-control" id="semainefin" name="sf">'+ optionsemestretext +
                                            '</select>'+
                                         '</div>'+
                                          
                                          '<div class="form-group">'+
                                            '<label>Enseignant</label>'+
                                            '<select class="form-control" id="enseignant" name="enseignant">'+ listeenseignanttext +
                                            '</select>'+
                                         '</div>'+
                                          '<div class="form-group">'+
                                           '<label>Matiere</label>'+
                                            '<select class="form-control" id="matiere" name="matiere">'+ listematiere +
                                            '</select>'+
                                         '</div>' +
                                         '<input type="button" onclick="addEmp()" class="btn btn-default" value="Create"/>' +
                             '</form>');
                         console.log("je suis dans create");
    } else {
        console.log("je suis dans modifier");
         console.log(enseignantnom);
        console.log(enseignantid);
        console.log(matierenom);
        
        $(this).attr("data-content", '<form id="myform" action="addemp" name="myformtoemp" method="POST"><span id="emptoeditadd" name="emptoeditadd" style="display: none;" >' + empid + '</span> '+
                                          '<span id="numerocase" name="numerocase" style="display: none;">' + idthis + '</span>'+
                                          '<span id="jour" >' + (jour === undefined? '':jour) + '</span>  '+
                                          '<span id="heure" > ' + (heure === undefined? '': heure)+ '</span>'+
                                          '<span id="groupeselectionne" style="display: none;">' + groupeselected +  '</span>'+
                                          '<br/>'+
                                         '<div class="form-group">'+
                                             
                                           '<label>Semaine Debut</label>'+
                                            '<select class="form-control" id="semaineDebut" name="sd">'+
                                             optionsemestretext +
   
                                            '</select>'+
                                         '</div>'+
                                          
                                          '<div class="form-group">'+
                                           '<label>Semaine Fin</label>'+
                                            '<select class="form-control" id="semainefin" name="sf">'+ optionsemestretext +
                                            '</select>'+
                                         '</div>'+
                                          
                                          '<div class="form-group">'+
                                            '<label>Enseignant</label>'+
                                            '<select class="form-control" id="enseignant" name="enseignant">'+ listeenseignanttext +
                                            '</select>'+
                                         '</div>'+
                                          '<div class="form-group">'+
                                           '<label>Matiere</label>'+
                                            '<select class="form-control" id="matiere" name="matiere">'+ listematiere +
                                            '</select>'+
                                         '</div>' +
                                         '<input type="button" onclick="edit()" class="btn btn-default" value="Edit"/>' +
                                         '<input type="button" onclick="mydelete()" class="btn btn-default" value="Delete"/>' +
                             '</form>');
                         
    }
    
    $(this).popover({
        html: true,
        template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
    });
    console.log("i'm here");
    $(this).popover('show');
   
   
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

$('#afficher').click(function(){
    grpid = $("#groupes option:selected").attr("id");
    console.log("Le groupe id:" + groupeselected);
    semestreid = $("#semestres option:selected").text();
    window.location.href = "/swp/gestionemploi?grpid=" + grpid + "&semestreid=" + semestreid;
    
//    var postFormStr = '<form action="gestionemploi" method="post">' +
//  '<input type="text" name="groupe1" value="' + 1 + '" />' + 
//  '<input type="text" name="sd1" value="' + 1 + '" />' +
//  '<input type="text" name="sf1" value="' + 2 + '" />' +
//  '<input type="text" name="matiere1" value="uml" />' +
//  '<input type="text" name="enseignant1" value="' + 1 + '" />' +
//  '</form>';


 //   var formElement = $(postFormStr);

 //   $('body').append(formElement);
 //   $(formElement).submit();

});

//reset de la case sélectionné
$('#reset').click(function(){
    var id = $(".myradio-group").find('.selected').children().text("");
});

//charger les groupes selon le semestre selectionné 

//$('#semestres').change(function(event){
//    groupeSelect = document.getElementById("groupes");
//    while (groupeSelect.firstChild) {
//        groupeSelect.removeChild(groupeSelect.firstChild);
//    }
//
//    sdselect = document.getElementById("sdselect");
//    sfselect = document.getElementById("sfselect");
//    while (sdselect.firstChild) {
//        sdselect.removeChild(sdselect.firstChild);
//    }
//
//    while (sfselect.firstChild) {
//        sfselect.removeChild(sfselect.firstChild);
//    }
//    
//    getSemestreId();
//     
//});

//$('#groupes').change(function(event){
//    var grpid = $('#groupes option:selected').attr("id");
//    var semestreid = $('#semestres option:selected').text();
//    getEMP(grpid, semestreid);
//});


});

