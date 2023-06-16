<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unique Games</title>
	<link rel="stylesheet" href="css/order_style.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<!-- 마이크로소프트 jQuery-->
	<script src="js/order_script.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../main/header.jsp"></jsp:include>

<!-- content -->
<section id="top-bg">
	<div id="base-layer">
		<div id="top-bg-textarea">
			<p id="top-title">Order</p>
			<p id="top-subtitle">#결제</p>
		</div>
	</div>
</section>

<!-- orderForm -->
<h1>Order / Payment</h1>
<section id="order">
	<input type="hidden" id="totalAmount" value="${ totalAmount }">
	<div id="div-gameList">
		<div id="div-table">
			<table id="table-gameList">
				<tr>
					<th>번호</th>
					<th></th>
					<th>상품명</th>
					<th>가격</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="order" items="${orderList}">
					<tr>
						<td>${ order.rno }</td>
						<td><a><img src="${ order.game_img }"></a></td>
						<td><p><a>${ order.gametitle }</a></p></td>
						<td><fmt:formatNumber type="currency" value="${ order.amount }" /></td>
						<td>
							<a href="http://localhost:9000/uniquegames/order_delete_one.do?id=${ order.id }" id="a-delete">
							<button type="button" id="btn-deleteOne" name="btn-deleteOne" value="${ order.id }">삭제</button></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="div-info">
		<h2>결제 정보</h2>
		<div id="div-paymentMethod">
			<h3>결제 수단</h3>
			<div id="div-method">
				<button id="btn-method" type="button" value="card">카드 결제</button>
				<button id="btn-method" type="button" value="vbank">가상 계좌</button>
				<button id="btn-method" type="button" value="trans">계좌이체</button>
				<button id="btn-method" type="button" value="phone">휴대폰소액결제</button>
				<button id="btn-method" type="button" value="kakao">카카오 페이</button>
			</div>	
		</div>
		<hr>
		<div>
			<h3>환불 안내</h3>
			<div id="div-infomation">
				환불 절차와 조건은 다음과 같습니다.
				
				<br><p id="p-infomationTitle">1. 환불 절차</p>
				<br><p id="p-infomationContent">환불 조건에 적합한 건에 대하여 선택하신 결제 수단으로 2주내 환불이 이루어집니다.</p>
				
				<br><p id="p-infomationTitle">2. 환불 조건</p>
				<br><p id="p-infomationContent">결제 후 2주가 지나지 않은 건에 대해서는 100% 환불이 가능하며 이외의 환불에 대해서는 아래의 링크를 참고하여주시길 바랍니다.</p>
				<br><p id="p-infomationContent"><a href="#">기간에 따른 환불 안내</a></p>
				
			</div>	
		</div>
		<hr>
		<h3>결제 동의</h3>
		<div id="div-agreement">
			<input type="checkbox" id="checkAll" name="checkAll"><span>전체 동의하기</span>
				<ul>
					<li><input type="checkbox" id="agreement" name="checkOne">[필수] 만 14세 이상입니다.</li>
					<li><input type="checkbox" id="agreement" name="checkOne">[필수] 이용 약관<a id="detail1">자세히</a></li>
					<li><input type="checkbox" id="agreement" name="checkOne">[필수] 개인정보 수집 및 이용 동의<a id="detail2">자세히</a></li>
					<li><input type="checkbox" id="agreement" name="checkOne">[필수] 개인정보 제 3자 제공 동의<a id="detail3">자세히</a></li>
					<li><input type="checkbox" id="agreement" name="checkOne">[필수] 전자결제대행 이용 동의<a id="detail4">자세히</a></li>
				</ul>
		</div>
		<div id="div-price">
			<table id="cart-price">
				<tr>
					<th>개수</th>
					<th>총 금액</th>
					
				</tr>
				<tr>
					<td>총 ${ count }개</td>
					<td><fmt:formatNumber type="currency" value="${ amount }" /></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="div-button">
		<button type="button" id="btn-order" name="btn-order">결제하기</button>
	</div>
</section>

<!-- modal -->
<div id="modal">
	<div class="modal-agreement" id="modal-agreement">
		<p id="modal-title">이용 약관</p>
		<div id="modal-content">
		</div>
		<button id="btn-modal">확인</button>
	</div>
</div>

<!-- Agreement Content -->
<div class="detail1"> 
제 1조(목적)
	<br>&nbsp;이 약관은 환경교육포털(이하 “홈페이지”)에서 제공되는 모든 서비스(이하 ‘서비스’라 한다)의 이용조건 및 절차, 
	이용자와 당 홈페이지의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
