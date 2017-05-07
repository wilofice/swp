package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import com.swp.beans.Permutation;
import com.swp.beans.Seance;
import com.swp.sessions.stateless.AbscenceFacade;
import com.swp.sessions.stateless.EmpFacade;
import com.swp.sessions.stateless.SeanceFacade;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import javax.annotation.PostConstruct;

public class Absenter {
    
    Seance s;
    Date sysdate = Calendar.getInstance().getTime();
    Date fin;
    SeanceFacade seanceFacade;
    Emp emp;
    EmpFacade empFacade;
    Enseignant e;
    Matiere m;
    Groupe g;
    Creneau c;
    AbscenceFacade abscenceFacade;
    List<Creneau> vidCrenEns;
    List<Creneau> videGrp;
    List<Creneau> videGrpAndEns;
    List<Permutation> listpermutation;
    
    public Absenter(Seance se, SeanceFacade sf, AbscenceFacade abscenceFacade) {
        this.s = se;
        this.emp = s.getNumEmp();
        this.e = this.emp.getNumE();
        this.m = this.emp.getNumM();
        this.g = this.emp.getNumG();
        this.c = se.getNumC();
        this.seanceFacade = sf;
        this.abscenceFacade = abscenceFacade;
    }
    
    
    @PostConstruct
    public void init() {
        s.setEtatS(0);
        seanceFacade.edit(s);
        fin = abscenceFacade.getDateFin(e, m, g, 1);
        vidCrenEns = abscenceFacade.getVidCrenEns(sysdate, fin, e);
        videGrp = abscenceFacade.getVideGrp(sysdate, fin, s.getNumC(), s.getNumEmp().getNumG(), s.getNumEmp().getIdsemestre());
        this.setVideGrpAndEns();
        this.setListPermutation();
        System.out.println("i got here without error");
    }

    public List<Creneau> getVideGrpAndEns() {
        return videGrpAndEns;
    }

    public List<Permutation> getListpermutation() {
        return listpermutation;
    }
    
    


    public void setVideGrpAndEns() {
        Iterator<Creneau> videEnsIterator = vidCrenEns.iterator();
        Creneau deEns;
        Creneau deGrp;
        while(videEnsIterator.hasNext()) {
            deEns = videEnsIterator.next();
            Iterator<Creneau> videGrpIterator = videGrp.iterator();
            while(videGrpIterator.hasNext())  {
                deGrp = videGrpIterator.next();
                if(Objects.equals(deGrp.getNumC(), deEns.getNumC())) {
                    if(videGrpAndEns == null) videGrpAndEns = new ArrayList<>();
                    videGrpAndEns.add(deEns);
                }
            }
        }
       
    }
    
    public void setListPermutation() {
        List<Enseignant> listEnsX = abscenceFacade.getEnsPermut(e, g, c);
        Iterator<Enseignant> listEnsXIterator = listEnsX.iterator();
        Enseignant en;
        List<Creneau> seanceEnsX;
        Iterator<Creneau> videEnsIterator;
        
        while(listEnsXIterator.hasNext()) {
            en = listEnsXIterator.next();
            seanceEnsX = abscenceFacade.getSeanceEnsX(en, g, sysdate, fin);
            Iterator<Creneau> cIterator = seanceEnsX.iterator();
            Creneau x;
            Permutation p = null;
            while(cIterator.hasNext()) {
                x = cIterator.next();
                Creneau y;
                videEnsIterator = vidCrenEns.iterator();
                while(videEnsIterator.hasNext()) {
                    y = videEnsIterator.next();
                    if(Objects.equals(x.getNumC(), y.getNumC())) {
                        if(p == null) {
                            p = new Permutation();
                            p.setE(en);
                        }
                        p.addCreneaux(x);
                        break;
                    }
                }
            }
            
            if(p != null) {
                if(listpermutation == null) listpermutation = new ArrayList<>();
                listpermutation.add(p);
            }
        }
    }
    
}
