<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="page-header">
  <h2>🔐 Đổi mật khẩu tài khoản</h2>
</div>

<div class="section">
  <p class="muted">Cập nhật mật khẩu để bảo mật tài khoản của bạn</p>

  <!-- Thông báo lỗi -->
  <c:if test="${not empty error}">
    <div class="flash error">
      ⚠️ ${error}
    </div>
  </c:if>

  <!-- Thông báo thành công -->
  <c:if test="${not empty msg}">
    <div class="flash success">
      ✅ ${msg}
    </div>
  </c:if>

  <!-- Form đổi mật khẩu -->
  <form method="post" action="${pageContext.request.contextPath}/change-password">

    <div class="form-row">
      <label for="old">🔒 Mật khẩu hiện tại</label>
      <input id="old" type="password" name="old"
             placeholder="Nhập mật khẩu hiện tại..." required>
    </div>

    <div class="form-row">
      <label for="new">🆕 Mật khẩu mới</label>
      <input id="new" type="password" name="new"
             placeholder="Nhập mật khẩu mới (tối thiểu 8 ký tự)..." required>
    </div>

    <div class="form-row">
      <label for="re">🔄 Xác nhận mật khẩu mới</label>
      <input id="re" type="password" name="re"
             placeholder="Nhập lại mật khẩu mới..." required>
    </div>

    <div class="form-row">
      <button type="submit" class="btn">🔐 Cập nhật mật khẩu</button>
      <a href="${pageContext.request.contextPath}/home" class="btn secondary">❌ Hủy bỏ</a>
    </div>
  </form>
</div>
