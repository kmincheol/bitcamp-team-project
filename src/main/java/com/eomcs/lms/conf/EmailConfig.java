package com.eomcs.lms.conf;

import java.util.Properties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfig {

  @Bean
  public JavaMailSender mailSender() {
    
    // SMTP 서버 설정
    final String host = "smtp.gmail.com";
    final String userName = "gwanghosongT@gmail.com";
    final String password = "thosong!@";
    final int port = 587; // SMTP 포트
    
    Properties props = System.getProperties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    
    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
    mailSender.setHost(host);
    mailSender.setPort(port);
    mailSender.setUsername(userName);
    mailSender.setPassword(password);
    mailSender.setDefaultEncoding("UTF-8");
    mailSender.setProtocol("smtp");
    mailSender.setJavaMailProperties(props);
    
    return mailSender;
  }
}
