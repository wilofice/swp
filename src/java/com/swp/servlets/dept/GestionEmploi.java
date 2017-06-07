/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.dept;

import com.swp.beans.Emp;
import com.swp.beans.EmpHashMap;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import com.swp.beans.Seance;
import com.swp.beans.Semaine;
import com.swp.beans.Semestre;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.FiliereFacade;
import com.swp.sessions.stateless.GroupeFacade;
import com.swp.sessions.stateless.MatiereFacade;
import com.swp.sessions.stateless.SeanceFacade;
import com.swp.sessions.stateless.SemaineFacade;
import com.swp.sessions.stateless.SemestreFacade;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
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
 * @author Azough Mehdi
 */
@WebServlet(name = "GestionEmploi", urlPatterns = {"/gestionemploi"})
public class GestionEmploi extends HttpServlet {

    @EJB
    SemaineFacade semaineFacade;
    @EJB
    GroupeFacade groupeFacade;
    @EJB
    MatiereFacade matiereFacade;
    @EJB
    EnseignantFacade enseignantFacade;
    @EJB
    EmpFacade empFacade;
    @EJB
    SemestreFacade semestreFacade;
    @EJB
    FiliereFacade filiereFacade;
    @EJB
    SeanceFacade seanceFacade;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Semestre> listesemestre = semestreFacade.findAll();
        List<Semaine> listesemaine = semaineFacade.findAll();
        List<Groupe> listegroupe = groupeFacade.findAll();
        List<Groupe> listeGroupeTemp = new ArrayList<Groupe>();
        List<Matiere> listeMatiere = matiereFacade.findAll();
        List<Enseignant> listeenseignant = enseignantFacade.getListeEnsbyRole("enseignant");
                Iterator<Groupe> groupIterator = listegroupe.iterator();
        while (groupIterator.hasNext()) {
                Groupe g = groupIterator.next();
                if(g.getNomFiliere().equals("Informatique")){
                    System.out.println("groupe finded");
                    listeGroupeTemp.add(g);
                }
        }
        
        request.setAttribute("listesemestre",listesemestre);
        request.setAttribute("listesemaine",listesemaine);
        request.setAttribute("listegroupe",listeGroupeTemp);
        request.setAttribute("listeMatiere",listeMatiere);
        request.setAttribute("listeenseignant",listeenseignant);
        
        System.out.println("Heeeeello");
        String groupeid = request.getParameter("grpid");
        Integer grpid = Integer.parseInt(groupeid);
        String semestreid = request.getParameter("semestreid");
        Integer semstrid = Integer.parseInt(semestreid);
        Groupe grp = groupeFacade.find(grpid);
        List<Emp> listemp = empFacade.findByGrpAndSemestre(grp, semstrid);
        List<Emp> listeEmp = new ArrayList<Emp>();
        
        Iterator<Emp> empIterator = listemp.iterator();
        while (empIterator.hasNext()) {
                Emp e = empIterator.next();
                Date datefin = e.getDateF();
                if(!e.getDateD().equals(datefin)){
                    System.out.println("emp ajoute");
                    listeEmp.add(e);
                }
        }
        HashMap<String, HashMap<String, Emp>> empHashMap =  EmpHashMap.getEmpAsHashMap(listeEmp);
        
        request.removeAttribute("empHashMap");
        request.setAttribute("empHashMap", empHashMap);
        request.setAttribute("groupeSelect", groupeid);
        request.setAttribute("semaineSelect", semestreid);
        
        HttpSession session = request.getSession();
        session.setAttribute("listesemestre",listesemestre);
        session.setAttribute("listesemaine",listesemaine);
        session.setAttribute("listeGroupeTemp",listeGroupeTemp);
        session.setAttribute("listeMatiere",listeMatiere);
        session.setAttribute("listeenseignant",listeenseignant);
        
        
        
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/Emploi_Dept.jsp").forward(request, response);
      
       
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
        
        String groupe1 = request.getParameter("groupe1");
        if(groupe1 == null) processRequest(request, response);
        Integer numgroupe1 = Integer.parseInt(groupe1);
        Groupe groupe = groupeFacade.find(numgroupe1);
        
        String matiere1 = request.getParameter("matiere1");
        Matiere matiere = matiereFacade.find(matiere1);
        
        String enseignant1 = request.getParameter("enseignant1");
        Integer numenseignant1 = Integer.parseInt(enseignant1);
        Enseignant enseignant = enseignantFacade.find(numenseignant1);
        
        
        
        Calendar cal = Calendar.getInstance();
        cal.set(0, 0, 0, 8, 0, 0);
        Date heure = cal.getTime();
        String sd1 = request.getParameter("sd1");
        Integer idSd = Integer.parseInt(sd1);
        Semaine sd = semaineFacade.find(sd1);
        
        String sf1 = request.getParameter("sf1");
        Integer idSf = Integer.parseInt(sf1);
        Semaine sf = semaineFacade.find(sf1);
        cal.setTime(sf.getDatedebut());
        cal.add(Calendar.DATE, 7);
        Emp emp =new Emp(1, 2, heure, sd.getDatedebut(), cal.getTime(), 1);
        System.out.println("matiere est = " + matiere.toString());
        emp.setNumE(enseignant);
        emp.setNumM(matiere);
        emp.setNumG(groupe);
        empFacade.create(emp);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/Emploi_Dept.jsp").forward(request, response);
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
