package com.example.chuyentrang.controller;

import com.example.chuyentrang.model.*;
import com.example.chuyentrang.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller()
public class HomeController {
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

    public HomeController(BrandService brandService, ColorSerivce colorSerivce, SizeService sizeService, OrderService orderService, ProductService productService, EmailService emailService) {
        this.brandService = brandService;
        this.colorSerivce = colorSerivce;
        this.sizeService = sizeService;
        this.orderService = orderService;
        this.productService = productService;
        this.emailService = emailService;
    }


    @GetMapping("/payment")
    public String pay() {
        return "invoice";
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


    @GetMapping("/")
    public String home(
            Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "asc") String sortOrder,
            @RequestParam(defaultValue = "") String priceRange
    ) {
        int brandId = 1;
        int pageSize = 4;
        Pageable pageable;

        if (sortOrder.equals("asc")) {
            pageable = PageRequest.of(page, pageSize, Sort.by("price").ascending());
        } else {
            pageable = PageRequest.of(page, pageSize, Sort.by("price").descending());
        }

        Page<Clothes> userPage;

        if (brandId > 0) {
            userPage = clothesService.getClothesByBrandId(brandId, pageable);
        } else {
            if (!priceRange.isEmpty()) {
                if (priceRange.equals("under500k")) {
                    userPage = clothesService.getUsersByIdRange(0, 500000, pageable);
                } else if (priceRange.equals("under1m")) {
                    userPage = clothesService.getUsersByIdRange(0, 1000000, pageable);
                } else if (priceRange.equals("above1m")) {
                    userPage = clothesService.getUsersByIdRange(1000000, Integer.MAX_VALUE, pageable);
                } else {
                    userPage = clothesService.getAboutInfo(keyword, pageable);
                }
            } else {
                userPage = clothesService.getAboutInfo(keyword, pageable);
            }
        }

        model.addAttribute("aboutInfo", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortOrder", sortOrder);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("brandId", brandId);

        return "home";
    }


    @Autowired
    private ClothesService clothesService;


    @GetMapping("/tops")
    public String tops(
            Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "asc") String sortOrder,
            @RequestParam(defaultValue = "") String priceRange,
            @RequestParam(defaultValue = "") String color,
            @RequestParam(defaultValue = "") String size
    ) {
        int brandId = 1;
        int pageSize = 4;
        Pageable pageable = sortOrder.equals("asc") ?
                PageRequest.of(page, pageSize, Sort.by("price").ascending()) :
                PageRequest.of(page, pageSize, Sort.by("price").descending());

        Page<Clothes> userPage;

        if (!size.isEmpty()) {
            userPage = clothesService.getClothesBySizeNameAndBrandId(size, brandId, pageable);
            color = "";
            priceRange = "";
            keyword = "";
        }
        else if (!color.isEmpty()) {
            userPage = clothesService.getClothesByColorNameColorAndBrandId(color, brandId, pageable);
            size = "";
            priceRange = "";
            keyword = "";
        }
        else if (!priceRange.isEmpty()) {
            switch (priceRange) {
                case "under500k":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 500000, keyword, pageable);
                    break;
                case "under1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 1000000, keyword, pageable);
                    break;
                case "above1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 1000000, Integer.MAX_VALUE, keyword, pageable);
                    break;
                default:
                    userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
            }
            size = "";
            color = "";
            keyword = "";
        }
        else {
            userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
        }

        model.addAttribute("aboutInfo", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortOrder", sortOrder);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("brandId", brandId);
        model.addAttribute("color", color);
        model.addAttribute("size", size);

        return "top";
    }


