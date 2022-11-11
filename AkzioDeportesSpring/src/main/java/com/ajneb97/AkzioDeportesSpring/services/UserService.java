package com.ajneb97.AkzioDeportesSpring.services;

import com.ajneb97.AkzioDeportesSpring.model.CustomResponse;
import com.ajneb97.AkzioDeportesSpring.model.Sport;
import com.ajneb97.AkzioDeportesSpring.model.User;
import com.ajneb97.AkzioDeportesSpring.repositories.SportRepository;
import com.ajneb97.AkzioDeportesSpring.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final SportRepository sportRepository;

    @Autowired
    public UserService(UserRepository userRepository,SportRepository sportRepository) {
        this.userRepository = userRepository;
        this.sportRepository = sportRepository;
    }

    public List<User> getUsers(){
        return userRepository.findAll();
    }

    public ResponseEntity<CustomResponse> addUser(User user){
        if(userRepository.findUserByEmail(user.getEmail()).isPresent()){
            CustomResponse response = new CustomResponse(HttpStatus.CONFLICT, "email_taken");
            return new ResponseEntity<>(response,response.getHttpStatus());
        }

        userRepository.save(user);
        CustomResponse response = new CustomResponse(HttpStatus.OK,user.getId()+"");
        return new ResponseEntity<>(response, response.getHttpStatus());
    }

    public void addSportForUser(Long userId, Long sportId){
        Optional<User> userOptional = userRepository.findById(userId);
        if(!userOptional.isPresent()){
            throw new IllegalStateException("user doesn't exists");
        }

        Optional<Sport> sportOptional = sportRepository.findById(sportId);
        if(!sportOptional.isPresent()){
            throw new IllegalStateException("sport doesn't exists");
        }

        User user = userOptional.get();
        Sport sport = sportOptional.get();

        user.addSport(sport);
        userRepository.save(user);
    }

    public void deleteUser(Long userId){
        Optional<User> userOptional = userRepository.findById(userId);
        if(!userOptional.isPresent()){
            throw new IllegalStateException("user doesn't exists");
        }

        userRepository.deleteById(userId);
    }
}
