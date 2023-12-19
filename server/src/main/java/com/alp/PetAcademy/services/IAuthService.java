package com.alp.PetAcademy.services;

import com.alp.PetAcademy.models.auth.LoginModel;
import com.alp.PetAcademy.models.auth.RegisterModel;

public interface IAuthService {
    void register(RegisterModel model) throws Exception;
    String login(LoginModel model) throws Exception;
}
