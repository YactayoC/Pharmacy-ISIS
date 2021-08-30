package com.proyect.integrator.repository;

import java.util.List;

public interface Search<T> {
    List<T> search(String text);
}
