package com.swp.servlets.login;

import com.swp.beans.Comptes;
import com.swp.beans.Enseignant;
import com.swp.servlets.ens.SendMail;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.SemaineFacade;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "MdpOublie", urlPatterns = {"/mdpOublie"})
public class MdpOublie extends HttpServlet {

    @EJB
    EnseignantFacade enseignantFacade;
    @EJB 
    SemaineFacade semaineFacade;
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewlogin/MdpOublie.jsp").forward(request, response);
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int i;
        List<String> listMail = enseignantFacade.getListeEmail();
        String email = request.getParameter("emailU");
        for(i=0;i< listMail.size() ; i++ ){
            if(listMail.get(i) == null ? email != null : !listMail.get(i).equals(email)){
                i++;
            }
            else
            {
                System.out.println("email "+email);
                Enseignant ens= enseignantFacade.getEnseignantByMail(email);
                Comptes compte = ens.getIdUser();
                String login = compte.getIdUser();
                String MotdePasse = compte.getMotdepasse();
                String message = "Coucou \n \n \n Votre mot de passe pour Swap my lecture est : \n \n Login :" + login + " \n Mot de Passe : " + MotdePasse + "\n \n Cordialement";
                SendMail.envoyerMail(email,"Votre mot de passe Swap My Lecture", message);

                this.getServletContext().getRequestDispatcher("/WEB-INF/viewlogin/index.jsp").forward(request, response);
            }
           
           request.setAttribute("erreur",email);
           this.getServletContext().getRequestDispatcher("/WEB-INF/viewlogin/MdpOublie.jsp").forward(request, response);
        
                
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
