<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
  <nav class="header-nav">
    <div class="menu">
      <ul>
        <li><a href="${contextRootPath}/app/main">Home</a></li>
        <li><a href="#">Blog</a></li>
        <c:if test="${empty sessionScope.loginUser}">
          <li><a href="${contextRootPath}/app/auth/form">Login</a></li>
        </c:if>
      </ul>
    </div>
  </nav>
</header>
