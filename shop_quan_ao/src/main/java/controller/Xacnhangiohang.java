package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ChiTietSanPham;
import model.DonHang;
import model.GioHang;
import model.SanPham;
import model.User;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Xacnhangiohang
 */
@WebServlet("/Xacnhangiohang")
public class Xacnhangiohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xacnhangiohang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String huy = request.getParameter("Huy");
		String datHang = request.getParameter("Dathang");
		String ten = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienThoai");
		String diaChi = request.getParameter("diaChi");
		System.out.println("Nút là "+ datHang);
		if(datHang != null && datHang.equals("Dathang")) {
			HttpSession s = request.getSession(false);
			List<User> u = (List<User>) s.getAttribute("Ghinhotaikhoan");
			List<GioHang> listGioHang = lgn.LayHetThongTinGioHang();
			System.out.println("u lỏ cat "+ u);
			System.out.println("Ghinhotaikhoan: " + request.getAttribute("Ghinhotaikhoan"));
			if(u != null) {
				int idNguoiDung = 0;
				System.out.println("vô dc trong u r");
				for(User user : u) {
					idNguoiDung = user.getMaTaiKhoan();
					ten = user.getHoTen();
					soDienThoai = user.getSoDienThoai();
				}
			List<GioHang> l = new ArrayList<GioHang>();
			for(GioHang g : listGioHang) {
				if(g.getMaNguoiDung() == idNguoiDung) {
				 // Kiểm tra đơn hàng đã tồn tại chưa và chả về số lượng nếu đúng
					int soLuong = lgn.CheckDonHangTonTaiChua(idNguoiDung, g.getMaChiTietSanPham(),ten , Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng", g.getGia());
					if(soLuong>0) {
						int soLuongMoi = soLuong+g.getSoLuong();
						
						// Lâý id đơn hàng
						int idDonHang = lgn.LayidDonHang(idNguoiDung, g.getMaChiTietSanPham(), ten, Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng",  g.getGia());
						boolean updatedonhang = lgn.updateDonHang(idDonHang, soLuongMoi,g.getGia());// update vô nếu như đơn hàng đã tồn tại
						int soLuongChiTiet = lgn.LaySoLuongChiTiet(g.getMaChiTietSanPham());
						if(soLuongChiTiet > 0) {
							int soLuongConLai = soLuongChiTiet - g.getSoLuong();
							// cập nhật vào bảng chi tiết só lượng của chúng sau khi mua
							boolean ktracapnhat = lgn.UpdateBangChiTiet(g.getMaChiTietSanPham(), soLuongConLai);
						}
					}else {
						LocalDate currentDate = LocalDate.now();
						 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
						 String formattedDate = currentDate.format(formatter);
						 // thêm đơn hàng
						boolean themDonHang = lgn.CapNhatDonHangNguoiDung(idNguoiDung, g.getMaChiTietSanPham(), ten, Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng", g.getSoLuong() ,g.getGia(),formattedDate);
						if(themDonHang) {
								int soLuongChiTiet = lgn.LaySoLuongChiTiet(g.getMaChiTietSanPham());
								
								if(soLuongChiTiet > 0) {
									int soLuongConLai = soLuongChiTiet - g.getSoLuong();
									System.out.println("số lượng còn lại là "+soLuongConLai);
									// cập nhật vào bảng chi tiết số lượng của chúng sau khi mua
									boolean ktracapnhat = lgn.UpdateBangChiTiet(g.getMaChiTietSanPham(), soLuongConLai);
								}
								
							}
					}
					
				}
			}
			
			
			}
			System.out.println("đã vào qua đây chơi");
			request.getRequestDispatcher("Giohang").forward(request, response);
		}else {
			request.getRequestDispatcher("Giohang").forward(request, response);;
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
