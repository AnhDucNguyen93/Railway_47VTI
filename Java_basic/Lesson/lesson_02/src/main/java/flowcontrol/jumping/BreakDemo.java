package flowcontrol.jumping;

public class BreakDemo {
    public static void main(String[] args) {
        // Tìm nhân viên có id = 10
        for (int i = 0; i < 20; i++) {
            if (i == 10){
                System.out.println("Đã tìm thấy");
                break;
            }
            System.out.println("Lặp qua nhân viên số: " + (i+1));
        }
    }
}
