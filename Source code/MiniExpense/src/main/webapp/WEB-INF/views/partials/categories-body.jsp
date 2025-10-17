<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="page-header">
  <h2>📂 Quản lý danh mục</h2>
</div>

<!-- Tabs chọn loại danh mục -->
<div class="section">
  <div class="form-row">
    <a class="btn ${type=='EXPENSE' ? '' : 'secondary'}"
       href="${pageContext.request.contextPath}/categories?type=EXPENSE">💸 Danh mục chi tiêu</a>
    <a class="btn ${type=='INCOME' ? '' : 'secondary'}"
       href="${pageContext.request.contextPath}/categories?type=INCOME">💰 Danh mục thu nhập</a>
  </div>
</div>

<!-- Form thêm danh mục -->
<div class="section">
  <h3>
    <c:choose>
      <c:when test="${type == 'EXPENSE'}">➕ Thêm danh mục chi tiêu mới</c:when>
      <c:otherwise>➕ Thêm danh mục thu nhập mới</c:otherwise>
    </c:choose>
  </h3>

  <form method="post" action="${pageContext.request.contextPath}/categories">
    <input type="hidden" name="action" value="create">
    <input type="hidden" name="type" value="${type}">
    <div class="form-row">
      <label for="catName">Tên danh mục</label>
      <input id="catName" type="text" name="name" placeholder="Ví dụ: Ăn uống, Xăng xe, Lương..." required>
      <button type="submit" class="btn success">Thêm danh mục</button>
    </div>
  </form>
</div>

<!-- Bảng danh mục -->
<div class="section">
  <h3>
    <c:choose>
      <c:when test="${type == 'EXPENSE'}">💸 Danh sách danh mục chi tiêu</c:when>
      <c:otherwise>💰 Danh sách danh mục thu nhập</c:otherwise>
    </c:choose>
  </h3>

  <table class="table">
    <thead>
      <tr>
        <th>📝 Tên danh mục</th>
        <th>👤 Thuộc về</th>
        <th class="right">⚙️ Thao tác</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="c" items="${items}">
        <tr>
          <td>
            <c:choose>
              <c:when test="${empty c.userId}">
                ${c.name}
              </c:when>
              <c:otherwise>
                <form method="post" action="${pageContext.request.contextPath}/categories" class="form-row">
                  <input type="hidden" name="action" value="rename">
                  <input type="hidden" name="type" value="${type}">
                  <input type="hidden" name="id" value="${c.id}">
                  <input type="text" name="name" value="${c.name}" required>
                  <button type="submit" class="btn">Lưu</button>
                </form>
              </c:otherwise>
            </c:choose>
          </td>
          <td>
            <c:choose>
              <c:when test="${empty c.userId}">🌐 Hệ thống</c:when>
              <c:otherwise>👤 Cá nhân</c:otherwise>
            </c:choose>
          </td>
          <td class="right">
            <c:choose>
              <c:when test="${empty c.userId}">
                <span class="muted">🔒 Không thể xóa</span>
              </c:when>
              <c:otherwise>
                <div class="table-actions">
                  <form method="post" action="${pageContext.request.contextPath}/categories"
                        onsubmit="return confirm('Bạn có chắc muốn xóa danh mục \"${c.name}\"?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="type" value="${type}">
                    <input type="hidden" name="id" value="${c.id}">
                    <button type="submit" class="btn danger">🗑️ Xóa</button>
                  </form>
                </div>
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
      </c:forEach>

      <c:if test="${empty items}">
        <tr class="empty">
          <td colspan="3">📭 Chưa có danh mục nào</td>
        </tr>
      </c:if>
    </tbody>
  </table>
</div>
