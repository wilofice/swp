/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.login;

import com.swp.beans.Comptes;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import com.swp.beans.Seance;
import com.swp.beans.SeanceHashMap;
import com.swp.beans.Semaine;
import com.swp.sessions.stateless.AbscenceFacade;
import com.swp.sessions.stateless.ComptesFacade;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.MatiereFacade;
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

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    @EJB
    ComptesFacade comptesFacade;
    @EJB
    AbscenceFacade absenceFacade;
    @EJB
    MatiereFacade matiereFacade;
    @EJB
    EnseignantFacade enseignantFacade;
    @EJB
    SemaineFacade semaineFacade;
    @EJB
    SeanceFacade seanceFacade;
    @EJB
    EmpFacade empFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Seance> listseances= seanceFacade.findByType("seancesupp");
         request.setAttribute("listseances", listseances);

        this.getServletContext().getRequestDispatcher("/WEB-INF/viewlogin/index.jsp").forward(request, response);
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
        cal.add(Calendar.DAY_OF_WEEK, x);
        System.out.println("date du lund = " + cal.getTime());
        return cal.getTime();
    }
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Seance> listseances= seanceFacade.findByType("seancesupp");
         request.setAttribute("listseances", listseances);
        String login = request.getParameter("id");
        System.out.println("Le login est : " + login);
        Comptes compte = comptesFacade.find(login);
        Comptes comptedept=comptesFacade.find("admin-dept@gmail.com");
        Comptes comptesys =comptesFacade.find("admin-sys@gmail.com");
        if(compte == null) {
            request.setAttribute("erreurlogin", "login");
            this.getServletContext().getRequestDispatcher("/WEB-INF/viewlogin/index.jsp").forward(request, response);
        } else {
            String password = request.getParameter("password");
            String realpassword = compte.getMotdepasse();
            if(!password.equals(realpassword)) {
                request.setAttribute("erreurpassword", "password");
                this.getServletContext().getRequestDispatcher("/WEB-INF/viewlogin/index.jsp").forward(request, response);
            }
            
            else {
               if(compte.equals(comptedept)){
                Enseignant ens = compte.getEnseignantList().get(0);
                Cookie cookieid = new Cookie("idens", ens.getId()+"");
                Cookie cookienom = new Cookie("nomens", ens.getNom());
                Cookie cookieprenom = new Cookie("prenomens", ens.getPrenom());
                response.addCookie(cookieid);
                response.addCookie(cookienom);
                response.addCookie(cookieprenom);
                
                HttpSession session = request.getSession();
                session.setAttribute("ens", ens);
                List<Matiere> listmat = matiereFacade.findAll();
                request.setAttribute("listmat", listmat);
                this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/AjouterMat.jsp").forward(request, response);}
               if(compte.equals(comptesys)){
                Enseignant ens = compte.getEnseignantList().get(0);
                Cookie cookieid = new Cookie("idens", ens.getId()+"");
                Cookie cookienom = new Cookie("nomens", ens.getNom());
                Cookie cookieprenom = new Cookie("prenomens", ens.getPrenom());
                response.addCookie(cookieid);
                response.addCookie(cookienom);
                response.addCookie(cookieprenom);
                
                HttpSession session = request.getSession();
                session.setAttribute("ens", ens);
                List<Enseignant> listens = enseignantFacade.findAll();
                request.setAttribute("listens", listens);
                this.getServletContext().getRequestDispatcher("/WEB-INF/viewsys/AjouterUtilisateur.jsp").forward(request, response);
                } 
               else{
                Enseignant ens = compte.getEnseignantList().get(0);
                Cookie cookieid = new Cookie("idens", ens.getId()+"");
                Cookie cookienom = new Cookie("nomens", ens.getNom());
                Cookie cookieprenom = new Cookie("prenomens", ens.getPrenom());
                response.addCookie(cookieid);
                response.addCookie(cookienom);
                response.addCookie(cookieprenom);
                
                HttpSession session = request.getSession();
                session.setAttribute("ens", ens);
                List<Groupe> listGrp=absenceFacade.getGroupeEnsX(ens);
                request.setAttribute("listGrp",listGrp);
                
                
                Date d = this.getMonday();
                Semaine semaine = semaineFacade.findByDateD(d);
                
                List<Emp> lemp = empFacade.findByEns(ens);
        System.out.println("lemp lenght = " + lemp.size());
        SeanceHashMap shm = new SeanceHashMap(seanceFacade);
        shm.init();
        List<Seance> listSeance = shm.getSeanceEnsBySemaine(lemp, semaine.getIdsemaine());
        HashMap<String, HashMap<String, Seance>> seanceHashMap = shm.getHashMap(listSeance);
        
        request.removeAttribute("seanceHashMap");
        request.setAttribute("seanceHashMap", seanceHashMap);
        
        
        Seance sa = (Seance) session.getAttribute("seancetoabsent");
        
        
        if(sa != null) {
            request.setAttribute("seancetoabsent", sa);
            System.out.println("seance to absent from session = " + sa.getNumS());
        }
        
        request.setAttribute("semainecurrent", semaine.getIdsemaine());
        
        
        
                  response.sendRedirect("gestionemploiens") ;
            }
                
            }
        }
        
        
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
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
