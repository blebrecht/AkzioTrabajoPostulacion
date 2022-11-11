package com.ajneb97.AkzioDeportesSpring.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table
public class User {
    @Id
    @SequenceGenerator(
            name = "user_sequence",
            sequenceName = "user_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "user_sequence"
    )
    private Long id;
    private String email;
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            })
    @JoinTable(name = "user_sports",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "sport_id") })
    private Set<Sport> sports;

    public User() {
    }

    public User(String email) {
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<Sport> getSports() {
        return sports;
    }

    public void addSport(Sport sport){
        this.sports.add(sport);
        sport.getUsers().add(this);
    }

    public void removeSport(long sportId) {
        Sport sport = this.sports.stream().filter(t -> t.getId() == sportId).findFirst().orElse(null);
        if (sport != null) {
            this.sports.remove(sport);
            sport.getUsers().remove(this);
        }
    }
}
