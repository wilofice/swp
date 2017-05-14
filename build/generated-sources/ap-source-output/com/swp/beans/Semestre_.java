package com.swp.beans;

import com.swp.beans.Semaine;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-14T14:17:26")
@StaticMetamodel(Semestre.class)
public class Semestre_ { 

    public static volatile SingularAttribute<Semestre, Integer> idsemestre;
    public static volatile ListAttribute<Semestre, Semaine> semaineList;
    public static volatile SingularAttribute<Semestre, String> semainedebut;

}