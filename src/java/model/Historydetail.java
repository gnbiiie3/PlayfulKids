/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kanisorn
 */
@Entity
@Table(name = "HISTORYDETAIL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Historydetail.findAll", query = "SELECT h FROM Historydetail h")
    , @NamedQuery(name = "Historydetail.findByProductbuyid", query = "SELECT h FROM Historydetail h WHERE h.productbuyid = :productbuyid")
    , @NamedQuery(name = "Historydetail.findByProductquantity", query = "SELECT h FROM Historydetail h WHERE h.productquantity = :productquantity")
    , @NamedQuery(name = "Historydetail.findByProductprice", query = "SELECT h FROM Historydetail h WHERE h.productprice = :productprice")})
public class Historydetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PRODUCTBUYID")
    private Integer productbuyid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTQUANTITY")
    private int productquantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTPRICE")
    private BigDecimal productprice;
    @JoinColumn(name = "HISTORYID", referencedColumnName = "HISTORYID")
    @ManyToOne(optional = false)
    private History historyid;
    @JoinColumn(name = "PRODUCTID", referencedColumnName = "PRODUCTID")
    @ManyToOne(optional = false)
    private Product productid;

    public Historydetail() {
    }

    public Historydetail(Integer productbuyid) {
        this.productbuyid = productbuyid;
    }

    public Historydetail(Integer productbuyid, int productquantity, BigDecimal productprice) {
        this.productbuyid = productbuyid;
        this.productquantity = productquantity;
        this.productprice = productprice;
    }

    public Integer getProductbuyid() {
        return productbuyid;
    }

    public void setProductbuyid(Integer productbuyid) {
        this.productbuyid = productbuyid;
    }

    public int getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(int productquantity) {
        this.productquantity = productquantity;
    }

    public BigDecimal getProductprice() {
        return productprice;
    }

    public void setProductprice(BigDecimal productprice) {
        this.productprice = productprice;
    }

    public History getHistoryid() {
        return historyid;
    }

    public void setHistoryid(History historyid) {
        this.historyid = historyid;
    }

    public Product getProductid() {
        return productid;
    }

    public void setProductid(Product productid) {
        this.productid = productid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productbuyid != null ? productbuyid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Historydetail)) {
            return false;
        }
        Historydetail other = (Historydetail) object;
        if ((this.productbuyid == null && other.productbuyid != null) || (this.productbuyid != null && !this.productbuyid.equals(other.productbuyid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Historydetail[ productbuyid=" + productbuyid + " ]";
    }
    
}
