<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Đơn Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 36px;
            color: #333;
        }

        .order-date {
            background-color: #e7f4e4;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .order-date p {
            font-size: 20px;
            font-weight: bold;
            color: #2ecc71;
            margin: 0;
        }

        .order-date span {
            font-size: 22px;
            color: #27ae60;
            font-weight: 600;
        }

        .order-summary {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #fafafa;
            border-radius: 8px;
        }

        .order-item span {
            font-size: 18px;
        }

        .order-item .price {
            font-weight: bold;
            color: #333;
        }

        .order-item .original-price {
            text-decoration: line-through;
            color: #999;
        }

        .total {
            display: flex;
            justify-content: space-between;
            font-size: 20px;
            margin-top: 30px;
            font-weight: bold;
        }

        .total .final-price {
            color: #e74c3c;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 30px;
        }

        .button {
            flex: 1;
            padding: 15px;
            color: white;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .confirm-button {
            background-color: #2ecc71;
        }

        .confirm-button:hover {
            background-color: #27ae60;
        }

        .cancel-button {
            background-color: #e74c3c;
        }

        .cancel-button:hover {
            background-color: #c0392b;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
            font-size: 14px;
            color: #777;
        }

        .footer a {
            color: #2ecc71;
            text-decoration: none;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header h1 {
                font-size: 28px;
            }

            .order-item span {
                font-size: 16px;
            }

            .order-item {
                flex-direction: column;
                padding: 15px;
            }

            .total {
                font-size: 18px;
            }

            .button {
                padding: 12px;
                font-size: 16px;
            }
        }

        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            .header h1 {
                font-size: 24px;
            }

            .order-item {
                padding: 10px;
            }

            .button {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<div class="container">
<form action="XacNhanandHuyDonHang" method="post">


    <div class="header">
        <h1>Xác Nhận Đơn Hàng</h1>
    </div>
    <%
    String hoTen = (String) request.getAttribute("hoTen");
    String soDienThoai = (String) request.getAttribute("soDienThoai");
    String diaChi = (String) request.getAttribute("diaChi"); 
    String maTaiKhoanUser = (String) request.getAttribute("maTaiKhoanUser"); 
    
    String kichThuoc = (String) request.getAttribute("kichThuoc");
    String mauSac = (String) request.getAttribute("mauSac");
    String soLuong = (String) request.getAttribute("soLuong");
    int id = (int) request.getAttribute("idSanPham");
    float giaCU = (float) request.getAttribute("gia");
    String tenSanPham = (String) request.getAttribute("tenSanPham");
    String time = (String) request.getAttribute("thoiGian");
    float giaSauKhiGiam = (float) request.getAttribute("giaSauKhiGiam");
    %>
    <!-- Hiển thị ngày đặt hàng -->
    <div class="order-date">
        <p><strong>Ngày Đặt Hàng: <%=time %></strong></p>
    </div>
    <input type="hidden" name="mauSac" value="<%=mauSac %>">
    <input type="hidden" name="kichThuoc" value="<%=kichThuoc %>">
    <input type="hidden" name="soLuong" value="<%=soLuong %>">
    <input type="hidden" name="id" value="<%=id %>">
    <input type="hidden" name="soDienThoai" value="<%=soDienThoai %>">
    <input type="hidden" name="hoTen" value="<%=hoTen %>">
    <input type="hidden" name="diaChi" value="<%=diaChi %>">
    <input type="hidden" name="time" value="<%=time %>">
     <input type="hidden" name="maTaiKhoanUser" value="<%=maTaiKhoanUser %>">
    <div class="order-summary">
        <!-- Mỗi mục đơn hàng sẽ được hiển thị như sau -->
        <div class="order-item">
            <span><%=tenSanPham %></span>
            <input type="hidden" name="tenSanPham" value="<%=tenSanPham %>">
            <span class="price original-price"><%=giaCU %></span>
        </div>
        <div class="order-item">
            <span>Giảm giá</span>
            <%if(giaSauKhiGiam != 0){ %>
            <span class="price">-<%= giaCU - giaSauKhiGiam %></span>
            <%}else{ %>
             <span class="price"><%=0%></span>
             <%} %>
        </div>
    </div>

    <div class="total">
        <span>Tổng cộng</span>
        <%if(giaSauKhiGiam !=0){ %>
        <span class="final-price"><%=giaSauKhiGiam %></span>
        <input type="hidden" name="gia" value="<%=giaSauKhiGiam %>">
        <%}else {%>
        <span class="final-price"><%=giaCU %></span>
        <input type="hidden" name="gia" value="<%=giaCU %>">
        <%} %>
    </div>

    <div class="button-group">
        <button class="button confirm-button" onclick="confirmOrder()" name="Xacnhandonhang" value="Xacnhandonhang">Xác Nhận Đơn Hàng</button>
        <button class="button cancel-button" onclick="cancelOrder()" name="Huydonhang" value="Huydonhang">Hủy</button>
    </div>
    </form>
</div>

<div class="footer">
    <p>© 2024 <a href="#">Cửa Hàng Online</a>. Tất cả các quyền được bảo lưu.</p>
</div> 

<script>
    // Hàm để hiển thị ngày đặt hàng
    function formatDate(date) {
        const day = date.getDate().toString().padStart(2, '0');
        const month = (date.getMonth() + 1).toString().padStart(2, '0');
        const year = date.getFullYear();
        return `${day}/${month}/${year}`;
    }

    // Hiển thị ngày đặt hàng hiện tại
    const today = new Date();
    document.getElementById("order-date").innerText = formatDate(today);

    // Hàm xác nhận đơn hàng
    function confirmOrder() {
        alert("Đơn hàng của bạn đã được xác nhận thành công!");
    }

    // Hàm hủy đơn hàng
    function cancelOrder() {
    	 alert("Bạn có muốn hủy đơn hàng không!");
    }
</script>

</body>
</html>
