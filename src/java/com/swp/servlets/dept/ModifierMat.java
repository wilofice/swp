/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.dept;

import com.swp.beans.Matiere;
import com.swp.sessions.stateless.MatiereFacade;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sara
 */
@WebServlet(name = "ModifierMat", urlPatterns = {"/ModifierMat"})
public class ModifierMat extends HttpServlet {

  @EJB
  MatiereFacade matiereFacade ;
  @EJB
  MatiereFacade matiereFacade1;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String codeM = request.getParameter("codeM"); 
       List<Matiere> listmat = matiereFacade.findAll();
        Matiere mat = matiereFacade1.getMatieretByCodeM(codeM);
       
       request.setAttribute("listmat", listmat);
        request.setAttribute("matSelected",mat);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/ModifierMat.jsp").forward(request, response);
    }
     protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String codeM = request.getParameter("codeMat");
        
       
        String nomM = request.getParameter("nomM"); 
       System.out.println("codeM = " + codeM + " nomM = " + nomM);
       
        Matiere mat = new Matiere(); 
         mat = matiereFacade.getMatieretByCodeM(codeM) ;
        
        
       
        mat.setNomM(nomM);
        //mat.setCodeM(codeM);
        
        matiereFacade.edit(mat);
        List<Matiere> listmat = matiereFacade.findAll();
        request.setAttribute("listmat", listmat);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/AjouterMat.jsp").forward(request, response);
         

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

