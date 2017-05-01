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

/**
 *
 * @author genereux
 */
@Entity
@Table(name = "Emp")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Emp.findAll", query = "SELECT e FROM Emp e")
    , @NamedQuery(name = "Emp.findByNumEmp", query = "SELECT e FROM Emp e WHERE e.numEmp = :numEmp")
    , @NamedQuery(name = "Emp.findByJour", query = "SELECT e FROM Emp e WHERE e.jour = :jour")
    , @NamedQuery(name = "Emp.findByHeure", query = "SELECT e FROM Emp e WHERE e.heure = :heure")
    , @NamedQuery(name = "Emp.findByDateD", query = "SELECT e FROM Emp e WHERE e.dateD = :dateD")
    , @NamedQuery(name = "Emp.findByDateF", query = "SELECT e FROM Emp e WHERE e.dateF = :dateF")
    , @NamedQuery(name = "Emp.findByIdsemestre", query = "SELECT e FROM Emp e WHERE e.idsemestre = :idsemestre")})
public class Emp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NumEmp")
    private Integer numEmp;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Jour")
    private int jour;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Heure")
    @Temporal(TemporalType.TIME)
    private Date heure;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DateD")
    @Temporal(TemporalType.DATE)
    private Date dateD;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DateF")
    @Temporal(TemporalType.DATE)
    private Date dateF;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Id_semestre")
    private int idsemestre;
    @JoinColumn(name = "NumE", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Enseignant numE;
    @JoinColumn(name = "NumG", referencedColumnName = "NumG")
    @ManyToOne(optional = false)
    private Groupe numG;
    @JoinColumn(name = "NumM", referencedColumnName = "CodeM")
    @ManyToOne(optional = false)
    private Matiere numM;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "NumEmp")
    private List<Seance> seanceList;

    public List<Seance> getSeanceList() {
        return seanceList;
    }

    public void setSeanceList(List<Seance> seanceList) {
        this.seanceList = seanceList;
    }

    public Emp() {
    }

    public Emp(Integer numEmp) {
        this.numEmp = numEmp;
    }

    public Emp(Integer numEmp, int jour, Date heure, Date dateD, Date dateF, int idsemestre) {
        this.numEmp = numEmp;
        this.jour = jour;
        this.heure = heure;
        this.dateD = dateD;
        this.dateF = dateF;
        this.idsemestre = idsemestre;
    }

    public Integer getNumEmp() {
        return numEmp;
    }

    public void setNumEmp(Integer numEmp) {
        this.numEmp = numEmp;
    }

    public int getJour() {
        return jour;
    }

    public void setJour(int jour) {
        this.jour = jour;
    }

    public Date getHeure() {
        return heure;
    }

    public void setHeure(Date heure) {
        this.heure = heure;
    }

    public Date getDateD() {
        return dateD;
    }

    public void setDateD(Date dateD) {
        this.dateD = dateD;
    }

    public Date getDateF() {
        return dateF;
    }

    public void setDateF(Date dateF) {
        this.dateF = dateF;
    }

    public int getIdsemestre() {
        return idsemestre;
    }

    public void setIdsemestre(int idsemestre) {
        this.idsemestre = idsemestre;
    }

    public Enseignant getNumE() {
        return numE;
    }

    public void setNumE(Enseignant numE) {
        this.numE = numE;
    }

    public Groupe getNumG() {
        return numG;
    }

    public void setNumG(Groupe numG) {
        this.numG = numG;
    }

    public Matiere getNumM() {
        return numM;
    }

    public void setNumM(Matiere numM) {
        this.numM = numM;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numEmp != null ? numEmp.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Emp)) {
            return false;
        }
        Emp other = (Emp) object;
        if ((this.numEmp == null && other.numEmp != null) || (this.numEmp != null && !this.numEmp.equals(other.numEmp))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Emp[ numEmp=" + numEmp + " ]";
    }
    
}
