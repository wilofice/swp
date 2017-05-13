package com.swp.beans;

import com.swp.beans.Enseignant;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-09T17:04:23")
@StaticMetamodel(Message.class)
public class Message_ { 

    public static volatile SingularAttribute<Message, Integer> idMsg;
    public static volatile SingularAttribute<Message, Date> date;
    public static volatile SingularAttribute<Message, String> receiver;
    public static volatile SingularAttribute<Message, Enseignant> sender;
    public static volatile SingularAttribute<Message, String> typeReceiver;
    public static volatile SingularAttribute<Message, String> text;
    public static volatile SingularAttribute<Message, Date> time;
    public static volatile SingularAttribute<Message, String> objet;

}