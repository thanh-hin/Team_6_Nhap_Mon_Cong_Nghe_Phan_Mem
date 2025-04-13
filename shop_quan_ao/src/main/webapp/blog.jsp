<%@page import="model.User"%>
<%@page import="model.GioHang"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@page import="model.BaiViet"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bài viết</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<!-- <link rel="icon" type="image/png" href="images/icons/favicon.png"/> -->
	<link rel="icon" type="image/png" href="images/icons/LOGOTHE5IVE.jpg"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style>
.d-none {
    display: none;
}

.d-block {
    display: block;
}

</style>
</head>
<body class="animsition">
	
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- <!-- Topbar
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">

				</div>
			</div> --> 

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="#" class="logo">
						<img src="images/icons/LOGOTHE5IVE-removebg.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="Laydulieusanpham">Trang chủ</a>
								 
							</li>

							<li >
								<a href="Cuahang">Cửa hàng</a>
							</li>

							<li class="label1" data-label1="hot">
								<a href="Giohang">Giỏ hàng</a>
							</li>

							<li class="active-menu" >
								<a href="blog.jsp">Blog</a>
							</li>

							<li>
								<a href="about.jsp">Giới thiệu</a>
							</li>

							<li>
								<a href="contact.jsp">Liên hệ</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div
						<%
						Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
							List<GioHang> gh = lgn.LayHetThongTinGioHang();
							HttpSession tk = request.getSession(false);
							List<User> user = (List<User>) tk.getAttribute("Ghinhotaikhoan");
							
								int soluong = 0;
								float tongTien = 0;
								if(user != null){
								for(GioHang gioHang:gh){
									for(User u : user)
										if(u.getMaTaiKhoan()==gioHang.getMaNguoiDung()){
									soluong += gioHang.getSoLuong();
									tongTien += gioHang.getGia();
										}
								}
							}
							
							
						%>
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="<%=soluong%>">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>
						
						<div class="icon-header-dropdown">
							<a href="#"
								class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
								<i class="fa fa-user"></i>
							</a>

							<!-- Thẻ con chứa thông tin cá nhân và đơn hàng -->
							<div class="dropdown-menu">
								<ul>
									<li><a href="Thongtincanhan.jsp">Thông tin cá nhân</a></li>
									<li><a href="Thongtindonhangdamua.jsp">Đơn hàng</a></li>
									<li><a href="Dangxuat">Đăng xuất</a></li>
								</ul>
							</div>
						</div>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.jsp"><img src="images/icons/LOGOTHE5IVE-removebg.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m">
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<%
				if (user != null) {
					for (GioHang gioHang : gh) {
						for (User u : user)
					if (u.getMaTaiKhoan() == gioHang.getMaNguoiDung()) {
						soluong += gioHang.getSoLuong();
						tongTien += gioHang.getGia();
					}
					}

				}
				%>
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
					data-notify="<%=soluong%>">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>


				<div class="icon-header-dropdown">
					<a href="#"
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i
						class="fa fa-user"></i>
					</a>

					<!-- Thẻ con chứa thông tin cá nhân và đơn hàng -->
					<div class="dropdown-menu">
						<ul>
							<li><a href="Thongtincanhan.jsp">Thông tin cá nhân</a></li>
							<li><a href="Thongtindonhangdamua.jsp">Đơn hàng</a></li>
							<li><a href="Dangxuat">Đăng xuất</a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<!-- <ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Miễn phí giao hàng cho đơn từ $100
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Trợ giúp & FAQs
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Tài khoản của tôi
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							VN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a>
					</div>
				</li>
			</ul>
 -->
			<ul class="main-menu-m">
				<li>
					<a href="Laydulieusanpham">Trang chủ</a>
					
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="Cuahang">Cửa hàng</a>
				</li>

				<li>
					<a href="Giohang" class="label1 rs1" data-label1="hot">Giỏ hàng</a>
				</li>

				<li>
					<a href="blog.jsp">Blog</a>
				</li>

				<li>
					<a href="about.jsp">Giới thiệu</a>
				</li>

				<li>
					<a href="contact.jsp">Liên hệ</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header">
		  <div class="container-search-header">
		    <!-- Nút đóng -->
		    <button class="btn-hide-modal-search js-hide-modal-search">
		      <img src="images/icons/icon-close2.png" alt="CLOSE">
		    </button>
		
		    <!-- Ô tìm kiếm -->
		    <form class="wrap-search-header flex-w p-l-15">
		      <button class="flex-c-m trans-04">
		        <i class="zmdi zmdi-search"></i>
		      </button>
		      <input class="plh3" type="text" name="search" placeholder="Tìm kiếm...">
		    </form>
		  </div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Giỏ hàng của bạn
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

							<span class="header-cart-item-info">
								1 x $19.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star
							</a>

							<span class="header-cart-item-info">
								1 x $39.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather
							</a>

							<span class="header-cart-item-info">
								1 x $17.00
							</span>
						</div>
					</li>
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Tổng: $75.00
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							Xem giỏ hàng
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Kiểm tra
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Blog
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
    <div class="container">
        <div class="row">
            <!-- Bài viết -->
            <div class="col-lg-6 col-md-12 mb-4">
                <img src="images/pexels-frendsmans-1926769.jpg" alt="Ảnh minh họa" class="img-fluid rounded">
            </div>
            <div class="col-lg-6 col-md-12 d-flex align-items-center">
            
                <div>
                <%
            LaydulieuReponsitory lg = new LaydulieuReponsitory();
            List<BaiViet> baiViet = lg.LayThongTinBaiViet();
            for(BaiViet b : baiViet){
            %>
                    <h2 class="mb-3"><%=b.getTenBai() %></h2>
                    <p>
                        Các voucher khuyến mãi sẽ được chúng tôi cung cấp trong bài viết dưới đây 
                    </p>
                    
                    <div id="extra-content" class="d-none">
                        <p>
                            <%=b.getNoiDung() %>
                        </p>
                    </div>
                    <%} %>
                    <button id="toggle-btn" class="btn btn-primary">Xem thêm</button>
                </div>
                
            </div>
        </div>
    </div>
