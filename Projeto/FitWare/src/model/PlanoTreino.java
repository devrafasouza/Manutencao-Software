package model;
// Generated 31/08/2021 16:33:37 by Hibernate Tools 4.3.1



/**
 * PlanoTreino generated by hbm2java
 */
public class PlanoTreino  implements java.io.Serializable {


     private Integer idPlanoTreino;
     private Cliente cliente;
     private Exercicio exercicio;
     private Treino treino;

    public PlanoTreino() {
    }

    public PlanoTreino(Cliente cliente, Exercicio exercicio, Treino treino) {
       this.cliente = cliente;
       this.exercicio = exercicio;
       this.treino = treino;
    }
   
    public Integer getIdPlanoTreino() {
        return this.idPlanoTreino;
    }
    
    public void setIdPlanoTreino(Integer idPlanoTreino) {
        this.idPlanoTreino = idPlanoTreino;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public Exercicio getExercicio() {
        return this.exercicio;
    }
    
    public void setExercicio(Exercicio exercicio) {
        this.exercicio = exercicio;
    }
    public Treino getTreino() {
        return this.treino;
    }
    
    public void setTreino(Treino treino) {
        this.treino = treino;
    }
    
    public String[] toRow(){
   
        return new String[]{
                treino.getNomeTreino(),
                exercicio.getNomeExercicio(),
                String.valueOf(exercicio.getQtdRepeticoes()),
                String.valueOf(exercicio.getQtdSeries()),
                exercicio.getObservacao()
        };
    }
    public String[] toRow1(){
   
        return new String[]{
                exercicio.getNomeExercicio(),
                String.valueOf(exercicio.getQtdSeries()),
                String.valueOf(exercicio.getQtdRepeticoes()),                
                exercicio.getObservacao()
        };
    }

    @Override
    public String toString() {
        return getTreino().getNomeTreino(); //To change body of generated methods, choose Tools | Templates.
    }
    
}


