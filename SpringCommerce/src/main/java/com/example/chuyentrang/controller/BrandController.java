package com.example.chuyentrang.controller;

import com.example.chuyentrang.model.Brand;
import com.example.chuyentrang.service.BrandService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/brands")
public class BrandController {
    private final BrandService brandService;

    public BrandController(BrandService brandService) {
        this.brandService = brandService;
    }
    @PostMapping
    public ResponseEntity<String> addBrand(@RequestBody Brand brand) {
        String response = brandService.addBrand(brand);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Brand> getBrand(@PathVariable int id) {
        Optional<Brand> brand = brandService.getBrand(id);
        return brand.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    @GetMapping
    public ResponseEntity<List<Brand>> getAllBrands() {
        List<Brand> brands = brandService.getAllBrand();
        return ResponseEntity.ok(brands);
    }

    @PutMapping("/{id}")
    public ResponseEntity<String> updateBrand(@PathVariable int id, @RequestBody String newName) {
        String response = brandService.updateBrand(newName, id);
        if (response.equals("Updated")) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> removeBrand(@PathVariable int id) {
        String response = brandService.removeBrand(id);
        if (response.equals("Deleted")) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
}
