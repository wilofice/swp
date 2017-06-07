/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Enseignant;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
    
    public Enseignant getEnseignantByMail(String email){
        TypedQuery<Enseignant> query = em.createNamedQuery( "Enseignant.findByEmail", Enseignant.class);
        query.setParameter("email", email);
        Enseignant ens = query.getSingleResult();
        return ens;
    }
    
    public List<String> getListeEmail() {
        List<String> results;
        Query query = em.createQuery("SELECT e.email FROM Enseignant e");
        results = query.getResultList();
        return results;
    }
     public List<Enseignant> getListeEnsbyRole(String role) {
        List<Enseignant> results;
        Query query = em.createQuery("SELECT e FROM Enseignant e WHERE e.rôle=:role");
        query.setParameter("role", role);
        results = query.getResultList();
        return results;
    }
}
