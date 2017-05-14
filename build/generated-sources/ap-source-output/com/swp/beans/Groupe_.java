package com.swp.beans;

import com.swp.beans.Emp;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-14T14:17:26")
@StaticMetamodel(Groupe.class)
public class Groupe_ { 

    public static volatile SingularAttribute<Groupe, Integer> numG;
    public static volatile ListAttribute<Groupe, Emp> empList;
    public static volatile SingularAttribute<Groupe, String> nomFiliere;
    public static volatile SingularAttribute<Groupe, String> nomG;
    public static volatile SingularAttribute<Groupe, Integer> niveau;
    public static volatile SingularAttribute<Groupe, String> email;

}