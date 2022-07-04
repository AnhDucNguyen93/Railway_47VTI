package inputFromConsole;

import java.util.Scanner;

public class Question7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("Hãy nhập vào 1 số chẵn: ");
            int a = sc.nextInt();
            if (a % 2 == 0) {
                System.out.println("Bạm vừa nhập vào:" + a);
               // break;
            } else {
                System.out.println("Nhập sai, đây không phải là số chẵn");

            }
        }
    }
}
