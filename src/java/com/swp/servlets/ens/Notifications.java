/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Enseignant;
import com.swp.beans.Message;
import com.swp.beans.Seance;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.MessageFacade;
import com.swp.sessions.stateless.SeanceFacade;
import java.io.IOException;
import java.util.Date;
import java.util.Objects;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Azough Mehdi
 */
@WebServlet(name = "notifications", urlPatterns = {"/notifications"})
public class Notifications extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
    EnseignantFacade enseignantFacade;
    @EJB 
    MessageFacade messageFacade;
    @EJB
    SeanceFacade seanceFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        String seanceid = request.getParameter("seancereportid");
//        Seance seance = seanceFacade.find(Integer.parseInt(seanceid));
        
//        Enseignant enseignantseance = seance.getNumEmp().getNumE();
//        String nomenseignantseance = enseignantseance.getNom();
//        String prenomenseignantseance = enseignantseance.getPrenom();
        
        StringBuilder sb = new StringBuilder();
        
        String ensid = request.getParameter("ensid");
        Enseignant enseignant = enseignantFacade.find(Integer.parseInt(ensid));
//        String nomens = enseignant.getNom();
//        String prenomens = enseignant.getPrenom();
        Long somme = messageFacade.countMessage(enseignant);
        
        //int idMsg = messageFacade.getIdLastMessage();
//        Message messagechef = messageFacade.getMessageById(idMsg-1);
//        Message message = messageFacade.getMessageById(idMsg);
//        String objetmessage = message.getObjet();
        
//        Date dateseance = seance.getNumC().getDate();
//        Date heureseance = seance.getNumC().getHeure();
//        String matiereseance = seance.getNumEmp().getNumM().getNomM();
//        String groupeseance = seance.getNumEmp().getNumG().getNomG();
//        String filiereseance = seance.getNumEmp().getNumG().getNomFiliere();
//        
        while(true){
            Long s = messageFacade.countMessage(enseignant);
            
            if( !Objects.equals(s, somme)) {
//                sb.append("<message>");
//                sb.append(nomens + " ");
//                sb.append(prenomens+" : ");
//                sb.append(message+" ");
//                sb.append("</message>");
                
                sb.append("<message>");
                sb.append(" dfsfd");
                sb.append(" tyfy ");
                sb.append(" gfc");
                sb.append("</message>");
                
//                if( objetmessage == "Report" ){
//                    sb.append("<message>");
//                    sb.append(nomens + " ");
//                    sb.append(prenomens+" ");
//                    sb.append("demande la permutation de la seance de ");
//                    sb.append(matiereseance + " ");
//                    sb.append("du"+dateseance + " ");
//                    sb.append("à "+heureseance + ",");
//                    sb.append("avec le groupe "+groupeseance + ",de la filiere"+filiereseance);
//                    sb.append("</message>");
//                    
//                    sb.append("<notificationPermut>");
//                    sb.append(nomens + " ");
//                    sb.append(prenomens+" ");
//                    sb.append("demande la permutation de la seance de ");
//                    sb.append(matiereseance + " ");
//                    sb.append("du"+dateseance + " ");
//                    sb.append("à "+heureseance + ",");
//                    sb.append("avec le groupe "+groupeseance + ",de la filiere"+filiereseance);
//                    sb.append("avec "+nomenseignantseance+" ");
//                    sb.append("avec "+prenomenseignantseance+" ");
//                    sb.append("</notificationfPermut>");
//                }else{
//                    if(objetmessage == "Ajout séance supplémentaire") {
//                        sb.append("<notificationAjout>");   
//                        sb.append(nomens+ " ");
//                        sb.append(prenomens+ " ");
//                        sb.append(" a ajouter une senace supplementaire le ");
//                        sb.append(dateseance + " ");
//                        sb.append("à "+heureseance + ",");
//                        sb.append("avec le groupe "+groupeseance + ",de la filiere"+filiereseance);
//                        sb.append("</notificationAjout>");
//                    }else{
//                        if(objetmessage == "Plannification d'examen"){
//                            sb.append("<notificationPlan>");   
//                            sb.append(nomens+ " ");
//                            sb.append(prenomens+ " ");
//                            sb.append(" a plannifier un examen le ");
//                            sb.append(dateseance + " ");
//                            sb.append("à "+heureseance + ",");
//                            sb.append("avec le groupe "+groupeseance + ",de la filiere"+filiereseance);
//                            sb.append("</notificationPlan>");
//                        }
//                    }
//                }
                break;
            }
            int i = 0;
            while(i < 1000000) {
            
            System.out.println(i);
            i++;
            }
            
            
        }
            response.setContentType("text/xml;charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            System.out.println("debut de sb" + sb.toString());
            response.getWriter().write(sb.toString());
            System.out.println("after setting response");
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
