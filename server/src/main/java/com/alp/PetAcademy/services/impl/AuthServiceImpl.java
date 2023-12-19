package com.alp.PetAcademy.services.impl;

import com.alp.PetAcademy.config.TokenConfig;
import com.alp.PetAcademy.repositories.IRoleRepository;
import com.alp.PetAcademy.repositories.IUserRepository;
import com.alp.PetAcademy.entities.Role;
import com.alp.PetAcademy.entities.User;
import com.alp.PetAcademy.models.auth.LoginModel;
import com.alp.PetAcademy.models.auth.RegisterModel;
import com.alp.PetAcademy.services.IAuthService;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jwt.JWTClaimsSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.*;

@Service
public class AuthServiceImpl implements IAuthService {
    private IUserRepository _userRepository;
    private IRoleRepository _roleRepository;
    private final TokenConfig _tokenConfig;

    @Autowired
    public AuthServiceImpl(IUserRepository userRepository, IRoleRepository roleRepository, TokenConfig tokenConfig)
    {
        this._userRepository = userRepository;
        this._roleRepository=roleRepository;
        this._tokenConfig = tokenConfig;
    }

    public void register(RegisterModel model) throws Exception
    {
        User user = _userRepository.findByEmail(model.email);

        if (user != null)
            throw new Exception("Email adresi zaten kullanımda!");

        Role role = _roleRepository.findByName("user");

        //TODO: Hash user password:
        user = User.builder()
                        .name(model.getName())
                        .surname(model.getSurname())
                        .email(model.getEmail())
                        .password(model.getPassword())
                        .role(role)
                        .createdAt(new Date())
                        .phoneNumber(model.getPhoneNumber())
                        .build();

        _userRepository.save(user);
    }

    public String login(LoginModel model) throws Exception
    {
        User user = _userRepository.findByEmailAndPassword(model.getEmail(), model.getPassword());

        if (user == null)
            throw new Exception("Kullanıcı adı ya da şifre hatalı!");

        JWSSigner signer = new MACSigner(generateRandomKey());

        JWTClaimsSet claimsSet = new JWTClaimsSet.Builder()
                .issuer(_tokenConfig.getIssuer())
                .subject(String.valueOf(user.getId()))
                .expirationTime(new Date(System.currentTimeMillis() + _tokenConfig.getExpirationTime()))
                .claim("name", user.getName())
                .claim("role", user.getRole().getName())
                .build();

        JWSObject jwsObject = new JWSObject(new JWSHeader(JWSAlgorithm.HS256), new Payload(String.valueOf(claimsSet)));
        jwsObject.sign(signer);

        return jwsObject.serialize();
    }

    private byte[] generateRandomKey() {
        byte[] keyBytes = new byte[32]; // 32 bytes for a 256-bit key
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.nextBytes(keyBytes);
        return keyBytes;
    }
}
