package com.example.Real_Estate.ServiceImpl;

import com.example.Real_Estate.Services.SmsService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SmsServiceImpl implements SmsService {

    private final JavaMailSender mailSender;
    private final String fromEmail;

    public SmsServiceImpl(JavaMailSender mailSender, 
                         @Value("${spring.mail.username}") String fromEmail) {
        this.mailSender = mailSender;
        this.fromEmail = fromEmail;
    }

    @Override
    public void sendOTP(String email, String otp) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(email);
            message.setSubject("Your OTP for SthayiNivas.com");
            message.setText("Your OTP is: " + otp + "\n\nThis OTP is valid for 5 minutes.\n\nRegards,\nSthayiNivas.com Team");
            
            mailSender.send(message);
            System.out.println("OTP sent successfully to " + email);
        } catch (Exception e) {
            System.err.println("Failed to send OTP: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Failed to send OTP: " + e.getMessage());
        }
    }
}
