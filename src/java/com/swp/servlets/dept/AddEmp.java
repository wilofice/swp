package com.swp.servlets.dept;

import com.swp.beans.Creneau;
import static com.swp.beans.Creneau_.numC;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import com.swp.beans.Seance;
import com.swp.beans.Semaine;
import com.swp.sessions.stateless.CreneauFacade;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.GroupeFacade;
import com.swp.sessions.stateless.MatiereFacade;
import com.swp.sessions.stateless.SeanceFacade;
import com.swp.sessions.stateless.SemaineFacade;
import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet(name = "AddEmp", urlPatterns = {"/addemp"})
public class AddEmp extends HttpServlet {
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empid = request.getParameter("emptoeditadd");
        String numerocasetoedit = request.getParameter("numerocase");
        String sd = request.getParameter("sd");
        String sf = request.getParameter("sf");
        String enseignant = request.getParameter("enseignant");
        String matiere = request.getParameter("matiere");
        String groupe = request.getParameter("groupe");
        String semestre = request.getParameter("semestre");
        System.out.println("empid = " + empid + "numerocase= " + numerocasetoedit + " sd = " + sd + " sf = " + sf + " enseignant = " + enseignant + " groupe = " + groupe);
        System.out.println("semestre = " + semestre);
        Date heure;
        Calendar cal = Calendar.getInstance();
            Integer num = Integer.parseInt(numerocasetoedit);
        if(num == 1 | num == 5 | num == 9 | num == 13| num == 17) cal.set(0, 0, 0, 8, 0, 0);
        if(num == 2 | num == 6 | num == 10 | num == 14| num == 18) cal.set(0, 0, 0, 10, 0, 0);
        if(num == 3 | num == 7 | num == 11 | num == 15| num == 19) cal.set(0, 0, 0, 14, 0, 0);
        if(num == 4 | num == 8 | num == 12 | num == 16| num == 20) cal.set(0, 0, 0, 16, 0, 0);
        
        heure = cal.getTime();
        int jour = 2;
        if(num == 1 | num == 2 | num == 3 | num == 4) jour=2;
        if(num == 5 | num == 6 | num == 7 | num == 8) jour=3;
        if(num == 9 | num == 10 | num == 11 | num == 12) jour=4;
        if(num == 13 | num == 14 | num == 15 | num == 16) jour=5;
        if(num == 17 | num == 18 | num == 19 | num == 20) jour=6;

        Semaine sdd = semaineFacade.find(sd);
        Semaine sff = semaineFacade.find(sf);
        Enseignant ens = enseignantFacade.find(Integer.parseInt(enseignant));
        Matiere mat = matiereFacade.find(matiere);
        Groupe grp = groupeFacade.find(Integer.parseInt(groupe));
        
        if(empid.equals("")) {
            Emp emp = new Emp(1, jour, heure, sdd.getDatedebut(), sff.getDatedebut(), Integer.parseInt(semestre));
            emp.setNumG(grp);
            emp.setNumE(ens);
            emp.setNumM(mat);
            empFacade.create(emp);
            
            int x = jour - 2;
            
//            Calendar calv = Calendar.getInstance();
//            calv.setTime(sff.getDatedebut());0
//            calv.add(Calendar.DAY_OF_WEEK, 5);
//            Date dernierVend = calv.getTime();
            
            List<Seance> listSeance = new ArrayList();
            
            Calendar calsd = Calendar.getInstance();
            calsd.setTime(sdd.getDatedebut());
            calsd.add(Calendar.DAY_OF_WEEK, x);
            calsd.set(Calendar.HOUR_OF_DAY, cal.get(Calendar.HOUR_OF_DAY));
            calsd.set(Calendar.MINUTE, cal.get(Calendar.MINUTE));
            calsd.set(Calendar.SECOND, cal.get(Calendar.SECOND));
            Calendar calsf = Calendar.getInstance();
            calsf.setTime(sff.getDatedebut());
            calsf.add(Calendar.DAY_OF_WEEK, x);
            calsf.set(Calendar.HOUR_OF_DAY, cal.get(Calendar.HOUR_OF_DAY));
            calsf.set(Calendar.MINUTE, cal.get(Calendar.MINUTE));
            calsf.set(Calendar.SECOND, cal.get(Calendar.SECOND));
            Date dateSeanceDebut = calsd.getTime();
            Date dateSenaceFin = calsf.getTime();
          
            
            System.out.println("dd = " + dateSeanceDebut + " df = " + dateSenaceFin);
                    
            for(Date date = dateSeanceDebut; !date.after(dateSenaceFin); date = calsd.getTime()){
                Seance seanceEmp = new Seance();
                System.out.println("date for = " + date);
                Creneau creneauEmp = creneauFacade.findByDateAndHeure(date);
                seanceEmp.setNumS(1);
                seanceEmp.setType("seance");
                seanceEmp.setEtatS(1);
                seanceEmp.setNumC(creneauEmp);
                seanceEmp.setNumEmp(emp);
                calsd.add(Calendar.DAY_OF_WEEK, 7);
                listSeance.add(seanceEmp);
                
            }
            
            Iterator<Seance> seanceIterator = listSeance.iterator();
            int c = 0;
            while(seanceIterator.hasNext()){
                Seance s = seanceIterator.next();
                seanceFacade.create(s);
                c++;
                System.out.println(c);
            }
            
            System.out.println("after creating emp");
            StringBuilder sb = new StringBuilder();
            sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            sb.append("<emplois>");
            sb.append("<emploi>");
            sb.append("<idemploi>").append(emp.getNumEmp()).append("</idemploi>");
            sb.append("</emploi>");
            sb.append("</emplois>");
            response.setContentType("text/xml;charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            System.out.println("debut de sb" + sb.toString());
            response.getWriter().write(sb.toString());
            System.out.println("after setting response");
            
        } else {
            Emp emp = new Emp(Integer.parseInt(empid), jour, heure, sdd.getDatedebut(), sff.getDatedebut(), Integer.parseInt(semestre));
            emp.setNumG(grp);
            emp.setNumE(ens);
            emp.setNumM(mat);
            empFacade.edit(emp);
            System.out.println("after modifiying emp");
        }
        
        
        
        
        
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
