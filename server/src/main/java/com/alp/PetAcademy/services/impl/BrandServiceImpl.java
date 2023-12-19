package com.alp.PetAcademy.services.impl;

import com.alp.PetAcademy.entities.Brand;
import com.alp.PetAcademy.models.brand.response.BrandsViewModel;
import com.alp.PetAcademy.repositories.IBrandRepository;
import com.alp.PetAcademy.services.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BrandServiceImpl implements IBrandService {
    private IBrandRepository _brandRepository;

    @Autowired
    public BrandServiceImpl(IBrandRepository brandRepository)
    {
        this._brandRepository = brandRepository;
    }

    public List<BrandsViewModel> getAll()
    {
        List<Brand> brands = _brandRepository.findAll();
        List<BrandsViewModel> vm = brands.stream().map(x -> {
            return BrandsViewModel.builder().id(x.getId()).name(x.getName()).build();
        }).collect(Collectors.toList());

        return vm;
    }
}
