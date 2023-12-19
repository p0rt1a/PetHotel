package com.alp.PetAcademy.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "HOTEL_APPOINTMENTS")
public class HotelAppointment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "is_cancelled")
    private boolean isCancelled = false;
    @ManyToOne
    @JoinColumn(name = "pet_id")
    @JsonBackReference
    private Pet pet;
    @OneToOne(mappedBy = "hotelAppointment", cascade = CascadeType.ALL)
    @JsonManagedReference
    private HotelRoom hotelRoom;
    @Column(name = "created_at")
    private Date createdAt = new Date();
    @Column(name = "appointment_date")
    private Date appointmentDate;
    @Column(name = "paid_price")
    private BigDecimal paidPrice;
}
