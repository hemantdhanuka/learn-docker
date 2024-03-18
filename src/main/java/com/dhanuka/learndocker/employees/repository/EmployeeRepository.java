package com.dhanuka.learndocker.employees.repository;

import com.dhanuka.learndocker.employees.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;


public interface EmployeeRepository extends JpaRepository<Employee, Long>{

}
