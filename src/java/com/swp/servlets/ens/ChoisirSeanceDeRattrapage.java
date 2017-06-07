package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Seance;
import com.swp.beans.SeanceHashMap;
import com.swp.beans.Semaine;
import com.swp.sessions.stateless.CreneauFacade;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.SeanceFacade;
import com.swp.sessions.stateless.SemaineFacade;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ChoisirSeanceDeRattrapage", urlPatterns = {"/choisirseancederattrapage"})
public class ChoisirSeanceDeRattrapage extends HttpServlet {

    @EJB
    EnseignantFacade enseignantFacade;
    @EJB 
    SemaineFacade semaineFacade;
    @EJB
    SeanceFacade seanceFacade;
    
    @EJB
    EmpFacade empFacade ;
    @EJB
    CreneauFacade creneauFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String semaineid = request.getParameter("currentsemainereportid");
        String idens = getEnseignantIdinCookies(request, "idens");
        Integer NumeroAbsence = Integer.parseInt(request.getParameter("seanceAbsenceid"));
        String seancetoreport = request.getParameter("seancereportid");
        Integer numjour = 0;
        Integer numheure = 0; 
        
        if(seancetoreport.equals("l8")) {
            numjour = 1;
            numheure = 1;
        }
        
        if(seancetoreport.equals("l10")) {
            numjour = 1;
            numheure = 2;
        }
        if(seancetoreport.equals("l14")) {
            numjour = 1;
            numheure = 3;
        }
        if(seancetoreport.equals("l16")) {
            numjour = 1;
            numheure = 4;
        }
        if(seancetoreport.equals("m8")) {
            numjour = 2;
            numheure = 1;
        }
        if(seancetoreport.equals("m10")) {
            numjour = 2;
            numheure = 2;
        }
        if(seancetoreport.equals("m14")) {
            numjour = 2;
            numheure = 3;
        }
        if(seancetoreport.equals("m16")) {
            numjour = 2;
            numheure = 4;
        }
        
        if(seancetoreport.equals("mer8")) {
            numjour = 3;
            numheure = 1;
        }
        if(seancetoreport.equals("mer10")) {
            numjour = 3;
            numheure = 2;
        }
        if(seancetoreport.equals("mer14")) {
            numjour = 3;
            numheure = 3;
        }
        if(seancetoreport.equals("mer16")) {
            numjour = 3;
            numheure = 4;
        }
        if(seancetoreport.equals("j8")) {
            numjour = 4;
            numheure = 1;
        }if(seancetoreport.equals("j10")) {
            numjour = 4;
            numheure = 2;
        }if(seancetoreport.equals("j14")) {
            numjour = 4;
            numheure = 3;
        }
        if(seancetoreport.equals("j16")) {
            numjour = 4;
            numheure = 4;
        }
        if(seancetoreport.equals("v8")) {
            numjour = 5;
            numheure = 1;
        }
        if(seancetoreport.equals("v10")) {
            numjour = 5;
            numheure = 2;
        }
        if(seancetoreport.equals("v14")) {
            numjour = 5;
            numheure = 3;
        }
        if(seancetoreport.equals("v16")) {
            numjour = 5;
            numheure = 4;
        }
        
        
        
        
        
//        Integer numjour = Integer.parseInt(seancetoreport.substring(0, 1));
//        Integer numheure = Integer.parseInt(seancetoreport.substring(1, 2));
        System.out.println(" l id et laseance"+ NumeroAbsence + numjour + " " +numheure);
        //Integer idSeanceReport = Integer.parseInt(request.getParameter("seancereportid"));
        Seance seAb = seanceFacade.getSeanceById(NumeroAbsence);
        
        Emp emp = seAb.getNumEmp();
        Creneau cr = seAb.getNumC();
        //System.out.println(" l id et laseance"+ NumeroAbsence + idSeanceReport + emp.getHeure() );
        seanceFacade.remove(seAb);
        
        Enseignant enseignant = enseignantFacade.find(Integer.parseInt(idens));
        Calendar cal = Calendar.getInstance();
        if(numheure == 1) { 
            cal.set(0, 0, 0, 8, 0, 0);
        }
        if(numheure == 2) { 
            cal.set(0, 0, 0, 10, 0, 0);
        }
        if(numheure == 3) { 
            cal.set(0, 0, 0, 14, 0, 0);
        }
        if(numheure == 4) { 
            cal.set(0, 0, 0, 16, 0, 0);
        }
        Date jo = cal.getTime();
        Semaine sem = semaineFacade.getSemaineById(semaineid);
        Date debutsem = sem.getDatedebut();
        Date exactdate = null;
        if(numjour == 1) {
            cal.setTime(debutsem);
            cal.add(Calendar.DATE,0);
            exactdate = cal.getTime();  
        }
        if(numjour == 2) {
            cal.setTime(debutsem);
            cal.add(Calendar.DATE,1);
            exactdate = cal.getTime();  
        }
        if(numjour == 3) {
            cal.setTime(debutsem);
            cal.add(Calendar.DATE,2);
            exactdate = cal.getTime();  
        }
        if(numjour == 4) {
            cal.setTime(debutsem);
            cal.add(Calendar.DATE,3);
            exactdate = cal.getTime();  
        }
        if(numjour == 5) {
            cal.setTime(debutsem);
            cal.add(Calendar.DATE,4);
            exactdate = cal.getTime();  
        }
        Emp newEmp = new Emp(10);
        newEmp.setJour(numjour+1);
        newEmp.setHeure(jo);
        newEmp.setDateD(exactdate);
        newEmp.setDateF(exactdate);
        newEmp.setIdsemestre(emp.getIdsemestre());
        newEmp.setNumG(emp.getNumG());
        newEmp.setNumM(emp.getNumM());
        newEmp.setNumE(enseignant);
        
        //empFacade.remove(emp);
        empFacade.create(newEmp);
        
        Seance se = new Seance(15);
        Creneau creneau = creneauFacade.findByDateAndHeure(exactdate, jo);
        se.setEtatS(1);
        se.setNumC(creneau);
        se.setNumEmp(newEmp);
        se.setType("report");
        seanceFacade.create(se);
        DelSeance del = new DelSeance(seanceFacade, empFacade, seAb);
        del.deleteSeance();
       
        
        List<Emp> lemp = empFacade.findByEns(enseignant);
        //System.out.println("lemp lenght = " + lemp.size());
        SeanceHashMap shm = new SeanceHashMap(seanceFacade);
        shm.init();
        List<Seance> listSeance = shm.getSeanceEnsBySemaine(lemp, semaineid);
        HashMap<String, HashMap<String, Seance>> seanceHashMap = shm.getHashMap(listSeance);
        request.removeAttribute("seanceHashMap");
        request.setAttribute("seanceHashMap", seanceHashMap);
        HttpSession session = request.getSession();
        session.removeAttribute("seancetoabsent");
        
        response.sendRedirect("gestionemploiens");
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
