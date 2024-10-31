package com.example.chuyentrang.controller;

import com.example.chuyentrang.model.Brand;
import com.example.chuyentrang.model.Clothes;
import com.example.chuyentrang.service.BrandService;
import com.example.chuyentrang.service.ClothesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RestController
@RequestMapping("/clothes")
public class ClothesController {

    private ClothesService clothesService;
    @Autowired
    private BrandService brandService;
    @Autowired
    public ClothesController(ClothesService clothesService) {
        this.clothesService = clothesService;
    }
    @PutMapping("/{id}")
    public ResponseEntity<Clothes> updateProduct(@PathVariable int id, @RequestBody Clothes product) {
        Clothes updatedProduct = clothesService.updateProduct(id, product);
        return new ResponseEntity<>(updatedProduct, HttpStatus.OK);
    }


    @PostMapping
    public Clothes createClothes(@RequestParam("name") String name,
                                 @RequestParam("material") String material,
                                 @RequestParam("detail") String detail,
                                 @RequestParam("content") String content,
                                 @RequestParam("price") Double price,
                                 @RequestParam("quantity") Integer quantity,
                                 @RequestParam("brandId") Integer brandId,
                                 @RequestParam("image") MultipartFile imageFile,
                                 @RequestParam("imagehover") MultipartFile imageFileHover) throws Exception {

        String folder = "src/main/resources/static/images/";

        if (imageFile.getSize() > 10485760 || imageFileHover.getSize() > 10485760) {
            throw new Exception("Kích thước tệp quá lớn");
        }

        String imageFileName = imageFile.getOriginalFilename();
        Path imagePath = Paths.get(folder + imageFileName);

        String imageHoverFileName = imageFileHover.getOriginalFilename();
        Path imageHoverPath = Paths.get(folder + imageHoverFileName);

        try {
            Files.write(imagePath, imageFile.getBytes());
            Files.write(imageHoverPath, imageFileHover.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            throw new Exception("Lỗi trong quá trình lưu hình ảnh: " + e.getMessage());
        }

        Brand brand = brandService.getBrand(brandId)
                .orElseThrow(() -> new IllegalArgumentException("Thương hiệu không tồn tại với ID: " + brandId));

        Clothes clothes = new Clothes();
        clothes.setName(name);
        clothes.setMaterial(material);
        clothes.setDetail(detail);
        clothes.setContent(content);
        clothes.setPrice(price);
        clothes.setQuantity(quantity);
        clothes.setImage(imageFileName);
        clothes.setImagehover(imageHoverFileName);
        clothes.setBrand(brand);

        return clothesService.saveClothes(clothes);
    }





    @GetMapping
    public List<Clothes> getAllClothes() {
        return clothesService.getAllClothes();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Clothes> getClothesById(@PathVariable int id) {
        Clothes clothes = clothesService.getClothesById(id);
        if (clothes != null) {
            return ResponseEntity.ok(clothes);
        }
        return ResponseEntity.notFound().build();
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteClothes(@PathVariable int id) {
        clothesService.deleteClothes(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/brand/{brandId}")
    public ResponseEntity<List<Clothes>> getClothesByBrandId(@PathVariable int brandId) {
        List<Clothes> clothesList = clothesService.getClothesByBrandId(brandId);
        return ResponseEntity.ok(clothesList);
    }
}
