package flowcontrol.decision;

import java.time.LocalDate;

public class SwitchCaseDemo {
    public static void main(String[] args) {
        int month = LocalDate.now().getMonthValue();
        System.out.println("Thang " + month);
        switch (month) {
            case 4:
            case 6:
            case 9:
            case 11:
                System.out.println("Co 30 ngay");
                break;
            case 2:
                System.out.println("Co 28 ngay");
                break;
            default:
                System.out.println("Co 31 ngay");
                break;
        }
    }
}
