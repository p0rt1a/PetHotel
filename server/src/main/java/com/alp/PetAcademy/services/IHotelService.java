package com.alp.PetAcademy.services;

import com.alp.PetAcademy.models.hotel.request.CreateHotelModel;
import com.alp.PetAcademy.models.hotel.response.HotelsViewModel;
import com.alp.PetAcademy.models.hotel_appointment.request.CreateHotelAppointmentModel;
import com.alp.PetAcademy.models.hotelroom.request.CreateHotelRoomModel;

import java.util.List;

public interface IHotelService {
    //TODO: Use filtered get all method instead
    List<HotelsViewModel> getAll(int page);
    void create(CreateHotelModel model);
    void createRoom(String id, CreateHotelRoomModel model);
    void createReservation(CreateHotelAppointmentModel model);
}
