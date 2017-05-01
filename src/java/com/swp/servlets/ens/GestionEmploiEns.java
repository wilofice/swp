package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Seance;
import com.swp.beans.SeanceHashMap;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.SemaineFacade;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "GestionEmploiEns", urlPatterns = {"/gestionemploiens"})
public class GestionEmploiEns extends HttpServlet {

    @EJB
    EnseignantFacade enseignantFacade;
    @EJB 
    SemaineFacade semaineFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String semaineid = request.getParameter("semaineid");
        String idens = getEnseignantIdinCookies(request, "idens");
        
        Enseignant enseignant = enseignantFacade.find(Integer.parseInt(idens));
        List<Seance> listSeance = SeanceHashMap.getSeanceEnsBySemaine(enseignant, semaineid);
        HashMap<String, HashMap<String, Seance>> seanceHashMap = SeanceHashMap.getHashMap(listSeance);
        request.setAttribute("seanceHashMap", seanceHashMap);
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
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
    
    
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
