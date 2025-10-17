package mini.expense.web;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*; import jakarta.servlet.*;
import mini.expense.config.DataSourceProvider;
import mini.expense.dao.CategoryDAO; import mini.expense.dao.TxnDAO;
import mini.expense.model.User; import mini.expense.model.Txn;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@WebServlet(urlPatterns={"/home"})
public class HomeServlet extends HttpServlet {
  @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    User u = (User) req.getSession().getAttribute("user");
    if(u==null){ resp.sendRedirect(req.getContextPath()+"/login"); return; }

    LocalDate today = LocalDate.now();
    LocalDate from = Optional.ofNullable(req.getParameter("from")).map(LocalDate::parse).orElse(today.withDayOfMonth(1));
    LocalDate to   = Optional.ofNullable(req.getParameter("to")).map(LocalDate::parse).orElse(today);

    TxnDAO dao = new TxnDAO(DataSourceProvider.get());
    req.setAttribute("from", from.toString()); req.setAttribute("to", to.toString());
    req.setAttribute("income", dao.list(u.id, from, to, "INCOME"));
    req.setAttribute("expense", dao.list(u.id, from, to, "EXPENSE"));
    req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req,resp);
  }
}
