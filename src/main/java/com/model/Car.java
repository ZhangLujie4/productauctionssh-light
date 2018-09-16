package com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import javax.persistence.*;

/**
 * @author DMZ
 * @description
 */

@Data
@AllArgsConstructor //全部参数的构造函数
@NoArgsConstructor //无参构造函数
@Entity
@Table(name = "Car")
@Component("Car")
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //自增id
    private Integer id;

    private String ddno;

    private String memberid;

    private String goodsid;

    private String maxprice;

    private String total;

    private String fkstatus;

    private String fhstatus;

    private String shstatus;

    private String shr;

    private String shtel;

    private String shaddr;

    private String saleid;

    private String thstatus;

}
