package com.app.utils;

import java.security.SecureRandom;

public class RandomCodeUtil {

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final SecureRandom RANDOM = new SecureRandom();

    public static String generateRandomCode(int codeLength) {
        StringBuilder sb = new StringBuilder(codeLength);
        for (int i = 0; i < codeLength; i++) {
            sb.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return sb.toString();
    }
    
}
