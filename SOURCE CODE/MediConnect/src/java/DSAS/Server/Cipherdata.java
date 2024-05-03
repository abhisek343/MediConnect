/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DSAS.Server;

import java.security.Key;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author Murthi
 */
public class Cipherdata {

    public static final String ALGO = "AES";
    public static final String key = "";
    public static byte[] keyValue = key.getBytes();

    public static long encryption_extime = 0;
    public static long decryption_extime = 0;

    public static String encryption(String data) throws Exception {
        long EsTime = System.nanoTime();
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal(data.getBytes());
        encryption_extime = (System.nanoTime() - EsTime) / 1000000;
        return Base64.getEncoder().encodeToString(encVal);

    }

    public static String decryption(String encryptedData) throws Exception {
        long DsTime = System.nanoTime();
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.DECRYPT_MODE, key);
        byte[] decordedValue = Base64.getDecoder().decode(encryptedData);
        byte[] decValue = c.doFinal(decordedValue);
        decryption_extime = (System.nanoTime() - DsTime) / 1000000;
        return new String(decValue);
    }

    public static Key generateKey() throws Exception {
        return new SecretKeySpec(keyValue, ALGO);
    }

}
