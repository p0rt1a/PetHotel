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
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="USERS")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name= "id")
    private int id;
    @Nullable
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private Image avatar;
    @ManyToOne
    @JoinColumn(name = "role_id")
    @JsonBackReference
    private Role role;
    @Column(name = "name")
    private String name;
    @Column(name = "surname")
    private String surname;
    @Column(name = "email")
    private String email;
    @Nullable
    @Column(name = "refresh_token")
    private String refreshToken;
    @Nullable
    @Column(name = "refresh_token_expiration_date")
    private Date refreshTokenExpirationDate;
    @Column(name = "password")
    private String password;
    @Nullable
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "email_confirm_status")
    private boolean emailConfirmStatus = false;
    @Column(name = "created_at")
    private Date createdAt = new Date();
    @Nullable
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Pet> pets;
    @Column(name = "is_deleted")
    private boolean isDeleted = false;
    @Nullable
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private Hotel hotel;
}
