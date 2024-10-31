package com.example.chuyentrang.controller;

import com.example.chuyentrang.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login() {
        return "loginAdmin";
    }



    @GetMapping("/logout")
    public String logout() {
        return "redirect:/login";
    }


    @GetMapping("/forgot")
    public String forgot() {
        return "forgot";
    }

    @GetMapping("/change")
    public String change() {
        return "change";
    }

    @Autowired
    private CustomUserDetailsService customUserDetailsService;


    @PostMapping("/forgot")
    public String resetPassword(@RequestParam("email") String email) {
        System.out.println(email);
        customUserDetailsService.resetPasswordToDefault(email);
        return "redirect:/login?resetSuccess=true";
    }

    @PostMapping("/change")
    public String changePassword(@RequestParam("oldPassword") String oldPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 Authentication authentication) {
        String email = authentication.getName();
        boolean success = customUserDetailsService.changePassword(oldPassword, newPassword, email);

        if (success) {
            return "redirect:/login?changeSuccess=true";
        } else {
            return "redirect:/change?error=true";
        }
    }





}
