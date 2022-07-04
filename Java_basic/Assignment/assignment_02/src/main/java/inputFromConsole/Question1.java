package inputFromConsole;

import java.util.Scanner;

public class Question1 {
    public static void main(String[] args) {
        // Question 1
        System.out.println("------------Question 1-----------");
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập 3 số nguyên vào  :");
        System.out.println(" số thứ 1: "+ scanner.nextInt());
        System.out.println(" số thứ 2: "+ scanner.nextInt());
        System.out.println(" số thứ 3: "+ scanner.nextInt());

    }
}
