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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author genereux
 */
@Entity
@Table(name = "Creneau")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Creneau.findAll", query = "SELECT c FROM Creneau c")
    , @NamedQuery(name = "Creneau.findByNumC", query = "SELECT c FROM Creneau c WHERE c.numC = :numC")
    , @NamedQuery(name = "Creneau.findByDate", query = "SELECT c FROM Creneau c WHERE c.date = :date")
    , @NamedQuery(name = "Creneau.findByHeure", query = "SELECT c FROM Creneau c WHERE c.heure = :heure")})
public class Creneau implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NumC")
    private Integer numC;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Heure")
    @Temporal(TemporalType.TIME)
    private Date heure;
    @JoinColumn(name = "id_semaine", referencedColumnName = "Id_semaine")
    @ManyToOne(optional = false)
    private Semaine idSemaine;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "numC")
    private List<Seance> seanceList;

    public Creneau() {
    }

    public Creneau(Integer numC) {
        this.numC = numC;
    }

    public Creneau(Integer numC, Date date, Date heure) {
        this.numC = numC;
        this.date = date;
        this.heure = heure;
    }

    public Integer getNumC() {
        return numC;
    }

    public void setNumC(Integer numC) {
        this.numC = numC;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getHeure() {
        return heure;
    }

    public void setHeure(Date heure) {
        this.heure = heure;
    }

    public Semaine getIdSemaine() {
        return idSemaine;
    }

    public void setIdSemaine(Semaine idSemaine) {
        this.idSemaine = idSemaine;
    }

    @XmlTransient
    public List<Seance> getSeanceList() {
        return seanceList;
    }

    public void setSeanceList(List<Seance> seanceList) {
        this.seanceList = seanceList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numC != null ? numC.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Creneau)) {
            return false;
        }
        Creneau other = (Creneau) object;
        if ((this.numC == null && other.numC != null) || (this.numC != null && !this.numC.equals(other.numC))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Creneau[ numC=" + numC + " ]";
    }
    
}
