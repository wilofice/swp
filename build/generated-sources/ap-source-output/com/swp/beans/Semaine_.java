package com.swp.beans;

import com.swp.beans.Creneau;
import com.swp.beans.Semestre;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-04-24T13:08:47")
@StaticMetamodel(Semaine.class)
public class Semaine_ { 

    public static volatile SingularAttribute<Semaine, String> idsemaine;
    public static volatile SingularAttribute<Semaine, Semestre> idsemestre;
    public static volatile SingularAttribute<Semaine, Date> datedebut;
    public static volatile ListAttribute<Semaine, Creneau> creneauList;

}