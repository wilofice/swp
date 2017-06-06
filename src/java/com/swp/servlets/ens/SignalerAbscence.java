/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Filiere;
import com.swp.beans.Message;
import com.swp.beans.Permutation;
import com.swp.beans.Seance;
import com.swp.beans.SeanceHashMap;
import com.swp.sessions.stateless.AbscenceFacade;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.EnseignantFacade;
import com.swp.sessions.stateless.FiliereFacade;
import com.swp.sessions.stateless.MessageFacade;
import com.swp.sessions.stateless.SeanceFacade;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SignalerAbscence", urlPatterns = {"/signalerabscence"})
public class SignalerAbscence extends HttpServlet {

    @EJB
    SeanceFacade seanceFacade;
    @EJB
    EnseignantFacade enseignantFacade;
    @EJB
    MessageFacade messageFacade;
    @EJB
    FiliereFacade filiereFacade;
    @EJB
    AbscenceFacade abscenceFacade;
    @EJB
    EmpFacade ef;
    
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String seanceid = request.getParameter("seancetoabsentid");
        
        Seance sa = seanceFacade.find(Integer.parseInt(seanceid));
        
//        Absenter absenter = new Absenter(sa, seanceFacade, abscenceFacade);
//        
//        absenter.init();
//        List<Creneau> listc = absenter.getVideGrpAndEns();
//        
//        
//        Iterator<Creneau> cIt = listc.iterator();
//        System.out.println("List des creneaux trouvés");
//        
//        while(cIt.hasNext()) {
//            Creneau c = cIt.next();
//            System.out.println("creneau num " + c.getNumC() + " date = " + c.getDate() + " heure " + c.getHeure());
//        }
//        
//        
//        AddSeance addSeance = new AddSeance(seanceFacade, ef, listc, sa);
//        addSeance.addSeance();
        
        
        
        
        //dqlmsjfmqljfmqj
        //LJQDLQJSDKLFJQLDKJFMQDKFQM
        Absenter absenter = new Absenter(sa, seanceFacade, abscenceFacade);
        
        absenter.init();
        List<Creneau> listc = absenter.getVideGrpAndEns();
        List<Permutation> listpermut = absenter.getListpermutation();
        
        Iterator<Permutation> pIt = listpermut.iterator();
        System.out.println("List des creneaux trouvés");
        
        while(pIt.hasNext()) {
            Permutation p = pIt.next();
            System.out.println("creneau num " + p.getE().getNom() + " prenom " + p.getE().getPrenom() );
        }
        
        
//        AddSeance addSeance = new AddSeance(seanceFacade, ef, listc, sa);
//        addSeance.addSeance();

        String idEns = getEnseignantInfoCookies(request, "idens");
        Integer ensid = Integer.parseInt(idEns);
        Enseignant ens = enseignantFacade.find(ensid);
        String semaineid = request.getParameter("currentsemaineid");
        System.out.println("currentsemaineid " + semaineid);
        List<Emp> lemp = ef.findByEns(ens);
        SeanceHashMap shm = new SeanceHashMap(seanceFacade);
        shm.init();
        List<Seance> listSeance = shm.getSeanceEnsBySemaine(lemp, semaineid);
        HashMap<String, HashMap<String, Seance>> seanceHashMap = shm.getHashMap(listSeance);
        
        HttpSession session = request.getSession();
        session.setAttribute("seancetoabsent", sa);
        request.setAttribute("seancetoabsent", sa);
        
        request.removeAttribute("seanceHashMap");
        request.setAttribute("seanceHashMap", seanceHashMap);
        request.setAttribute("notification", "notification");
        this.getServletContext().getRequestDispatcher("/WEB-INF/viewens/EmploiEns.jsp").forward(request, response);
        
        Enseignant enstest = enseignantFacade.find(1);
        
