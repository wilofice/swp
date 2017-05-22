/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.login;

import com.swp.beans.Comptes;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.sessions.stateless.AbscenceFacade;
import com.swp.sessions.stateless.ComptesFacade;
import java.io.IOException;
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
    AbscenceFacade af;
    
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        this.getServletContext().getRequestDispatcher("/WEB-INF/viewlogin/index.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("id");
        System.out.println("Le login est : " + login);
        Comptes compte = comptesFacade.find(login);
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
                
                Enseignant ens = compte.getEnseignantList().get(0);
                
                if ( "Enseignant".equals(ens.getRôle())){
                Cookie cookieid = new Cookie("idens", ens.getId()+"");
                Cookie cookienom = new Cookie("nomens", ens.getNom());
                Cookie cookieprenom = new Cookie("prenomens", ens.getPrenom());
                response.addCookie(cookieid);
                response.addCookie(cookienom);
                response.addCookie(cookieprenom);
                HttpSession session = request.getSession();
                session.setAttribute("ens", ens);
                System.out.println("Hello mon rôle est :" + ens.getRôle());
                this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
                } 
                
                else{
                Cookie cookieid = new Cookie("idens", ens.getId()+"");
                Cookie cookienom = new Cookie("nomens", ens.getNom());
                Cookie cookieprenom = new Cookie("prenomens", ens.getPrenom());
                response.addCookie(cookieid);
                response.addCookie(cookienom);
                response.addCookie(cookieprenom);
                HttpSession sessionDept = request.getSession();
                sessionDept.setAttribute("ens", ens);
                System.out.println("Hello mon rôle est :" + ens.getRôle());
                this.getServletContext().getRequestDispatcher("/WEB-INF/viewdept/Emploi_Dept.jsp").forward(request, response);
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
