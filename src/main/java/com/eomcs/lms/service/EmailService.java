package com.eomcs.lms.service;

public interface EmailService {
  void send(String subject, String text, String from, String to);
}
