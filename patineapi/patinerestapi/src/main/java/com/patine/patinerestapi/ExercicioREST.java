package com.patine.patinerestapi;

import java.util.List;

import com.patine.patinerestapi.database.RepositorioExercicio;
import com.patine.patinerestapi.entidade.Exercicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/exercicio")
public class ExercicioREST {
    
    @Autowired
    private RepositorioExercicio repositorio;

    @GetMapping
    public List<Exercicio> listar(){
        return repositorio.findAll();
    }

    @PostMapping
    public void salvar(@RequestBody Exercicio exercicio){
        repositorio.save(exercicio);
    }

    @PutMapping
    public void alterar(@RequestBody Exercicio exercicio){
        if(exercicio.getId() > 0){
            repositorio.save(exercicio);
        }
    }

    @DeleteMapping("/{id}")
    public void excluir(@PathVariable Long id){
        repositorio.deleteById(id);
    }
}
