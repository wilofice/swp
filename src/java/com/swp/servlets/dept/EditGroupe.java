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


@WebServlet(name = "EditGroupe", urlPatterns = {"/editGroupe"})
public class EditGroupe extends HttpServlet {
    /*private static Integer idCounter = 0;
    public static synchronized String createID()
        {
            return String.valueOf(idCounter++);
        } */

    
     @EJB
    GroupeFacade groupeFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("id = " + request.getParameter("id"));
        int id = Integer.parseInt(request.getParameter("id"));
        List<Groupe> listGroupe = groupeFacade.findAll(); 
        Groupe groupe = groupeFacade.getGroupeById(id);
        request.setAttribute("listGroupe", listGroupe);
        request.setAttribute("groupeSelected",groupe);
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/ModifierGroupe.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("id recupere" + request.getParameter("groupeid"));
        int id = Integer.parseInt(request.getParameter("groupebv id"));
        Groupe groupe = groupeFacade.getGroupeById(id);
        
       
        Integer niveau = Integer.parseInt(request.getParameter("niveau"));
        String nomG = request.getParameter("nomG");
        String nomFiliere = request.getParameter("nomFiliere");
       
        
     
        
        groupeFacade.edit(groupe);
        groupe.setNomG(nomG);
        groupe.setNiveau(niveau);
        groupe.setNomFiliere(nomFiliere);
       
        
    
        
        List<Groupe> listGroupe = groupeFacade.findAll();
        request.setAttribute("listGroupe", listGroupe);
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
