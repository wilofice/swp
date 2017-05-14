package com.swp.beans;

import com.swp.beans.Enseignant;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-14T13:41:13")
@StaticMetamodel(Comptes.class)
public class Comptes_ { 

    public static volatile SingularAttribute<Comptes, String> idUser;
    public static volatile ListAttribute<Comptes, Enseignant> enseignantList;
    public static volatile SingularAttribute<Comptes, String> motdepasse;

}