package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class UpdateDanhMuc
 */
@WebServlet("/UpdateDanhMuc")
public class UpdateDanhMuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDanhMuc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("product-id"));
		String tenDanhMuc = request.getParameter("updateDanhMuc");
		System.out.println("id danh mục cần sửa là: "+ id);
		System.out.println("tên danh mục cần sửa là: "+ tenDanhMuc);
		boolean ktra = lg.updateDanhMuc(id, tenDanhMuc);
		System.out.println("cơ sở dữ liệu danh mục cần sửa là: "+ ktra);
		if(ktra) {
			response.sendRedirect("category.jsp");
		}else {
			response.sendRedirect("category.jsp");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
