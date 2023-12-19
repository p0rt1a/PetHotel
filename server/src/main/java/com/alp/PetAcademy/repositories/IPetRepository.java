package com.alp.PetAcademy.repositories;

import com.alp.PetAcademy.entities.Pet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPetRepository extends JpaRepository<Pet, String> {
    List<Pet> findByUserIdAndBrandIdAndIsDeletedFalse(int userId, int brandId);
}
