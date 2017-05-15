/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Semaine;
import com.swp.beans.Semestre;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author genereux
 */
@Stateless
public class SemestreFacade extends AbstractFacade<Semestre> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SemestreFacade() {
        super(Semestre.class);
    }
    
    
    public Date getDateFinSemestre(int idsemestre) {
        
        String squery = "SELECT MAX(sem.datedebut) FROM Semaine sem WHERE sem.idSemestre.idsemestre = :idSemestre";
        Query query = em.createQuery(squery);
        query.setParameter("idSemestre", idsemestre);
        Date d = (Date) query.getSingleResult();
        return d;
    }
    
    public Semestre getSemestreBySemaine(Semaine sem) { 
        String squery = "SELECT sem.idSemestre FROM Semaine sem WHERE sem = :sem";
        
        Query query = em.createQuery(squery);
        
        query.setParameter("sem", sem);
        
        return (Semestre) query.getSingleResult();
    }
    
}
