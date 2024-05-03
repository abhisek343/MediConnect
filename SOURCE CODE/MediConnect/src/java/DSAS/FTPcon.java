/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DSAS;

/**
 *
 * @author java1
 */
import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.net.ftp.FTPClient;

public class FTPcon {

    FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

    /**
     *
     * @param file
     * @return
     */
    public boolean upload(File file) {
        try {
            System.out.println("Check------------------------------------->1");
            client.connect("ftp.drivehq.com");
            String your_username = System.getenv("YOUR_USERNAME");
            String your_password = System.getenv("YOUR_PASSWORD");


            client.login(your_username, your_password);
            client.enterLocalPassiveMode();
            fis = new FileInputStream(file);
            System.out.println("Check------------------------------------->2");
            status = client.storeFile("/" + file.getName(), fis);
            //file path of drive storage
            client.logout();
            fis.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;

        }

    }
}
