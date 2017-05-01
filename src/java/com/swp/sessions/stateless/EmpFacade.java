/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Emp;
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
public class EmpFacade extends AbstractFacade<Emp> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EmpFacade() {
        super(Emp.class);
    }
    
    public List<Emp> findByGrpAndSemestre(Groupe grp, int semestre) {
        TypedQuery<Emp> query =
        em.createQuery("SELECT e FROM Emp e WHERE e.idsemestre = :idsemestre AND e.numG = :numG", Emp.class);
        query.setParameter("idsemestre", semestre);
        query.setParameter("numG", grp);
        List<Emp> results = query.getResultList();
        return results;
    }
}
