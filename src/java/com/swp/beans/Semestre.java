/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.beans;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Pro
 */
@Entity
@Table(name = "semestre")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Semestre.findAll", query = "SELECT s FROM Semestre s")
    , @NamedQuery(name = "Semestre.findByIdsemestre", query = "SELECT s FROM Semestre s WHERE s.idsemestre = :idsemestre")
    , @NamedQuery(name = "Semestre.findBySemainedebut", query = "SELECT s FROM Semestre s WHERE s.semainedebut = :semainedebut")})
public class Semestre implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "Id_semestre")
    private Integer idsemestre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Semaine_debut")
    private String semainedebut;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSemestre")
    private List<Semaine> semaineList;

    public Semestre() {
    }

    public Semestre(Integer idsemestre) {
        this.idsemestre = idsemestre;
    }

    public Semestre(Integer idsemestre, String semainedebut) {
        this.idsemestre = idsemestre;
        this.semainedebut = semainedebut;
    }

    public Integer getIdsemestre() {
        return idsemestre;
    }

    public void setIdsemestre(Integer idsemestre) {
        this.idsemestre = idsemestre;
    }

    public String getSemainedebut() {
        return semainedebut;
    }

    public void setSemainedebut(String semainedebut) {
        this.semainedebut = semainedebut;
    }

    @XmlTransient
    public List<Semaine> getSemaineList() {
        return semaineList;
    }

    public void setSemaineList(List<Semaine> semaineList) {
        this.semaineList = semaineList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsemestre != null ? idsemestre.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Semestre)) {
            return false;
        }
        Semestre other = (Semestre) object;
        if ((this.idsemestre == null && other.idsemestre != null) || (this.idsemestre != null && !this.idsemestre.equals(other.idsemestre))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Semestre[ idsemestre=" + idsemestre + " ]";
    }
    
}
