package inputFromConsole;

import java.util.Scanner;

public class Question2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập 2 số thực");
        System.out.println("Số thứ nhất: " + scanner.nextFloat());
        if (scanner.hasNextFloat()){
            System.out.println("Số thứ hai: " + scanner.nextFloat());
        } else
        System.out.println("Sai định dạng nhé! " );
    }
}
