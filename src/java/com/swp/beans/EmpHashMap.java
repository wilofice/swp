/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.beans;

import com.swp.sessions.stateless.EmpFacade;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author genereux
 */
public class EmpHashMap {
    
    EmpFacade empFacade;
    
    public EmpHashMap(EmpFacade empFacade) {
        this.empFacade = empFacade;
    }
    
    public static HashMap<String, HashMap<String, List<Emp>>> getEmpAsHashMap(List<Emp> listemp) {
        HashMap<String, List<Emp>> lundi = new HashMap<>();
        HashMap<String, List<Emp>> mardi = new HashMap<>();
        HashMap<String, List<Emp>> mercredi = new HashMap<>();
        HashMap<String, List<Emp>> jeudi = new HashMap<>();
        HashMap<String, List<Emp>> vendredi = new HashMap<>();
        Iterator<Emp> empIterator = listemp.iterator();
        Emp emp;
        Date heure;
        Calendar cal = Calendar.getInstance();
        int hour;
        
        List<Emp> delundi8 = new ArrayList<>();
        List<Emp> delundi10 = new ArrayList<>();
        List<Emp> delundi14 = new ArrayList<>();
        List<Emp> delundi16 = new ArrayList<>();
        
        List<Emp> demardi8 = new ArrayList<>();
        List<Emp> demardi10 = new ArrayList<>();
        List<Emp> demardi14= new ArrayList<>();
        List<Emp> demardi16 = new ArrayList<>();
        
        List<Emp> demercredi8 = new ArrayList<>();
        List<Emp> demercredi10 = new ArrayList<>();
        List<Emp> demercredi14 = new ArrayList<>();
        List<Emp> demercredi16 = new ArrayList<>();
        
        List<Emp> dejeudi8 = new ArrayList<>();
        List<Emp> dejeudi10 = new ArrayList<>();
        List<Emp> dejeudi14 = new ArrayList<>();
        List<Emp> dejeudi16 = new ArrayList<>();
        
        List<Emp> devendredi8 = new ArrayList<>();
        List<Emp> devendredi10 = new ArrayList<>();
        List<Emp> devendredi14 = new ArrayList<>();
        List<Emp> devendredi16 = new ArrayList<>();
        
        while(empIterator.hasNext()) {
            emp = empIterator.next();
            heure = emp.getHeure();
            cal.setTime(heure);
            hour = cal.get(Calendar.HOUR_OF_DAY);
            if(emp.getJour() == 2) {
                if(hour == 8) {
                    delundi8.add(emp);
                    //lundi.put("8", emp);
                }
                if(hour == 10) {
                    delundi10.add(emp);
                    //lundi.put("10", emp);
                }
                if(hour == 14) {
                    delundi14.add(emp);
                    //lundi.put("14", emp);
                }
                if(hour == 16) {
                    delundi16.add(emp);
                    //lundi.put("16", emp);
                }
            }
            if(emp.getJour() == 3) {

                if(hour == 8) {
                    demardi8.add(emp);
                    //mardi.put("8", emp);
                }
                if(hour == 10) {
                    demardi10.add(emp);
                    //mardi.put("10", emp);
                }
                if(hour == 14) {
                    demardi14.add(emp);
                    //mardi.put("14", emp);
                }
                if(hour == 16) {
                    demardi16.add(emp);
                    //mardi.put("16", emp);
                }
            }
            if(emp.getJour() == 4) {

                if(hour == 8) {
                    demercredi8.add(emp);
                    //mercredi.put("8", emp);
                }
                if(hour == 10) {
                    demercredi10.add(emp);
                    //mercredi.put("10", emp);
                }
                if(hour == 14) {
                    demercredi14.add(emp);
                    //mercredi.put("14", emp);
                }
                if(hour == 16) {
                    demercredi16.add(emp);
                    //mercredi.put("16", emp);
                }
            }
            
            if(emp.getJour() == 5) {

                if(hour == 8) {
                    dejeudi8.add(emp);
                    //jeudi.put("8", emp);
                }
                if(hour == 10) {
                    dejeudi10.add(emp);
                    //jeudi.put("10", emp);
                }
                if(hour == 14) {
                    dejeudi14.add(emp);
                    //jeudi.put("14", emp);
                }
                if(hour == 16) {
                    dejeudi16.add(emp);
                    //jeudi.put("16", emp);
                }
            }
            
            if(emp.getJour() == 6) {

                if(hour == 8) {
                    devendredi8.add(emp);
                    //vendredi.put("8", emp);
                }
                if(hour == 10) {
                    devendredi10.add(emp);
                    //vendredi.put("10", emp);
                }
                if(hour == 14) {
                    devendredi14.add(emp);
                    //vendredi.put("14", emp);
                }
                if(hour == 16) {
                    devendredi16.add(emp);
                    //vendredi.put("16", emp);
                }
            }
        }
        
        lundi.put("8", delundi8);
        lundi.put("10", delundi10);
        lundi.put("14", delundi14);
        lundi.put("16", delundi16);
        
        mardi.put("8", demardi8);
        mardi.put("10", demardi10);
        mardi.put("14", demardi14);
        mardi.put("16", demardi16);
        
        mercredi.put("8", demercredi8);
        mercredi.put("10", demercredi10);
        mercredi.put("14", demercredi14);
        mercredi.put("16", demercredi16);
        
        jeudi.put("8", dejeudi8);
        jeudi.put("10", dejeudi10);
        jeudi.put("14", dejeudi14);
        jeudi.put("16", dejeudi16);
        
        vendredi.put("8", devendredi8);
        vendredi.put("10", devendredi10);
        vendredi.put("14", devendredi14);
        vendredi.put("16", devendredi16);
              
        
        HashMap<String, HashMap<String, List<Emp>>> empHashMap = new HashMap<>();
        empHashMap.put("lundi", lundi);
        empHashMap.put("mardi", mardi);
        empHashMap.put("mercredi", mercredi);
        empHashMap.put("jeudi", jeudi);
        empHashMap.put("vendredi", vendredi);
        
        
        return empHashMap;
        
    }
}
