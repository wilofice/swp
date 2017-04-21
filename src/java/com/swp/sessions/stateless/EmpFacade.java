/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Emp;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
    
}
