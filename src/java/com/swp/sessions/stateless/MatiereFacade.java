/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Matiere;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author genereux
 */
@Stateless
public class MatiereFacade extends AbstractFacade<Matiere> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MatiereFacade() {
        super(Matiere.class);
    }
    public Matiere getMatieretByCodeM(String codeM){
        TypedQuery<Matiere> query = em.createNamedQuery( "Matiere.findByCodeM", Matiere.class);
        query.setParameter("codeM", codeM);
        Matiere mat = new Matiere();
        mat = query.getSingleResult();
        return mat;
    } 
}
