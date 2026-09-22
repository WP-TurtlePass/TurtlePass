<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!doctype html><html lang="ko"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>시흥 투어패스</title><link rel="stylesheet" href="${root}/assets/style.css"></head><body>
<header><a href="${root}/">siheung-tourpass</a><nav aria-label="주 메뉴"><a href="${root}/merchants">가맹점·혜택</a><a href="${root}/recommendations">관광 추천</a>
<c:choose><c:when test="${empty user}"><a href="${root}/login">로그인</a></c:when><c:otherwise>
<c:if test="${user.role eq 'VISITOR'}"><a href="${root}/passes">내 패스</a><a href="${root}/feedback/history">사용 이력·피드백</a></c:if>
<c:if test="${user.role eq 'STAFF'}"><a href="${root}/merchant/redeem">혜택 사용</a><a href="${root}/merchant/history">가맹점 이력</a></c:if>
<c:if test="${user.role eq 'ADMIN'}"><a href="${root}/admin">관리</a></c:if>
<span><c:out value="${user.displayName}"/></span><form class="inline" method="post" action="${root}/logout"><input type="hidden" name="csrf" value="${fn:escapeXml(csrf)}"><button>로그아웃</button></form>
</c:otherwise></c:choose></nav></header>
<main><p class="notice">시연용·실제 사용 불가 — 패스·가맹점·금액·혜택은 가상 설정입니다.</p>
<c:choose>
<c:when test="${view eq 'error'}"><h1>요청 확인</h1><p class="error" role="alert"><c:out value="${message}"/></p><p>오류 코드: <c:out value="${errorCode}"/></p><a href="${root}/">처음으로</a></c:when>
<c:when test="${view eq 'login'}"><h1>로그인</h1><form method="post" action="${root}/login"><input type="hidden" name="csrf" value="${fn:escapeXml(csrf)}"><label>아이디<input name="loginId" maxlength="100" autocomplete="username" required></label><label>비밀번호<input type="password" name="password" maxlength="500" autocomplete="current-password" required></label><button>로그인</button></form></c:when>
<c:when test="${view eq 'catalog' or view eq 'product' or view eq 'merchant' or view eq 'place'}"><%@ include file="catalog.jspf" %></c:when>
<c:when test="${view eq 'recommendations'}"><%@ include file="recommendations.jspf" %></c:when>
<c:when test="${view eq 'passes' or view eq 'pass'}"><%@ include file="passes.jspf" %></c:when>
<c:when test="${view eq 'redeem' or view eq 'confirm' or view eq 'history' or view eq 'feedback'}"><%@ include file="usage.jspf" %></c:when>
<c:when test="${view eq 'admin' or view eq 'editor' or view eq 'relations'}"><%@ include file="admin.jspf" %></c:when>
</c:choose></main><footer>수업용 시연 서비스 · 화면 시각은 한국 시간 · 실제 관광 자료의 영업·예약·이동 가능성은 미확인</footer></body></html>
