package inheritance.question1.entity;

public class NhanVien extends CanBo {
    private String congViec;
    public NhanVien(){}

    public NhanVien(String fullName, int tuoi, GioiTinh gioiTinh, String diaChi, String congViec) {
        super(fullName, tuoi, gioiTinh, diaChi);
        this.congViec = congViec;
    }

    public String getCongViec() {
        return congViec;
    }

    public void setCongViec(String congViec) {
        this.congViec = congViec;
    }

    @Override
    public String toString() {
        return "NhanVien{" +
                "Họ tên =" + getFullName() +
                "congViec='" + congViec + '\'' +
                '}';
    }
}
