package inheritance.question1.entity;

public class CongNhan extends CanBo {
    private int bac;
    public CongNhan(){}

    public CongNhan(String fullName, int tuoi, GioiTinh gioiTinh, String diaChi, int bac) {
        super(fullName, tuoi, gioiTinh, diaChi);
        this.bac = bac;
    }

    public int getBac() {
        return bac;
    }

    public void setBac(int bac) {
        this.bac = bac;
    }

    @Override
    public String toString() {
        return "CongNhan{" +
                "bac=" + bac +
                "} " + super.toString();
    }
}
