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
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author amira
 */
@WebServlet(name = "AddExam", urlPatterns = {"/addexam"})
public class AddExam extends HttpServlet {
    
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
    
     protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         System.out.println("in method get");
       Integer classeid = Integer.parseInt(request.getParameter("classe"));
       String matiereid = request.getParameter("matiere");
       Integer creneauid = Integer.parseInt(request.getParameter("creneau"));
       
       Enseignant ens;
            HttpSession session = request.getSession();
                ens = (Enseignant) session.getAttribute("ens");
       
       Groupe classe = groupeFacade.find(classeid);
       
       Matiere mat = matiereFacade.find(matiereid);
       //Creneau cr = new Creneau(creneauid);
       Creneau cr = creneauFacade.find(creneauid);
       Date heure=cr.getHeure();
       
       System.out.println("in method get 2");
       
       Calendar cal = Calendar.getInstance();
       Date d = this.getMonday();
       Semaine semaine = semaineFacade.findByDateD(d);
       Semestre actusem = semestreFacade.getSemestreBySemaine(semaine);
       
       Date datecr=cr.getDate();
       cal.setTime(datecr);
       Integer jour = cal.get(Calendar.DAY_OF_WEEK);
       
       
       Integer idsem=actusem.getIdsemestre();
       
           Emp emp = new Emp(1, jour, heure, datecr, datecr,idsem);
            emp.setNumG(classe);
            emp.setNumE(ens);
            emp.setNumM(mat);
            empFacade.create(emp);
           
        Seance s=new Seance(1,"examen",1);
            s.setNumC(cr);
            s.setNumEmp(emp);
            s.setType("examen");
            seanceFacade.create(s);
            System.out.println("in method get 4");
//         List<Emp> lemp = empFacade.findByEns(ens);
//        System.out.println("lemp lenght = " + lemp.size());
//        SeanceHashMap shm = new SeanceHashMap(seanceFacade);
//        shm.init();
//        List<Seance> listSeance = shm.getSeanceEnsBySemaine(lemp, semaineid);
//        HashMap<String, HashMap<String, Seance>> seanceHashMap = shm.getHashMap(listSeance);
//        
//        request.removeAttribute("seanceHashMap");
//        request.setAttribute("seanceHashMap", seanceHashMap);
//        
//        HttpSession session = request.getSession();
//        Seance sa = (Seance) session.getAttribute("seancetoabsent");
//        
//        
//        if(sa != null) {
//            request.setAttribute("seancetoabsent", sa);
//            System.out.println("seance to absent from session = " + sa.getNumS());
//        }
//        
//        List<Groupe> listGrp = abscenceFacade.getGroupeEnsX(enseignant);
//        
//        request.setAttribute("listGrp",listGrp);
            
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);    
        
     }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestGet(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    
}
