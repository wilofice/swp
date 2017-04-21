/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.beans;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author genereux
 */
@Entity
@Table(name = "Message")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Message.findAll", query = "SELECT m FROM Message m")
    , @NamedQuery(name = "Message.findByIdMsg", query = "SELECT m FROM Message m WHERE m.idMsg = :idMsg")
    , @NamedQuery(name = "Message.findByTypeReceiver", query = "SELECT m FROM Message m WHERE m.typeReceiver = :typeReceiver")
    , @NamedQuery(name = "Message.findByReceiver", query = "SELECT m FROM Message m WHERE m.receiver = :receiver")
    , @NamedQuery(name = "Message.findByDate", query = "SELECT m FROM Message m WHERE m.date = :date")
    , @NamedQuery(name = "Message.findByTime", query = "SELECT m FROM Message m WHERE m.time = :time")})
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_msg")
    private Integer idMsg;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "text")
    private String text;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "type_receiver")
    private String typeReceiver;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "receiver")
    private String receiver;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Column(name = "time")
    @Temporal(TemporalType.TIME)
    private Date time;
    @JoinColumn(name = "sender", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Enseignant sender;

    public Message() {
    }

    public Message(Integer idMsg) {
        this.idMsg = idMsg;
    }

    public Message(Integer idMsg, String text, String typeReceiver, String receiver, Date date, Date time) {
        this.idMsg = idMsg;
        this.text = text;
        this.typeReceiver = typeReceiver;
        this.receiver = receiver;
        this.date = date;
        this.time = time;
    }

    public Integer getIdMsg() {
        return idMsg;
    }

    public void setIdMsg(Integer idMsg) {
        this.idMsg = idMsg;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTypeReceiver() {
        return typeReceiver;
    }

    public void setTypeReceiver(String typeReceiver) {
        this.typeReceiver = typeReceiver;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Enseignant getSender() {
        return sender;
    }

    public void setSender(Enseignant sender) {
        this.sender = sender;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMsg != null ? idMsg.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Message)) {
            return false;
        }
        Message other = (Message) object;
        if ((this.idMsg == null && other.idMsg != null) || (this.idMsg != null && !this.idMsg.equals(other.idMsg))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Message[ idMsg=" + idMsg + " ]";
    }
    
}
