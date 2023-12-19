package com.alp.PetAcademy.models.hotelroom.response;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

@Builder
@Data
public class HotelRoomsViewModel {
    private int id;
    private String title;
    private String description;
    private String brand;
    private BigDecimal price;
}
