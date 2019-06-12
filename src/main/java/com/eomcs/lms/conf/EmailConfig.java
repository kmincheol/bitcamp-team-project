package com.eomcs.lms.conf;

import java.util.Properties;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@PropertySource("classpath:/com/eomcs/lms/conf/email.properties")
public class EmailConfig {
  
  private static final Logger logger = LogManager.getLogger(EmailConfig.class);
  
  @Autowired 
  Environment env;

  @Autowired
  GlobalPropertySource globalPropertySource;
  
  @Bean
  public JavaMailSender mailSender() {
    
    // SMTP 서버 설정
    final String host = "smtp.gmail.com";
    final int port = 587; // SMTP 포트
    final String userName = globalPropertySource.getMailUserName();
    final String password = globalPropertySource.getMailPassword();
    
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
