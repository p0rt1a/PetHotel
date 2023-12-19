package com.alp.PetAcademy.config;

import com.alp.PetAcademy.models.hotel_appointment.request.CreateHotelAppointmentModel;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class KafkaProducerService {
    private final KafkaTemplate<String, Object> kafkaTemplate;

    public KafkaProducerService(KafkaTemplate<String, Object> kafkaTemplate)
    {
        this.kafkaTemplate = kafkaTemplate;
    }

    public String createAppointment(CreateHotelAppointmentModel model) {
        kafkaTemplate.send("createAppointment", model);

        return "Rezervasyon işleme alındı!";
    }
}
