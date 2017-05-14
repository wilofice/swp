
$(document).ready(function(){
    
var currentDate  = new Date(),
    currentDay   = currentDate.getDate() < 10 
                 ? '0' + currentDate.getDate() 
                 : currentDate.getDate(),
    currentMonth = currentDate.getMonth() < 9 
                 ? '0' + (currentDate.getMonth() + 1) 
                 : (currentDate.getMonth() + 1);

document.getElementById("datedujour").innerHTML = currentDay + '/' + currentMonth + '/' +  currentDate.getFullYear();

for(var i = 1; i <= 28; i++) {
    option = document.createElement("option");
    option.innerHTML = i;
    $('#semaineselect').append(option);
}
$("#semaineselect").prop("selectedIndex", -1);

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
    var messageReport = "Bonjour chers élèves, La séance annulée de " + matierenom + " du " + jour + " de " + heure + " Sera programmée pour "+ jourSelected +" de "+heureSelected;
    $('#messageReport').text(messageReport);
    
    var objetmessageReport = "séance de Rattrapage de " + matierenom + " le " + jourSelected + " de " + heureSelected;
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
    
    var message = "Bonjour chers eleves, je ne pourrai pas assurer la seance de " + matierenom + " du " + jour + " de " + heure + " Une seance de rattrapage sera programmee plus tard!"+"\n"+"Cordialement.";
    $('#message').text(message);      
    var objetmessage = "Report de la seance de " + matierenom + " du " + jour;
    $('#objetmessage').attr("value", objetmessage);
    
    var messageD = "Bonjour, je ne pourrai pas assurer la seance de " + matierenom + " du " + jour + " de " + heure + " Une seance de rattrapage sera programmee plus tard!"+"\n"+"Cordialement.";
    $('#messageD').text(messageD);
    
    var currentsemaineid = $('#semaineselect option:selected').text();
    currentsemaineid = "15";
    $('#currentsemaineid').attr("value", currentsemaineid);  
    $("#SigAbsc").attr("data-target", "#SigAbsc" + this.id);
    $("#AjSeaSupp").attr("data-target", "#AjSeaSupp" + this.id);
    $("#Plann").attr("data-target", "#Plann" + this.id);

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
