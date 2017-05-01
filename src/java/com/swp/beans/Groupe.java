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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
 * @author genereux
 */
@Entity
@Table(name = "Groupe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Groupe.findAll", query = "SELECT g FROM Groupe g")
    , @NamedQuery(name = "Groupe.findByNumG", query = "SELECT g FROM Groupe g WHERE g.numG = :numG")
    , @NamedQuery(name = "Groupe.findByNomG", query = "SELECT g FROM Groupe g WHERE g.nomG = :nomG")
    , @NamedQuery(name = "Groupe.findByNiveau", query = "SELECT g FROM Groupe g WHERE g.niveau = :niveau")
    , @NamedQuery(name = "Groupe.findByNomFiliere", query = "SELECT g FROM Groupe g WHERE g.nomFiliere = :nomFiliere")})
public class Groupe implements Serializable {

    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "Email")
    private String email;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NumG")
    private Integer numG;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "NomG")
    private String nomG;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Niveau")
    private int niveau;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "NomFiliere")
    private String nomFiliere;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "numG")
    private List<Emp> empList;

    public Groupe() {
    }

    public Groupe(Integer numG) {
        this.numG = numG;
    }

    public Groupe(Integer numG, String nomG, int niveau, String nomFiliere) {
        this.numG = numG;
        this.nomG = nomG;
        this.niveau = niveau;
        this.nomFiliere = nomFiliere;
    }

    public Integer getNumG() {
        return numG;
    }

    public void setNumG(Integer numG) {
        this.numG = numG;
    }

    public String getNomG() {
        return nomG;
    }

    public void setNomG(String nomG) {
        this.nomG = nomG;
    }

    public int getNiveau() {
        return niveau;
    }

    public void setNiveau(int niveau) {
        this.niveau = niveau;
    }

    public String getNomFiliere() {
        return nomFiliere;
    }

    public void setNomFiliere(String nomFiliere) {
        this.nomFiliere = nomFiliere;
    }

    @XmlTransient
    public List<Emp> getEmpList() {
        return empList;
    }

    public void setEmpList(List<Emp> empList) {
        this.empList = empList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numG != null ? numG.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Groupe)) {
            return false;
        }
        Groupe other = (Groupe) object;
        if ((this.numG == null && other.numG != null) || (this.numG != null && !this.numG.equals(other.numG))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.swp.beans.Groupe[ numG=" + numG + " ]";
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
