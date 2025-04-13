package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;

import java.io.IOException;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Cuahang
 */
@WebServlet("/Cuahang")
public class Cuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cuahang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DanhMuc> listDanhMuc = lg.Laythongtidanhmuc();
        request.setAttribute("listDanhMuc", listDanhMuc);

        String loai = request.getParameter("loai");
        List<SanPham> list;

        if (loai != null && !loai.isEmpty()) {
            switch (loai) {
                case "nu":
                    list = lg.LaythongtinsanphamTheoDanhMuc(1);
                    break;
                case "nam":
                    list = lg.LaythongtinsanphamTheoDanhMuc(2);
                    break;
                case "tui":
                    list = lg.LaythongtinsanphamTheoDanhMuc(3);
                    break;
                case "giay":
                    list = lg.LaythongtinsanphamTheoDanhMuc(4);
                    break;
                default:
                    list = lg.Laythongtinsanpham();
                    break;
            }
        } else {
            list = lg.Laythongtinsanpham();
            loai = ""; // Default to empty for "Tất cả"
        }

        request.setAttribute("listHome", list);
        request.setAttribute("currentLoai", loai); // Pass the current loai to JSP
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
