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
@Table(name = "Filiere")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Filiere.findAll", query = "SELECT f FROM Filiere f")
    , @NamedQuery(name = "Filiere.findByNumF", query = "SELECT f FROM Filiere f WHERE f.numF = :numF")
    , @NamedQuery(name = "Filiere.findByNomF", query = "SELECT f FROM Filiere f WHERE f.nomF = :nomF")})
public class Filiere implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NumF")
    private Integer numF;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "NomF")
    private String nomF;
    @JoinColumn(name = "chef", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Enseignant chef;
    @JoinColumn(name = "coordinateur", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Enseignant coordinateur;

    public Filiere() {
    }

    public Filiere(Integer numF) {
        this.numF = numF;
    }

    public Filiere(Integer numF, String nomF) {
        this.numF = numF;
        this.nomF = nomF;
    }

    public Integer getNumF() {
        return numF;
    }

    public void setNumF(Integer numF) {
        this.numF = numF;
    }

    public String getNomF() {
        return nomF;
    }

    public void setNomF(String nomF) {
        this.nomF = nomF;
    }

    public Enseignant getChef() {
        return chef;
    }

    public void setChef(Enseignant chef) {
        this.chef = chef;
    }

    public Enseignant getCoordinateur() {
        return coordinateur;
    }

    public void setCoordinateur(Enseignant coordinateur) {
        this.coordinateur = coordinateur;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numF != null ? numF.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Filiere)) {
            return false;
        }
        Filiere other = (Filiere) object;
        if ((this.numF == null && other.numF != null) || (this.numF != null && !this.numF.equals(other.numF))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Filiere[ numF=" + numF + " ]";
    }
    
}
