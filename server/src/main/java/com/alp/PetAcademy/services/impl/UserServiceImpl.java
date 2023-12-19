package com.alp.PetAcademy.services.impl;

import com.alp.PetAcademy.entities.Brand;
import com.alp.PetAcademy.entities.Pet;
import com.alp.PetAcademy.models.pet.request.CreatePetModel;
import com.alp.PetAcademy.repositories.IBrandRepository;
import com.alp.PetAcademy.repositories.IPetRepository;
import com.alp.PetAcademy.repositories.IUserRepository;
import com.alp.PetAcademy.entities.User;
import com.alp.PetAcademy.models.pet.response.PetsViewModel;
import com.alp.PetAcademy.models.user.response.UserDetailViewModel;
import com.alp.PetAcademy.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements IUserService {
    private IUserRepository _userRepository;
    private IBrandRepository _brandRepository;
    private IPetRepository _petRepository;

    @Autowired
    public UserServiceImpl(IUserRepository userRepository, IBrandRepository brandRepository, IPetRepository petRepository)
    {
        this._userRepository = userRepository;
        this._brandRepository = brandRepository;
        this._petRepository = petRepository;
    }

    public UserDetailViewModel getUserInfo(String id)
    {
        User user = _userRepository.getReferenceById(id);

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        UserDetailViewModel vm = UserDetailViewModel.builder()
                .id(String.valueOf(user.getId()))
                .pets(user.getPets().stream().map(x ->
                { return PetsViewModel.builder()
                        .id(x.getId())
                        .name(x.getName())
                        .createdAt(dateFormat.format(x.getCreatedAt()))
                        .brand(x.getBrand().getName())
                        .build();
                }).collect(Collectors.toList()))
                .name(user.getName())
                .surname(user.getSurname())
                .email(user.getEmail())
                .phoneNumber(user.getPhoneNumber())
                .createdAt(dateFormat.format(user.getCreatedAt()))
                .build();

        return vm;
    }

    public List<PetsViewModel> getUserPets(String id) {
        User user = _userRepository.getReferenceById(id);

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        List<PetsViewModel> vm = user.getPets().stream().map(x -> {
            return PetsViewModel.builder()
                    .id(x.getId())
                    .name(x.getName())
                    .brand(x.getBrand().getName())
                    .createdAt(dateFormat.format(x.getCreatedAt()))
                    .build();
        }).collect(Collectors.toList());

        return vm;
    }

    public void CreatePet(CreatePetModel model, String id) {
        User user = _userRepository.getReferenceById(id);
        Brand brand = _brandRepository.getReferenceById(model.getBrandId());
        Pet pet = Pet.builder()
                .name(model.getName())
                .brand(brand)
                .user(user)
                .createdAt(new Date())
                .build();

        _petRepository.save(pet);
    }
}
