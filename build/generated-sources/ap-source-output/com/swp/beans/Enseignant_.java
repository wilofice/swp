package com.swp.beans;

import com.swp.beans.Comptes;
import com.swp.beans.Emp;
import com.swp.beans.Filiere;
import com.swp.beans.Message;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-16T17:29:09")
@StaticMetamodel(Enseignant.class)
public class Enseignant_ { 

    public static volatile SingularAttribute<Enseignant, Comptes> idUser;
    public static volatile ListAttribute<Enseignant, Filiere> filiereList1;
    public static volatile ListAttribute<Enseignant, Emp> empList;
    public static volatile ListAttribute<Enseignant, Message> messageList;
    public static volatile SingularAttribute<Enseignant, String> tel;
    public static volatile SingularAttribute<Enseignant, Integer> id;
    public static volatile SingularAttribute<Enseignant, String> rôle;
    public static volatile ListAttribute<Enseignant, Filiere> filiereList;
    public static volatile SingularAttribute<Enseignant, String> nom;
    public static volatile SingularAttribute<Enseignant, String> prenom;
    public static volatile SingularAttribute<Enseignant, String> email;

}