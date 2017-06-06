/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var nomens;
var prenonens;
var email;
var tel;
var mdp;

$(document).ready(function(){
    
    $("#modifier").click(function(){
        if($(this).text() === "Modifier"){
            nomens = $("#NomEns").attr("value");
            prenonens = $("#PrenomEns").attr("value");
            email = $("#EmailEns").attr("value");
            mdp = $("#MdpEns").attr("value");
            tel = $("#TelEns").attr("value");
            console.log(nomens, prenonens);
           $("#NomEns").removeAttr("disabled");
      
           $("#PrenomEns").removeAttr("disabled");
           $("#EmailEns").removeAttr("disabled");
           $("#TelEns").removeAttr("disabled");
           $("#MdpEns").attr("type", "text");
           $("#MdpEns").removeAttr("disabled");
           $(this).text("Annuler");
        } else {
            window.location = "/swp/profil";
//            console.log("nom = " + nomens, "prenomon = " + prenonens);
//            $("#NomEns").attr("value", nomens);
//            $("#PrenomEns").attr("value", prenonens);
//            $("#EmailEns").attr("value", email);
//            $("#MdpEns").attr("value", mdp);
//            $("#TelEns").attr("value", tel);
//            $("#NomEns").text(nomens);
//            $("#PrenomEns").html(prenonens);
//            $("#EmailEns").html(email);
//            $("#MdpEns").html(mdp);
//            $("#TelEns").html(tel);
//           $("#NomEns").attr("disabled", "disabled");
//           $("#PrenomEns").attr("disabled", "disabled");
//           $("#EmailEns").attr("disabled", "disabled");
//           $("#TelEns").attr("disabled", "disabled");
//           $("#MdpEns").attr("type", "password");
//           $("#MdpEns").attr("disabled", "disabled");
//           $(this).text("Modifier");
        }
       
    });
});

