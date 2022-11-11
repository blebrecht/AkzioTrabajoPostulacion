package com.ajneb97.AkzioDeportesSpring.configs;

import com.ajneb97.AkzioDeportesSpring.model.Sport;
import com.ajneb97.AkzioDeportesSpring.repositories.SportRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class SportConfig {

    @Bean
    CommandLineRunner commandLineRunner(SportRepository studentRepository){
        return args -> {
            List<Sport> sports = new ArrayList<Sport>();
            sports.add(new Sport("Futbol"));
            sports.add(new Sport("Basquetbol"));
            sports.add(new Sport("Tenis"));
            sports.add(new Sport("Badminton"));
            sports.add(new Sport("Natacion"));

            studentRepository.saveAll(sports);
        };
    }
}
