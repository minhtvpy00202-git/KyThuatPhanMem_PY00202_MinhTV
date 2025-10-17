<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
  request.setAttribute("pageTitle", "Trang chủ");
  request.setAttribute("body", "/WEB-INF/views/partials/home-body.jsp");
%>
<jsp:include page="/WEB-INF/views/layout.jsp"/>