<br><br>제 2조(약관의 효력과 변경)
	<br>&nbsp;① 당 홈페이지는 이용자가 본 약관 내용에 동의하는 것을 조건으로 이용자에게 서비스를 제공할 것이며, 
	이용자가 본 약관의 내용에 동의하는 경우, 당 홈페이지의 서비스 제공 행위 및 이용자의 서비스 이용 행위는 본 약관이 
	우선적으로 적용 될 것입니다.
	<br>&nbsp;② 당 홈페이지는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위 내에서 본 약관을 변경할 수 있으며, 
	약관이 변경된 경우에는 지체 없이 당 홈페이지 내에 공지함과 동시에 회원가입 시 기입한 이메일을 통해 공지함으로써 이용자가 직접 확인하도록 할 것입니다.
	<br>&nbsp;③ 변경된 약관은 공지와 동시에 그 효력이 발생되며, 이용자가 변경된 약관에 동의하지 아니하는 경우, 
	이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있습니다. 단, 공지된 이후 이메일 회신 등 별도의 거부의사를 표시하지 아니하고 
	서비스를 7일 이상 계속 사용할 경우에는 약관 변경에 동의한 것으로 간주됩니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 
	이용자의 피해는 당 홈페이지에서 책임지지 않습니다.
<br><br>제 3조(약관 외 준칙)
	<br>&nbsp;본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 방송통신심의위원회 정보통신에 관한 심의규정, 
	저작권법 및 기타 관계 법령의 규정에 의합니다.
<br><br>제 4조(용어의 정의)
	<br>&nbsp;본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
	<br>&nbsp;1. 이용자 : 당 홈페이지에 접속하여 당 홈페이지에서 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
	<br>&nbsp;2. 회원 : 당 홈페이지에 접속하여 이 약관에 동의하고, ID(고유번호)와 비밀번호를 발급받은 자로 
	당 홈페이지의 정보 및 서비스를 이용할 수 있는 자를 말합니다.
	<br>&nbsp;3. 비회원 : 회원가입을 하지 않고 당 홈페이지에서 제공하는 서비스를 이용하는 자를 말합니다.
	<br>&nbsp;4. ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 이용자가 선정하고 당 홈페이지에서 승인하는 
	영문자와 숫자의 조합(하나의 ID만 발급, 이용가능)을 말합니다.
	<br>&nbsp;5. 비밀번호 : 회원 아이디와 일치된 회원임을 확인하는 번호로서, 회원의 비밀보호를 
	위해 회원자신이 선정한 문자와 숫자의 조합을 말합니다.
	<br>&nbsp;6. 회원가입 : 회원이 당 홈페이지에서 제공하는 신청서 양식에 해당 정보를 기입하고, 
	본 약관에 동의하여 서비스 이용계약을 완료시키는 행위를 말합니다.
	<br>&nbsp;7. 회원탈퇴 : 회원이 이용계약을 종료시키는 의사표시입니다.
</div>
<div class="detail2"> 
1. 개인정보의 수집·이용 목적 : 홈페이지 관리, 통계
<br>2. 수집하는 개인정보의 항목 : 성명, 이메일, 계좌번호, 주소
<br>3. 개인정보의 보유 및 이용 기간 : 구매일로부터 6개월
<br>4. 동의를 거부할 권리
<br>&nbsp;  : 귀하는 위와 같이 개인정보를 수집 및 이용하는 데 대한 동의를 거부할 권리가 있습니다.
<br>&nbsp;  - 동의를 거부하셔도 그에 따른 불이익은 없습니다.
</div>
<div class="detail3"> 
[UniqueGames]은(는) 개인정보보호법 등 관련 법령상의 개인정보 보호 규정을 준수하며 학생의 개인정보 보호에 최선을 다하고 있습니다.  
<br>[UniqueGames]은(는)  개인정보보호법 제17조제1항제1호에 근거하여, 다음과 같이 [게임 서비스 제공]을(를) 위하여 개인정보를 제3자에게 제공하는데 동의를 받고자 합니다. 

<br><br>1. 개인정보를 제공받는 자 : [UniqueGames]
<br>2. 개인정보를 제공받는 자의 개인정보 이용 목적 : 게임 서비스 제공
<br>3. 제공하는 개인정보의 항목 : 성명, 이메일, 계좌번호, 주소
<br>4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 구매일로부터 6개월
<br>5. 동의거부권 및 동의 거부에 따른 불이익 안내
  : 소비자은(는) 위와 같이 개인정보를 수집․이용하는 데 대한 동의를 거부할 권리가 있습니다.
</div>
<div class="detail4"> 
전자금융거래 기본약관
<br><br>제1조 (목적)
<br>이 약관은 NICE페이먼츠 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.

<br><br>제2조 (용어의 정의)
<br>이 약관에서 정하는 용어의 정의는 다음과 같습니다.

<br>1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
<br>2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
<br>3.'결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
<br>4. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
<br>5. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
<br>6. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
<br>7. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
</div>

<!-- footer -->
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>