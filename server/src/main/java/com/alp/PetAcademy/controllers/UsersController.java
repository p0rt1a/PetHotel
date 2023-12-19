package com.alp.PetAcademy.controllers;

import com.alp.PetAcademy.models.pet.request.CreatePetModel;
import com.alp.PetAcademy.models.pet.response.PetsViewModel;
import com.alp.PetAcademy.services.IUserService;
import com.alp.PetAcademy.models.user.response.UserDetailViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UsersController {
    private IUserService _userService;

    @Autowired
    public UsersController(IUserService userService)
    {
        this._userService = userService;
    }

    @GetMapping("getUserInfo/{id}")
    public ResponseEntity<?> getUserInformation(@PathVariable String id)
    {
        /*
        try {
            var decodedJwt = SignedJWT.parse(token);
            var header = decodedJwt.getHeader().toString();
            var payload = decodedJwt.getPayload().toString();
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body("Token is not valid!");
        }
         */

        UserDetailViewModel user;

        try {
            user = _userService.getUserInfo(id);
        }
        catch (Exception ex)
        {
           return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok(user);
    }

    @GetMapping("/getUserPets/{id}")
    public ResponseEntity<?> getUserPets(@PathVariable String id)
    {
        List<PetsViewModel> result = new ArrayList<>();

        try {
            result = _userService.getUserPets(id);
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok(result);
    }

    @PostMapping("/createPet/{id}")
    public ResponseEntity<String> createPet(@RequestBody CreatePetModel model, @PathVariable String id)
    {
        try {
            _userService.CreatePet(model, id);
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok("Pet created successfully!");
    }
}
