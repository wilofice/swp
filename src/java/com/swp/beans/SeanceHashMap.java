/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this tseancelate file, choose Tools | Tseancelates
 * and open the tseancelate in the editor.
 */
package com.swp.beans;

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
public class SeanceHashMap {
    
    public static List<Seance> getSeanceEnsBySemaine(Enseignant ens, String semaineid) {
        List<Emp> listemp = ens.getEmpList();
        Iterator<Emp> empIterator = listemp.iterator();
        Emp emp;
        List<Seance> listseanceByemp;
        List<Seance> results = null;
        Seance s;
        Creneau creneau;
        while(empIterator.hasNext()) {
            emp = empIterator.next();
            listseanceByemp = emp.getSeanceList();
            Iterator<Seance> seanceIterator = listseanceByemp.iterator();
            while(seanceIterator.hasNext()) {
                s = seanceIterator.next();
                System.out.println("seance groupe "  + s.getNumEmp().getNumG().getNomG());
                creneau = s.getNumC();
                if(creneau.getIdSemaine().getIdsemaine().equals(semaineid)) {
                    if(results == null) results = new ArrayList<>();
                    results.add(s);
                }
                        
            }
        }
        
        return results;
    }
    
    public static HashMap<String, HashMap<String, Seance>> getHashMap(List<Seance> listseance) {
        HashMap<String, Seance> lundi = new HashMap<>();
        HashMap<String, Seance> mardi = new HashMap<>();
        HashMap<String, Seance> mercredi = new HashMap<>();
        HashMap<String, Seance> jeudi = new HashMap<>();
        HashMap<String, Seance> vendredi = new HashMap<>();
        Iterator<Seance> seanceIterator = listseance.iterator();
        Seance seance;
        Date heure;
        Calendar cal = Calendar.getInstance();
        int hour;
        
        while(seanceIterator.hasNext()) {
            seance = seanceIterator.next();
            heure = seance.getNumEmp().getHeure();
            cal.setTime(heure);
            hour = cal.get(Calendar.HOUR_OF_DAY);
            if(seance.getNumEmp().getJour() == 2) {
                
                if(hour == 8) {
                    lundi.put("8", seance);
                }
                if(hour == 10) {
                    lundi.put("10", seance);
                }
                if(hour == 14) {
                    lundi.put("14", seance);
                }
                if(hour == 16) {
                    lundi.put("16", seance);
                }
            }
            if(seance.getNumEmp().getJour() == 3) {

                if(hour == 8) {
                    mardi.put("8", seance);
                }
                if(hour == 10) {
                    mardi.put("10", seance);
                }
                if(hour == 14) {
                    mardi.put("14", seance);
                }
                if(hour == 16) {
                    mardi.put("16", seance);
                }
            }
            if(seance.getNumEmp().getJour() == 4) {

                if(hour == 8) {
                    mercredi.put("8", seance);
                }
                if(hour == 10) {
                    mercredi.put("10", seance);
                }
                if(hour == 14) {
                    mercredi.put("14", seance);
                }
                if(hour == 16) {
                    mercredi.put("16", seance);
                }
            }
            
            if(seance.getNumEmp().getJour() == 5) {

                if(hour == 8) {
                    jeudi.put("8", seance);
                }
                if(hour == 10) {
                    jeudi.put("10", seance);
                }
                if(hour == 14) {
                    jeudi.put("14", seance);
                }
                if(hour == 16) {
                    jeudi.put("16", seance);
                }
            }
            
            if(seance.getNumEmp().getJour() == 6) {

                if(hour == 8) {
                    vendredi.put("8", seance);
                }
                if(hour == 10) {
                    vendredi.put("10", seance);
                }
                if(hour == 14) {
                    vendredi.put("14", seance);
                }
                if(hour == 16) {
                    vendredi.put("16", seance);
                }
            }
        }
        
        HashMap<String, HashMap<String, Seance>> seanceHashMap = new HashMap<>();
        seanceHashMap.put("lundi", lundi);
        seanceHashMap.put("mardi", mardi);
        seanceHashMap.put("mercredi", mercredi);
        seanceHashMap.put("jeudi", jeudi);
        seanceHashMap.put("vendredi", vendredi);
        
        
        return seanceHashMap;
    
        
    }
}
