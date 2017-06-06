package com.swp.servlets.dept;

import com.swp.beans.Emp;
import com.swp.beans.EmpHashMap;
import com.swp.beans.Groupe;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.GroupeFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "GetEmpByGrp", urlPatterns = {"/getempbygrp"})
public class GetEmpByGrp extends HttpServlet {

    @EJB
    EmpFacade empFacade;
    @EJB
    GroupeFacade groupeFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String groupeid = request.getParameter("grpid");
        System.out.println("grpid = " + groupeid);
        Integer grpid = Integer.parseInt(groupeid);
        String semestreid = request.getParameter("semestreid");
        Integer semstrid = Integer.parseInt(semestreid);
        Groupe grp = groupeFacade.find(grpid);
        List<Emp> listemp = empFacade.findByGrpAndSemestre(grp, semstrid);
        HashMap<String, HashMap<String, Emp>> empHashMap =  EmpHashMap.getEmpAsHashMap(listemp);
        request.removeAttribute("empHashMap");
        request.setAttribute("empHashMap", empHashMap);
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/Emploi_Dept.jsp").forward(request, response);
        
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


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
