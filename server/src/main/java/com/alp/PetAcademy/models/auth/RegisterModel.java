package com.alp.PetAcademy.models.auth;

import lombok.Data;

@Data
public class RegisterModel {
    public String name;
    public String surname;
    public String email;
    public String password;
    public String phoneNumber;
    public String city;
    public String country;
    public String roleId;
}
