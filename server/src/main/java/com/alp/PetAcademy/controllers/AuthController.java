package com.alp.PetAcademy.controllers;

import com.alp.PetAcademy.services.IAuthService;
import com.alp.PetAcademy.models.auth.LoginModel;
import com.alp.PetAcademy.models.auth.RegisterModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
public class AuthController {
    private IAuthService _authService;

    @Autowired
    public AuthController(IAuthService authService)
    {
        this._authService = authService;
    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody RegisterModel model)
    {
        try {
            _authService.register(model);
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok("Register is successfull!");
    }

    @PostMapping("/connect-token")
    public ResponseEntity<String> login(@RequestBody LoginModel model)
    {
        String token;

        try {
            token = _authService.login(model);
        }
        catch(Exception ex) {

            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok(token);
    }
}
