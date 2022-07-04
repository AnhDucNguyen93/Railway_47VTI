package inheritance.question1.backend;

import inheritance.question1.entity.CanBo;
import inheritance.question1.entity.CongNhan;
import inheritance.question1.entity.KySu;
import inheritance.question1.entity.NhanVien;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class QLCB {
    List<CanBo> canBos = new ArrayList<>();
    Scanner scanner = new Scanner(System.in);

    public void Question1() {
        while (true) {
            System.out.println("Lựa chọn các phương thức sau:");
            System.out.println("1. Thêm cán bộ mới");
            System.out.println("2 Tìm kiếm theo tên");
            System.out.println("3. Hiển thị thông tin danh sách các cán bộ");
            System.out.println("4. Nhập tên của cán bộ và xóa nó");
            System.out.println("5. Thoát khỏi chương trình");
            int menu = scanner.nextInt();
            switch (menu) {
                case 1:
                    themCanBo();
                    break;
                case 2:
                    timKiemTheoTen();
                    break;
                case 3:
                    hienThiDSCB();
                    break;
                case 4:
                    nhapVaXoa();
                    break;
                case 5:
                    return;
                default:
                    System.out.println("Nhập đúng chức năng ở trên");
                    break;
            }
        }
    }

    private void nhapVaXoa() {
        System.out.println("Nhập tên cán bộ muốn xóa");
        String name = scanner.next();
        if (canBos.removeIf(canBo -> canBo.getFullName().contains(name))) {
            System.out.println("Đã xóa cán bộ có tên là: " + name);
        } else {
            System.out.println("Không có cán bộ nào bị xóa với tên là: " + name);
        }
    }

    private void hienThiDSCB() {
        System.out.println("Danh sách cán bộ" + canBos);
    }


    private void timKiemTheoTen() {
        System.out.println("Nhập tên muốn tìm kiếm: ");
        scanner.nextLine();
        String seach = scanner.nextLine();
        int soLuong = 0;
        for (CanBo canBo : canBos) {
            if (canBo.getFullName().equals(seach)) {
                soLuong++;
                System.out.println("Tên cán bộ = " + canBo);
                System.out.printf("Đã tìm thấy %d cán bộ", soLuong);
            } else {
                System.out.printf("Không tim thấy cán bộ %s nào\n", seach);
            }

        }
    }

    private void themCanBo() {
        System.out.println("Chọn vị trí cán bộ muốn thêm");
        System.out.println("1.Công nhân");
        System.out.println("2. Kỹ sư");
        System.out.println("3. Nhân viên");
        int menu = scanner.nextInt();
        System.out.println("Nhập họ tên:");
        scanner.nextLine();
        String hoTen = scanner.nextLine();
        System.out.println("Nhập tuổi:");
        int tuoi = scanner.nextInt();
        System.out.println("Nhập giới tính (NAM,NU,KHAC):");
        String gioiTinh = scanner.next();
        CanBo.GioiTinh enumGioiTinh = CanBo.GioiTinh.valueOf(gioiTinh);
        System.out.println("Nhập địa chỉ:");
        scanner.nextLine();
        String diaChi = scanner.nextLine();
        switch (menu) {
            case 1:
                System.out.println("Nhập bậc công nhân: ");
                int bac = scanner.nextInt();
                CongNhan congNhan = new CongNhan(hoTen, tuoi, enumGioiTinh, diaChi, bac);
                canBos.add(congNhan);
                break;
            case 2:
                System.out.println("Nhập ngành đào tạo: ");
                String nganhDt = scanner.nextLine();
                KySu kySu = new KySu(hoTen, tuoi, enumGioiTinh, diaChi, nganhDt);
                canBos.add(kySu);
                break;
            case 3:
                System.out.println("Nhập công việc: ");
                String congviec = scanner.nextLine();
                NhanVien nhanVien = new NhanVien(hoTen, tuoi, enumGioiTinh, diaChi, congviec);
                canBos.add(nhanVien);
                break;
        }
    }


}
