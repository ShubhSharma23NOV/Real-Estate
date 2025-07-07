package com.example.Real_Estate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.Real_Estate.ServiceImpl.SmsServiceImpl;

@RestController
@RequestMapping("/api/otp")
public class OtpController {

    @Autowired
    private SmsServiceImpl smsServiceimpl;

    // You can use this to generate a random 6-digit OTP
    private String generateOTP(int length) {
        StringBuilder otp = new StringBuilder();
        for (int i = 0; i < length; i++) {
            otp.append((int)(Math.random() * 10)); // 0–9 digits
        }
        return otp.toString();
    }

    @PostMapping("/send")
    public String sendOtpToEmail(@RequestParam String email) {
        try {
            String otp = generateOTP(6);
            smsServiceimpl.sendOTP(email, otp);
            return "OTP sent successfully to " + email;
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to send OTP: " + e.getMessage();
        }
    }
}
