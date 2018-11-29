/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
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
 * @author kanisorn
 */
@Entity
@Table(name = "HISTORY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "History.findAll", query = "SELECT h FROM History h")
    , @NamedQuery(name = "History.findByHistoryid", query = "SELECT h FROM History h WHERE h.historyid = :historyid")
    , @NamedQuery(name = "History.findByOrderdate", query = "SELECT h FROM History h WHERE h.orderdate = :orderdate")
    , @NamedQuery(name = "History.findByTotalprice", query = "SELECT h FROM History h WHERE h.totalprice = :totalprice")
    , @NamedQuery(name = "History.findByTime", query = "SELECT h FROM History h WHERE h.time = :time")
    , @NamedQuery(name = "History.findByTotalquantity", query = "SELECT h FROM History h WHERE h.totalquantity = :totalquantity")})
public class History implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "HISTORYID")
    private Integer historyid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDERDATE")
    @Temporal(TemporalType.DATE)
    private Date orderdate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "TOTALPRICE")
    private BigDecimal totalprice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date time;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TOTALQUANTITY")
    private int totalquantity;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "historyid")
    private List<Historydetail> historydetailList;
    @JoinColumn(name = "EMAIL", referencedColumnName = "EMAIL")
    @ManyToOne(optional = false)
    private Account email;

    public History() {
    }

    public History(Integer historyid) {
        this.historyid = historyid;
    }

    public History(Integer historyid, Date orderdate, BigDecimal totalprice, Date time, int totalquantity) {
        this.historyid = historyid;
        this.orderdate = orderdate;
        this.totalprice = totalprice;
        this.time = time;
        this.totalquantity = totalquantity;
    }

    public Integer getHistoryid() {
        return historyid;
    }

    public void setHistoryid(Integer historyid) {
        this.historyid = historyid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public BigDecimal getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(BigDecimal totalprice) {
        this.totalprice = totalprice;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getTotalquantity() {
        return totalquantity;
    }

    public void setTotalquantity(int totalquantity) {
        this.totalquantity = totalquantity;
    }

    @XmlTransient
    public List<Historydetail> getHistorydetailList() {
        return historydetailList;
    }

    public void setHistorydetailList(List<Historydetail> historydetailList) {
        this.historydetailList = historydetailList;
    }

    public Account getEmail() {
        return email;
    }

    public void setEmail(Account email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (historyid != null ? historyid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof History)) {
            return false;
        }
        History other = (History) object;
        if ((this.historyid == null && other.historyid != null) || (this.historyid != null && !this.historyid.equals(other.historyid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.History[ historyid=" + historyid + " ]";
    }
    
}
