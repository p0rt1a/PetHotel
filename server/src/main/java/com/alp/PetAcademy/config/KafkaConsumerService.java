package com.alp.PetAcademy.config;

import com.alp.PetAcademy.models.hotel_appointment.request.CreateHotelAppointmentModel;
import com.alp.PetAcademy.repositories.IHotelAppointmentRepository;
import com.alp.PetAcademy.services.IHotelService;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumerService {
    private final IHotelService _hotelService;

    public KafkaConsumerService(IHotelService hotelService) {
        this._hotelService = hotelService;
    }

    @KafkaListener(topics = "createAppointment")
    public void createAppointment(CreateHotelAppointmentModel model) {
        _hotelService.createReservation(model);
    }
}
