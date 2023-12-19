package com.alp.PetAcademy.models.hotelroom.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CreateHotelRoomModel {
    private String title;
    private String description;
    private String brandId;
    private BigDecimal price;
}