</section>


	
		

		<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Danh mục
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Nữ
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Nam
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Giày
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Đồng hồ
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Trợ giúp
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Theo dõi đơn
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Hoàn trả 
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Giao hàng
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								FAQs
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						LIÊN LẠC
					</h4>

					<p class="stext-107 cl7 size-201">
						Có bất kì câu hỏi nào? Hãy đến cửa hàng chúng tôi tại 379 Hudson Street, Floor 8, New York, NY 10014, USA 10018 hoặc gọi đến số 18008098.
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Đăng ký nhận thông báo
					</h4>

					<form>
						<div class="wrap-input1 w-full p-b-4">
							<input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
							<div class="focus-input1 trans-04"></div>
						</div>

						<div class="p-t-18">
							<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Đăng kí
							</button>
						</div>
					</form>
				</div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>

<script>

document.getElementById('toggle-btn').addEventListener('click', function () {
    const extraContent = document.getElementById('extra-content');
    if (extraContent.classList.contains('d-none')) {
        extraContent.classList.remove('d-none');
        extraContent.classList.add('d-block');
        this.textContent = 'Ẩn bớt'; // Thay đổi chữ trên nút
    } else {
        extraContent.classList.remove('d-block');
        extraContent.classList.add('d-none');
        this.textContent = 'Xem thêm'; // Quay lại chữ ban đầu
    }
});

</script>
	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script>
  // Mở modal khi click icon tìm kiếm
  document.querySelectorAll('.js-show-modal-search').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelector('.modal-search-header').classList.add('show-modal-search');
    });
  });

  // Đóng modal khi click nút ×
  document.querySelectorAll('.js-hide-modal-search').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelector('.modal-search-header').classList.remove('show-modal-search');
    });
  });

  // Đóng modal khi click ra ngoài vùng trắng
  document.querySelector('.modal-search-header').addEventListener('click', function (e) {
    if (e.target === this) {
      this.classList.remove('show-modal-search');
    }
  });
</script>

</body>
</html>