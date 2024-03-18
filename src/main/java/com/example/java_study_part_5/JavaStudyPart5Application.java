package com.example.java_study_part_5;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.example.java_study_part_5.controllers.ProductController;
import com.example.java_study_part_5.controllers.RegisterController;
import com.example.java_study_part_5.controllers.ControllerDefaultAdvice;

@SpringBootApplication
public class JavaStudyPart5Application {

    public static void main(String[] args) {
        SpringApplication.run(JavaStudyPart5Application.class, args);
    }

}
