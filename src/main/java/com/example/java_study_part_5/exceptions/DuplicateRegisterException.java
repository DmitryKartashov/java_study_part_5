package com.example.java_study_part_5.exceptions;

import lombok.Getter;

@Getter
public class DuplicateRegisterException extends RuntimeException{
    private final String errorMsg;

    public DuplicateRegisterException(String error) {
        this.errorMsg = error;
    }
}