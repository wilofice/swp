/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this tseancelate file, choose Tools | Tseancelates
 * and open the tseancelate in the editor.
 */
package com.swp.beans;

import com.swp.sessions.stateless.SeanceFacade;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;

/**
 *
 * @author genereux
 */
public class SeanceHashMap {
    
    SeanceFacade seanceFacade;

    public SeanceHashMap(SeanceFacade seanceFacade) {
        this.seanceFacade = seanceFacade;
    }
    
    @PostConstruct
    public void init() {}
    
    public  List<Seance> getSeanceEnsBySemaine(List<Emp> listemp, String semaineid) {
        //List<Emp> listemp = ens.getEmpList();
        Iterator<Emp> empIterator = listemp.iterator();
        
        
        List<Seance> results = null;
        
        
        while(empIterator.hasNext()) {
            Emp emp = empIterator.next();
            List<Seance> listseanceByemp = seanceFacade.findByEmp(emp);
            System.out.println("taille = " + listseanceByemp.size());
            Iterator<Seance> seanceIterator = listseanceByemp.iterator();
            while(seanceIterator.hasNext()) {
                Seance s = seanceIterator.next();
                System.out.println("before test "  + s.getNumEmp().getNumG().getNomG());
                Creneau creneau = s.getNumC();
                if(creneau.getIdSemaine().getIdsemaine().equals(semaineid)) {
                    System.out.println("seance find " + s.getNumS() + " " + s.getNumC().getDate() + " " + s.getNumEmp().getHeure());
                    if(results == null) results = new ArrayList<>();
                    results.add(s);
                }
                        
            }
        }
        
        return results;
    }
    
    public HashMap<String, HashMap<String, Seance>> getHashMap(List<Seance> listseance) {
        HashMap<String, Seance> lundi = new HashMap<>();
        HashMap<String, Seance> mardi = new HashMap<>();
        HashMap<String, Seance> mercredi = new HashMap<>();
        HashMap<String, Seance> jeudi = new HashMap<>();
        HashMap<String, Seance> vendredi = new HashMap<>();
        if(listseance == null) {
            System.out.println("list seance reçu est nulle");
            return null;
        }
        System.out.println("in seance get hash map");
        Iterator<Seance> seanceIterator = listseance.iterator();
        
        Date heure;
        Calendar cal = Calendar.getInstance();
        int hour;
        System.out.println("list seance lenght = " + listseance.size());
        while(seanceIterator.hasNext()) {
            Seance seance = seanceIterator.next();
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
