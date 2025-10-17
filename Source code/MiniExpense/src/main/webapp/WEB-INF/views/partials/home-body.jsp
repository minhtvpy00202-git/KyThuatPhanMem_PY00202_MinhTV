<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!-- Tiêu đề trang -->
<div class="page-header">
	<h2 style="font-size: 40px;">📊 Sổ thu chi</h2>
</div>

<!-- Bộ lọc theo thời gian -->
<div class="section">
	<h3>🔍 Lọc theo thời gian</h3>
	<form method="get" action="${pageContext.request.contextPath}/home">
		<div class="form-row">
			<label for="from">Từ ngày</label> <input id="from" type="date"
				name="from" value="${from}"> <label for="to">Đến
				ngày</label> <input id="to" type="date" name="to" value="${to}">
			<button type="submit" class="btn">Lọc dữ liệu</button>
		</div>
	</form>
</div>

<%-- Tính tổng --%>
<c:set var="sumExpense" value="0" />
<c:forEach var="t" items="${expense}">
  <c:set var="sumExpense" value="${sumExpense + t.amount}" />
</c:forEach>

<c:set var="sumIncome" value="0" />
<c:forEach var="t" items="${income}">
  <c:set var="sumIncome" value="${sumIncome + t.amount}" />
</c:forEach>

<c:set var="net" value="${sumIncome - sumExpense}" />

<!-- THẺ TỔNG HỢP -->
<div class="stat-cards">
  <div class="stat stat--expense">
    <div class="stat-title">Tổng chi</div>
    <div class="stat-value">
      -<fmt:formatNumber value="${sumExpense}" pattern="#,##0.##" /> ₫
    </div>
  </div>

  <div class="stat stat--income">
    <div class="stat-title">Tổng thu</div>
    <div class="stat-value">
      +<fmt:formatNumber value="${sumIncome}" pattern="#,##0.##" /> ₫
    </div>
  </div>

  <div class="stat stat--net">
    <div class="stat-title">Thu - Chi</div>
    <div class="stat-value">
      <fmt:formatNumber value="${net}" pattern="#,##0.##" /> ₫
    </div>
  </div>
</div>


<!-- Chi tiêu -->
<div class="section">
	<h3>💸 Chi tiêu</h3>
	<table class="table transaction-table">
		<thead>
			<tr>
				<th>📅 Ngày</th>
				<th>📂 Danh mục</th>
				<th>📝 Ghi chú</th>
				<th>💰 Số tiền</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="t" items="${expense}">
				<tr>
					<td><fmt:formatDate value="${t.txDay}" pattern="dd/MM/yyyy" /></td>
					<td>${t.categoryName}</td>
					<td>${t.notes}</td>
					<td class="num"><fmt:formatNumber value="${t.amount}"
							pattern="#,##0.##" /> ₫</td>

				</tr>
			</c:forEach>

			<c:if test="${empty expense}">
				<tr class="empty">
					<td colspan="4">📭 Chưa có chi tiêu trong khoảng thời gian này</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<!-- Thu nhập -->
<div class="section">
	<h3>💰 Thu nhập</h3>
	<table class="table transaction-table">
		<thead>
			<tr>
				<th>📅 Ngày</th>
				<th>📂 Danh mục</th>
				<th>📝 Ghi chú</th>
				<th>💰 Số tiền</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="t" items="${income}">
				<tr>
					<td><fmt:formatDate value="${t.txDay}" pattern="dd/MM/yyyy" /></td>
					<td>${t.categoryName}</td>
					<td>${t.notes}</td>
<td class="num"><fmt:formatNumber value="${t.amount}" pattern="#,##0.##"/> ₫</td>
				</tr>
			</c:forEach>

			<c:if test="${empty income}">
				<tr class="empty">
					<td colspan="4">📭 Chưa có thu nhập trong khoảng thời gian này</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
