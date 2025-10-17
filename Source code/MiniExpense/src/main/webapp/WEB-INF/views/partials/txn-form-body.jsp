<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- Tiêu đề -->
<div class="page-header">
  <h2>
    <c:choose>
      <c:when test="${type == 'INCOME'}">💰 Thêm thu nhập mới</c:when>
      <c:otherwise>💸 Thêm chi tiêu mới</c:otherwise>
    </c:choose>
  </h2>
</div>

<!-- Form giao dịch -->
<div class="section">
  <p class="muted">Nhập đầy đủ thông tin giao dịch của bạn</p>

  <form method="post" action="${pageContext.request.contextPath}/tx/create">
    <input type="hidden" name="type" value="${type}"/>

    <!-- Danh mục -->
    <div class="form-row">
      <label for="cat">📂 Danh mục</label>
      <select id="cat" name="categoryId" required>
        <option value="">-- Chọn danh mục phù hợp --</option>
        <c:forEach var="c" items="${cats}">
          <option value="${c.id}">${c.name}</option>
        </c:forEach>
      </select>
    </div>

    <!-- Ngày -->
    <div class="form-row">
      <label for="day">📅 Ngày giao dịch</label>
      <input id="day" type="date" name="txDay" value="<%= java.time.LocalDate.now() %>" required/>
    </div>

    <!-- Số tiền -->
    <div class="form-row">
      <label for="amount">💰 Số tiền (VNĐ)</label>
      <input id="amount" type="number" step="0.01" name="amount" placeholder="Ví dụ: 500000" required/>
    </div>

    <!-- Ghi chú -->
    <div class="form-row">
      <label for="notes">📝 Ghi chú</label>
      <input id="notes" type="text" name="notes" placeholder="Mô tả chi tiết về giao dịch này..."/>
    </div>

    <!-- Nút hành động -->
    <div class="form-row">
      <button type="submit" class="btn">
        <c:choose>
          <c:when test="${type == 'INCOME'}">💾 Lưu thu nhập</c:when>
          <c:otherwise>💾 Lưu chi tiêu</c:otherwise>
        </c:choose>
      </button>
      <a href="${pageContext.request.contextPath}/home" class="btn secondary">❌ Hủy bỏ</a>
    </div>
  </form>
</div>
