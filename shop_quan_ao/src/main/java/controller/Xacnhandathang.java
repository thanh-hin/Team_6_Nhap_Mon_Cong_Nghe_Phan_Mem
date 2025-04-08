package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.KhuyenMai;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Xacnhandathang
 */
@WebServlet("/Xacnhandathang")
public class Xacnhandathang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
   
    public Xacnhandathang() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("idSanPham"));
//		String maKhuyenMai = request.getParameter("maKhuyenMai");
//		float gia = Float.parseFloat(request.getParameter("giaSanPham"));
//		String tenSanPham = request.getParameter("tenSanPham");
//		String mauSac = request.getParameter("mauSac");
//		String kichThuoc = request.getParameter("kichThuoc");
//		String soLuong = request.getParameter("soLuong");
//		String hoTen = request.getParameter("hoTen");
//		String soDienThoai = request.getParameter("soDienThoai");
//		String diaChi = request.getParameter("diaChiGiaoHang");
//		String maTaiKhoanUser = request.getParameter("maTaiKhoanUser");
//		
//		 LocalDate currentDate = LocalDate.now();
//		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//		 String formattedDate = currentDate.format(formatter);
//		 float giaSauKhiGiam = 0; // Giá sau khi giảm giá
//		 if(maKhuyenMai != null) {
//			 boolean ktra = lgn.Laythongtinsanpham(id, maKhuyenMai);
//			 if(ktra) {
//				 List<KhuyenMai> listKhuyenMai = lgn.LayThongTinKhuyenMai(maKhuyenMai);
//				 float phanTramKhuyenMai = 0;
//				 for(KhuyenMai k : listKhuyenMai) {
//					 phanTramKhuyenMai =k.getPhanTramKhuyenMai();
//				 }
//				 giaSauKhiGiam = gia*(1 - phanTramKhuyenMai);
//			 }
//		 }
//
//		 
//		 
//		 request.setAttribute("maTaiKhoanUser",maTaiKhoanUser );
//		 request.setAttribute("mauSac",mauSac );
//		 request.setAttribute("hoTen",hoTen );
//		 request.setAttribute("soDienThoai",soDienThoai );
//		 request.setAttribute("diaChi",diaChi );
//		 request.setAttribute("kichThuoc", kichThuoc);
//		 request.setAttribute("soLuong",soLuong );
//		 request.setAttribute("giaSauKhiGiam", giaSauKhiGiam);
//		request.setAttribute("idSanPham",id );
//		request.setAttribute("maKhuyenMai", maKhuyenMai);
//		request.setAttribute("gia", gia);
//		request.setAttribute("tenSanPham",tenSanPham );
//		request.setAttribute("thoiGian",formattedDate);
//		request.getRequestDispatcher("Xacnhandonhang.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idSanPham"));
		String maKhuyenMai = request.getParameter("maKhuyenMai");
		float gia = Float.parseFloat(request.getParameter("giaSanPham"));
		String tenSanPham = request.getParameter("tenSanPham");
		String mauSac = request.getParameter("mauSac");
		String kichThuoc = request.getParameter("kichThuoc");
		String soLuong = request.getParameter("soLuong");
		String hoTen = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienThoai");
		String diaChi = request.getParameter("diaChiGiaoHang");
		String maTaiKhoanUser = request.getParameter("maTaiKhoanUser");
		
		 LocalDate currentDate = LocalDate.now();
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		 String formattedDate = currentDate.format(formatter);
		 float giaSauKhiGiam = 0; // Giá sau khi giảm giá
		 if(maKhuyenMai != null) {
//			 boolean ktra = lgn.Laythongtinsanpham(id, maKhuyenMai);
			 
				 // Kiểm tra xem sản phẩm này có khuyến mãi hay không
				 boolean ktraSanPhamKhuyenMai = false;
				 List<KhuyenMai> listKhuyenMai = lgn.LayThongTinKhuyenMai();
				 for(KhuyenMai khuyenMai : listKhuyenMai) {
					 if(khuyenMai.getMaKhuyenMai().equals(maKhuyenMai) && khuyenMai.getMaSanpham()==id) {
						 ktraSanPhamKhuyenMai = true;
					 }
				 }
				 if(ktraSanPhamKhuyenMai) {
					 float phanTramKhuyenMai = 0;
					 for(KhuyenMai k : listKhuyenMai) {
						 phanTramKhuyenMai =k.getPhanTramKhuyenMai();
					 }
					 giaSauKhiGiam = gia*(1 - phanTramKhuyenMai);
				 }
				 
			 }
		 

		 
		 
		 request.setAttribute("maTaiKhoanUser",maTaiKhoanUser );
		 request.setAttribute("mauSac",mauSac );
		 request.setAttribute("hoTen",hoTen );
		 request.setAttribute("soDienThoai",soDienThoai );
		 request.setAttribute("diaChi",diaChi );
		 request.setAttribute("kichThuoc", kichThuoc);
		 request.setAttribute("soLuong",soLuong );
		 request.setAttribute("giaSauKhiGiam", giaSauKhiGiam);
		request.setAttribute("idSanPham",id );
		request.setAttribute("maKhuyenMai", maKhuyenMai);
		request.setAttribute("gia", gia);
		request.setAttribute("tenSanPham",tenSanPham );
		request.setAttribute("thoiGian",formattedDate);
		request.getRequestDispatcher("Xacnhandonhang.jsp").forward(request, response);
	}

}
