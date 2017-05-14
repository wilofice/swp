/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.beans;

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
    
    public static HashMap<String, HashMap<String, Emp>> getEmpAsHashMap(List<Emp> listemp) {
        HashMap<String, Emp> lundi = new HashMap<>();
        HashMap<String, Emp> mardi = new HashMap<>();
        HashMap<String, Emp> mercredi = new HashMap<>();
        HashMap<String, Emp> jeudi = new HashMap<>();
        HashMap<String, Emp> vendredi = new HashMap<>();
        Iterator<Emp> empIterator = listemp.iterator();
        Emp emp;
        Date heure;
        Calendar cal = Calendar.getInstance();
        int hour;
        
        while(empIterator.hasNext()) {
            emp = empIterator.next();
            heure = emp.getHeure();
            cal.setTime(heure);
            hour = cal.get(Calendar.HOUR_OF_DAY);
            if(emp.getJour() == 2) {
                
                if(hour == 8) {
                    lundi.put("8", emp);
                }
                if(hour == 10) {
                    lundi.put("10", emp);
                }
                if(hour == 14) {
                    lundi.put("14", emp);
                }
                if(hour == 16) {
                    lundi.put("16", emp);
                }
            }
            if(emp.getJour() == 3) {

                if(hour == 8) {
                    mardi.put("8", emp);
                }
                if(hour == 10) {
                    mardi.put("10", emp);
                }
                if(hour == 14) {
                    mardi.put("14", emp);
                }
                if(hour == 16) {
                    mardi.put("16", emp);
                }
            }
            if(emp.getJour() == 4) {

                if(hour == 8) {
                    mercredi.put("8", emp);
                }
                if(hour == 10) {
                    mercredi.put("10", emp);
                }
                if(hour == 14) {
                    mercredi.put("14", emp);
                }
                if(hour == 16) {
                    mercredi.put("16", emp);
                }
            }
            
            if(emp.getJour() == 5) {

                if(hour == 8) {
                    jeudi.put("8", emp);
                }
                if(hour == 10) {
                    jeudi.put("10", emp);
                }
                if(hour == 14) {
                    jeudi.put("14", emp);
                }
                if(hour == 16) {
                    jeudi.put("16", emp);
                }
            }
            
            if(emp.getJour() == 6) {

                if(hour == 8) {
                    vendredi.put("8", emp);
                }
                if(hour == 10) {
                    vendredi.put("10", emp);
                }
                if(hour == 14) {
                    vendredi.put("14", emp);
                }
                if(hour == 16) {
                    vendredi.put("16", emp);
                }
            }
        }
        
        HashMap<String, HashMap<String, Emp>> empHashMap = new HashMap<>();
        empHashMap.put("lundi", lundi);
        empHashMap.put("mardi", mardi);
        empHashMap.put("mercredi", mercredi);
        empHashMap.put("jeudi", jeudi);
        empHashMap.put("vendredi", vendredi);
        
        
        return empHashMap;
        
    }
}
