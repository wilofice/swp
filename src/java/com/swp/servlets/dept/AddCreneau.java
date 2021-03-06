/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.dept;

import com.swp.beans.Creneau;
import com.swp.beans.Semaine;
import com.swp.sessions.stateless.CreneauFacade;
import com.swp.sessions.stateless.SemaineFacade;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jboss.weld.SimpleCDI;

/**
 *
 * @author Pro
 */
@WebServlet(name = "AddCreneau", urlPatterns = {"/AddCreneau"})
public class AddCreneau extends HttpServlet {

    @EJB 
    SemaineFacade semaineFacade;
    
    @EJB
    CreneauFacade creneauFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Semaine> listSemaine = semaineFacade.findAll();
        Iterator<Semaine> semaineIterator = listSemaine.iterator();
        List<Creneau> creneauList = new ArrayList<Creneau>();
              
        while(semaineIterator.hasNext()){
            
            Semaine s = semaineIterator.next();
            String idSemaine = s.getIdsemaine();
            
           // System.out.println(idSemaine);
            
            Date dateDSemaine = s.getDatedebut();
            Calendar cal = Calendar.getInstance();
            
            Date date = new Date();
    
            for(int i=0;i<=4;i++){
                cal.setTime(dateDSemaine);
                cal.add(Calendar.DAY_OF_WEEK, i);
                for(int j=0;j<=8;j+=2){
                    cal.set(Calendar.HOUR_OF_DAY, 8);
                    if(j==2){
                        cal.add(Calendar.HOUR_OF_DAY, j); 
                        j=4;
                    }
                    else{
                        cal.add(Calendar.HOUR_OF_DAY, j); 
                    }
                    Creneau cren = new Creneau();
                    date = cal.getTime();
                    cren.setDate(date);
                    cren.setIdSemaine(s);
                    cren.setHeure(date);
                    creneauList.add(cren);             
                }
            }
        }           
          
        Iterator<Creneau> creneauIterator = creneauList.iterator();
        int c = 0;
        while(creneauIterator.hasNext()){
              
            Creneau cre = creneauIterator.next();
            creneauFacade.create(cre);
            System.out.println(cre.getHeure());
            //c++;
        }
        
        //System.out.println("le nombre de creneaux est :"+ c);
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
     * Handles the HTTP <code>POST</-code> method.
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
