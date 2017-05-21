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


@WebServlet(name = "DeleteUtilisateur", urlPatterns = {"/deleteUtilisateur"})
public class DeleteUtilisateur extends HttpServlet {
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
        Enseignant ens = enseignantFacade.getEnseignantById(id);
        Comptes compte = ens.getIdUser();
        enseignantFacade.remove(ens);
        System.out.print("i got here after remove");
        comptesFacade.remove(compte);
        
        
        List<Enseignant> listEns = enseignantFacade1.findAll();
        request.setAttribute("listEns", listEns);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewsys/AjouterUtilisateur.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
