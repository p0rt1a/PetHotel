package com.alp.PetAcademy;
import com.alp.PetAcademy.config.TokenConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication(exclude={SecurityAutoConfiguration.class})
@EnableConfigurationProperties(TokenConfig.class)
public class PetAcademyApplication {

	public static void main(String[] args) {
		SpringApplication.run(PetAcademyApplication.class, args);
	}
}
