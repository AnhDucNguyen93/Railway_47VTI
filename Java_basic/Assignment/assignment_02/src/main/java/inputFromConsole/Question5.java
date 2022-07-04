package inputFromConsole;

import entity.Account;
import entity.Position;

import java.util.Scanner;

public class Question5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập thông tin account: ");
        Account acc = new Account();

        System.out.println("Nhập Id: ");
        acc.accountId = scanner.nextInt();
        System.out.println("Nhập Email : ");
        acc.email = scanner.next();
        System.out.println("Nhập UserName: ");
        acc.userName = scanner.next();
        System.out.println("Nhập full name: ");
        scanner.next();
        acc.fullName = scanner.nextLine();

        System.out.println("Nhập các số từ 1 đến 4 tương ứng với:\n 1.Dev, 2.Test, 3.Scrum_Master, 4.PM): ");
        int numberPossion = scanner.nextInt();
        switch (numberPossion){
            case 1:
                Position position1 = new Position();
                position1.positionName= Position.PositionName.DEV;
                acc.position = position1;
                break;
            case 2:
                Position position2 = new Position();
                position2.positionName= Position.PositionName.TEST;
                acc.position = position2;
                break;
            case 3:
                Position position3 = new Position();
                position3.positionName= Position.PositionName.SCRUM_MASTER;
                acc.position = position3;
                break;
            case 4:
                Position position4 = new Position();
                position4.positionName= Position.PositionName.PM;
                acc.position = position4;
                break;
        }
        System.out.println("Thông tin Account vừa nhập:     " + acc);
    }
}
