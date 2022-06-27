package flowcontrol.jumping;

public class ContinueDemo {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            if (i%2 ==0){
                System.out.println("Đã tìm thấy:  "+i);
                continue;
            }
            System.out.println("Lặp qua vị trí thứ: "+ (i+1));
        }

    }
}
