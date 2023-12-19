package com.alp.PetAcademy.controllers;

import com.alp.PetAcademy.models.brand.response.BrandsViewModel;
import com.alp.PetAcademy.services.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/brands")
public class BrandsController {
    private IBrandService _brandService;

    @Autowired
    public BrandsController(IBrandService brandService)
    {
        this._brandService = brandService;
    }

    @GetMapping("/getAll")
    public ResponseEntity<?> getAll()
    {
        List<BrandsViewModel> brands;

        try {
            brands = _brandService.getAll();
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok(brands);
    }
}
