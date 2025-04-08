package model;

public class ChiTietSanPham {
private int idChiTietSanPham, MaSanPham, soLuong;
private String mauSac, kichCo;
public ChiTietSanPham(int idChiTietSanPham, int maSanPham, int soLuong, String mauSac, String kichCo) {
	super();
	this.idChiTietSanPham = idChiTietSanPham;
	MaSanPham = maSanPham;
	this.soLuong = soLuong;
	this.mauSac = mauSac;
	this.kichCo = kichCo;
}
public ChiTietSanPham() {
	super();
}
public int getIdChiTietSanPham() {
	return idChiTietSanPham;
}
public void setIdChiTietSanPham(int idChiTietSanPham) {
	this.idChiTietSanPham = idChiTietSanPham;
}
public int getMaSanPham() {
	return MaSanPham;
}
public void setMaSanPham(int maSanPham) {
	MaSanPham = maSanPham;
}
public int getSoLuong() {
	return soLuong;
}
public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
}
public String getMauSac() {
	return mauSac;
}
public void setMauSac(String mauSac) {
	this.mauSac = mauSac;
}
public String getKichCo() {
	return kichCo;
}
public void setKichCo(String kichCo) {
	this.kichCo = kichCo;
}

}
