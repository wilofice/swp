package com.swp.beans;

import com.swp.beans.Creneau;
import com.swp.beans.Emp;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-04-21T07:51:45")
@StaticMetamodel(Seance.class)
public class Seance_ { 

    public static volatile SingularAttribute<Seance, Integer> etatS;
    public static volatile SingularAttribute<Seance, Emp> numEmp;
    public static volatile SingularAttribute<Seance, String> type;
    public static volatile SingularAttribute<Seance, Integer> numS;
    public static volatile SingularAttribute<Seance, Creneau> numC;

}