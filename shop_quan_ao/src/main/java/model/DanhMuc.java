package model;

public class DanhMuc {
private int maDanhmuc, soluong;
private String tenDanhMuc;
public DanhMuc() {
	super();
}
public DanhMuc(int maDanhmuc, String tenDanhMuc) {
	super();
	this.maDanhmuc = maDanhmuc;
	this.tenDanhMuc = tenDanhMuc;
}
public int getMaDanhmuc() {
	return maDanhmuc;
}
public void setMaDanhmuc(int maDanhmuc) {
	this.maDanhmuc = maDanhmuc;
}
public String getTenDanhMuc() {
	return tenDanhMuc;
}
public void setTenDanhMuc(String tenDanhMuc) {
	this.tenDanhMuc = tenDanhMuc;
}
public int getSoluong() {
	return soluong;
}
public void setSoluong(int soluong) {
	this.soluong = soluong;
}

}
