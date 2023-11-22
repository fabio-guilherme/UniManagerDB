package pt.iade.unimanagerdb.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="classes")
public class Unit {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="cla_id")    private int id;
    @Column(name="cla_name")  private String name;
    @Column(name="cla_credits") private int credits;
    public Unit() {}
    public int getId() { return id; }
    public String getName() {
        return name;
    }
    public int getCredits() {
        return credits;
    }
    
}
