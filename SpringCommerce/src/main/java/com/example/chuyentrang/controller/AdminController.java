package com.example.chuyentrang.controller;

import com.example.chuyentrang.model.*;
import com.example.chuyentrang.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller()
public class AdminController {
    @Autowired
    private final BrandService brandService;


    @Autowired
    private final ColorSerivce colorSerivce;

    @Autowired
    private final SizeService sizeService;

    @Autowired
    private final OrderService orderService;


    @Autowired
    private final ProductService productService;

    @Autowired
    private final EmailService emailService;

    @Autowired
    private final ClothesService clothesService;

    public AdminController(BrandService brandService, ColorSerivce colorSerivce, SizeService sizeService, OrderService orderService, ProductService productService, EmailService emailService, ClothesService clothesService) {
        this.brandService = brandService;
        this.colorSerivce = colorSerivce;
        this.sizeService = sizeService;
        this.orderService = orderService;
        this.productService = productService;
        this.emailService = emailService;
        this.clothesService = clothesService;
    }


    @ModelAttribute
    public void addCommonAttributes(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String email = authentication.getName();
            model.addAttribute("email", email);
        }
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        return "admin";
    }

    @GetMapping("/loaisanpham")
    public String admin_brand(Model model) {
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("list_brand", brands);
        return "admin_brand";
    }

    @GetMapping("/sanpham")
    public String sanpham(Model model) {
        List<Clothes> clothes = clothesService.getAllClothes();
        model.addAttribute("list_clothes", clothes);

        return "admin_clothes";
    }

    @GetMapping("/mausac")
    public String mausac(Model model) {
        List<Color> clothes = colorSerivce.getAllColor();
        model.addAttribute("list_color", clothes);
        return "admin_color";
    }

    @GetMapping("/kichco")
    public String kichco(Model model) {
        List<Size> clothes = sizeService.getAll();
        model.addAttribute("list_size", clothes);
        return "admin_size";
    }

    @GetMapping("/donhang")
    public String donhang(Model model) {
        List<Order> clothes1 = orderService.chuagiao();
        List<Order> clothes2 = orderService.dagiao();
        model.addAttribute("list_order", clothes1);
        model.addAttribute("list_order_dagiao", clothes2);
        return "admin_donhang";
    }

    @PutMapping("/phe_duyet/{id}")
    public String approveOrder(@PathVariable("id") int id) {
        Order updatedOrder = orderService.approveOrder(id);

        String email = updatedOrder.getEmail();
        String name = updatedOrder.getName();

        String subject = "Xác nhận đơn hàng từ NCK SHOP";
        String body = "<h1>Thông báo đơn hàng</h1>" +
                "<p>Chào <strong>" + name + "</strong>,</p>" +
                "<p>Chúng tôi vui mừng thông báo rằng đơn hàng của bạn đã được duyệt và hiện đang trong quá trình giao hàng.</p>" +
                "<p>Vui lòng đợi trong khoảng <strong>3-5 ngày</strong> để nhận hàng. Chúng tôi rất cảm ơn sự kiên nhẫn của bạn!</p>" +
                "<p>Nếu bạn có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ với chúng tôi qua email này hoặc gọi đến số hotline của chúng tôi.</p>" +
                "<p>Cảm ơn bạn đã chọn NCK SHOP!</p>" +
                "<p>Trân trọng,</p>" +
                "<p>Đội ngũ NCK SHOP</p>";

        emailService.sendInvoiceEmail(email, subject, body);

        return "admin_donhang";
    }


    @GetMapping("/xem_donhang/{id}")
    public String viewOrder(@PathVariable("id") int id, Model model) {
        List<Product> products = productService.getProductsByOder(id);
        model.addAttribute("order", products);
        return "chitiet_donhang";
    }


    @DeleteMapping("/xoa_size/{id}")
    public String xoaSize(@PathVariable("id") int id) {
        sizeService.remove(id);
        return "admin_size";
    }

    @DeleteMapping("/xoa_color/{id}")
    public String xoa_color(@PathVariable("id") int id) {
        colorSerivce.removeColor(id);
        return "admin_color";
    }

    @DeleteMapping("/xoa_clothes/{id}")
    public String xoa_clothes(@PathVariable("id") int id) {
        clothesService.deleteClothes(id);
        return "admin_clothes";
    }

    @DeleteMapping("/xoa_brand/{id}")
    public String xoa_brand(@PathVariable("id") int id) {
        brandService.removeBrand(id);
        return "admin_brand";
    }


    @GetMapping("/sua/{id}")
    public String sua(@PathVariable("id") int id, Model model) {
        Clothes clothes = clothesService.getClothesById(id);
        model.addAttribute("product", clothes);
        return "admin_clothes_sua";
    }

}
