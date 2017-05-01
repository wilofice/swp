package com.swp.servlets.dept;

import com.swp.beans.Groupe;
import com.swp.beans.Semaine;
import com.swp.beans.Semestre;
import com.swp.sessions.stateless.GroupeFacade;
import com.swp.sessions.stateless.SemaineFacade;
import com.swp.sessions.stateless.SemestreFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "GetGrpBySemstr", urlPatterns = {"/getgrpbysemstr"})
public class GetGrpBySemstr extends HttpServlet {
    
    @EJB
    SemestreFacade semestreFacade;
    @EJB
    GroupeFacade groupeFacade;
    @EJB
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String semestreid = request.getParameter("semestreid");
        Integer semstrid = Integer.parseInt(semestreid);
        System.out.println("semestre id = " + semestreid);
        StringBuilder sb = new StringBuilder();
        Integer niveau = 1;
        if(semstrid == 1 || semstrid == 2) niveau = 1;
        if(semstrid == 3 || semstrid == 4) niveau = 2;
        if(semstrid == 5 || semstrid == 6) niveau = 3;
        List<Groupe> listgrp = groupeFacade.findByNiveauAndFiliere(niveau, "Informatique");
        Groupe g;
        Iterator<Groupe> groupIterator = listgrp.iterator();
        boolean groupeadded = false;
        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        sb.append("<groupes_semaines>");
        sb.append("<groupes>");
        while (groupIterator.hasNext()) {
                g = groupIterator.next();
                System.out.println("nomgroupe " + g.getNomG());
                
                sb.append("<groupe>");
                sb.append("<id>").append(g.getNumG()).append("</id>");
                sb.append("<nomG>").append(g.getNomG()).append("</nomG>");
                sb.append("<niveau>").append(g.getNiveau()).append("</niveau>");
                sb.append("<nomFiliere>").append(g.getNomFiliere()).append("</nomFiliere>");
                sb.append("</groupe>");
                groupeadded = true;
                
        }
        sb.append("</groupes>");
        
        Semestre semestre = semestreFacade.find(semstrid);
        List<Semaine> listsemaine = semestre.getSemaineList();
        Iterator<Semaine> semaineIterator = listsemaine.iterator();
        Semaine s;
        sb.append("<semaines>");
        while(semaineIterator.hasNext()) {
            s = semaineIterator.next();
            sb.append("<semaine>");
            sb.append("<id_semaine>").append(s.getIdsemaine()).append("</id_semaine>");
            sb.append("<date_debut>").append(s.getDatedebut()).append("</date_debut>");
            sb.append("<id_semestre>").append(s.getIdsemestre()).append("</id_semestre>");
            sb.append("</semaine>");
        }
        
        sb.append("</semaines>");
        sb.append("</groupes_semaines>");
        
        if (groupeadded) {
            response.setContentType("text/xml;charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            System.out.println("debut de sb" + sb.toString());
            response.getWriter().write(sb.toString());
            System.out.println("after setting response");
        } else {
            //nothing to show
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
        
        //this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/GestionEmploi.jsp").forward(request, response);

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
