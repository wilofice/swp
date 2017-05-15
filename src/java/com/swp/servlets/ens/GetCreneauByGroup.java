package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Groupe;
import com.swp.beans.Semaine;
import com.swp.beans.Semestre;
import com.swp.beans.Enseignant;
import com.swp.beans.Matiere;
import com.swp.sessions.stateless.AbscenceFacade;
import com.swp.sessions.stateless.CreneauFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.GroupeFacade;
import com.swp.sessions.stateless.SeanceFacade;
import com.swp.sessions.stateless.SemaineFacade;
import com.swp.sessions.stateless.SemestreFacade;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(name = "getmatandcrenbyprp", urlPatterns = {"/getmatandcrenbyprp"})
public class GetCreneauByGroup extends HttpServlet {
    
    @EJB
    SemestreFacade semestreFacade;
    @EJB
    GroupeFacade groupeFacade;
    @EJB
    CreneauFacade creneauFacade;
    @EJB
    AbscenceFacade absenceFacade;
    @EJB
    SeanceFacade seanceFacade;
    @EJB
    EnseignantFacade enseignantFacade;
    @EJB
    SemaineFacade semaineFacade;
            
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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            Enseignant ens;
            HttpSession session = request.getSession();
                ens = (Enseignant) session.getAttribute("ens");
            Calendar cal = Calendar.getInstance();
            Date d = this.getMonday();
            Semaine semaine = semaineFacade.findByDateD(d);
           
            
            
            System.out.println("semaine actuelle = " + semaine.getIdsemaine());
            Semestre actusem = semestreFacade.getSemestreBySemaine(semaine);
            System.out.println("semestre actu = " + actusem);
            String numGrpp= request.getParameter("classe");
            int numGrp =Integer.parseInt(numGrpp);
            
            Groupe grp = groupeFacade.findGrpByNum(numGrp);
            
            Matiere m;
            List<Matiere> listMat = absenceFacade.getMatiereEnsX(ens,grp);
            Iterator<Matiere> matIterator= listMat.iterator();
            boolean matAdded = false ;
            StringBuilder sb = new StringBuilder();
            sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            sb.append("<matieres_creneaux>");
            sb.append("<matieres>");  
            
            while (matIterator.hasNext()) {
                    System.out.println("des matieres son trouvés");
                    m = matIterator.next();
                    sb.append("<matiere>");
                    sb.append("<codeM>").append(m.getCodeM()).append("</codeM>");
                    sb.append("<nomM>").append(m.getNomM()).append("</nomM>");
                    sb.append("</matiere>");   
                    matAdded=true;
            }
            
            
            
            sb.append("</matieres>"); 
            
            PlannSExam plannSExam = new PlannSExam(absenceFacade, semestreFacade, actusem.getIdsemestre(), ens, grp);
            plannSExam.init();
            List<Creneau> videGrpAndEns = plannSExam.getResults();
            Iterator<Creneau> creIt = videGrpAndEns.iterator();
            sb.append("<creneaux>");
            while(creIt.hasNext()) {
                Creneau c = creIt.next();
                sb.append("<creneau>");
                sb.append("<idc>").append(c.getNumC()).append("</idc>");
                sb.append("<date>").append(c.getDate()).append("</date>");
                sb.append("<heure>").append(c.getHeure()).append("</heure>");
                sb.append("</creneau>");
            }
            
            sb.append("</creneaux>");
            sb.append("</matieres_creneaux>");
            
        if (matAdded) {
            response.setContentType("text/xml;charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            
            response.getWriter().write(sb.toString());
           
        } else {
            //nothing to show
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
             
         
         
         
         
         
            
            
    }


  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}