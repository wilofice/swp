/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Creneau;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author genereux
 */
@Stateless
public class AbscenceFacade {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;
    
    public Date getDateFin(Enseignant e, Matiere m, Groupe g, int semestre) {
        Object[] res;
        Date results;
        String squery = "SELECT max(e.dateF) FROM Emp e WHERE e.numE = :numE AND e.numM = :numM AND e.numG = :numG and e.idsemestre = :idsemestre";
        Query query = em.createQuery(squery);
        query.setParameter("numE", e);
        query.setParameter("numM", m);
        query.setParameter("numG", g);
        query.setParameter("idsemestre", semestre);
        System.out.println("query results " + query.getSingleResult());
        //res = (Object[]) query.getSingleResult();
        results = (Date) query.getSingleResult();
        System.out.println("results " + results);
        return results;
    }
    
    public List<Creneau> getVideGrp(Date debut, Date fin, Creneau c, Groupe g, int semestre) {
        List<Creneau> results;
        String squery = "SELECT c FROM Creneau c WHERE c.date BETWEEN :debut AND :fin";
        squery += " AND c.numC NOT IN (SELECT s.numC.numC FROM Seance s WHERE s.numEmp.numG = :numG AND s.etatS = :etatS";
        squery += " AND s.numEmp.idsemestre = :idsemestre)";
        Query query = em.createQuery(squery);
        query.setParameter("debut", debut);
        query.setParameter("fin", fin);
        query.setParameter("numG", g);
        query.setParameter("etatS", 1);
        query.setParameter("idsemestre", semestre);
        results = query.getResultList();
        return results;
    }
    
    public List<Creneau> getVidCrenEns(Date debut, Date fin, Enseignant e) {
        List<Creneau> results;
        String squery = "SELECT c FROM Creneau c WHERE c.date BETWEEN :debut AND :fin";
        squery += " AND c.numC NOT IN (SELECT s.numC.numC FROM Seance s WHERE s.numEmp.numE = :numE)";
        Query query = em.createQuery(squery);
        query.setParameter("debut", debut);
        query.setParameter("fin", fin);
        query.setParameter("numE", e);
        results = query.getResultList();
        return results;
    }
    
    public List<Enseignant> getEnsPermut(Enseignant e, Groupe g, Creneau c) {
        List<Enseignant> results;
        String squery = "SELECT e.numE from Emp e WHERE e.numE != :numE AND e.numG = :numG";
        squery += " and e.numE NOT IN(SELECT e.numE from Emp e, IN (e.seanceList) s WHERE s.numC = :numC)";
        Query query = em.createQuery(squery);
        query.setParameter("numE", e);
        query.setParameter("numG", g);
        query.setParameter("numC", c);
        results = query.getResultList();
        return results;
    }
    
    
    public List<Creneau> getSeanceEnsX(Enseignant e, Groupe g, Date debut, Date fin) {
        List<Creneau> results;
        
        String squery = "SELECT c FROM Creneau c, IN (c.seanceList) s WHERE s.numEmp.numE = :numE AND s.numEmp.numG = :numG";
        squery += " AND s.etatS = :etatS AND c.date BETWEEN :debut AND :fin";
        Query query = em.createQuery(squery);
        query.setParameter("numE", e);
        query.setParameter("numG", g);
        query.setParameter("debut", debut);
        query.setParameter("fin", fin);
        query.setParameter("etatS", 1);
        results = query.getResultList();
        return results;
    }
    
    public List<Groupe> getGroupeEnsX(Enseignant e){
        List<Groupe> results;
   
        Query query = em.createQuery("SELECT DISTINCT g FROM Groupe g, IN (g.empList) emp WHERE emp.numE = :numE");
        query.setParameter("numE", e);
        results=query.getResultList();

        return results;

    }
    
    
    public List<Matiere> getMatiereEnsX(Enseignant e,Groupe g){
        List<Matiere> results;
    
        Query query = em.createQuery("SELECT m FROM Matiere m, IN(m.empList) emp WHERE emp.numE=:numE AND emp.numG=:numG");
         query.setParameter("numE",e);
         query.setParameter("numG",g);
         results=query.getResultList();
         return results;
    }
    
    
}
