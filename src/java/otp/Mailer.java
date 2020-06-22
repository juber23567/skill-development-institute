package otp;
import java.util.Properties;   
import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;   
public class Mailer {  
public static void send(String to,String subject,String msg){   
final String user="sdiskill2017@gmail.com";  
final String pass="awtcmhwohftexpjp";      
Properties props = new Properties();  
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.auth", "true");  
props.put("mail.smtp.port", "465");
Session session = Session.getInstance(props,  
 new javax.mail.Authenticator() {  
  @Override
  protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication(user,pass);  
   }  
});   
try {  
 MimeMessage message = new MimeMessage(session);  
 message.setFrom(new InternetAddress(user));  
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
 message.setSubject(subject);  
 message.setContent(msg,"text/html");  
 Transport.send(message);  
 System.out.println("Done");   
 } catch (MessagingException e) {  
    throw new RuntimeException(e);  
 } } } 
 