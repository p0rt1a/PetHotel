package com.alp.PetAcademy.models.hotel.request;

import lombok.Data;

import java.util.List;

@Data
public class CreateHotelModel {
    public String name;
    public String userId;
    public List<String> brandIds;
    public String address;
    public String taxNumber;
    public String taxAdministration;
    public String city;
    public String district;
    public String phoneNumber;
    public String email;
    public String description;
}
