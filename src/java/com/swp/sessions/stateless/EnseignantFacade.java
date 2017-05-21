/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Enseignant;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author genereux
 */
@Stateless
public class EnseignantFacade extends AbstractFacade<Enseignant> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EnseignantFacade() {
        super(Enseignant.class);
    }
    
    public Enseignant getEnseignantById(Integer id){
        TypedQuery<Enseignant> query = em.createNamedQuery( "Enseignant.findById", Enseignant.class);
        query.setParameter("id", id);
        Enseignant ens = new Enseignant();
        ens = query.getSingleResult();
        return ens;
    }
}

