package com.ajneb97.AkzioDeportesSpring.controllers;

import com.ajneb97.AkzioDeportesSpring.model.CustomResponse;
import com.ajneb97.AkzioDeportesSpring.model.Sport;
import com.ajneb97.AkzioDeportesSpring.model.User;
import com.ajneb97.AkzioDeportesSpring.services.SportService;
import com.ajneb97.AkzioDeportesSpring.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(path = "api/v1/user")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService){
        this.userService = userService;
    }

    @GetMapping
    public List<User> getUsers(){
        return userService.getUsers();
    }

    @PostMapping
    public ResponseEntity<CustomResponse> addNewUser(@RequestBody User user){
        return userService.addUser(user);
    }

    @PostMapping("/addsport/{userId}/{sportId}")
    public void addSportForUser(@PathVariable(value = "userId") Long userId, @PathVariable(value = "sportId") Long sportId){
        userService.addSportForUser(userId,sportId);
    }

    @DeleteMapping("/deletesport/{userId}")
    public void deleteSport(@PathVariable(value = "userId") Long userId){
        userService.deleteUser(userId);
    }


}
