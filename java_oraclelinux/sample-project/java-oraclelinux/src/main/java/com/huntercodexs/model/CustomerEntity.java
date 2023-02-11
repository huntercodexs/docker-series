package com.huntercodexs.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "customers")
public class CustomerEntity {

    @Id
    @GeneratedValue(generator = "SEQ_CUSTOMER", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "SEQ_CUSTOMER", sequenceName = "SEQ_CUSTOMER", allocationSize = 1, initialValue = 1)
    private long id;

    @Column
    private String name;

    @Column
    private String email;

    @Column
    private int age;

}
