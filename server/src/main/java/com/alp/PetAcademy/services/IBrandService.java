package com.alp.PetAcademy.services;

import com.alp.PetAcademy.models.brand.response.BrandsViewModel;

import java.util.List;

public interface IBrandService {
    List<BrandsViewModel> getAll();
}
