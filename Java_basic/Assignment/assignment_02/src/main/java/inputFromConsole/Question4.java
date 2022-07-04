package inputFromConsole;

import java.time.LocalDate;
import java.util.Scanner;

public class Question4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập ngày sinh của bạn:  ");
        int ngaySinh = scanner.nextInt();
        System.out.println("Nhập tháng sinh của bạn:  " );
        int thangSinh = scanner.nextInt();
        System.out.println("Nhập năm sinh của bạn:  " );
        int namSinh = scanner.nextInt();
        LocalDate birthDay = LocalDate.of(namSinh,thangSinh,ngaySinh);
        System.out.println("birthDay = " + birthDay);
    }
}
