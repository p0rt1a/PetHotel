package com.alp.PetAcademy.models.pet.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PetsViewModel {
    private int id;
    //TODO: Return image
    private String name;
    private String brand;
    private String createdAt;
}
