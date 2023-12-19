package com.alp.PetAcademy.repositories;

import com.alp.PetAcademy.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserRepository extends JpaRepository<User, String> {
    User findByEmailAndPassword(String email, String password);
    User findByEmail(String email);
    User findByIdAndIsDeletedFalse(Integer id);
}
