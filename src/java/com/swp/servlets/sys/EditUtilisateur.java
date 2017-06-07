/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.sys;


import com.swp.beans.Comptes;
import com.swp.beans.Enseignant;
import com.swp.sessions.stateless.ComptesFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "EditUtilisateur", urlPatterns = {"/editUtilisateur"})
public class EditUtilisateur extends HttpServlet {
    /*private static Integer idCounter = 0;
    public static synchronized String createID()
        {
            return String.valueOf(idCounter++);
        } */

    @EJB
    EnseignantFacade enseignantFacade;
    @EJB
    EnseignantFacade enseignantFacade1;
    @EJB
    ComptesFacade comptesFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        List<Enseignant> listEns = enseignantFacade.findAll(); 
        Enseignant ens = enseignantFacade1.getEnseignantById(id);
        request.setAttribute("listEns", listEns);
        request.setAttribute("ensSelected",ens);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewsys/ModifierUtilisateur.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("id recupere" + request.getParameter("ensid"));
        int id = Integer.parseInt(request.getParameter("ensid"));
        Enseignant ens = enseignantFacade1.getEnseignantById(id);
        Comptes compte = ens.getIdUser();
        
        String nomU = request.getParameter("nomU");
        String prenomU = request.getParameter("prenomU");
        String P1Mail = request.getParameter("P1Mail");
        String P2Mail = request.getParameter("P2Mail");
        String telU = request.getParameter("telU");
        String roleU = request.getParameter("roleU");
        String identUser = request.getParameter("idUser");
        String mailU = P1Mail+P2Mail;
        
      //  compte.setIdUser(identUser);
        comptesFacade.edit(compte);
        ens.setNom(nomU);
        ens.setPrenom(prenomU);
        ens.setEmail(mailU);
        ens.setTel(telU);
        ens.setRôle(roleU);
        ens.setIdUser(compte);
        enseignantFacade.edit(ens);
        
        List<Enseignant> listEns = enseignantFacade.findAll();
        request.setAttribute("listEns", listEns);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewsys/AjouterUtilisateur.jsp").forward(request, response); 
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestGet(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestPost(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
