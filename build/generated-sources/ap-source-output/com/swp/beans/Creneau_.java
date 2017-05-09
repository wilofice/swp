package com.swp.beans;

import com.swp.beans.Seance;
import com.swp.beans.Semaine;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-08T22:09:28")
@StaticMetamodel(Creneau.class)
public class Creneau_ { 

    public static volatile SingularAttribute<Creneau, Date> date;
    public static volatile SingularAttribute<Creneau, Date> heure;
    public static volatile SingularAttribute<Creneau, Semaine> idSemaine;
    public static volatile SingularAttribute<Creneau, Integer> numC;
    public static volatile ListAttribute<Creneau, Seance> seanceList;

}