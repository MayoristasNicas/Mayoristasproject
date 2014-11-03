/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;
import java.util.Properties;
import java.util.Scanner;
import java.util.regex.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author MayoristasNicas
 */
public class EmailValidator {
    boolean result = false;
        private Pattern pattern;
    private Matcher matcher;
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public EmailValidator() {
        pattern = Pattern.compile(EMAIL_PATTERN);
    }

    /**
     * Validate hex with regular expression
     *
     * @param hex hex for validation
     * @return true valid hex, false invalid hex
     */
    public boolean validate(final String hex) {

        matcher = pattern.matcher(hex);
        
        //Send email
        if(matcher.matches()){
            return this.sendEmail(hex);
        }
        return false;

    }
    
    public boolean sendEmail(String email){
        final String username = "mayoristasnicas.soporte@gmail.com";
        final String password = "mayoristas";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("Confirmación cuenta MayoristasNicas");
            message.setText("Estimado Usuario,"
                    + "\n\n Gracias por suscribirse a MayoristasNicas");

            Transport.send(message);

            System.out.println("Done");
            return true;
        } catch (MessagingException e) {
            return false;
        }
    }
          
          /*
    public boolean isValidEmail(String email){
        
        Pattern p=Pattern.compile("[a-zA-Z]*[0-9]*@[a-zA-Z]*\\.[a-zA-Z]*");
        Matcher m=p.matcher(email);
        //Matcher m=p.matcher(args[0]);
        boolean b=m.matches();
        if(b==true)
        {
            result = true;
        }
        else
        {
            result = false;
        }
        return result;
    }
    */
          
    
    public static void main(String arg[]){
        EmailValidator valid = new EmailValidator();
        System.out.print("Correo electrónico a validar...");
        Scanner sc = new Scanner(System.in);
        String email = sc.next();
        
        boolean b = valid.validate(email);
        System.out.println("Correo electrónico es: "+ b);
    }
}
