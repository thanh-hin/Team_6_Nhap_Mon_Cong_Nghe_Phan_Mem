package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GioHang;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class ThanhToanGioHang
 */
@WebServlet("/ThanhToanGioHang")
public class ThanhToanGioHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanGioHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<GioHang> listGioHang = lgn.LayHetThongTinGioHang();
		
		List<GioHang> l = new ArrayList<GioHang>();
		HttpSession s = request.getSession(false);
		List<User> user = (List<User>) s.getAttribute("Ghinhotaikhoan");
		List<GioHang> gioHangCoIdKhachHang = new ArrayList<GioHang>();
		if(s != null && listGioHang != null) {
			System.out.println("đã đi vào đaya chơi huhhu");
			
			  for (User us : user) {
			        for (GioHang g : listGioHang) {
			            if (g.getMaNguoiDung() == us.getMaTaiKhoan()) { 
			            	System.out.println("đã đi vào đaya chơi haha");
			                gioHangCoIdKhachHang.add(g);
			                
			            }
			        }
			    }
			    request.setAttribute("user", user);
			    request.setAttribute("gioHang", gioHangCoIdKhachHang);
			    request.getRequestDispatcher("Xacnhangiohang.jsp").forward(request, response);
			  
		}else {
			request.getRequestDispatcher("Xacnhangiohang.jsp").forward(request, response);
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
List<GioHang> listGioHang = lgn.LayHetThongTinGioHang();
		
		List<GioHang> l = new ArrayList<GioHang>();
		HttpSession s = request.getSession(false);
		List<User> user = (List<User>) s.getAttribute("Ghinhotaikhoan");
		List<GioHang> gioHangCoIdKhachHang = new ArrayList<GioHang>();
		if(s != null && listGioHang != null) {
			System.out.println("đã đi vào đaya chơi huhhu");
			
			  for (User us : user) {
			        for (GioHang g : listGioHang) {
			            if (g.getMaNguoiDung() == us.getMaTaiKhoan()) { 
			            	System.out.println("đã đi vào đaya chơi haha");
			                gioHangCoIdKhachHang.add(g);
			                
			            }
			        }
			    }
			    request.setAttribute("user", user);
			    request.setAttribute("gioHang", gioHangCoIdKhachHang);
			    request.getRequestDispatcher("Xacnhangioahang.jsp").forward(request, response);
			  
		}else {
			request.getRequestDispatcher("Xacnhangioahang.jsp").forward(request, response);
		}
	
	}
	}


