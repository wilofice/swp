/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.sessions.stateless;

import com.swp.beans.Enseignant;
import com.swp.beans.Message;
import com.swp.beans.Seance;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author genereux
 */
@Stateless
public class MessageFacade extends AbstractFacade<Message> {

    @PersistenceContext(unitName = "swpPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MessageFacade() {
        super(Message.class);
    }
    
    public int getIdLastMessage(){
         Query query =
         em.createQuery("SELECT MAX(m.id) FROM Message m");
         int idMsg = (int) query.getSingleResult();
         return idMsg;
    }
    
    public Message getMessageById(Integer id){
        TypedQuery<Message> query = em.createNamedQuery( "Message.findByidMsg", Message.class);
        query.setParameter("idMsg", id);
        Message message = query.getSingleResult();
        return message;
    }
    
    public Long countMessage(Enseignant ens){
         Query query =
         em.createQuery("SELECT count(m) FROM Message m WHERE m.receiver = :email");
         query.setParameter("email", ens.getEmail());
         Long somme = (Long) query.getSingleResult();
         return somme;
    }
    
}
