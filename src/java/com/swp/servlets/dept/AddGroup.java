/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.dept;

import com.swp.beans.Groupe;
import com.swp.sessions.stateless.GroupeFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author amira
 */

@WebServlet(name = "AddGroup", urlPatterns = {"/addgroupe"})
public class AddGroup  extends HttpServlet {
    
    @EJB
    GroupeFacade groupeFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Groupe> listgroup = groupeFacade.findAll();
        request.setAttribute("listgroup", listgroup);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/AddGroup.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer niveau = Integer.parseInt(request.getParameter("niveau"));
        String nomG = request.getParameter("nomG");
        String nomFiliere = request.getParameter("nomFiliere");
        
        
        //studentId = Integer.parseInt(request.getParameter("StudentId"));
        
        System.out.println("niveau= " + niveau + " nomG = " + nomG + "nomFiliere= " + nomFiliere );
//        //Groupe group = new Groupe(1,nomG,niveau,nomFiliere);
//     
//        groupeFacade.create(group);
//        List<Groupe> listgroup = groupeFacade.findAll();
//        request.setAttribute("listgroup", listgroup);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/AddGroup.jsp").forward(request, response);
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
