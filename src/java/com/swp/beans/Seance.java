/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.beans;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Pro
 */
@Entity
@Table(name = "seance")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Seance.findAll", query = "SELECT s FROM Seance s")
    , @NamedQuery(name = "Seance.findByNumS", query = "SELECT s FROM Seance s WHERE s.numS = :numS")
    , @NamedQuery(name = "Seance.findByType", query = "SELECT s FROM Seance s WHERE s.type = :type")
    , @NamedQuery(name = "Seance.findByEtatS", query = "SELECT s FROM Seance s WHERE s.etatS = :etatS")})
public class Seance implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NumS")
    private Integer numS;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "type")
    private String type;
    @Basic(optional = false)
    @NotNull
    @Column(name = "EtatS")
    private int etatS;
    @JoinColumn(name = "NumC", referencedColumnName = "NumC")
    @ManyToOne(optional = false)
    private Creneau numC;
    @JoinColumn(name = "NumEmp", referencedColumnName = "NumEmp")
    @ManyToOne(optional = false)
    private Emp numEmp;

    public Seance() {
    }

    public Seance(Integer numS) {
        this.numS = numS;
    }

    public Seance(Integer numS, String type, int etatS) {
        this.numS = numS;
        this.type = type;
        this.etatS = etatS;
    }

    public Integer getNumS() {
        return numS;
    }

    public void setNumS(Integer numS) {
        this.numS = numS;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getEtatS() {
        return etatS;
    }

    public void setEtatS(int etatS) {
        this.etatS = etatS;
    }

    public Creneau getNumC() {
        return numC;
    }

    public void setNumC(Creneau numC) {
        this.numC = numC;
    }

    public Emp getNumEmp() {
        return numEmp;
    }

    public void setNumEmp(Emp numEmp) {
        this.numEmp = numEmp;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numS != null ? numS.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Seance)) {
            return false;
        }
        Seance other = (Seance) object;
        if ((this.numS == null && other.numS != null) || (this.numS != null && !this.numS.equals(other.numS))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Seance[ numS=" + numS + " ]";
    }
    
}
