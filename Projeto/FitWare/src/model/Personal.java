package model;
// Generated 31/08/2021 16:33:37 by Hibernate Tools 4.3.1



/**
 * Personal generated by hbm2java
 */
public class Personal  implements java.io.Serializable {


     private String cpfPersonal;
     private String nomePersonal;
     private String turno;

    public Personal() {
    }

    public Personal(String cpfPersonal, String nomePersonal, String turno) {
       this.cpfPersonal = cpfPersonal;
       this.nomePersonal = nomePersonal;
       this.turno = turno;
    }
   
    public String getCpfPersonal() {
        return this.cpfPersonal;
    }
    
    public void setCpfPersonal(String cpfPersonal) {
        this.cpfPersonal = cpfPersonal;
    }
    public String getNomePersonal() {
        return this.nomePersonal;
    }
    
    public void setNomePersonal(String nomePersonal) {
        this.nomePersonal = nomePersonal;
    }
    public String getTurno() {
        return this.turno;
    }
    
    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String[] toRow(){
   
         return new String[]{
             cpfPersonal,
             nomePersonal,
             turno
             
      };
    }


}


