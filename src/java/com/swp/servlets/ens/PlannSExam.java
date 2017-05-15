/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import com.swp.beans.Creneau;
import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.sessions.stateless.AbscenceFacade;
import com.swp.sessions.stateless.SemestreFacade;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import javax.annotation.PostConstruct;

/**
 *
 * @author genereux
 */
public class PlannSExam {

    AbscenceFacade abscenceFacade;
    SemestreFacade semestreFacade;
    int idSemestre;
    Enseignant e;
    Groupe g;
    private List<Creneau> results;
    
    public PlannSExam(AbscenceFacade abscenceFacade, SemestreFacade semestreFacade, int idSemestre, Enseignant e, Groupe g) {
        this.abscenceFacade = abscenceFacade;
        this.semestreFacade = semestreFacade;
        this.idSemestre = idSemestre;
        this.e = e;
        this.g = g;
    }

    @PostConstruct
    public void init() {

        Date sysdate = Calendar.getInstance().getTime();
        Date fin = semestreFacade.getDateFinSemestre(idSemestre);
        Calendar cal = Calendar.getInstance();
        cal.setTime(fin);
        cal.add(Calendar.DAY_OF_WEEK, 4);
        fin = cal.getTime();
        List<Creneau> vidCrenEns = abscenceFacade.getVidCrenEns(sysdate, fin, e);
        List<Creneau> videGrp = abscenceFacade.getVideGrp(sysdate, fin, null, g, idSemestre);
        List<Creneau> videGrpAndEns = calcVideGrpAndEns(videGrp, vidCrenEns);
        results = videGrpAndEns;
    }

    public List<Creneau> getResults() {
        return results;
    }
    
    public List<Creneau> calcVideGrpAndEns(List<Creneau> videGrp, List<Creneau> vidCrenEns) {
        List<Creneau> videGrpAndEns = null;
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
        return videGrpAndEns;
        
    }

}
