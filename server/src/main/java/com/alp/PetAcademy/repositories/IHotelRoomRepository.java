package com.alp.PetAcademy.repositories;

import com.alp.PetAcademy.entities.HotelRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IHotelRoomRepository extends JpaRepository<HotelRoom, String> {
}
