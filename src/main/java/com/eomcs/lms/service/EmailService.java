package com.eomcs.lms.service;

public interface EmailService {
  boolean send(String subject, String text, String from, String to);
}
