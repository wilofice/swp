/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.beans;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author genereux
 */
@Entity
@Table(name = "Semaine")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Semaine.findAll", query = "SELECT s FROM Semaine s")
    , @NamedQuery(name = "Semaine.findByIdsemaine", query = "SELECT s FROM Semaine s WHERE s.idsemaine = :idsemaine")
    , @NamedQuery(name = "Semaine.findByDatedebut", query = "SELECT s FROM Semaine s WHERE s.datedebut = :datedebut")})
public class Semaine implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Id_semaine")
    private String idsemaine;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Date_debut")
    @Temporal(TemporalType.DATE)
    private Date datedebut;
    @JoinColumn(name = "Id_semestre", referencedColumnName = "Id_semestre")
    @ManyToOne(optional = false)
    private Semestre idsemestre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSemaine")
    private List<Creneau> creneauList;

    public Semaine() {
    }

    public Semaine(String idsemaine) {
        this.idsemaine = idsemaine;
    }

    public Semaine(String idsemaine, Date datedebut) {
        this.idsemaine = idsemaine;
        this.datedebut = datedebut;
    }

    public String getIdsemaine() {
        return idsemaine;
    }

    public void setIdsemaine(String idsemaine) {
        this.idsemaine = idsemaine;
    }

    public Date getDatedebut() {
        return datedebut;
    }

    public void setDatedebut(Date datedebut) {
        this.datedebut = datedebut;
    }

    public Semestre getIdsemestre() {
        return idsemestre;
    }

    public void setIdsemestre(Semestre idsemestre) {
        this.idsemestre = idsemestre;
    }

    @XmlTransient
    public List<Creneau> getCreneauList() {
        return creneauList;
    }

    public void setCreneauList(List<Creneau> creneauList) {
        this.creneauList = creneauList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsemaine != null ? idsemaine.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Semaine)) {
            return false;
        }
        Semaine other = (Semaine) object;
        if ((this.idsemaine == null && other.idsemaine != null) || (this.idsemaine != null && !this.idsemaine.equals(other.idsemaine))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Semaine[ idsemaine=" + idsemaine + " ]";
    }
    
}
