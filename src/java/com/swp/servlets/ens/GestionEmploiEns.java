package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Seance;
import com.swp.beans.SeanceHashMap;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.SeanceFacade;
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
import javax.servlet.http.HttpSession;


@WebServlet(name = "GestionEmploiEns", urlPatterns = {"/gestionemploiens"})
public class GestionEmploiEns extends HttpServlet {

    @EJB
    EnseignantFacade enseignantFacade;
    @EJB 
    SemaineFacade semaineFacade;
    @EJB
    EmpFacade empFacade;
    @EJB
    SeanceFacade seanceFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String semaineid = request.getParameter("semaineid");
        String idens = getEnseignantIdinCookies(request, "idens");
        
        Enseignant enseignant = enseignantFacade.find(Integer.parseInt(idens));
        List<Emp> lemp = empFacade.findByEns(enseignant);
        System.out.println("lemp lenght = " + lemp.size());
        SeanceHashMap shm = new SeanceHashMap(seanceFacade);
        shm.init();
        List<Seance> listSeance = shm.getSeanceEnsBySemaine(lemp, semaineid);
        HashMap<String, HashMap<String, Seance>> seanceHashMap = shm.getHashMap(listSeance);
        
        request.removeAttribute("seanceHashMap");
        request.setAttribute("seanceHashMap", seanceHashMap);
        
        HttpSession session = request.getSession();
        Seance sa = (Seance) session.getAttribute("seancetoabsent");
        
        
        if(sa != null) {
            request.setAttribute("seancetoabsent", sa);
            System.out.println("seance to absent from session = " + sa.getNumS());
        }
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
