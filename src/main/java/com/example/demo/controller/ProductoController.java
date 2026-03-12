package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Producto;
import java.util.List;

@RestController
@RequestMapping("/api/v1/productos")
public class ProductoController {

    @GetMapping
    public List<Producto> getAllProductos() {
        Producto producto = new Producto();
        producto.setId(1L);
        producto.setNombre("Producto de ejemplo");
        return List.of(producto);
    }
    
}
