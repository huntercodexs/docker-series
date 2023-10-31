package com.huntercodexs.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "customers")
public class CustomerEntity {

    @Id
    private Long id;

    @Column
    private String name;

    @Column
    private String email;

    @Column
    private int age;

}
