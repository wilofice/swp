/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Enseignant;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.MessageFacade;
import java.io.IOException;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        String ensid=request.getParameter("ensid");
        Enseignant enseignant = enseignantFacade.find(Integer.parseInt(ensid));
        Long somme = messageFacade.countMessage(enseignant);
        String nomens = enseignant.getNom();
        String prenomens = enseignant.getPrenom();
        while(true){
            Long s = messageFacade.countMessage(enseignant);
            if( !Objects.equals(s, somme)) {
            sb.append("<message>");
            sb.append("vous avez un nouveau message de la part de ");
            sb.append(nomens + " ");            
            sb.append(prenomens);
         
        sb.append("</message>");
            break;
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
