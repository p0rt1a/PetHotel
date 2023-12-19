package com.alp.PetAcademy.repositories;

import com.alp.PetAcademy.entities.Brand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IBrandRepository extends JpaRepository<Brand, String> {
}
