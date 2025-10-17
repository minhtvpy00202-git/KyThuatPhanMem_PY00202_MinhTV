package mini.expense.web;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*; import jakarta.servlet.*;
import mini.expense.config.DataSourceProvider;
import mini.expense.dao.CategoryDAO; import mini.expense.dao.TxnDAO;
import mini.expense.model.User; import mini.expense.model.Txn;

import java.io.IOException; import java.time.LocalDate;

@WebServlet(urlPatterns={"/tx/new","/tx/create"})
public class TxnServlet extends HttpServlet {
  @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    User u = (User) req.getSession().getAttribute("user");
    if(u==null){ resp.sendRedirect(req.getContextPath()+"/login"); return; }
    String type = req.getParameter("type"); // INCOME|EXPENSE
    req.setAttribute("type", type==null?"EXPENSE":type);
    req.setAttribute("cats", new CategoryDAO(DataSourceProvider.get()).allForUser(u.id, req.getAttribute("type").toString()));
    req.getRequestDispatcher("/WEB-INF/views/txn-form.jsp").forward(req,resp);
  }

  @Override protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    User u = (User) req.getSession().getAttribute("user");
    if(u==null){ resp.sendRedirect(req.getContextPath()+"/login"); return; }
    Txn t = new Txn();
    t.userId = u.id;
    t.categoryId = req.getParameter("categoryId");
    t.amount = Double.parseDouble(req.getParameter("amount"));
    t.txDay = java.sql.Date.valueOf(req.getParameter("txDay"));
    t.notes = req.getParameter("notes");
    new TxnDAO(DataSourceProvider.get()).create(t);
    resp.sendRedirect(req.getContextPath()+"/home");
  }
}
