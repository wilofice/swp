package com.swp.beans;

import com.swp.beans.Enseignant;
import com.swp.beans.Groupe;
import com.swp.beans.Matiere;
import com.swp.beans.Seance;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-16T15:22:29")
@StaticMetamodel(Emp.class)
public class Emp_ { 

    public static volatile SingularAttribute<Emp, Date> heure;
    public static volatile SingularAttribute<Emp, Groupe> numG;
    public static volatile SingularAttribute<Emp, Integer> jour;
    public static volatile SingularAttribute<Emp, Matiere> numM;
    public static volatile SingularAttribute<Emp, Integer> idsemestre;
    public static volatile SingularAttribute<Emp, Date> dateF;
    public static volatile SingularAttribute<Emp, Date> dateD;
    public static volatile SingularAttribute<Emp, Integer> numEmp;
    public static volatile SingularAttribute<Emp, Enseignant> numE;
    public static volatile ListAttribute<Emp, Seance> seanceList;

}