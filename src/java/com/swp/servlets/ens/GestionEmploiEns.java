package com.swp.servlets.ens;

import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import com.swp.beans.Seance;
import com.swp.beans.SeanceHashMap;
import com.swp.beans.Semaine;
import com.swp.beans.Semestre;
import com.swp.sessions.stateless.AbscenceFacade;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.GroupeFacade;
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
    @EJB
    AbscenceFacade abscenceFacade;
    @EJB
    GroupeFacade groupeFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date d = this.getMonday();
                Semaine semaine = semaineFacade.findByDateD(d);
                
                
                String idens = getEnseignantIdinCookies(request, "idens");
                Enseignant enseignant = enseignantFacade.find(Integer.parseInt(idens));
                List<Emp> lemp = empFacade.findByEns(enseignant);
        System.out.println("lemp lenght = " + lemp.size());
        SeanceHashMap shm = new SeanceHashMap(seanceFacade);
        shm.init();
        List<Seance> listSeance = shm.getSeanceEnsBySemaine(lemp, semaine.getIdsemaine());
        HashMap<String, HashMap<String, Seance>> seanceHashMap = shm.getHashMap(listSeance);
        
        request.removeAttribute("seanceHashMap");
        request.setAttribute("seanceHashMap", seanceHashMap);
        
      List<Seance> listseances= seanceFacade.findByType("seancesupp");
         request.setAttribute("listseances", listseances);
          List<Seance> listexams= seanceFacade.findByType("examen");
         request.setAttribute("listexams", listexams);
         HttpSession session = request.getSession();
         Seance sa = (Seance) session.getAttribute("seancetoabsent");
         session.setAttribute("semainenow", semaine.getIdsemaine());
        
        
        if(sa != null) {
            request.setAttribute("seancetoabsent", sa);
            System.out.println("seance to absent from session = " + sa.getNumS());
        }
        List<Groupe> listGrp = abscenceFacade.getGroupeEnsX(enseignant);
        
        request.setAttribute("listGrp",listGrp);
        
        request.setAttribute("semainecurrent", semaine.getIdsemaine());
        List<Semaine> list_sem = semaineFacade.findAll();
        request.setAttribute("list_sem", list_sem);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String semaineid = request.getParameter("semaineid");
        //if(semaineid == null) this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
        String idens = getEnseignantIdinCookies(request, "idens");
        List<Seance> listseances= seanceFacade.findByType("seancesupp");
         request.setAttribute("listseances", listseances);
        
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
        
        request.setAttribute("semainecurrent", semaineid);
        
        List<Groupe> listGrp = abscenceFacade.getGroupeEnsX(enseignant);
        
        request.setAttribute("listGrp",listGrp);
//            Calendar cal = Calendar.getInstance();
//                Date d = this.getMonday();
//                Semaine semaine = semaineFacade.findByDateD(d);
//                Semestre actusem = semaine.getIdSemestre();
//                String numGrpp= request.getParameter("classe");
//                int numGrp =Integer.parseInt(numGrpp);
//
//                Groupe grp = groupeFacade.findGrpByNum(numGrp);
//
//
//                List<Matiere> listMat = abscenceFacade.getMatiereEnsX(enseignant, grp);
//        Calendar cal = Calendar.getInstance();
//            Date d = this.getMonday();
//            Semaine semaine = semaineFacade.findByDateD(d);
//            Semestre actusem = semaine.getIdSemestre();
//            String numGrpp= request.getParameter("classe");
//            int numGrp =Integer.parseInt(numGrpp);
            
//            Groupe grp = groupeFacade.findGrpByNum(numGrp);
            
            
//            List<Matiere> listMat = abscenceFacade.getMatiereEnsX(enseignant, grp);
            List<Semaine> list_sem = semaineFacade.findAll();
        request.setAttribute("list_sem", list_sem);
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
        cal.add(Calendar.DATE,x);
        return new Date(cal.getTimeInMillis());
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
