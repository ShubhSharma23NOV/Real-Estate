package com.example.Real_Estate.Services;

public interface SmsService {
	 void sendOTP(String recipientEmail, String otpCode) throws Exception;
}