    @GetMapping("/bottoms")
    public String bottoms(
            Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "asc") String sortOrder,
            @RequestParam(defaultValue = "") String priceRange,
            @RequestParam(defaultValue = "") String color,
            @RequestParam(defaultValue = "") String size
    ) {
        int brandId = 2;
        int pageSize = 4;
        Pageable pageable = sortOrder.equals("asc") ?
                PageRequest.of(page, pageSize, Sort.by("price").ascending()) :
                PageRequest.of(page, pageSize, Sort.by("price").descending());

        Page<Clothes> userPage;

        if (!size.isEmpty()) {
            userPage = clothesService.getClothesBySizeNameAndBrandId(size, brandId, pageable);
            color = "";
            priceRange = "";
            keyword = "";
        }
        else if (!color.isEmpty()) {
            userPage = clothesService.getClothesByColorNameColorAndBrandId(color, brandId, pageable);
            size = "";
            priceRange = "";
            keyword = "";
        }
        else if (!priceRange.isEmpty()) {
            switch (priceRange) {
                case "under500k":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 500000, keyword, pageable);
                    break;
                case "under1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 1000000, keyword, pageable);
                    break;
                case "above1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 1000000, Integer.MAX_VALUE, keyword, pageable);
                    break;
                default:
                    userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
            }
            size = "";
            color = "";
            keyword = "";
        }
        else {
            userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
        }

        model.addAttribute("aboutInfo", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortOrder", sortOrder);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("brandId", brandId);
        model.addAttribute("color", color);
        model.addAttribute("size", size);

        return "bottom";
    }



    @GetMapping("/bags")
    public String bags(
            Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "asc") String sortOrder,
            @RequestParam(defaultValue = "") String priceRange,
            @RequestParam(defaultValue = "") String color,
            @RequestParam(defaultValue = "") String size
    ) {
        int brandId = 3;
        int pageSize = 4;
        Pageable pageable = sortOrder.equals("asc") ?
                PageRequest.of(page, pageSize, Sort.by("price").ascending()) :
                PageRequest.of(page, pageSize, Sort.by("price").descending());

        Page<Clothes> userPage;

        if (!size.isEmpty()) {
            userPage = clothesService.getClothesBySizeNameAndBrandId(size, brandId, pageable);
            color = "";
            priceRange = "";
            keyword = "";
        }
        else if (!color.isEmpty()) {
            userPage = clothesService.getClothesByColorNameColorAndBrandId(color, brandId, pageable);
            size = "";
            priceRange = "";
            keyword = "";
        }
        else if (!priceRange.isEmpty()) {
            switch (priceRange) {
                case "under500k":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 500000, keyword, pageable);
                    break;
                case "under1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 1000000, keyword, pageable);
                    break;
                case "above1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 1000000, Integer.MAX_VALUE, keyword, pageable);
                    break;
                default:
                    userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
            }
            size = "";
            color = "";
            keyword = "";
        }
        else {
            userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
        }

        model.addAttribute("aboutInfo", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortOrder", sortOrder);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("brandId", brandId);
        model.addAttribute("color", color);
        model.addAttribute("size", size);

        return "bag";
    }



    @GetMapping("/outerwears")
    public String outerwears(
            Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "asc") String sortOrder,
            @RequestParam(defaultValue = "") String priceRange,
            @RequestParam(defaultValue = "") String color,
            @RequestParam(defaultValue = "") String size
    ) {
        int brandId = 4;
        int pageSize = 4;
        Pageable pageable = sortOrder.equals("asc") ?
                PageRequest.of(page, pageSize, Sort.by("price").ascending()) :
                PageRequest.of(page, pageSize, Sort.by("price").descending());

        Page<Clothes> userPage;

        if (!size.isEmpty()) {
            userPage = clothesService.getClothesBySizeNameAndBrandId(size, brandId, pageable);
            color = "";
            priceRange = "";
            keyword = "";
        }
        else if (!color.isEmpty()) {
            userPage = clothesService.getClothesByColorNameColorAndBrandId(color, brandId, pageable);
            size = "";
            priceRange = "";
            keyword = "";
        }
        else if (!priceRange.isEmpty()) {
            switch (priceRange) {
                case "under500k":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 500000, keyword, pageable);
                    break;
                case "under1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 0, 1000000, keyword, pageable);
                    break;
                case "above1m":
                    userPage = clothesService.getClothesByBrandIdAndPriceRange(brandId, 1000000, Integer.MAX_VALUE, keyword, pageable);
                    break;
                default:
                    userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
            }
            size = "";
            color = "";
            keyword = "";
        }
        else {
            userPage = clothesService.getClothesByBrandIdAndKeyword(brandId, keyword, pageable);
        }

        model.addAttribute("aboutInfo", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortOrder", sortOrder);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("brandId", brandId);
        model.addAttribute("color", color);
        model.addAttribute("size", size);

        return "outerwear";
    }




    @GetMapping("/detail/{id}")
    public String getProductDetail(@PathVariable("id") Integer id, Model model) {
        Clothes product = clothesService.getClothesById(id);

        if (product == null) {
            return "error";
        }
        model.addAttribute("product", product);
        model.addAttribute("aboutInfo", clothesService.getAllClothes());

        return "detail";
    }


}
