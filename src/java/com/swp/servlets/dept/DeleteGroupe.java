/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.dept;


import com.swp.beans.Groupe;
import com.swp.sessions.stateless.GroupeFacade;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "deleteGroupe", urlPatterns = {"/deleteGroupe"})
public class DeleteGroupe extends HttpServlet {
    
     
     @EJB
    GroupeFacade groupeFacade;
     
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int numG = Integer.parseInt(request.getParameter("numG"));
        Groupe groupe = groupeFacade.find(numG);
        groupeFacade.remove(groupe);
        System.out.print("i got lnkjlhkjhlkhkljhlkhkl after remove");

        
        
        List<Groupe> listgroup = groupeFacade.findAll();
        request.setAttribute("listGroupe", listgroup);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/AddGroup.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
