package com.ajneb97.AkzioDeportesSpring.repositories;

import com.ajneb97.AkzioDeportesSpring.model.Sport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SportRepository extends JpaRepository<Sport, Long> {

}
