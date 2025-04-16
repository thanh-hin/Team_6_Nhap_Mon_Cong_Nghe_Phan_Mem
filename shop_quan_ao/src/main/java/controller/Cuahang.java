package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;
import Reponsitory.LaydulieuReponsitory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Cuahang")
public class Cuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LaydulieuReponsitory lg = new LaydulieuReponsitory();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<DanhMuc> listDanhMuc = lg.Laythongtidanhmuc();
		request.setAttribute("listDanhMuc", listDanhMuc);

		// Nhận các tham số lọc
		String loai = request.getParameter("loai"); // VD: nu, nam, tui
		String gia = request.getParameter("gia");   // VD: 0-50, 100-200, 200+
		String mau = request.getParameter("mau");   // VD: Đen, Trắng, Xanh...

		List<SanPham> list;

		// 1. Lọc theo danh mục
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
			}
		} else {
			list = lg.Laythongtinsanpham();
			loai = "";
		}

		// 2. Lọc theo màu (nếu có)
		if (mau != null && !mau.isEmpty()) {
			List<SanPham> filteredByColor = lg.laySanPhamTheoMau(mau);
			List<SanPham> temp = new ArrayList<>();

			// Giữ lại sản phẩm vừa thuộc danh mục, vừa có màu
			for (SanPham sp : list) {
				for (SanPham spColor : filteredByColor) {
					if (sp.getMaSanpham() == spColor.getMaSanpham()) {
						temp.add(sp);
						break;
					}
				}
			}
			list = temp;
		}

		// 3. Lọc theo giá
		if (gia != null && !gia.isEmpty()) {
			List<SanPham> filteredByPrice = new ArrayList<>();
			double min = 0;
			double max = Double.MAX_VALUE;

			try {
				if (gia.contains("-")) {
					String[] parts = gia.split("-");
					min = Double.parseDouble(parts[0]);
					max = Double.parseDouble(parts[1]);
				} else if (gia.endsWith("+")) {
					min = Double.parseDouble(gia.replace("+", ""));
				}

				for (SanPham sp : list) {
					if (sp.getGia() >= min && sp.getGia() <= max) {
						filteredByPrice.add(sp);
					}
				}

				list = filteredByPrice;
			} catch (NumberFormatException e) {
				e.printStackTrace(); // log lỗi nếu giá không hợp lệ
			}
		}

		// 4. Gửi dữ liệu sang JSP
		request.setAttribute("listHome", list);
		request.setAttribute("currentLoai", loai);
		request.setAttribute("currentGia", gia);
		request.setAttribute("currentMau", mau);

		request.getRequestDispatcher("/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
