package model;
// Generated 31/08/2021 16:33:37 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Pagamento generated by hbm2java
 */
public class Pagamento  implements java.io.Serializable {


     private Integer idPagamento;
     private Cliente cliente;
     private Date dataPagamento;

    public Pagamento() {
    }

    public Pagamento(Cliente cliente, Date dataPagamento) {
       this.cliente = cliente;
       this.dataPagamento = dataPagamento;
    }
   
    public Integer getIdPagamento() {
        return this.idPagamento;
    }
    
    public void setIdPagamento(Integer idPagamento) {
        this.idPagamento = idPagamento;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public Date getDataPagamento() {
        return this.dataPagamento;
    }
    
    public void setDataPagamento(Date dataPagamento) {
        this.dataPagamento = dataPagamento;
    }




}

