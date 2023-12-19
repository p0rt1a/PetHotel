package com.alp.PetAcademy.models.hotel_appointment.request;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class CreateHotelAppointmentModel {
    @NotNull(message = "RoomID can not be null!")
    private String roomId;
    @NotNull(message = "PetID can not be null!")
    private String petId;
    @FutureOrPresent(message = "AppointmentDate can not be in past!")
    private Date appointmentDate;
    @DecimalMin(value = "0.0", message = "Value can not be negative!")
    private BigDecimal paidPrice;
}
