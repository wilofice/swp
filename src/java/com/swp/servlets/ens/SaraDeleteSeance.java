/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import com.swp.beans.Seance;
import com.swp.beans.Semaine;
import com.swp.beans.Semestre;
import com.swp.sessions.stateless.CreneauFacade;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.GroupeFacade;
import com.swp.sessions.stateless.MatiereFacade;
import com.swp.sessions.stateless.SeanceFacade;
import com.swp.sessions.stateless.SemaineFacade;
import com.swp.sessions.stateless.SemestreFacade;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sara
 */
@WebServlet(name = "SaraDeleteSeance", urlPatterns = {"/saradeleteseance"})
public class SaraDeleteSeance extends HttpServlet {

    public Date getMonday() {
        Calendar cal=Calendar.getInstance();
        int x =cal.get(Calendar.DAY_OF_WEEK);
        switch(x){
            case 1:
                x= 1;
                break;
            case 2:
                x= 0;
                break;
            case 3:
                x= -1;
                break;
            case 4:
                x= -2;
                break;
            case 5:
                x= -3;
                break;
            case 6:
                x= -4;
            default:
                x= 2;
                break;
               
        }
        cal.add(Calendar.DAY_OF_WEEK, x);
        System.out.println("date du lund = " + cal.getTime());
        return cal.getTime();
    }
     
    @EJB
    EmpFacade  empFacade;
    @EJB
    EnseignantFacade enseignantFacade;
    @EJB
    GroupeFacade groupeFacade;
    @EJB
    MatiereFacade matiereFacade;
    @EJB
    SemaineFacade semaineFacade;
    @EJB
    SeanceFacade seanceFacade;
    @EJB
    CreneauFacade creneauFacade;
     @EJB
    SemestreFacade semestreFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {}

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
        List<Seance> listseances= seanceFacade.findByType("seancesupp");
         request.setAttribute("listseances", listseances);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/EmploiEns.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       {
          
       
      String numS=request.getParameter("seancesajoutees");
           
         Seance s= seanceFacade.find(Integer.parseInt(numS));
            seanceFacade.remove(s);
            
           
     response.sendRedirect("gestionemploiens") ;
    }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
