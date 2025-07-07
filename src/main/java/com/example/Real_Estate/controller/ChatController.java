package com.example.Real_Estate.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ChatController {

    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
    private final RestTemplate restTemplate = new RestTemplate();

    @PostMapping("/chat")
    public ResponseEntity<String> chatWithOllama(@RequestBody Map<String, String> body) {
        String userMessage = body.get("message");
        logger.info("Chatbot Input - User Message: {}", userMessage);

        // Construct headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Request body for Ollama
        Map<String, Object> requestBody = Map.of(
            "model", "llama3.2:latest",   // Updated to use 'llama3.2:latest' as confirmed available in the user's Ollama setup.
            "prompt", userMessage,
            "stream", false
        );

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(
                "http://localhost:11434/api/generate",
                entity,
                Map.class
            );

            String responseText = (String) response.getBody().get("response");
            logger.info("Chatbot Output - Response: {}", responseText.trim());
            return ResponseEntity.ok(responseText.trim());

        } catch (org.springframework.web.client.HttpClientErrorException.NotFound e) {
            e.printStackTrace(); // For debugging
            logger.error("Chatbot Error - Model not found: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Error: Ollama model not found. Please ensure the specified model ('llama3.2:latest') is installed in your Ollama setup. Error details: " + e.getMessage());
        } catch (org.springframework.web.client.ResourceAccessException e) {
            e.printStackTrace(); // For debugging
            logger.error("Chatbot Error - Unable to connect to Ollama service: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Error: Unable to connect to Ollama service. Please ensure Ollama is running on localhost:11434. Error details: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace(); // For debugging
            logger.error("Chatbot Error - Unexpected error: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Unexpected error communicating with Ollama: " + e.getMessage());
        }
    }
}
