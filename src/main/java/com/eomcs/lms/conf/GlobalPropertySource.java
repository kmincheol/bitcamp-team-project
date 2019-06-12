package com.eomcs.lms.conf;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

@Configuration
@PropertySources({
    @PropertySource(
        value = "classpath:/com/eomcs/lms/conf/jdbc.properties", ignoreResourceNotFound = true ),
    @PropertySource(
        value = "classpath:/com/eomcs/lms/conf/email.properties", ignoreResourceNotFound = true),
    @PropertySource(
        value = "classpath:/com/eomcs/lms/conf/sms.properties", ignoreResourceNotFound = true),
    @PropertySource(
        value = "classpath:/com/eomcs/lms/conf/sns.properties", ignoreResourceNotFound = true)
})
public class GlobalPropertySource {
  
  @Value("${jdbc.driver}")
  private String driverClassName;
  
  @Value("${jdbc.url}")
  private String url;
  
  @Value("${jdbc.username}")
  private String username;
  
  @Value("${jdbc.password}")
  private String password;

  @Value("${mailUserName}")
  private String mailUserName;
  
  @Value("${mailPassword}")
  private String mailPassword;
  
  @Value("${sms.apiKey}")
  private String smsApiKey;
  
  @Value("${sms.apiSecret}")
  private String smsApiSecret;
  
  @Value("${sms.fromTel}")
  private String smsFromTel;
  
  @Value("${facebook.clientId}")
  private String facebookClientId;
  
  @Value("${facebook.clientSecret}")
  private String facebookClientSecret;
  
  @Value("${naver.clientId}")
  private String naverClientId;
  
  @Value("${naver.clientSecret}")
  private String naverClientSecret;
  
  @Value("${kakao.clientId}")
  private String kakaoClientId;
  
  @Value("${kakao.clientSecret}")
  private String kakaoClientSecret;
  
  @Value("${google.clientId}")
  private String googleClientId;
  
  @Value("${google.clientSecret}")
  private String googleClientSecret;
  
  public String getDriverClassName() {
    return driverClassName;
  }

  public String getUrl() {
    return url;
  }

  public String getUsername() {
    return username;
  }

  public String getPassword() {
    return password;
  }

  public String getMailUserName() {
    return mailUserName;
  }

  public String getMailPassword() {
    return mailPassword;
  }

  public String getSmsApiKey() {
    return smsApiKey;
  }

  public String getSmsApiSecret() {
    return smsApiSecret;
  }

  public String getSmsFromTel() {
    return smsFromTel;
  }

  public String getFacebookClientId() {
    return facebookClientId;
  }

  public String getFacebookClientSecret() {
    return facebookClientSecret;
  }

  public String getNaverClientId() {
    return naverClientId;
  }

  public String getNaverClientSecret() {
    return naverClientSecret;
  }

  public String getKakaoClientId() {
    return kakaoClientId;
  }

  public String getKakaoClientSecret() {
    return kakaoClientSecret;
  }

  public String getGoogleClientId() {
    return googleClientId;
  }

  public String getGoogleClientSecret() {
    return googleClientSecret;
  }

}
