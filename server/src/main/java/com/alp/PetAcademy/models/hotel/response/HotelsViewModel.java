package com.alp.PetAcademy.models.hotel.response;

import com.alp.PetAcademy.entities.HotelRoom;
import com.alp.PetAcademy.models.hotelroom.response.HotelRoomsViewModel;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class HotelsViewModel {
    private int id;
    private String name;
    private List<String> brands;
    private List<HotelRoomsViewModel> rooms;
    private String city;
    private String district;
    private String description;
    private String email;
    private String phoneNumber;
    private double rate;
    private int rateCount;
    //TODO: Send images
    //TODO: Add comments
}
