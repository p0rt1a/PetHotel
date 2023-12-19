package com.alp.PetAcademy.services;

import com.alp.PetAcademy.models.pet.request.CreatePetModel;
import com.alp.PetAcademy.models.pet.response.PetsViewModel;
import com.alp.PetAcademy.models.user.response.UserDetailViewModel;

import java.util.List;

public interface IUserService {
    UserDetailViewModel getUserInfo(String id);
    List<PetsViewModel> getUserPets(String id);
    void CreatePet(CreatePetModel model, String id);
}
