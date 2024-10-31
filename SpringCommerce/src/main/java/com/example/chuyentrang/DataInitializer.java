package com.example.chuyentrang;

import com.example.chuyentrang.model.User;
import com.example.chuyentrang.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public DataInitializer(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) throws Exception {
        // Cung cấp tài khoản ban đầu cho admin
        String email = "caoky.sonha@gmail.com";
        String rawPassword = "123";
        String encodedPassword = passwordEncoder.encode(rawPassword);

        if (!userRepository.findByEmail(email).isPresent()) {
            User user = new User(email, encodedPassword);
            userRepository.save(user);
        }
    }
}
