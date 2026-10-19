package cws.passwordGenerator;

import java.util.Random;

/**
 *
 */
public class PasswordGenerator {

    public static String generate() {
        int length = 8;
        String password = "";
        Random random = new Random();
        while (length-- > 0) {
            password = password + (char) random.nextInt(34, 126);
        }

        return password;
    }

}
