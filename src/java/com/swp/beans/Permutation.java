/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.beans;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author genereux
 */
public class Permutation {
    private Enseignant e;
    private List<Creneau> listCreneauxOfferts;

    public Permutation() {
        
        this.listCreneauxOfferts = new ArrayList<>();
    }

    public Enseignant getE() {
        return e;
    }

    public void setE(Enseignant e) {
        this.e = e;
    }

    public List<Creneau> getListCreneauxOfferts() {
        return listCreneauxOfferts;
    }

    public void setListCreneauxOfferts(List<Creneau> listCreneauxOfferts) {
        this.listCreneauxOfferts = listCreneauxOfferts;
    }
    
    public void addCreneaux(Creneau creneau){
        listCreneauxOfferts.add(creneau);
    }
    
    public void removeCreneaux(int index){
        listCreneauxOfferts.remove(index);
    }
    
    
}
