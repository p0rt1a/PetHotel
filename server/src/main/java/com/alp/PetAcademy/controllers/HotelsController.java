package com.alp.PetAcademy.controllers;

import com.alp.PetAcademy.config.KafkaProducerService;
import com.alp.PetAcademy.models.hotel.request.CreateHotelModel;
import com.alp.PetAcademy.models.hotel_appointment.request.CreateHotelAppointmentModel;
import com.alp.PetAcademy.models.hotelroom.request.CreateHotelRoomModel;
import com.alp.PetAcademy.services.IHotelService;
import com.alp.PetAcademy.models.hotel.response.HotelsViewModel;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/hotels")
public class HotelsController {
    private IHotelService _hotelService;
    private final KafkaProducerService _kafkaProducerService;

    @Autowired
    public HotelsController(IHotelService hotelService, KafkaProducerService kafkaProducerService)
    {
        this._hotelService = hotelService;
        this._kafkaProducerService = kafkaProducerService;
    }

    @GetMapping("/getAll")
    public ResponseEntity<?> getAll(@RequestParam(name = "page", required = false, defaultValue = "0")int page)
    {
        List<HotelsViewModel> result = new ArrayList<>();

        try {
            result =_hotelService.getAll(page);
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok(result);
    }

    @PostMapping("/create")
    public ResponseEntity<String> create(@RequestBody CreateHotelModel model)
    {
        try {
            _hotelService.create(model);
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok("Ekleme işlemi başarılı!");
    }

    @PostMapping("/createRoom/{id}")
    public ResponseEntity<String> createRoom(@PathVariable String id, @RequestBody CreateHotelRoomModel model)
    {
        try {
            _hotelService.createRoom(id, model);
        }
        catch (Exception ex)
        {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok("Ekleme işlemi başarılı!");
    }

    @PostMapping("/createAppointment")
    public ResponseEntity<String> createReservation(@Valid @RequestBody CreateHotelAppointmentModel model, BindingResult result) {
        if (result.hasErrors()) {
            List<String> errors = result.getAllErrors()
                    .stream()
                    .map(error -> error.getDefaultMessage())
                    .collect(Collectors.toList());

            return ResponseEntity.badRequest().body(errors.toString());
        }
        String response = "";
        try {
            response = _kafkaProducerService.createAppointment(model);
        }
        catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return ResponseEntity.ok(response);
    }
}
