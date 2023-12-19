package com.alp.PetAcademy.repositories;

import com.alp.PetAcademy.entities.Hotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.awt.print.Pageable;
import java.util.List;

@Repository
public interface IHotelRepository extends JpaRepository<Hotel, String> {
    List<Hotel> findByNameAndCity(String name, String city);
    List<Hotel> findByIsConfirmedTrue();
    List<Hotel> findByIsConfirmedFalse();
}
