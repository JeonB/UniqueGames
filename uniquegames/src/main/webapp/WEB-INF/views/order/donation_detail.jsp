<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unique Games</title>
	<link rel="stylesheet" href="css/order_style.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script> <!-- 마이크로소프트 jQuery-->
	<script src="js/order_script.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../main/header.jsp"></jsp:include>

<!-- content -->
<section id="top-bg">
	<div id="base-layer">
		<div id="top-bg-textarea">
			<p id="top-title">Payment Detail</p>
			<p id="top-subtitle">#결제내역</p>
		</div>
	</div>
</section>

<h1>Payment Detail</h1>
<section id="cart">
	<div id="div-gameList">
		<div>
			<select id="select-order">
				<option value="orderdate_desc">최근 날짜순</option>
				<option value="orderdate_acs">오래된 날짜순</option>
				<option value="amount_acs">높은 후원금순</option>
				<option value="amount_desc">낮은 후원금순</option>			
			</select>
		</div>
		<div id="div-table">
			<table id="table-gameList">
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>상품명</th>
					<th>가격</th>
				</tr>
				<tr>
					<td>1</td>
					<td>2023/05/16</td>
					<td>게임이름 입니다.</td>
					<td>999,999,999</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="div-price">
		<table id="cart-price">
			<tr>
				<th>월 평균</th>
				<th>총 금액</th>
				
			</tr>
			<tr>
				<td>333,333,333</td>
				<td>999,999,999</td>
			</tr>
		</table>
	</div>
</section>

<!-- footer -->
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>