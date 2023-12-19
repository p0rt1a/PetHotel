package com.alp.PetAcademy.repositories;

import com.alp.PetAcademy.entities.HotelAppointment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IHotelAppointmentRepository extends JpaRepository<HotelAppointment, String> {
}
