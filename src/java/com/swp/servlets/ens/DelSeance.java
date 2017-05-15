/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Emp;
import com.swp.beans.Seance;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.SeanceFacade;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author genereux
 */
public class DelSeance {
    
    SeanceFacade sf;
    EmpFacade ef;
    Seance s;

    public DelSeance(SeanceFacade sf, EmpFacade ef, Seance s) {
        this.sf = sf;
        this.ef = ef;
        this.s = s;
    }
    
    public void deleteSeance() {
        String type = "" + s.getNumC().getNumC() + s.getNumS() + s.getNumEmp().getNumEmp();
        List<Seance> ls = sf.findByType(type);
        Iterator<Seance> it  = ls.iterator();
        while(it.hasNext()) {
            Seance sa = it.next();
            Emp emp = sa.getNumEmp();
            sf.remove(sa);
            ef.remove(emp);  
        } 
    }
}
