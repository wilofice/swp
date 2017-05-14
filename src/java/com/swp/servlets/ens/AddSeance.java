/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import com.swp.beans.Seance;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.SeanceFacade;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;

/**
 *
 * @author genereux
 */
public class AddSeance {
    
    SeanceFacade sf;
    EmpFacade ef;
    List<Creneau> lc;
    Seance s;
    

    @PostConstruct
    public void addSeance() {
        
        Iterator<Creneau> it = lc.iterator();
        while(it.hasNext()) {
            Creneau c = it.next();
            Calendar cal = Calendar.getInstance();
            cal.setTime(c.getDate());
            Emp emp = new Emp();
            
            emp.setDateD(c.getDate());
            emp.setDateF(c.getDate());
            emp.setHeure(c.getHeure());
            emp.setIdsemestre(c.getIdSemaine().getIdSemestre().getIdsemestre());
            emp.setNumE(s.getNumEmp().getNumE());
            emp.setNumG(s.getNumEmp().getNumG());
            emp.setNumM(s.getNumEmp().getNumM());
            
            emp.setJour(cal.get(Calendar.DAY_OF_WEEK));
            emp.setNumEmp(1);
            ef.create(emp);
            
            Seance se = new Seance();
            String type = "" + s.getNumC().getNumC() + s.getNumS() + s.getNumEmp().getNumEmp();
            se.setNumS(1);
            se.setNumC(c);
            se.setType(type);
            se.setNumEmp(emp);
            se.setEtatS(1);
            sf.create(se);
            
        }
    }
    
    

    public AddSeance(SeanceFacade sf, EmpFacade ef, List<Creneau> lc, Seance s) {
        this.sf = sf;
        this.ef = ef;
        this.lc = lc;
        this.s = s;
    }
   
}
