/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Comptes;
import com.swp.beans.Enseignant;
import com.swp.sessions.stateless.ComptesFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author genereux
 */
@WebServlet(name = "GestionProfil", urlPatterns = {"/profil"})
public class GestionProfil extends HttpServlet {

    @EJB
    EnseignantFacade ef;
    @EJB
    ComptesFacade cf;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/ProfilEns.jsp").forward(request, response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("NomEns");
        String prenom = request.getParameter("PrenomEns");
        String email = request.getParameter("EmailEns");
        String tel = request.getParameter("TelEns");
        String mdp = request.getParameter("MdpEns");
        
        HttpSession session = request.getSession();
        Enseignant ens = (Enseignant) session.getAttribute("ens");
        Comptes comptes = ens.getIdUser();
        comptes.setMotdepasse(mdp);
        cf.edit(comptes);
        ens.setNom(nom);
        ens.setPrenom(prenom);
        ens.setTel(tel);
        ens.setEmail(email);
        ef.edit(ens);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/ProfilEns.jsp").forward(request, response);
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    public String getEnseignantIdinCookies(HttpServletRequest request, String cle) {
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for (Cookie cooky : cookies) {
                if(cooky != null && cle.equals(cooky.getName())) {
                    return cooky.getValue();
                }
            }
        }
        return null;
    }

}
