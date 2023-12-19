package com.alp.PetAcademy.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "PETS")
public class Pet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Nullable
    @OneToOne(mappedBy = "pet", cascade = CascadeType.ALL)
    @JsonManagedReference
    private Image avatar;
    @Column(name = "name")
    private String name;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    @JsonBackReference
    private Brand brand;
    @ManyToOne
    @JoinColumn(name= "user_id")
    @JsonBackReference
    private User user;
    @Column(name = "is_deleted")
    private boolean isDeleted = false;
    @Column(name = "created_at")
    private Date createdAt = new Date();
    @Nullable
    @OneToMany(mappedBy = "pet", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<HotelAppointment> hotelAppointments;
}
