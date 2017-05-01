/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Groupe;
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
public class GroupeFacade extends AbstractFacade<Groupe> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GroupeFacade() {
        super(Groupe.class);
    }

    public List<Groupe> findByNiveau(int niveau) {
        TypedQuery<Groupe> query =
        em.createNamedQuery("Country.findByNiveau", Groupe.class);
        query.setParameter("niveau", niveau);
        List<Groupe> results = query.getResultList();
        return results;
        
    }
    
    public List<Groupe> findByNiveauAndFiliere(int niveau, String nomFiliere) {
        TypedQuery<Groupe> query =
        em.createQuery("SELECT g FROM Groupe g WHERE g.nomFiliere = :nomFiliere AND g.niveau = :niveau", Groupe.class);
        query.setParameter("niveau", niveau);
        query.setParameter("nomFiliere", nomFiliere);
        List<Groupe> results = query.getResultList();
        return results;
        
    }

    
}