        System.out.println(seanceid);
        Seance s = seanceFacade.find(Integer.parseInt(seanceid));
        String nomF = s.getNumEmp().getNumG().getNomFiliere();
        Filiere filiere = filiereFacade.findByNomF(nomF);
        
        Enseignant enschef = filiere.getChef();
        String emailchefdepartement = enschef.getEmail();
        
        Enseignant enscoordinateur = filiere.getCoordinateur();
        String emailcoordinateur = enscoordinateur.getEmail();
        
        String emailgroupe = request.getParameter("emailgroupe");
        
        String message = request.getParameter("message");
        //System.out.println("taille du message " + message.length());
        
        String objetmessage = request.getParameter("objetmessage");
        //System.out.println("taille du objetmessage " + objetmessage.length());
        
        Message msgt = new Message();
        Calendar cal = Calendar.getInstance();
        msgt.setDate(cal.getTime());
        
        msgt.setTypeReceiver("groupe");
        msgt.setIdMsg(1);
        msgt.setSender(ens);
        msgt.setText(message);
        msgt.setTime(cal.getTime());
        msgt.setObjet(objetmessage);
        msgt.setReceiver(enstest.getEmail());
        System.out.println("before creating");
        messageFacade.create(msgt);
        //System.out.println("ensnom  " + ens.getPrenom());
        String nomEns = getEnseignantInfoCookies(request, "nomens");
        String prenomEns = getEnseignantInfoCookies(request, "prenomens");
        String fromWhichEns =  "De la part du professeur " + nomEns + " " + prenomEns;
        String messagetosend = fromWhichEns + "\n" + message;
        //System.out.println("idens = " + idEns);
        //System.out.println("ensid = " + ensid);
        
//        String messageD = request.getParameter("messageD");
//        System.out.println(messageD);
//        String messagetosendD = fromWhichEns + "\n" + messageD;
        
//        SendMail.envoyerMail(emailgroupe, objetmessage, messagetosend);
//        SendMail.envoyerMail(emailchefdepartement, objetmessage, messagetosend);
//        SendMail.envoyerMail(emailcoordinateur, objetmessage, messagetosend);
        
        
        
        
        Message msg = new Message();
        //Calendar cal = Calendar.getInstance();
        msg.setDate(cal.getTime());
        
        msg.setTypeReceiver("groupe");
        msg.setIdMsg(1);
        msg.setSender(ens);
        msg.setText(message);
        msg.setTime(cal.getTime());
        msg.setObjet(objetmessage);
        msg.setReceiver(emailgroupe);
        System.out.println("before creating");
        messageFacade.create(msg);
        
        Message msgChef = new Message();
        Calendar calChef = Calendar.getInstance();
        msgChef.setDate(cal.getTime());
        
        msgChef.setTypeReceiver("Chef Departement");
        msgChef.setIdMsg(1);
        msgChef.setSender(ens);
        msgChef.setText(message);
        msgChef.setTime(cal.getTime());
        msgChef.setObjet(objetmessage);
        msgChef.setReceiver(emailchefdepartement);
        System.out.println("before creating");
        messageFacade.create(msgChef);
        
        Message msgCoord = new Message();
        Calendar calCoord = Calendar.getInstance();
        msgCoord.setDate(cal.getTime());
        
        msgCoord.setTypeReceiver("Coordinateur Filiere");
        msgCoord.setIdMsg(1);
        msgCoord.setSender(ens);
        msgCoord.setText(message);
        msgCoord.setTime(cal.getTime());
        msgCoord.setObjet(objetmessage);
        msgCoord.setReceiver(emailcoordinateur);
        System.out.println("before creating");
        messageFacade.create(msgCoord);
        
        
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

    
    public String getEnseignantInfoCookies(HttpServletRequest request, String cle) {
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for (Cookie cooky : cookies) {
                if(cooky != null && cle.equals(cooky.getName())) {
                    return cooky.getValue();
                }
            }
        }
        return null;
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
