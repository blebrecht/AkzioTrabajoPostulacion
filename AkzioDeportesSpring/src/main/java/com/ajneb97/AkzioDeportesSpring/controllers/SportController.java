package com.ajneb97.AkzioDeportesSpring.controllers;

import com.ajneb97.AkzioDeportesSpring.model.Sport;
import com.ajneb97.AkzioDeportesSpring.model.User;
import com.ajneb97.AkzioDeportesSpring.services.SportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/sports")
public class SportController {
    private final SportService sportService;

    @Autowired
    public SportController(SportService sportService){
        this.sportService = sportService;
    }

    @GetMapping
    public List<Sport> getSports(){
        return sportService.getSports();
    }


}
