package com.alp.PetAcademy.services.impl;

import com.alp.PetAcademy.entities.*;
import com.alp.PetAcademy.models.hotel_appointment.request.CreateHotelAppointmentModel;
import com.alp.PetAcademy.models.hotelroom.request.CreateHotelRoomModel;
import com.alp.PetAcademy.models.hotelroom.response.HotelRoomsViewModel;
import com.alp.PetAcademy.repositories.*;
import com.alp.PetAcademy.models.hotel.request.CreateHotelModel;
import com.alp.PetAcademy.models.hotel.response.HotelsViewModel;
import com.alp.PetAcademy.services.IHotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class HotelServiceImpl implements IHotelService {
    private final IHotelRepository _hotelRepository;
    private final IBrandRepository _brandRepository;
    private final IUserRepository _userRepository;
    private final IHotelRoomRepository _hotelRoomRepository;
    private final IPetRepository _petRepository;
    private final IHotelAppointmentRepository _hotelAppointmentRepository;

    @Autowired
    public HotelServiceImpl(IHotelRepository hotelRepository, IBrandRepository brandRepository, IUserRepository userRepository, IHotelRoomRepository hotelRoomRepository, IPetRepository petRepository, IHotelAppointmentRepository hotelAppointmentRepository)
    {
        this._hotelRepository = hotelRepository;
        this._brandRepository = brandRepository;
        this._userRepository = userRepository;
        this._hotelRoomRepository =hotelRoomRepository;
        this._petRepository = petRepository;
        this._hotelAppointmentRepository = hotelAppointmentRepository;
    }

    public List<HotelsViewModel> getAll(int page) {
        Page<Hotel> hotels = _hotelRepository.findAll(PageRequest.of(page, 5));

        List<HotelsViewModel> vm = hotels.stream().map(x -> {
            return HotelsViewModel.builder()
                    .id(x.getId())
                    .name(x.getName())
                    .brands(x.getBrands().stream().map(brand -> {return brand.getName();}).collect(Collectors.toList()))
                    .rooms(x.getRooms().stream().map(room -> {
                        return HotelRoomsViewModel.builder()
                                .id(room.getId())
                                .title(room.getTitle())
                                .description(room.getDescription())
                                .brand(room.getBrand().getName())
                                .price(room.getPrice())
                                .build();
                    }).collect(Collectors.toList()))
                    .city(x.getCity())
                    .district(x.getDistrict())
                    .description(x.getDescription())
                    .email(x.getEmail())
                    .phoneNumber(x.getPhoneNumber())
                    .rate(4.2)
                    .rateCount(13)
                    .build();
        }).collect(Collectors.toList());

        return vm;
    }

    public void create(CreateHotelModel model) {
        User user = _userRepository.getReferenceById(model.userId);

        List<Brand> brands = model.getBrandIds().stream().map(x -> {
            return _brandRepository.getReferenceById(x);
        }).collect(Collectors.toList());
        Hotel hotel = Hotel.builder()
                .name(model.getName())
                .user(user)
                .brands(brands)
                .address(model.getAddress())
                .taxNumber(model.getTaxNumber())
                .createdAt(new Date())
                .taxAdministration(model.getTaxAdministration())
                .city(model.getCity())
                .district(model.getDistrict())
                .phoneNumber(model.getPhoneNumber())
                .email(model.getEmail())
                .description(model.getDescription())
                .build();

        _hotelRepository.save(hotel);
    }

    public void createRoom(String id, CreateHotelRoomModel model)
    {
        Hotel hotel = _hotelRepository.getReferenceById(id);

        Brand brand = _brandRepository.getReferenceById(model.getBrandId());

        HotelRoom room = HotelRoom.builder()
                .hotel(hotel)
                .brand(brand)
                .title(model.getTitle())
                .description(model.getDescription())
                .price(model.getPrice())
                .build();

        _hotelRoomRepository.save(room);
    }

    public void createReservation(CreateHotelAppointmentModel model) {
        HotelRoom room = _hotelRoomRepository.getReferenceById(model.getRoomId());

        Pet pet = _petRepository.getReferenceById(model.getPetId());

        HotelAppointment appointment = HotelAppointment.builder()
                .createdAt(new Date())
                .appointmentDate(model.getAppointmentDate())
                .pet(pet)
                .hotelRoom(room)
                .paidPrice(model.getPaidPrice())
                .build();

        _hotelAppointmentRepository.save(appointment);
    }
}
