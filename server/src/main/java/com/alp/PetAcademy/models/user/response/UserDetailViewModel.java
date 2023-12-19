package com.alp.PetAcademy.models.user.response;

import com.alp.PetAcademy.models.pet.response.PetsViewModel;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class UserDetailViewModel {
    private String id;
    private String name;
    private String surname;
    private String email;
    private List<PetsViewModel> pets;
    private boolean emailConfirmStatus;
    private String phoneNumber;
    private String createdAt;
}
