package com.juniormiqueletti.moneyapp.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.juniormiqueletti.moneyapp.event.ResourceCreatedEvent;
import com.juniormiqueletti.moneyapp.model.Person;
import com.juniormiqueletti.moneyapp.repository.PersonRepository;
import com.juniormiqueletti.moneyapp.service.PersonService;

@RestController
@RequestMapping("/person")
public class PersonController {

	@Autowired
	private PersonRepository repo;

	@Autowired
	private PersonService service;

	@Autowired
	private ApplicationEventPublisher publisher;

	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_SEARCH_PERSON')")
	public Page<Person> find(@RequestParam(required = false, defaultValue = "%") String name, Pageable pageable) {

		Page<Person> people = repo.findByNameIgnoreCaseContaining(name, pageable);
		return people;
	}

	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasAuthority('ROLE_CREATE_PERSON')")
	public ResponseEntity<Person> create(@Valid @RequestBody Person person, HttpServletResponse response) {

		Person created = repo.save(person);

		publisher.publishEvent(new ResourceCreatedEvent(this, response, created.getId()));

		return ResponseEntity.status(HttpStatus.CREATED).body(created);
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_SEARCH_PERSON')")
	public ResponseEntity<Person> findById(@PathVariable Long id) {

		Person person = repo.findOne(id);

		if (person == null)
			return ResponseEntity.notFound().build();
		else
			return ResponseEntity.ok(person);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_SEARCH_PERSON')")
	public void delete(@PathVariable Long id) {
		
		repo.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_UPDATE_PERSON')")
	public ResponseEntity<Person> update(@PathVariable Long id, @Valid @RequestBody Person person){

		Person savedPerson = service.update(id, person);
		return ResponseEntity.ok(savedPerson);
	}
	
	@PutMapping("/{id}/active")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_UPDATE_PERSON')")
	public void updatePropertyActive(@PathVariable Long id,@RequestBody Boolean active) {
		service.updatePropertyActive(id, active);
	}
}
