<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>팀 구함(뷰페이지)</title>
<!--  <jsp:include page="../commonCss.jsp"/> -->
<link rel="stylesheet"href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"href="${contextRootPath}/css/recruit_form_view.css">
</head>
<body>

	<jsp:include page="../header.jsp" />


	<h2>마음에 드는 회원을 자기팀으로 스카웃하세요.</h2>
	<div class="container">

		<hr color="black" width=90%>
		<form action='add' method='post'>

			<div class="form-group row">

				<label for="location" class="col-sm-2 col-form-label" id="head"><b>지역</b></label>
				<label for="colFormLabelSm" class="col-sm-2 col-form-label">서울시</label>
				<label for="colFormLabelSm" class="col-sm-2 col-form-label">강남구</label>
				<label for="colFormLabelSm" class="col-sm-2 col-form-label">xx동</label>
			</div>


			<div class="form-group row">
				<label for="playtype" class="col-sm-2 col-form-label" id="head"><b>경기유형</b></label>
				<label for="colFormLabelSm" class="col-sm-2 col-form-label">축구</label>
			</div>

			<div class="form-group row">
				<label for="title" class="col-sm-2 col-form-label" id="titlabel"><b>제목</b></label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="title" id="title"
						value="제목자리입니다." readonly="readonly" />
				</div>
			</div>

			<div class="form-group row">
				<label for="contents" class="col-sm-2 col-form-label" id="cntlabel"><b>내용</b></label>
				<div class="col-sm-8">
					<textarea class="form-control" id="contents" name='contents'
						rows='5' readonly="readonly">강남에서 축구하는 20대 팀에 가입하고 싶습니다. </textarea>
				</div>
			</div>


			<div class="button2">
				<div class="col-sm-10">
					<button class="btn btn-primary"><b>초대하기</b></button>
				</div>
			</div>

			<div class="button3">
				<div class="col-sm-10">
					<button disabled class="btn btn-primary"><b>입단완료</b></button>
				</div>
			</div>

			<p>
				<b>댓글수자리 | 조회수자리</b>
			</p>


			<table class="comment_view">
				<tbody>
					<tr>

						<td id="id_loc"><b>아이디자리입니다</b>
							<p style="font-size: 8px;">댓글날짜입니다.</p>
						</td>

						<td>

							<div id="contentsBox">
								<input type="hidden" id="com_CON">댓글내용자리입니다
								ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ호롤롤로로로로로로로롤로로로로로로로로로로롤


								<div align="left">
									<input type="text" value="댓글달기 아이콘 넣장" id="com_IDX">
								</div>

								<div align="right">
									<a href="#" class="btn"><b>댓글삭제</b></a> <a href="#" class="btn">댓글수정</a>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<div class="form-group row">
								<textarea rows="5" cols="75" name="COM_CONTENTS"></textarea>
								<button type="button" id="comment_sumit" class="btn btn-primary"><b>등록하기</b></button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<!--  <p align="right" >-->
		</form>

	</div>
	<!-- .container -->

	<jsp:include page="../javascript.jsp" />
</body>
</html>
