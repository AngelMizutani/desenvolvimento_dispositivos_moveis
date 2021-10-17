package com.patine.patinerestapi.database;

import com.patine.patinerestapi.entidade.Exercicio;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RepositorioExercicio extends JpaRepository<Exercicio, Long> {
    
}
