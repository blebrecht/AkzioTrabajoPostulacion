package com.ajneb97.AkzioDeportesSpring.services;

import com.ajneb97.AkzioDeportesSpring.model.Sport;
import com.ajneb97.AkzioDeportesSpring.repositories.SportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SportService {
    private final SportRepository sportRepository;

    @Autowired
    public SportService(SportRepository sportRepository) {
        this.sportRepository = sportRepository;
    }

    public List<Sport> getSports(){
        return sportRepository.findAll();
    }


}
