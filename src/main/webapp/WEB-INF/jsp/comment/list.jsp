<%@page import="com.eomcs.lms.domain.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<body>

  <div class="comment-list">
    <table class="table table-hover">
      <thead>
        <tr id="comment-list-tr">
          <th scope="col">번호</th>
          <th scope="col">게시물번호</th>
          <th scope="col">작성자</th>
          <th scope="col">내용</th>
          <th scope="col">작성일</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="comment"> 
          <tr>
            <th scope="row">${comment.no}</th>
            <td>${comment.freeNo}</td>
            <td>${comment.member.name}</td>
            <td>${comment.contents}</td>
            <td>${comment.modifierDate}</td>
          </tr>
           </c:forEach> 
      </tbody>
    </table>
  </div>

    






</body>
</html>







