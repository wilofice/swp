/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Emp;
import com.swp.beans.Filiere;
import com.swp.beans.Seance;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author genereux
 */
@Stateless
public class SeanceFacade extends AbstractFacade<Seance> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SeanceFacade() {
        super(Seance.class);
    }
    
    public Seance findByNumS(String numS) {
        TypedQuery<Seance> query =
        em.createNamedQuery("Seance.findByNumS", Seance.class);
        query.setParameter("numS", numS);
        Seance results = query.getSingleResult();
        return results;
    }
    
    public List<Seance> findByType(String type) {
        TypedQuery<Seance> query =
        em.createQuery("SELECT s FROM Seance s WHERE s.type = :type", Seance.class);
        query.setParameter("type", type);
        List<Seance> results = query.getResultList();
        return results;
    }
    
    public List<Seance> findByEmp(Emp e) {
        TypedQuery<Seance> query =
        em.createQuery("SELECT s FROM Seance s WHERE s.numEmp = :numEmp AND s.etatS = 1", Seance.class);
        query.setParameter("numEmp", e);
        List<Seance> results = query.getResultList();
        return results;
    }
    
    public Seance getSeanceById(Integer id){
        TypedQuery<Seance> query = em.createNamedQuery( "Seance.findByNumS", Seance.class);
        query.setParameter("numS", id);
        Seance seance = query.getSingleResult();
        return seance;
    }    
}
