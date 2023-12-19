package com.alp.PetAcademy.repositories;

import com.alp.PetAcademy.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IRoleRepository extends JpaRepository<Role, String> {
    Role findByName(String name);
}
