/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Creneau;
import com.swp.beans.Seance;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author genereux
 */
@Stateless
public class CreneauFacade extends AbstractFacade<Creneau> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CreneauFacade() {
        super(Creneau.class);
    }
    
    public Creneau findByDateAndHeure(Date dateC){
        TypedQuery<Creneau> query =
        em.createQuery("SELECT c FROM Creneau c WHERE c.date = :date AND c.heure = :heure", Creneau.class);
        query.setParameter("date", dateC);
        query.setParameter("heure", dateC);
        Creneau results = query.getSingleResult();
        return results;
    }
    
    public Creneau findByDateAndHeure(Date exactdate,Date d){
        TypedQuery<Creneau> query =
        em.createQuery("SELECT e FROM Creneau e WHERE e.date = :exactdate AND e.heure = :d", Creneau.class);
        query.setParameter("exactdate", exactdate);
        query.setParameter("d", d);
        Creneau result = query.getSingleResult();
        return result;
    } 
}
